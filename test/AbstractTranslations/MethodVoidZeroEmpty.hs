module Test.AbstractTranslations.MethodVoidZeroEmpty where

import ScannerParser.AbstrakteSyntax2

methodVoidZeroEmptyAbstractSyntax = 
    Class(
        [Public], 
        "MethodVoidZeroEmpty", 
        [],
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