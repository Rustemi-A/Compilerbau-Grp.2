module Test.AbstractTranslations.ArithUnary where

import AbstrakteSyntax
import qualified TypedAST as T

arithUnaryAbstractSyntax = 
    Class(
        [Public], 
        "ArithUnary", 
        [],
        [Method (
            [Public], 
            "void", 
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
                            Negativ,
                            LocalOrFieldVar "x"
                        )
                    )
                )
            ] 
        )]
    )

arithUnaryAbstractTypedSyntax = 
    T.Typed "Empty" (T.Class
        [Public] 
        "Empty" 
        []
        [T.Typed "void" (T.Method
            [Public] 
            "void" 
            "Empty" 
            [] 
            (T.Typed "void" (T.Block [])))
        ]
        []
    )

-- arithUnaryAbstractByteCode