module Test.AbstractTranslations.ArithUnary where

import ScannerParser.AbstrakteSyntax

arithUnaryAbstractSyntax = 
    Class(
        [Public], 
        "ArithUnary", 
        [],
        [Method(
            [], 
            "int", 
            "foo", 
            [
                ("int","x")
            ],
            Block [
                Return(
                    Just (
                        Unary (
                            Negation,
                            LocalOrFieldVar "x"
                        )
                    )
                )
            ] 
        )]
    )

-- arithUnaryAbstractTypedSyntax

-- arithUnaryAbstractByteCode