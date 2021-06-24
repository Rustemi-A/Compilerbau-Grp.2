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
    T.Typed "NegUnary" (T.Class
        [Public]
        "NegUnary"
        []
        [T.Typed "void" (T.Method
            [Public]
            "void"
            "NegUnary"
            []
            (T.Typed "void" (T.Block [])))
        ]
        [
            T.Typed "void" (T.Method
            [Public]
            "void"
            "foo"
            [
                ("boolean", "x")
            ]
            (T.Typed "void" (T.Block [
                T.Typed "void" (T.If
                    (T.Typed "boolean" (T.Unary Negation (T.Typed "boolean" (T.LocalOrFieldVar "x"))))
                    (T.Typed "void" (T.Block []))
                    Nothing)
            ])))
        ]
    )

-- negUnaryAbstractByteCode
