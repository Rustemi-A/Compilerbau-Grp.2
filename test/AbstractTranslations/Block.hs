module Test.AbstractTranslations.Block where

import AbstrakteSyntax
import qualified TypedAST as T

blockAbstractSyntax = 
    Class(
        [Public], 
        "Block", 
        [],
        [Method (
            [Public], 
            "void", 
            "Block", 
            [], 
            Block [])],
        [Method(
            [Public], 
            "void", 
            "foo", 
            [],
            Block [
                Block []
            ]
        )]
    )

blockAbstractTypedSyntax = 
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

-- blockAbstractByteCode