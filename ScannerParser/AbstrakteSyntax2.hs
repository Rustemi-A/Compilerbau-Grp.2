module AbstrakteSyntax2 where

import HappyParser

data Class = Class([Modifier], Type, [FieldDecl], [MethodDecl]) -- public class A{}
           deriving (Eq, Show)

data FieldDecl = FieldDecl([Modifier], Type, String) -- int v
           deriving (Eq, Show)

data MethodDecl = Method([Modifier], Type, String,[(Type, String)], Stmt) -- void methode(int x, char c){}
           deriving (Eq, Show)

data Expr = This
--            | Super
            | LocalOrFieldVar(String)      -- i
            | InstVar(Expr, String)        -- object.var
            | Unary(UnaryOp, Expr)         -- i++
            | Binary(BinaryOp, Expr, Expr) -- i + j
            | Integer(Integer)             -- 1
            | Bool(Bool)                   -- true
            | Char(Char)                   -- 'a'
            | String(String)               -- "Hello World"
            | Jnull                        -- null
            | StmtExprExpr(StmtExpr)       -- StmtExpr zu Expr "casten"
           deriving (Eq, Show)

data StmtExpr = Assign(Expr, Expr)                  -- int i = 1
                | New(Type, [Expr])                 -- new A(params);
                | MethodCall(Expr, String, [Expr])  -- a.methode(x,c)
           deriving (Eq, Show)

data Stmt = Block([Stmt])                     -- {}
            | Return( Expr )                  -- return x
            | While( Expr , Stmt )            -- while(boolean) {...}
            | LocalVarDecl( Type, String )    -- int i = 1;
            | If( Expr, Stmt , Maybe Stmt )   -- if(boolean){...}else {...}
            | StmtExprStmt(StmtExpr)          -- StmtExpr zu Stmt "casten"
           deriving (Eq, Show)

data Modifier =  Public 
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