{-# LANGUAGE GADTs #-}

module TypedAST
  ( Type (..),
    Class (..),
    Field (..),
    Method (..),
    Expr (..),
    StmtExpr (..),
    Stmt (..),
    --   BinaryOp (..),
    UnaryOp (..),
  )
where

import qualified ScannerParser.AbstrakteSyntax2 as U

data Type t where
  TBool :: Type Bool
  TInt :: Type Int
  TObj :: String -> TObj
  TVoid :: Type ()

-- deriving (Show, Eq)

instance Show (Type t) where
  show TBool = "boolean"
  show TInt = "int"
  show (TObj o) = o
  show TVoid = "void"

instance Eq (Type t) where
  TBool == TBool = True
  TInt == TInt = True
  (TObj o1) == (TObj o2) = o1 == o2
  TVoid == TVoid = True

type TObj = Type String

data Class = Class [U.Modifier] TObj [Field *] [Method *] -- public class A{}
  deriving (Eq, Show)

data Field t = Field [U.Modifier] (Type t) String -- int v
  deriving (Eq, Show)

data Method t = Method [U.Modifier] (Type t) String [(Type t, String)] (Stmt t) -- void methode(int x, char c){}
  deriving (Eq, Show)

data Expr t
  = This
  | LocalOrFieldVar String -- i
  | InstVar (Expr t) String -- object.var
  | Unary (UnaryOp t) (Expr t) -- !i
  | Binary (Expr *) U.BinaryOp (Expr *) -- i + j
  | Int Integer
  | Bool Bool
  | Char Char -- 'a'
  | String String -- "Hello World"
  | Jnull -- null
  | StmtExprExpr (StmtExpr t) -- StmtExpr zu Expr "casten"
  deriving (Eq, Show)

data StmtExpr t
  = Assign (Expr t) (Expr t) -- i = 1
  | New TObj [Expr *] -- new A(params);
  | MethodCall (Expr *) String [Expr *] -- a.methode(x,c)
  deriving (Eq, Show)

data Stmt t
  = Block [Stmt *] -- {}
  | Return (Maybe (Expr t)) -- return x
  | While (Expr (Type Bool)) (Stmt t) -- while(boolean) {...}
  | LocalVarDecl (Type t) String -- int i = 1;
  | If (Expr (Type Bool)) (Stmt t) (Maybe (Stmt t)) -- if(boolean){...}else {...}
  | StmtExprStmt (StmtExpr t) -- StmtExpr zu Stmt "casten"
  deriving (Eq, Show)

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
