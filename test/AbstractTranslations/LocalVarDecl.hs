module Test.AbstractTranslations.LocalVarDecl where

import ScannerParser.AbstrakteSyntax2

localVarDeclAbstractSyntax = 
    Class(
        [Public,Final], 
        "LocalVarDecl", 
        [],
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