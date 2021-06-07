module Test.AbstractTranslations.LocalVarDecl where

import AbstrakteSyntax
import qualified TypedAST as T

localVarDeclAbstractSyntax = 
    Class(
        [Public], 
        "LocalVarDecl", 
        [],
        [Method (
            [Public], 
            "void", 
            "LocalVarDecl", 
            [], 
            Block [])],
        [Method (
            [Public], 
            "void", 
            "foo", 
            [], 
            Block [
                LocalVarDecl (
                    "int", 
                    "x"
                ),
                StmtExprStmt (
                    Assign (
                        LocalOrFieldVar "x",
                        Integer 1    
                    )
                )
            ]
        )]
    )

localVarDeclAbstractTypedSyntax = 
    T.Typed "LocalVarDecl" (T.Class
        [Public] 
        "LocalVarDecl" 
        []
        [T.Typed "void" (T.Method
            [Public] 
            "void" 
            "LocalVarDecl" 
            [] 
            (T.Typed "void" (T.Block [])))
        ]
        [T.Typed "void" (T.Method 
            [Public] 
            "void" 
            "foo" 
            [] 
            (T.Typed "void" (T.Block [
                T.Typed "int" (T.LocalVarDecl "int" "x"),
                T.Typed "int" (T.StmtExprStmt (T.Typed "int" (T.Assign (T.Typed "int" (T.LocalOrFieldVar "x")) (T.Typed "int" (T.Int 42)))))
            ])))
        ]
    )

-- localVarDeclAbstractByteCode