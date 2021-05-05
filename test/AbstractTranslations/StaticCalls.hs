module Test.AbstractTranslations.StaticCalls where

import AbstrakteSyntax

staticCallsAbstractSyntax = 
    Class(
        [Public], 
        "StaticCalls", 
        [],
        [Method (
            [Public], 
            "", 
            "StaticCalls", 
            [], 
            Block [])],
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