module Test.AbstractTranslations.ComparisonBinary where

import AbstrakteSyntax

comparisonBinaryAbstractSyntax = 
    Class(
        [Public], 
        "ComparisonBinary", 
        [],
        [Method(
            [], 
            "void", 
            "foo", 
            [
                ("int", "x"),
                ("int", "y")
            ],
            Block [
                If (
                    Binary (
                        Equals, 
                        LocalOrFieldVar "x", 
                        LocalOrFieldVar "y"), 
                    Block [], 
                    Nothing 
                )
            ]
        )]
    )

-- comparisonBinaryAbstractTypedSyntax

-- comparisonBinaryAbstractByteCode