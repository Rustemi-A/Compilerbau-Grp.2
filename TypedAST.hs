{-# LANGUAGE GADTs #-}

module TypedAST
  ( Typed (..),
    Class (..),
    Field (..),
    Method (..),
    Expr (..),
    StmtExpr (..),
    Stmt (..),
    --   BinaryOp (..),
    --UnaryOp (..),
  )
where

import qualified ScannerParser.AbstrakteSyntax2 as U

data Typed ast = Typed U.Type ast
  deriving (Eq, Show)

data Class = Class [U.Modifier] U.Type [Typed Field] [Typed Method] -- public class A{}
  deriving (Eq, Show)

data Field = Field [U.Modifier] U.Type String -- int v
  deriving (Eq, Show)

data Method = Method [U.Modifier] U.Type String [(U.Type, String)] Stmt -- void methode(int x, char c){}
  deriving (Eq, Show)

data Expr
  = This
  | LocalOrFieldVar String -- i
  | InstVar (Typed Expr) String -- object.var
  | Unary U.UnaryOp (Typed Expr) -- !i
  | Binary (Typed Expr) U.BinaryOp (Typed Expr) -- i + j
  | Int Integer
  | Bool Bool
  | Char Char -- 'a'
  | String String -- "Hello World"
  | Jnull -- null
  | StmtExprExpr (Typed StmtExpr) -- StmtExpr zu Expr "casten"
  deriving (Eq, Show)

data StmtExpr
  = Assign (Typed Expr) (Typed Expr) -- i = 1
  | New U.Type [Typed Expr] -- new A(params);
  | MethodCall (Typed Expr) String [Typed Expr] -- a.methode(x,c)
  deriving (Eq, Show)

data Stmt
  = Block [Typed Stmt] -- {}
  | Return (Maybe (Typed Expr)) -- return x
  | While (Typed Expr) (Typed Stmt) -- while(boolean) {...}
  | LocalVarDecl U.Type String -- int i = 1;
  | If (Typed Expr) (Typed Stmt) (Maybe (Typed Stmt)) -- if(boolean){...}else {...}
 -- Empty Anmerkung: habe ich aus dem AST gelöscht - Etienne
  | StmtExprStmt (Typed StmtExpr) -- StmtExpr zu Stmt "casten"
  deriving (Eq, Show)

{-
data UnaryOp t where
  Neg :: UnaryOp Bool
  Plus :: UnaryOp Int
  Minus :: UnaryOp Int

instance Show (UnaryOp t) where
  show Neg = "!"
  show Plus = "+"
  show Minus = "-"

instance Eq (UnaryOp t) where
  Neg == Neg = True
  Plus == Plus = True
  Minus == Minus = True
  _ == _ = False
-}
--  deriving (Eq, Show)
{-data Modifier
  = Public
  | Private
  | Static
  | Final
  deriving (Eq, Show)

data BinaryOp =
  EQ :: BinaryOp Bool *
  LT :: BinaryOp Bool Int
  GT :: BinaryOp Bool Int
  GE :: BinaryOp Bool Int
  LE :: BinaryOp Bool Int
  Add :: BinaryOp Int Int
  Sub :: BinaryOp Int Int
  Mult :: BinaryOp Int Int
  Div :: BinaryOp Int Int
  Modulo :: BinaryOp Int Int
  AND :: BinaryOp Bool Bool
  OR :: BinaryOp Bool Bool
  BitwiseAND :: BinaryOp Int Int
  BitwiseOR :: BinaryOp Int Int
--  deriving (Eq, Show)
-}
