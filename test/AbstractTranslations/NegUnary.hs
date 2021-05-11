module Test.AbstractTranslations.NegUnary where

import AbstrakteSyntax

negUnaryAbstractSyntax = 
    Class(
        [Public], 
        "NegUnary", 
        [],
        [Method (
            [Public], 
            "", 
            "NegUnary", 
            [], 
            Block [])],
        [Method (
            [Public], 
            "void", 
            "foo", 
            [
                ("boolean", "x")
            ], 
            Block [
                If (
                    Unary (
                        Negation , 
                        LocalOrFieldVar "x"), 
                    Block [], 
                    Nothing )
            ]
        )]
    )

-- negUnaryAbstractTypedSyntax

-- negUnaryAbstractByteCode