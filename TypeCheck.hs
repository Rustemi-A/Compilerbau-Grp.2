module TypeCheckStmt where

--import JavaParser_mit_Typen
import ScannerParser.AbstrakteSyntax
import qualified TypedAST as T

getAST (T.Typed _ ast) = ast

getType (T.Typed typ _) = typ

type TypeChecker u t = [(Type, String)] -> [Class] -> u -> T.Typed t

typeCheckClass :: TypeChecker Class T.Class
typeCheckClass symtab classes (Class (modifier, typ, fields, methods)) =
  let syms =
        symtab
          ++ map (\(FieldDecl (_, ftyp, fname)) -> (ftyp, fname)) fields
          ++ map (\(Method (_, mtyp, mname, _, _)) -> (mtyp, mname)) methods
      tfields = map (typeCheckField syms classes) fields
      tmeths = map (typeCheckMethod syms classes) methods
   in T.Typed typ (T.Class modifier typ tfields tmeths)

typeCheckMethod :: TypeChecker MethodDecl T.Method
typeCheckMethod symtab classes (Method (modifier, typ, name, args, stmt)) =
  let syms = symtab ++ args --Todo replace existing entries
      tstmt = typeCheckStmt syms classes stmt
   in if getType tstmt == typ
        then T.Typed typ $ T.Method modifier typ name args tstmt
        else error "Returntyp und Methodentyp stimmen nicht überein"

typeCheckField :: TypeChecker FieldDecl T.Field
typeCheckField _ _ (FieldDecl (modifier, typ, name)) = T.Typed typ $ T.Field modifier typ name

typeCheckStmt :: TypeChecker Stmt T.Stmt
-- Block
typeCheckStmt symtab classes (Block [stmt]) = typeCheckStmt symtab classes stmt
typeCheckStmt symtab classes (Block (us : uss)) =
  let ts = typeCheckStmt symtab classes us
      htyp = getType ts
      T.Typed ttyp (T.Block tss) = typeCheckStmt symtab classes $ Block uss
   in if htyp == ttyp || htyp == "void"
        then T.Typed ttyp $ T.Block (ts : tss)
        else error "Typen der Statements stimmen nicht überein"
typeCheckStmt _ _ (Block []) = T.Typed "void" $ T.Block []
-- Return
typeCheckStmt _ _ (Return Nothing) = T.Typed "void" (T.Return Nothing)
typeCheckStmt symtab cls (Return (Just e)) =
  let texpr = typeCheckExpr symtab cls e
   in T.Typed (getType texpr) (T.Return $ Just texpr)
-- If
typeCheckStmt symtab cls (If (cond, ifs, elses)) =
  let tcond = typeCheckExpr symtab cls cond
      tifs = typeCheckStmt symtab cls ifs
      iftyp = getType tifs
      telse = fmap (typeCheckStmt symtab cls) elses
   in if getType tcond == "boolean"
        then case telse of
          Just telse ->
            if getType telse == iftyp
              then T.Typed iftyp $ T.If tcond tifs $ Just telse
              else error "If und Else haben verschiedene Typen."
          Nothing -> T.Typed iftyp $ T.If tcond tifs Nothing
        else error "If-Bedingung muss boolean sein"
-- While
typeCheckStmt symtab cls (While (cond, stmt)) =
  let tcond = typeCheckExpr symtab cls cond
      tstmt = typeCheckStmt symtab cls stmt
   in if getType tcond == "boolean"
        then T.Typed (getType tstmt) $ T.While tcond tstmt
        else error "While-Bedingung muss boolean sein"
-- LocalVarDecl
typeCheckStmt symtab cls (LocalVarDecl (typ, name)) =
  error "Todo"
--Empty
--typeCheckStmt symtab cls Empty = T.Typed "void" T.Empty
-- StmtExprExpr
typeCheckStmt symtab cls (StmtExprStmt expr) =
  error "Todo"

typeCheckExpr :: TypeChecker Expr T.Expr
typeCheckExpr = error "todo"

{-
instance TypeCheckable Stmt T.TStmt (*) where
  typeCheckStmt (If (be, ifs, Nothing)) symtab cls =
    let bexp = typeCheckStmt be symtab cls
        ifstmt = typeCheckStmt ifs symtab cls
     in if getType bexp == "boolean"
          then TypedStmt (If (bexp, ifstmt, Nothing), getType ifstmt)
          else error "boolean expected"
  typeCheckStmt (If (be, ifs, Just elses)) symtab cls =
    let bexp = typeCheckStmt be symtab cls
        ifstmt = typeCheckStmt ifs symtab cls
        elsestmt = typeCheckStmt elses symtab cls
     in if getType bexp == "boolean"
          then
            if getType ifstmt == getType elsestmt
              then TypedStmt (If (bexp, ifstmt, Just elsestmt), getType elsestmt)
              else error "if und else unterschiedlich"
          else error "boolean expected"
  typeCheckStmt (While (be, s)) symtab cls =
    let bexp = typeCheckStmt be symtab cls
        stmt = typeCheckStmt s symtab cls
     in if getType bexp == "boolean"
          then TypedStmt (While (bexp, stmt), getType stmt)
          else error "boolean expected"
  typeCheckStmt (Block [s]) symtab cls = typeCheck s symtab cls
  typeCheckStmt (Block (s : sts)) symtab cls =
    let stmt = typeCheckStmt s symtab cls
        stmts = typeCheckStmt (Block sts) symtab cls
     in if getType stmt == getType stmts || getType stmt == "void"
          then TypedStmt (Block (s : sts), getType stmts)
          else error "wrong types in statements"
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

emptyClass = Class ([Public], "Empty", [], [])

arithBinaryAbstractSyntax =
  Class
    ( [Public],
      "ArithBinary",
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
