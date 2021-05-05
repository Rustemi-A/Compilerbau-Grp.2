module Test.AbstractTranslations.MethodVoidTwoEmpty where

import ScannerParser.AbstrakteSyntax

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