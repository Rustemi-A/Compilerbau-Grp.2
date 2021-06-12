module Test.AbstractTranslations.MethodIntZeroReturn where

import AbstrakteSyntax
import qualified TypedAST as T

methodIntZeroReturnAbstractSyntax =
  Class
    ( [Public],
      "MethodIntZeroReturn",
      [],
      [ Method
          ( [Public],
            "void",
            "MethodIntZeroReturn",
            [],
            Block []
          )
      ],
      [ Method
          ( [Public],
            "int",
            "foo",
            [],
            Block
              [ Return
                  ( Just
                      ( Integer 1
                      )
                  )
              ]
          )
      ]
    )

methodIntZeroReturnAbstractTypedSyntax =
  T.Typed
    "MethodIntZeroReturn"
    ( T.Class
        [Public]
        "MethodIntZeroReturn"
        []
        [ T.Typed
            "void"
            ( T.Method
                [Public]
                "void"
                "MethodIntZeroReturn"
                []
                (T.Typed "void" (T.Block []))
            )
        ]
        [ T.Typed
            "int"
            ( T.Method
                [Public]
                "int"
                "foo"
                []
                ( T.Typed
                    "int"
                    ( T.Block
                        [ T.Typed "int" (T.Return (Just (T.Typed "int" (T.Int 1))))
                        ]
                    )
                )
            )
        ]
    )

-- methodIntZeroReturnAbstractByteCode
