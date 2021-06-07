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
    T.Typed "StaticMethod" (T.Class
        [Public] 
        "StaticMethod" 
        []
        [T.Typed "void" (T.Method
            [Public] 
            "void" 
            "StaticMethod" 
            [] 
            (T.Typed "void" (T.Block [])))
        ]
        [
            T.Typed "void" (T.Method 
            [Public, Static] 
            "void" 
            "foo" 
            [] 
            (T.Typed "void" (T.Block [])))
        ]
    )

-- staticMethodAbstractByteCode