module Test.AbstractTranslations.MethodCall where

import ScannerParser.AbstrakteSyntax2

methodCallAbstractSyntax = 
    Class(
        [Public], 
        "MethodCall", 
        [FieldDecl (
            [],
            "MethodIntZeroReturn", 
            "o"
        )],
        [Method (
            [], 
            "int", 
            "foo", 
            [], 
            Block [
                StmtExprStmt(
                    Assign (
                        LocalOrFieldVar "o", 
                        StmtExprExpr ( 
                            New (
                                "MethodIntZeroReturn", 
                                []
                            )
                        )
                    )
                ),
                Return (
                    Just (
                        StmtExprExpr  (
                            MethodCall (
                                LocalOrFieldVar "o", 
                                "foo", 
                                [])
                        )  
                    ) 
                )
            ]
        )]
    )

-- methodCallAbstractTypedSyntax

-- methodCallAbstractByteCode