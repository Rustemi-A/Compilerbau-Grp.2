module Test.AbstractTranslations.MethodVoidZeroEmpty where

import AbstrakteSyntax
import qualified TypedAST as T

methodVoidZeroEmptyAbstractSyntax =
    Class(
        [Public],
        "MethodVoidZeroEmpty",
        [],
        [Method (
            [Public],
            "void",
            "MethodVoidZeroEmpty",
            [],
            Block [])],
        [Method (
            [Public],
            "void",
            "foo",
            [],
            Block []
        )]
    )

methodVoidZeroEmptyAbstractTypedSyntax =
    T.Typed "MethodVoidZeroEmpty" (T.Class
        [Public]
        "MethodVoidZeroEmpty"
        []
        [T.Typed "void" (T.Method
            [Public]
            "void"
            "MethodVoidZeroEmpty"
            []
            (T.Typed "void" (T.Block [])))
        ]
        [T.Typed "void" (T.Method
            [Public]
            "void"
            "foo"
            []
            (T.Typed "void" (T.Block [])))]
    )

-- methodVoidZeroEmptyAbstractByteCode
