module Test.AbstractTranslations.MethodObjectZeroReturn where

import ScannerParser.AbstrakteSyntax

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