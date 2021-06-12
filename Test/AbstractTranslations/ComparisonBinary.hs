module Test.AbstractTranslations.ComparisonBinary where

import AbstrakteSyntax
import qualified TypedAST as T

comparisonBinaryAbstractSyntax =
  Class
    ( [Public],
      "ComparisonBinary",
      [],
      [ Method
          ( [Public],
            "void",
            "ComparisonBinary",
            [],
            Block []
          )
      ],
      [ Method
          ( [Public],
            "void",
            "foo",
            [ ("int", "x"),
              ("int", "y")
            ],
            Block
              [ If
                  ( Binary
                      ( Equals,
                        LocalOrFieldVar "x",
                        LocalOrFieldVar "y"
                      ),
                    Block [],
                    Nothing
                  )
              ]
          )
      ]
    )

comparisonBinaryAbstractTypedSyntax =
  T.Typed
    "ComparisonBinary"
    ( T.Class
        [Public]
        "ComparisonBinary"
        []
        [ T.Typed
            "void"
            ( T.Method
                [Public]
                "void"
                "ComparisonBinary"
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
                [ ("int", "x"),
                  ("int", "y")
                ]
                ( T.Typed
                    "void"
                    ( T.Block
                        [ T.Typed
                            "void"
                            ( T.If
                                (T.Typed "boolean" (T.Binary (T.Typed "int" (T.LocalOrFieldVar "x")) Equals (T.Typed "int" (T.LocalOrFieldVar "y"))))
                                (T.Typed "void" (T.Block []))
                                Nothing
                            )
                        ]
                    )
                )
            )
        ]
    )

-- comparisonBinaryAbstractByteCode
