module Test.AbstractTranslations.While where

import AbstrakteSyntax
import qualified TypedAST as T

whileAbstractSyntax = 
    Class(
        [Public], 
        "While", 
        [],
        [Method (
            [Public], 
            "void", 
            "While", 
            [], 
            Block [])],
        [Method (
            [Public], 
            "void", 
            "foo", 
            [], 
            Block [
                While (
                    Bool True, 
                    Block [])
            ]
        )]
    )

whileAbstractTypedSyntax = 
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

-- whileAbstractByteCode