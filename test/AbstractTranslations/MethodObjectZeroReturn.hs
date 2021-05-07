module Test.AbstractTranslations.MethodObjectZeroReturn where

import AbstrakteSyntax

methodObjectZeroReturnAbstractSyntax = 
    Class(
        [Public], 
        "MethodObjectZeroReturn", 
        [],
        [Method (
            [], 
            "", 
            "MethodObjectZeroReturn", 
            [], 
            Block [])],
        [Method (
            [], 
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