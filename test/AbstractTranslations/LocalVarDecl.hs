module Test.AbstractTranslations.LocalVarDecl where

import AbstrakteSyntax

localVarDeclAbstractSyntax = 
    Class(
        [Public], 
        "LocalVarDecl", 
        [],
        [Method (
            [], 
            "", 
            "LocalVarDecl", 
            [], 
            Block [])],
        [Method (
            [], 
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

-- localVarDeclAbstractTypedSyntax

-- localVarDeclAbstractByteCode