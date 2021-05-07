module Test.AbstractTranslations.MethodVoidOneEmpty where

import AbstrakteSyntax

methodVoidOneEmptyAbstractSyntax = 
    Class(
        [Public], 
        "MethodVoidOneEmpty", 
        [],
        [Method (
            [], 
            "", 
            "MethodVoidOneEmpty", 
            [], 
            Block [])],
        [Method (
            [], 
            "void", 
            "foo", 
            [
                ("int", "x")
            ], 
            Block []
        )]
    )

-- methodVoidOneEmptyAbstractTypedSyntax

-- methodVoidOneEmptyAbstractByteCode