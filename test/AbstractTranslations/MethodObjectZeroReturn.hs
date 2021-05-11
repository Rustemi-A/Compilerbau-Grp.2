module Test.AbstractTranslations.MethodObjectZeroReturn where

import AbstrakteSyntax

methodObjectZeroReturnAbstractSyntax = 
    Class(
        [Public], 
        "MethodObjectZeroReturn", 
        [],
        [Method (
            [Public], 
            "", 
            "MethodObjectZeroReturn", 
            [], 
            Block [])],
        [Method (
            [Public], 
            "Object", 
            "foo", 
            [], 
            Block [
                Return (
                    Just (
                        StmtExprExpr (
                            New (
                                "Object", 
                                [])
                        )
                    ) 
                )
            ]
        )]
    )

-- methodObjectZeroReturnAbstractTypedSyntax

-- methodObjectZeroReturnAbstractByteCode