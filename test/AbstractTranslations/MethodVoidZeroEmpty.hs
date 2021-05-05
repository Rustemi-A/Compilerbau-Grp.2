module Test.AbstractTranslations.MethodVoidZeroEmpty where

import ScannerParser.AbstrakteSyntax

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