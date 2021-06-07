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
    T.Typed "FinalClass" (T.Class
        [Public, Final] 
        "FinalClass" 
        []
        [T.Typed "void" (T.Method
            [Public] 
            "void" 
            "FinalClass" 
            [] 
            (T.Typed "void" (T.Block [])))
        ]
        []
    )

-- finalClassAbstractByteCode