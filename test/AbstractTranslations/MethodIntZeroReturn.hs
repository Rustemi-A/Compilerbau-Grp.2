module Test.AbstractTranslations.MethodIntZeroReturn where

import AbstrakteSyntax
import qualified TypedAST as T

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

methodIntZeroReturnAbstractTypedSyntax = 
    T.Typed "Empty" (T.Class
        [Public] 
        "Empty" 
        []
        [T.Typed "void" (T.Method
            [Public] 
            "void" 
            "Empty" 
            [] 
            (T.Typed "void" (T.Block [])))
        ]
        []
    )

-- methodIntZeroReturnAbstractByteCode