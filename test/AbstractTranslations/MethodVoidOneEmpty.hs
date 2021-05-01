module Test.AbstractTranslations.MethodVoidOneEmpty where

import ScannerParser.AbstrakteSyntax2

methodVoidOneEmptyAbstractSyntax = 
    Class(
        [Public], 
        "MethodVoidOneEmpty", 
        [],
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