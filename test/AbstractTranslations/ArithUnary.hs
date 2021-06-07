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
    T.Typed "ArithUnary" (T.Class
        [Public] 
        "ArithUnary" 
        []
        [T.Typed "void" (T.Method
            [Public] 
            "void" 
            "ArithUnary" 
            [] 
            (T.Typed "void" (T.Block [])))
        ]
        [T.Typed "int" (
            T.Method 
            [Public] 
            "int" 
            "foo" 
            [("int", "x")] 
            (T.Typed "int" (T.Block [
                T.Typed "int" (T.Return (Just (T.Typed "int" (T.Unary Negation (T.Typed "int" (T.LocalOrFieldVar "x"))))))
            ])))
        ]
    )

-- arithUnaryAbstractByteCode