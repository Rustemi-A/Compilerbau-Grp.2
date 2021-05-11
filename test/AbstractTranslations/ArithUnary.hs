module Test.AbstractTranslations.ArithUnary where

import AbstrakteSyntax

arithUnaryAbstractSyntax = 
    Class(
        [Public], 
        "ArithUnary", 
        [],
        [Method (
            [Public], 
            "", 
            "ArithUnary", 
            [], 
            Block [])],
        [Method(
            [Public], 
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