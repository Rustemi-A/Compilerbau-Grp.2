{-# LANGUAGE MultiWayIf #-}

module TypeCheck (typeCheck) where

import AbstrakteSyntax
import Control.Applicative
import Control.Arrow ((&&&))
import Control.Monad
import Control.Monad.Except
import Data.Functor ((<&>))
import Data.List
import Data.Maybe (fromMaybe)
import qualified TypedAST as T

-- Hilfsfunktionen ungetypter AST

getClassName (Class (_, name, _, _, _)) = name

getConstructors (Class (_, _, _, constrs, _)) = constrs

findField field = find ((field ==) . (getFieldType &&& getFieldName)) . getFields

getFields (Class (_, _, fields, _, _)) = fields

getFieldType (FieldDecl (_, typ, _)) = typ

getFieldName (FieldDecl (_, _, name)) = name

getFieldMods (FieldDecl (mods, _, _)) = mods

getMethods (Class (_, _, _, _, methods)) = methods

getMethodName (Method (_, _, name, _, _)) = name

getMethodType (Method (_, typ, _, _, _)) = typ

getParams (Method (_, _, _, params, _)) = params

getAST (T.Typed _ ast) = ast

getType (T.Typed typ _) = typ

-- getMods (T.Typed _ _ mods) = mods

-- Hilfstypen /-funktionen für type check

(~=) :: Type -> Type -> Bool
"null" ~= typ
  | typ == "void" || typ == "int" || typ == "char" || typ == "boolean" = False
  | otherwise = True
typ ~= "null" = "null" ~= typ
typ ~= typ2 = typ == typ2

(?:) = flip fromMaybe

infixr 0 ?:

type ClsList = (Class, [Class])

this = fst

allClss :: ClsList -> [Class]
allClss (this, rest) = this : rest

findClass :: String -> ClsList -> Maybe Class
findClass "this" = Just . this
findClass name = find ((==) name . getClassName) . allClss

typeCheck :: Class -> [Class] -> T.Typed T.Class
typeCheck cls classes =
  let allClss = (cls, java'lang'String : java'lang'Object : classes)
   in case typeCheckClass [] allClss cls of
        Right typed -> typed
        Left e -> error e

type TypeChecker u t = [(Type, String)] -> ClsList -> u -> Either String (T.Typed t)

-- Semantische Analyse

typeCheckClass :: TypeChecker Class T.Class
typeCheckClass symtab classes (Class (modifier, typ, fields, constrs, methods)) =
  do
    tfields <- mapM (typeCheckField symtab classes) fields
    tmeths <- mapM (typeCheckMethod symtab classes) methods
    tconstrs <- mapM (typeCheckMethod symtab classes) constrs
    return $ T.Typed typ (T.Class modifier typ tfields tconstrs tmeths)

typeCheckMethod :: TypeChecker MethodDecl T.Method
typeCheckMethod symtab classes (Method (modifier, mType, name, args, stmt)) =
  typeCheckStmt (args ++ symtab) classes stmt >>= \tstmt ->
    let innerType = getType tstmt
     in if innerType ~= mType
          then return $ T.Typed mType $ T.Method modifier mType name args tstmt
          else throwError $ "Returntyp und Methodentyp stimmen nicht überein. Erwartet: " ++ mType ++ ". Gefunden: " ++ innerType

typeCheckField :: TypeChecker FieldDecl T.Field
typeCheckField _ _ (FieldDecl (modifier, typ, name)) = return $ T.Typed typ $ T.Field modifier typ name

--
--
typeCheckStmt :: TypeChecker Stmt T.Stmt
--
-- Block
--
mightReturn :: T.Stmt -> Bool
mightReturn (T.Block _) = True
mightReturn (T.Return _) = True
mightReturn T.If {} = True
mightReturn T.While {} = True
mightReturn _ = False

willReturn :: T.Stmt -> Bool
willReturn (T.Block []) = False
willReturn (T.Block [s]) = willReturn $ getAST s
willReturn (T.Block ss) = any (willReturn . getAST) ss
willReturn (T.Return _) = True
willReturn _ = False

--
--
typeCheckStmt _ _ (Block []) = return $ T.Typed "void" $ T.Block []
-- Block only has a type /= void if last statement is return or other block
typeCheckStmt symtab classes (Block [stmt]) = toBlock <$> typeCheckStmt symtab classes stmt
  where
    toBlock stmt =
      if mightReturn $ getAST stmt
        then T.Typed (getType stmt) $ T.Block [stmt]
        else T.Typed "void" $ T.Block [stmt]
--
typeCheckStmt symtab classes (Block (head : tail)) = typeCheckStmt symtab classes head >>= checkTail
  where
    checkTail typedHead =
      let newSymTab = case getAST typedHead of
            (T.LocalVarDecl varType varName) -> symtab ++ [(varType, varName)]
            _ -> symtab
       in do
            T.Typed tailType ~(T.Block typedTail) <- typeCheckStmt newSymTab classes $ Block tail
            let headType = getType typedHead
            if
                | willReturn $ getAST typedHead -> throwError "Return Statement nur als letzte Anweisung erwartet"
                | (mightReturn . getAST) typedHead && headType /= "void" && headType ~= tailType ->
                  throwError $ "Typen der Statements stimmen nicht überein: " ++ headType ++ " und " ++ tailType
                | otherwise -> return $ T.Typed tailType $ T.Block (typedHead : typedTail)
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
  if getType tcond ~= "boolean"
    then case maybeElses of
      Just elses -> do
        telse <- typeCheckStmt symtab cls elses
        if getType telse ~= iftyp
          then return $ T.Typed iftyp $ T.If tcond tifs $ Just telse
          else throwError "If und Else haben verschiedene Typen"
      Nothing -> return $ T.Typed iftyp $ T.If tcond tifs Nothing
    else throwError $ "If-Bedingung muss vom Typ boolean sein. Aktuell: " ++ getType tcond
--
-- While
typeCheckStmt symtab cls (While (cond, stmt)) = do
  tcond <- typeCheckExpr symtab cls cond
  tstmt <- typeCheckStmt symtab cls stmt
  if getType tcond ~= "boolean"
    then return $ T.Typed (getType tstmt) $ T.While tcond tstmt
    else throwError $ "While-Bedingung muss vom Typ boolean sein. Aktuell: " ++ getType tcond
--
-- LocalVarDecl
typeCheckStmt symtab cls (LocalVarDecl (typ, name)) =
  if any ((name ==) . snd) symtab
    then throwError $ "Variable " ++ name ++ " bereits deklariert"
    else return $ T.Typed typ (T.LocalVarDecl typ name)
--
-- Empty
typeCheckStmt symtab cls Empty = return $ T.Typed "void" T.Empty
--
-- StmtExprExpr
typeCheckStmt symtab cls (StmtExprStmt expr) = toStmtExpr <$> typeCheckStmtExpr symtab cls expr
  where
    toStmtExpr tstmExpr = T.Typed (getType tstmExpr) $ T.StmtExprStmt tstmExpr

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
      mods = case tExprL of
        (T.Typed varType (T.LocalOrFieldVar var)) ->
          if (varType, var) `elem` symtab
            then []
            else getFieldMods <$> findField (varType, var) (this cls) ?: []
        (T.Typed varType (T.InstVar clsExpr var)) -> (findClass varType cls >>= findField (varType, var)) <&> getFieldMods ?: []
        _ -> []

  if Final `elem` mods
    then throwError "Finalem Ausdruck kann nichts zugewiesen werden"
    else
      if leftType ~= rightType
        then return $ T.Typed leftType $ T.Assign tExprL tExprR
        else throwError $ "Kann " ++ rightType ++ " nicht " ++ leftType ++ " zuweisen"
--
-- New
typeCheckStmtExpr symtab cls (New (typ, params)) =
  case findClass typ cls of
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
  methClass <- case findClass (getType tExprL) cls of
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
    sameTypes = and (zipWith (\typed (typ, _) -> typ ~= getType typed) args params)

--
--
-- Expressions
--
typeCheckExpr :: TypeChecker Expr T.Expr
--
typeCheckExpr symtab cls Jnull = return $ T.Typed "null" T.Jnull
--
typeCheckExpr symtab cls (Integer i) = return $ T.Typed "int" $ T.Int i
--
typeCheckExpr symtab cls (Bool b) = return $ T.Typed "boolean" $ T.Bool b
--
typeCheckExpr symtab cls (Char c) = return $ T.Typed "char" $ T.Char c
--
typeCheckExpr symtab cls (String s) = return $ T.Typed "String" $ T.String s
--
typeCheckExpr symtab cls This = return $ T.Typed (getClassName $ this cls) T.This
--
typeCheckExpr symtab cls (StmtExprExpr e) = toStmtExpr <$> typeCheckStmtExpr symtab cls e
  where
    toStmtExpr stmExpr = T.Typed (getType stmExpr) $ T.StmtExprExpr stmExpr
--
--
typeCheckExpr symtab cls (LocalOrFieldVar name) = case local <|> field of
  Just varType -> return $ T.Typed varType (T.LocalOrFieldVar name)
  Nothing -> throwError $ "Variable " ++ name ++ " nicht gefunden"
  where
    local = fst <$> find ((name ==) . snd) symtab
    field = getFieldType <$> find ((name ==) . getFieldName) (getFields $ this cls)
--
--
typeCheckExpr symtab cls (Unary (op, expr)) = toTyped <$> typeCheckExpr symtab cls expr
  where
    toTyped e = T.Typed (getType e) $ T.Unary op e

--
--
typeCheckExpr symtab cls (Binary (op, left, right)) = do
  lTyped <- typeCheckExpr symtab cls left
  rTyped <- typeCheckExpr symtab cls right
  let binaryType = case op of
        op | op `elem` [Equals, LessT, GreaterT, GE, LE, AND, OR, BitwiseAND, BitwiseOR] -> "boolean"
        _ -> getType rTyped
  if getType lTyped == getType rTyped
    then return $ T.Typed binaryType $ T.Binary lTyped op rTyped
    else throwError $ "Typen in dem binären Ausdruck haben verschiedene Typen: " ++ getType lTyped ++ " und " ++ getType rTyped

--
--
typeCheckExpr symtab clss (InstVar (expr, name)) = typeCheckExpr symtab clss expr >>= checkVar
  where
    nameAndMods (FieldDecl (mods, typ, _)) = (typ, filter (`elem` [Final, Static]) mods)

    checkVar :: T.Typed T.Expr -> Either String (T.Typed T.Expr)
    checkVar typedExpr = case findClass (getType typedExpr) clss of
      Just cls -> case getFieldType <$> find ((name ==) . getFieldName) (getFields cls) of
        Just varType -> return $ T.Typed varType (T.InstVar typedExpr name)
        Nothing -> throwError $ "Feld " ++ name ++ " existiert nicht in Klasse " ++ getType typedExpr
      Nothing -> throwError $ "Klasse " ++ getType typedExpr ++ " nicht gefunden."

-- java.lang Klassen

java'lang'Object :: Class
java'lang'Object =
  Class
    ( [Public],
      "Object",
      [],
      [ Method
          ( [Public],
            "void",
            "Object",
            [],
            Block []
          )
      ],
      []
    )

java'lang'String :: Class
java'lang'String =
  Class
    ( [Public],
      "String",
      [],
      [],
      []
    )
