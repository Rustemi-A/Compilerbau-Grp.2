module Test.AbstractTranslations.MethodVoidTwoEmpty where

import AbstrakteSyntax
import qualified TypedAST as T

methodVoidTwoEmptyAbstractSyntax = 
    Class(
        [Public], 
        "MethodVoidTwoEmpty", 
        [],
        [Method (
            [Public], 
            "void", 
            "MethodVoidTwoEmpty", 
            [], 
            Block [])],
        [Method (
            [Public], 
            "void", 
            "foo", 
            [
                ("int", "x"),
                ("char", "c")
            ], 
            Block []
        )]
    )

methodVoidTwoEmptyAbstractTypedSyntax = 
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

-- methodVoidTwoEmptyAbstractByteCode