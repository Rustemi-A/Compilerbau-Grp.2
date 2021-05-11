module TypeCheckStmt where

import AbstrakteSyntax
import Control.Monad
import Control.Monad.Except
import qualified TypedAST as T

getAST (T.Typed _ ast) = ast

getType (T.Typed typ _) = typ

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
--Empty
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
--typeCheckStmtExpr _ _ _ = throwError "todo"
typeCheckStmtExpr symtab cls (Assign (exprLeft, exprRight)) = throwError "Todo: assign"
typeCheckStmtExpr symtab cls (New (typ, params)) = throwError "todo: new"
typeCheckStmtExpr symtab cls (MethodCall (exprLeft, name, params)) = throwError "todo: method"

--
--
--
--
typeCheckExpr :: TypeChecker Expr T.Expr
typeCheckExpr _ _ _ = throwError "todo"

{-
instance TypeCheckable Stmt T.TStmt (*) where
  typeCheckStmt (If (be, ifs, Nothing)) symtab cls =
    let bexp = typeCheckStmt be symtab cls
        ifstmt = typeCheckStmt ifs symtab cls
     in if getType bexp == "boolean"
          then TypedStmt (If (bexp, ifstmt, Nothing), getType ifstmt)
          else throwError "boolean expected"
  typeCheckStmt (If (be, ifs, Just elses)) symtab cls =
    let bexp = typeCheckStmt be symtab cls
        ifstmt = typeCheckStmt ifs symtab cls
        elsestmt = typeCheckStmt elses symtab cls
     in if getType bexp == "boolean"
          then
            if getType ifstmt == getType elsestmt
              then TypedStmt (If (bexp, ifstmt, Just elsestmt), getType elsestmt)
              else throwError "if und else unterschiedlich"
          else throwError "boolean expected"
  typeCheckStmt (While (be, s)) symtab cls =
    let bexp = typeCheckStmt be symtab cls
        stmt = typeCheckStmt s symtab cls
     in if getType bexp == "boolean"
          then TypedStmt (While (bexp, stmt), getType stmt)
          else throwError "boolean expected"
  typeCheckStmt (Block [s]) symtab cls = typeCheck s symtab cls
  typeCheckStmt (Block (s : sts)) symtab cls =
    let stmt = typeCheckStmt s symtab cls
        stmts = typeCheckStmt (Block sts) symtab cls
     in if getType stmt == getType stmts || getType stmt == "void"
          then TypedStmt (Block (s : sts), getType stmts)
          else throwError "wrong types in statements"
  typeCheckStmt Empty symtab cls = TypedStmt (Empty, "void")
  typeCheckStmt Return Nothing symtab cls = TypedStmt (Return Nothing, "void")
  typeCheckStmt (Return (Just e)) symtab cls =
    let typedexpr = typeCheckStmt e symtab cls
     in TypedStmt (Return (Just typedexpr), getType typedexpr)

  getType (TypedStmt (_, typ)) = typ

instance TypeCheckable BExpr where
  typeCheckStmt T symtab cls = TypedBExpr (T, "boolean")
  getType (TypedBExpr (_, typ)) = typ

instance TypeCheckable Expr where
  typeCheckStmt One symtab cls = TypedExpr (One, "integer")
  getType (TypedExpr (_, typ)) = typ
-}

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
