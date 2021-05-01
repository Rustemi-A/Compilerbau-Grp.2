module Test.AbstractTranslations.MethodVoidTwoEmpty where

import ScannerParser.AbstrakteSyntax2

methodVoidTwoEmptyAbstractSyntax = 
    Class(
        [Public], 
        "MethodVoidTwoEmpty", 
        [],
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