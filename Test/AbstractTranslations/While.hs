module Test.AbstractTranslations.While where

import AbstrakteSyntax
import qualified TypedAST as T

whileAbstractSyntax =
  Class
    ( [Public],
      "While",
      [],
      [ Method
          ( [Public],
            "void",
            "While",
            [],
            Block []
          )
      ],
      [ Method
          ( [Public],
            "void",
            "foo",
            [],
            Block
              [ While
                  ( Bool True,
                    Block []
                  )
              ]
          )
      ]
    )

whileAbstractTypedSyntax =
  T.Typed
    "While"
    ( T.Class
        [Public]
        "While"
        []
        [ T.Typed
            "void"
            ( T.Method
                [Public]
                "void"
                "While"
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
                []
                ( T.Typed
                    "void"
                    ( T.Block
                        [ T.Typed "void" (T.While (T.Typed "boolean" (T.Bool True)) (T.Typed "void" (T.Block [])))
                        ]
                    )
                )
            )
        ]
    )

-- whileAbstractByteCode
