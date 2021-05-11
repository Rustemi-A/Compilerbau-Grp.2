module Test.AbstractTranslations.ArithBinary where

import AbstrakteSyntax

arithBinaryAbstractSyntax = 
    Class(
        [Public], 
        "ArithBinary", 
        [],
        [Method (
            [Public], 
            "", 
            "ArithBinary", 
            [], 
            Block [])],
        [Method(
            [Public], 
            "int", 
            "foo", 
            [
                ("int","x"),
                ("int", "y")
            ], 
            Block [
                Return(
                    Just (
                        Binary(
                            Plus, 
                            LocalOrFieldVar "x",
                            LocalOrFieldVar "y"
                        )
                    )
                )
            ]
        )]
    )

-- arithBinaryAbstractTypedSyntax

-- arithBinaryAbstractByteCode