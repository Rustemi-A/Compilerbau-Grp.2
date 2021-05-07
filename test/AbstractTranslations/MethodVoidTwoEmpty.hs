module Test.AbstractTranslations.MethodVoidTwoEmpty where

import AbstrakteSyntax

methodVoidTwoEmptyAbstractSyntax = 
    Class(
        [Public], 
        "MethodVoidTwoEmpty", 
        [],
        [Method (
            [], 
            "", 
            "MethodVoidTwoEmpty", 
            [], 
            Block [])],
        [Method (
            [], 
            "void", 
            "foo", 
            [
                ("int", "x"),
                ("char", "c")
            ], 
            Block []
        )]
    )

-- methodVoidTwoEmptyAbstractTypedSyntax

-- methodVoidTwoEmptyAbstractByteCode