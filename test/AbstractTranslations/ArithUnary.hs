module Test.AbstractTranslations.ArithUnary where

import AbstrakteSyntax

arithUnaryAbstractSyntax = 
    Class(
        [Public], 
        "ArithUnary", 
        [],
        [Method (
            [], 
            "", 
            "ArithUnary", 
            [], 
            Block [])],
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