module Test.AbstractTranslations.MethodObjectZeroReturn where

import ScannerParser.AbstrakteSyntax2

methodObjectZeroReturnAbstractSyntax = 
    Class(
        [Public], 
        "MethodObjectZeroReturn", 
        [],
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