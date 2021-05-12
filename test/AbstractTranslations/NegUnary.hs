module Test.AbstractTranslations.NegUnary where

import AbstrakteSyntax
import qualified TypedAST as T

negUnaryAbstractSyntax = 
    Class(
        [Public], 
        "NegUnary", 
        [],
        [Method (
            [Public], 
            "void", 
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

negUnaryAbstractTypedSyntax = 
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

-- negUnaryAbstractByteCode