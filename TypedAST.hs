module TypedAST
  ( Typed (..),
    Class (..),
    Field (..),
    Method (..),
    Expr (..),
    StmtExpr (..),
    Stmt (..),
  )
where

import qualified AbstrakteSyntax as U

data Typed ast = Typed U.Type ast
  deriving (Eq, Show)

data Class = Class [U.Modifier] U.Type [Typed Field] [Typed Method] [Typed Method] -- public class A{}
  deriving (Eq, Show)

data Field = Field [U.Modifier] U.Type String -- int v
  deriving (Eq, Show)

data Method = Method [U.Modifier] U.Type String [(U.Type, String)] (Typed Stmt) -- void methode(int x, char c){}
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
  | LocalVarDecl U.Type String -- int i;
  | If (Typed Expr) (Typed Stmt) (Maybe (Typed Stmt)) -- if(boolean){...}else {...}
  | Empty
  | StmtExprStmt (Typed StmtExpr) -- StmtExpr zu Stmt "casten"
  deriving (Eq, Show)
