module Test.AbstractTranslations.StaticCalls where

import ScannerParser.AbstrakteSyntax2

staticCallsAbstractSyntax = 
    Class(
        [Public], 
        "StaticCalls", 
        [],
        [Method (
            [], 
            "int", 
            "foo", 
            [], 
            Block [
                StmtExprStmt (
                    MethodCall (
                        String "StaticMethod", 
                        "foo", 
                        []
                    )
                ),
                Return (
                    Just(
                        InstVar (
                            String "StaticAttri", 
                            "i")
                    )
                )
            ]
        )]
    )

-- staticCallsAbstractTypedSyntax

-- staticCallsAbstractByteCode