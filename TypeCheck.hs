module TypeCheck where

--import JavaParser_mit_Typen
import ScannerParser.AbstrakteSyntax2
import qualified TypedAST as T

--class TypeCheckable u t where
--  typeCheck :: u -> [(String, Type)] -> [Class] -> t

--getType :: (TypeCheckable u t) -> Type
--getType (Type _ typ) = typ

type TypeChecker u t = [(Type, String)] -> [Class] -> u -> t

typeCheckClass :: TypeChecker Class T.TClass
typeCheckClass symtab classes (Class (modifier, typ, fields, methods)) =
  let syms =
        symtab
          ++ map (\(FieldDecl (_, ftyp, fname)) -> (ftyp, fname)) fields
          ++ map (\(Method (_, mtyp, mname, _, _)) -> (mtyp, mname)) methods
      tfields = map (typeCheckField syms classes) fields
      tmeths = map (typeCheckMethod syms classes) methods
   in T.Class (modifier, typ, tfields, tmeths)

typeCheckMethod :: TypeChecker MethodDecl T.TMethodDecl
typeCheckMethod symtab classes (Method (modifier, typ, name, args, stmt)) =
  let syms = symtab ++ args --Todo replace existing entries
      tstmt = typeCheckStmt syms classes stmt
   in T.Method (modifier, typ, name, args, tstmt)

typeCheckField :: TypeChecker FieldDecl T.TFieldDecl
typeCheckField _ _ (FieldDecl (modifier, typ, name)) = FieldDecl (modifier, typ, name)

typeCheckStmt :: TypeChecker Stmt (T.TStmt (*))
typeCheckStmt symtab classes (Block [stmt]) = typeCheckStmt symtab classes stmt
typeCheckStmt symtab classes (Block [stmt:stmts]) =
  let
    tstmt = typeCheckStmt symtab classes stmt
    tstmts = typeCheckStmt symtab classes stmts
  in

{-
instance TypeCheckable Stmt T.TStmt (*) where
  typeCheck (If (be, ifs, Nothing)) symtab cls =
    let bexp = typeCheck be symtab cls
        ifstmt = typeCheck ifs symtab cls
     in if getType bexp == "boolean"
          then TypedStmt (If (bexp, ifstmt, Nothing), getType ifstmt)
          else error "boolean expected"
  typeCheck (If (be, ifs, Just elses)) symtab cls =
    let bexp = typeCheck be symtab cls
        ifstmt = typeCheck ifs symtab cls
        elsestmt = typeCheck elses symtab cls
     in if getType bexp == "boolean"
          then
            if getType ifstmt == getType elsestmt
              then TypedStmt (If (bexp, ifstmt, Just elsestmt), getType elsestmt)
              else error "if und else unterschiedlich"
          else error "boolean expected"
  typeCheck (While (be, s)) symtab cls =
    let bexp = typeCheck be symtab cls
        stmt = typeCheck s symtab cls
     in if getType bexp == "boolean"
          then TypedStmt (While (bexp, stmt), getType stmt)
          else error "boolean expected"
  typeCheck (Block [s]) symtab cls = typeCheck s symtab cls
  typeCheck (Block (s : sts)) symtab cls =
    let stmt = typeCheck s symtab cls
        stmts = typeCheck (Block sts) symtab cls
     in if getType stmt == getType stmts || getType stmt == "void"
          then TypedStmt (Block (s : sts), getType stmts)
          else error "wrong types in statements"
  typeCheck Empty symtab cls = TypedStmt (Empty, "void")
  typeCheck Return Nothing symtab cls = TypedStmt (Return Nothing, "void")
  typeCheck (Return (Just e)) symtab cls =
    let typedexpr = typeCheck e symtab cls
     in TypedStmt (Return (Just typedexpr), getType typedexpr)

  getType (TypedStmt (_, typ)) = typ

instance TypeCheckable BExpr where
  typeCheck T symtab cls = TypedBExpr (T, "boolean")
  getType (TypedBExpr (_, typ)) = typ

instance TypeCheckable Expr where
  typeCheck One symtab cls = TypedExpr (One, "integer")
  getType (TypedExpr (_, typ)) = typ
-}

emptyClass = Class ([Public], "Empty", [], [])

x = typeCheckClass emptyClass [] []

--main = do
--  s <- readFile "fst.stmt"
--  print s

--s <- readFile "if.stmt"
-- print (parser s)
--print (typeCheck (parser s) [] [])
