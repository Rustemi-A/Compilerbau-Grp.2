module Test.AbstractTranslations.MethodVoidZeroEmpty where

import AbstrakteSyntax
import qualified TypedAST as T

methodVoidZeroEmptyAbstractSyntax = 
    Class(
        [Public], 
        "MethodVoidZeroEmpty", 
        [],
        [Method (
            [Public], 
            "void", 
            "MethodVoidZeroEmpty", 
            [], 
            Block [])],
        [Method (
            [Public], 
            "void", 
            "foo", 
            [], 
            Block []
        )]
    )

methodVoidZeroEmptyAbstractTypedSyntax = 
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

-- methodVoidZeroEmptyAbstractByteCode