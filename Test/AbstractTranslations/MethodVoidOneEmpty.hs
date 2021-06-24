module Test.AbstractTranslations.MethodVoidOneEmpty where

import AbstrakteSyntax
import qualified TypedAST as T

methodVoidOneEmptyAbstractSyntax =
  Class
    ( [Public],
      "MethodVoidOneEmpty",
      [],
      [ Method
          ( [Public],
            "void",
            "MethodVoidOneEmpty",
            [],
            Block []
          )
      ],
      [ Method
          ( [Public],
            "void",
            "foo",
            [ ("int", "x")
            ],
            Block []
          )
      ]
    )

methodVoidOneEmptyAbstractTypedSyntax =
  T.Typed
    "MethodVoidOneEmpty"
    ( T.Class
        [Public]
        "MethodVoidOneEmpty"
        []
        [ T.Typed
            "void"
            ( T.Method
                [Public]
                "void"
                "MethodVoidOneEmpty"
                []
                (T.Typed "void" (T.Block []))
            )
        ]
        [ T.Typed
            "void"
            ( T.Method
                [Public]
                "void"
                "foo"
                [("int", "x")]
                (T.Typed "void" (T.Block []))
            )
        ]
    )

-- methodVoidOneEmptyAbstractByteCode
