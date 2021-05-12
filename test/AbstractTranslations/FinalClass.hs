module Test.AbstractTranslations.FinalClass where

import AbstrakteSyntax
import qualified TypedAST as T

finalClassAbstractSyntax = 
    Class(
        [
            Public,
            Final
        ], 
        "FinalClass", 
        [],
        [Method (
            [Public], 
            "void", 
            "FinalClass", 
            [], 
            Block [])],
        []
    )

finalClassAbstractTypedSyntax = 
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

-- finalClassAbstractByteCode