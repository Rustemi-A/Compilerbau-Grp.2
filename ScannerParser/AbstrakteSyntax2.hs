module AbstrakteSyntax2 where

import HappyParser

data Class = Class([Modifier], Type, [FieldDecl], [MethodDecl])
           deriving (Eq, Show)

data FieldDecl = FieldDecl([Modifier], Type, String)
           deriving (Eq, Show)

data MethodDecl = Method([Modifier], Type, String,[(Type, String)], Stmt)
           deriving (Eq, Show)

data Expr = This
--            | Super
            | LocalOrFieldVar(String)
            | InstVar(Expr, String)
            | Unary(UnaryOp, Expr)
            | Binary(BinaryOp, Expr, Expr)
            | Integer(Integer)
            | Bool(Bool)
            | Char(Char)
            | String(String)
            | Jnull
            | StmtExprExpr(StmtExpr)
           deriving (Eq, Show)

data StmtExpr = Assign(Expr, Expr)
                | New(Type, [Expr])
                | MethodCall(Expr, String, [Expr])
           deriving (Eq, Show)

data Stmt = Block([Stmt])
            | Return( Expr )
            | While( Expr , Stmt )
            | LocalVarDecl( Type, String )
            | If( Expr, Stmt , Maybe Stmt )
            | StmtExprStmt(StmtExpr)
           deriving (Eq, Show)

data Modifier = Public 
                |Private 
                |Static 
                |Final
           deriving (Eq, Show)

data BinaryOp  = EQ
                | LT
                | GT
                | GE
                | LE
                | Plus
                | Minus
                | Mult
                | Div
                | Modulo
                | AND
                | OR
                | BitwiseAND
                | BitwiseOR
           deriving (Eq, Show)

data UnaryOp = Neg 
                |Plus 
                |Minus
           deriving (Eq, Show)