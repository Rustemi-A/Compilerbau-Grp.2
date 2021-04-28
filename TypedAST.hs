{-# LANGUAGE GADTs #-}

module TypedAST
  ( TClass,
    TFieldDecl,
    TMethodDecl,
    TExpr (..),
    TStmtExpr (..),
    TStmt (..),
  )
where

import JavaParser_mit_Typen

newtype TClass = Class ([Modifier], Type, [TFieldDecl *], [TMethodDecl *]) -- public class A{}
--  deriving (Eq, Show)

newtype TFieldDecl t = FieldDecl ([Modifier], t, String) -- int v
--  deriving (Eq, Show)

newtype TMethodDecl t = Method ([Modifier], t, String, [(Type, String)], TStmt t) -- void methode(int x, char c){}
--  deriving (Eq, Show)

data TExpr t where
  This :: TExpr t
  LocalOrFieldVar :: String -> TExpr t -- int i
  InstVar :: (TExpr t, String) -> TExpr t -- object.var
  Unary :: (TUnaryOp t, TExpr t) -> TExpr t -- !i
  Binary :: (BinaryOp, TExpr t, TExpr t) -> TExpr t -- i + j
  Integer :: Integer -> TExpr Integer
  Bool :: Bool -> TExpr Bool
  Char :: Char -> TExpr Char -- 'a'
  String :: String -> TExpr String -- "Hello World"
  Jnull :: TExpr t -- null
  StmtExprExpr :: TStmtExpr t -> TExpr t -- StmtExpr zu Expr "casten"
  --  deriving (Eq, Show)

data TStmtExpr t where
  Assign :: (TExpr t, TExpr t) -> TStmtExpr t -- i = 1
  New :: (t, [TExpr *]) -> TStmtExpr t -- new A(params);
  MethodCall :: (TExpr *, String, [TExpr *]) -> TStmtExpr t -- a.methode(x,c)
  --  deriving (Eq, Show)

data TStmt t where
  Block :: [TStmt *] -> TStmt t -- {}
  Return :: TExpr t -> TStmt t -- return x
  While :: (TExpr Bool, TStmt t) -> TStmt t -- while(boolean) {...}
  LocalVarDecl :: (t, String) -> TStmt t -- int i = 1;
  If :: (TExpr Bool, TStmt t, Maybe (TStmt t)) -> TStmt t -- if(boolean){...}else {...}
  StmtExprStmt :: TStmtExpr t -> TStmt t -- StmtExpr zu Stmt "casten"
  --  deriving (Eq, Show)

data Modifier
  = Public
  | Private
  | Static
  | Final
  deriving (Eq, Show)

data BinaryOp
  = EQ
  | LT
  | GT
  | GE
  | LE
  | Add
  | Sub
  | Mult
  | Div
  | Modulo
  | AND
  | OR
  | BitwiseAND
  | BitwiseOR
  deriving (Eq, Show)

data TUnaryOp t where
  Neg :: TUnaryOp Bool
  Plus :: TUnaryOp Integer
  Minus :: TUnaryOp Integer

--  deriving (Eq, Show)
