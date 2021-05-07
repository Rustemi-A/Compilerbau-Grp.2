module Test.AbstractTranslations.MethodVoidZeroEmpty where

import AbstrakteSyntax

methodVoidZeroEmptyAbstractSyntax = 
    Class(
        [Public], 
        "MethodVoidZeroEmpty", 
        [],
        [Method (
            [], 
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