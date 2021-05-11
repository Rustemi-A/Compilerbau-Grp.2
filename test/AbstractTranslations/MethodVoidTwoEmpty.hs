module Test.AbstractTranslations.MethodVoidTwoEmpty where

import AbstrakteSyntax

methodVoidTwoEmptyAbstractSyntax = 
    Class(
        [Public], 
        "MethodVoidTwoEmpty", 
        [],
        [Method (
            [Public], 
            "", 
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

-- methodVoidTwoEmptyAbstractTypedSyntax

-- methodVoidTwoEmptyAbstractByteCode