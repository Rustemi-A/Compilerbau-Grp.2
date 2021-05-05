module Test.AbstractTranslations.MethodVoidZeroEmpty where

import AbstrakteSyntax

methodVoidZeroEmptyAbstractSyntax = 
    Class(
        [Public], 
        "MethodVoidZeroEmpty", 
        [],
        [Method (
            [Public], 
            "", 
            "MethodVoidZeroEmpty", 
            [], 
            Block [])],
        [Method (
            [], 
            "void", 
            "foo", 
            [], 
            Block []
        )]
    )

-- methodVoidZeroEmptyAbstractTypedSyntax

-- methodVoidZeroEmptyAbstractByteCode