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
    T.Typed "Block" (T.Class
        [Public] 
        "Block" 
        []
        [T.Typed "void" (T.Method
            [Public] 
            "void" 
            "Block" 
            [] 
            (T.Typed "void" (T.Block [])))
        ]
        [T.Typed "void" (T.Method 
            [Public] 
            "void" 
            "foo" 
            [] 
            (T.Typed "void" (T.Block [
                T.Typed "void" (T.Block [])
            ])))
        ]
    )

-- blockAbstractByteCode