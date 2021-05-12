module Test.AbstractTranslations.StaticMethod where

import AbstrakteSyntax
import qualified TypedAST as T

staticMethodAbstractSyntax = 
    Class(
        [Public], 
        "StaticMethod", 
        [],
        [Method (
            [Public], 
            "void", 
            "StaticMethod", 
            [], 
            Block [])],
        [Method (
            [
                Public,
                Static
            ], 
            "void", 
            "foo", 
            [], 
            Block []
        )]
    )

staticMethodAbstractTypedSyntax = 
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

-- staticMethodAbstractByteCode