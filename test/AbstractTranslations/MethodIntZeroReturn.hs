module Test.AbstractTranslations.MethodIntZeroReturn where

import AbstrakteSyntax

methodIntZeroReturnAbstractSyntax = 
    Class(
        [Public], 
        "MethodIntZeroReturn", 
        [],
        [Method (
            [], 
            "", 
            "MethodIntZeroReturn", 
            [], 
            Block [])],
        [Method (
            [], 
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