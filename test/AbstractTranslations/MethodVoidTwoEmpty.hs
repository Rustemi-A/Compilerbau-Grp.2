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
    T.Typed "MethodVoidTwoEmpty" (T.Class
        [Public] 
        "MethodVoidTwoEmpty" 
        []
        [T.Typed "void" (T.Method
            [Public] 
            "void" 
            "MethodVoidTwoEmpty" 
            [] 
            (T.Typed "void" (T.Block [])))
        ]
        [T.Typed "void" (T.Method 
            [Public] 
            "void" 
            "foo" 
            [
                ("int", "x"),
                ("char", "c")
            ] 
            (T.Typed "void" (T.Block [])))]
    )

-- methodVoidTwoEmptyAbstractByteCode