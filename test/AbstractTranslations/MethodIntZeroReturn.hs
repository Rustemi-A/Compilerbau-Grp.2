module Test.AbstractTranslations.MethodIntZeroReturn where

import AbstrakteSyntax

methodIntZeroReturnAbstractSyntax = 
    Class(
        [Public], 
        "MethodIntZeroReturn", 
        [],
        [Method (
            [Public], 
            "void", 
            "MethodIntZeroReturn", 
            [], 
            Block [])],
        [Method (
            [Public], 
            "int", 
            "foo", 
            [], 
            Block [
                Return (
                    Just (
                        Integer 1
                    ) 
                )
            ]
        )]
    )

-- methodIntZeroReturnAbstractTypedSyntax

-- methodIntZeroReturnAbstractByteCode