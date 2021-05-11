module TypeCheckStmt where

import AbstrakteSyntax
import Control.Monad
import Control.Monad.Except
import Data.List
import qualified TypedAST as T

getAST (T.Typed _ ast) = ast

getType (T.Typed typ _) = typ

getClassName (Class (_, name, _, _, _)) = name

getConstructors (Class (_, _, _, _, constrs)) = constrs

getMethods (Class (_, _, _, methods, _)) = methods

getMethodName (Method (_, _, name, _, _)) = name

getMethodType (Method (_, typ, _, _, _)) = typ

getParams (Method (_, _, _, params, _)) = params

orThrow :: Maybe a -> e -> Either e a
orThrow (Just a) _ = Right a
orThrow Nothing e = Left e

type TypeChecker u t = [(Type, String)] -> [Class] -> u -> Either String (T.Typed t)

typeCheckClass :: TypeChecker Class T.Class
typeCheckClass symtab classes (Class (modifier, typ, fields, methods, constrs)) =
  let syms =
        symtab
          ++ map (\(FieldDecl (_, ftyp, fname)) -> (ftyp, fname)) fields
          ++ map (\(Method (_, mtyp, mname, _, _)) -> (mtyp, mname)) methods
   in do
        tfields <- mapM (typeCheckField syms classes) fields
        tmeths <- mapM (typeCheckMethod syms classes) methods
        tconstrs <- mapM (typeCheckMethod syms classes) constrs
        return $ T.Typed typ (T.Class modifier typ tfields tmeths tconstrs)

typeCheckMethod :: TypeChecker MethodDecl T.Method
typeCheckMethod symtab classes (Method (modifier, typ, name, args, stmt)) =
  let syms = symtab ++ args --Todo replace existing entries
   in do
        tstmt <- typeCheckStmt syms classes stmt
        if getType tstmt == typ
          then return $ T.Typed typ $ T.Method modifier typ name args tstmt
          else throwError "Returntyp und Methodentyp stimmen nicht überein"

typeCheckField :: TypeChecker FieldDecl T.Field
typeCheckField _ _ (FieldDecl (modifier, typ, name)) = return $ T.Typed typ $ T.Field modifier typ name

--
--
--
typeCheckStmt :: TypeChecker Stmt T.Stmt
--
-- Block
typeCheckStmt symtab classes (Block [stmt]) = typeCheckStmt symtab classes stmt
typeCheckStmt symtab classes (Block (us : uss)) = do
  ts <- typeCheckStmt symtab classes us
  T.Typed ttyp ~(T.Block tss) <- typeCheckStmt symtab classes $ Block uss
  let htyp = getType ts
  if htyp == ttyp || htyp == "void"
    then return $ T.Typed ttyp $ T.Block (ts : tss)
    else throwError "Typen der Statements stimmen nicht überein"
typeCheckStmt _ _ (Block []) = return $ T.Typed "void" $ T.Block []
--
-- Return
typeCheckStmt _ _ (Return Nothing) = return $ T.Typed "void" (T.Return Nothing)
typeCheckStmt symtab cls (Return (Just e)) = do
  texpr <- typeCheckExpr symtab cls e
  return $ T.Typed (getType texpr) (T.Return $ Just texpr)
--
-- If
typeCheckStmt symtab cls (If (cond, ifs, maybeElses)) = do
  tcond <- typeCheckExpr symtab cls cond
  tifs <- typeCheckStmt symtab cls ifs
  let iftyp = getType tifs
  if getType tcond == "boolean"
    then case maybeElses of
      Just elses -> do
        telse <- typeCheckStmt symtab cls elses
        if getType telse == iftyp
          then return $ T.Typed iftyp $ T.If tcond tifs $ Just telse
          else throwError "If und Else haben verschiedene Typen"
      Nothing -> return $ T.Typed iftyp $ T.If tcond tifs Nothing
    else throwError "If-Bedingung muss boolean sein"
--
-- While
typeCheckStmt symtab cls (While (cond, stmt)) = do
  tcond <- typeCheckExpr symtab cls cond
  tstmt <- typeCheckStmt symtab cls stmt
  if getType tcond == "boolean"
    then return $ T.Typed (getType tstmt) $ T.While tcond tstmt
    else throwError "While-Bedingung muss boolean sein"
--
-- LocalVarDecl
typeCheckStmt symtab cls (LocalVarDecl (typ, name)) =
  if any ((name ==) . snd) symtab
    then throwError "Variable mit diesem Namen bereits deklariert"
    else return $ T.Typed typ (T.LocalVarDecl typ name)
--
-- Empty
typeCheckStmt symtab cls Empty = return $ T.Typed "void" T.Empty
--
-- StmtExprExpr
typeCheckStmt symtab cls (StmtExprStmt expr) = do
  tstmExpr <- typeCheckStmtExpr symtab cls expr
  return $ T.Typed (getType tstmExpr) $ T.StmtExprStmt tstmExpr

--
--
--
--
typeCheckStmtExpr :: TypeChecker StmtExpr T.StmtExpr
--
-- Assign
typeCheckStmtExpr symtab cls (Assign (exprLeft, exprRight)) = do
  tExprL <- typeCheckExpr symtab cls exprLeft
  tExprR <- typeCheckExpr symtab cls exprRight
  let leftType = getType tExprL
      rightType = getType tExprR
  if leftType == rightType
    then return $ T.Typed (getType tExprL) $ T.Assign tExprL tExprR
    else throwError $ "Kann " ++ rightType ++ " nicht " ++ leftType ++ " zuweisen"
--
-- New
typeCheckStmtExpr symtab cls (New (typ, params)) =
  case find ((typ ==) . getClassName) cls of
    Just newClass -> do
      typedArgs <- mapM (typeCheckExpr symtab cls) params
      if any (matchParams typedArgs . getParams) (getConstructors newClass)
        then return $ T.Typed typ (T.New typ typedArgs)
        else throwError $ "Kein Konstruktor in Klasse " ++ typ ++ " mit Parametern " ++ show params ++ " gefunden"
    Nothing -> throwError $ "Klasse " ++ typ ++ " nicht gefunden"
--
-- MethodCall
typeCheckStmtExpr symtab cls (MethodCall (exprLeft, name, params)) = do
  tExprL <- typeCheckExpr symtab cls exprLeft
  typedArgs <- mapM (typeCheckExpr symtab cls) params
  methClass <- case find ((getType tExprL ==) . getClassName) cls of
    Just clazz -> return clazz
    Nothing -> throwError $ "Klasse " ++ getType tExprL ++ " nicht gefunden"
  let methodsWithSameName = filter ((name ==) . getMethodName) $ getMethods methClass
  case find (matchParams typedArgs . getParams) methodsWithSameName of
    Just method -> return $ T.Typed (getMethodType method) (T.MethodCall tExprL name typedArgs)
    Nothing -> throwError $ "Methode " ++ name ++ " mit Parametern " ++ show params ++ " nicht gefunden"

--
--
matchParams :: [T.Typed a] -> [(Type, String)] -> Bool
matchParams args params = sameLength && sameTypes
  where
    sameLength = length args == length params
    sameTypes = and (zipWith (\typed (typ, _) -> typ == getType typed) args params)

--
--
--
--
typeCheckExpr :: TypeChecker Expr T.Expr
typeCheckExpr _ _ _ = throwError "todo"

--
--
--
--
emptyClass = Class ([Public], "Empty", [], [], [])

arithBinaryAbstractSyntax :: Class
arithBinaryAbstractSyntax =
  Class
    ( [Public],
      "ArithBinary",
      [],
      [],
      [ Method
          ( [],
            "int",
            "foo",
            [ ("int", "x"),
              ("int", "y")
            ],
            Return
              ( Just $
                  Binary
                    ( Plus,
                      LocalOrFieldVar "x",
                      LocalOrFieldVar "y"
                    )
              )
          )
      ]
    )

x = typeCheckClass [] [] emptyClass

--main = do
--  s <- readFile "fst.stmt"
--  print s

--s <- readFile "if.stmt"
-- print (parser s)
--print (typeCheckStmt (parser s) [] [])
