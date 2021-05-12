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
    T.Typed "Empty" (T.Class
        [Public] 
        "Empty" 
        []
        [T.Typed "void" (T.Method
            [Public] 
            "void" 
            "Empty" 
            [] 
            (T.Typed "void" (T.Block [])))
        ]
        []
    )

-- localVarDeclAbstractByteCode