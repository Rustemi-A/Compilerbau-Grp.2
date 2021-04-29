module ScannerParser.AbstrakteSyntax2
  ( Class (..),
    FieldDecl (..),
    MethodDecl (..),
    Expr (..),
    StmtExpr (..),
    Stmt (..),
    Modifier (..),
    BinaryOp (..),
    UnaryOp (..),
    Type,
  )
where

type Type = String

newtype Class = Class ([Modifier], Type, [FieldDecl], [MethodDecl]) -- public class A{}
  deriving (Eq, Show)

newtype FieldDecl = FieldDecl ([Modifier], Type, String) -- int v
  deriving (Eq, Show)

newtype MethodDecl = Method ([Modifier], Type, String, [(Type, String)], Stmt) -- void methode(int x, char c){}
  deriving (Eq, Show)

data Expr
  = This
  | LocalOrFieldVar String -- i
  | InstVar (Expr, String) -- object.var
  | Unary (UnaryOp, Expr) -- i++
  | Binary (BinaryOp, Expr, Expr) -- i + j
  | Integer Integer -- 1
  | Bool Bool -- true
  | Char Char -- 'a'
  | String String -- "Hello World"
  | Jnull -- null
  | StmtExprExpr StmtExpr -- StmtExpr zu Expr "casten"
  deriving (Eq, Show)

data StmtExpr
  = Assign (Expr, Expr) -- i = 1
  | New (Type, [Expr]) -- new A(params);
  | MethodCall (Expr, String, [Expr]) -- a.methode(x,c)
  deriving (Eq, Show)

data Stmt
  = Block [Stmt] -- {}
  | Return (Maybe Expr) -- return x
  | While (Expr, Stmt) -- while(boolean) {...}
  | LocalVarDecl (Type, String) -- int i = 1;
  | If (Expr, Stmt, Maybe Stmt) -- if(boolean){...}else {...}
  | Empty -- kein Statement oder nur ;
  | StmtExprStmt StmtExpr -- StmtExpr zu Stmt "casten"
  deriving (Eq, Show)

data Modifier
  = Public -- public
  | Private -- private
  | Static -- static
  | Final -- final
  deriving (Eq, Show)

data BinaryOp
  = Equals -- ==
  | LT -- <
  | GT -- >
  | GE -- >=
  | LE -- <=
  | Plus -- +
  | Minus -- -
  | Mult --  *
  | Div -- /
  | Modulo -- %
  | AND -- &&
  | OR  -- ||
  | BitwiseAND -- &
  | BitwiseOR --  |
  deriving (Eq, Show)

data UnaryOp
  = Negation -- !
  | Positiv -- +
  | Negativ -- -
  deriving (Eq, Show)
