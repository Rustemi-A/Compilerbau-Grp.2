module Test.AbstractTranslations.MethodVoidOneEmpty where

import AbstrakteSyntax
import qualified TypedAST as T

methodVoidOneEmptyAbstractSyntax = 
    Class(
        [Public], 
        "MethodVoidOneEmpty", 
        [],
        [Method (
            [Public], 
            "void", 
            "MethodVoidOneEmpty", 
            [], 
            Block [])],
        [Method (
            [Public], 
            "void", 
            "foo", 
            [
                ("int", "x")
            ], 
            Block []
        )]
    )

methodVoidOneEmptyAbstractTypedSyntax = T.Typed "Empty" (T.Class
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

-- methodVoidOneEmptyAbstractByteCode