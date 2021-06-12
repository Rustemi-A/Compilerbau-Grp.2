module Test.AbstractTranslations.MethodIntReferenceParamReturn where

import AbstrakteSyntax
import qualified TypedAST as T

methodIntReferenceParamReturnAbstractSyntax =
  Class
    ( [Public],
      "MethodIntReferenceParamReturn",
      [],
      [ Method
          ( [Public],
            "void",
            "MethodIntReferenceParamReturn",
            [],
            Block []
          )
      ],
      [ Method
          ( [Public],
            "int",
            "foo",
            [ ("Attris", "att")
            ],
            Block
              [ Return
                  ( Just
                      ( InstVar
                          ( LocalOrFieldVar "att",
                            "i"
                          )
                      )
                  )
              ]
          )
      ]
    )

methodIntReferenceParamReturnAbstractTypedSyntax =
  T.Typed
    "MethodIntReferenceParamReturn"
    ( T.Class
        [Public]
        "MethodIntReferenceParamReturn"
        []
        [ T.Typed
            "void"
            ( T.Method
                [Public]
                "void"
                "MethodIntReferenceParamReturn"
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
                [("Attris", "att")]
                ( T.Typed
                    "int"
                    ( T.Block
                        [ T.Typed "int" (T.Return (Just (T.Typed "int" (T.InstVar (T.Typed "Attris" (T.LocalOrFieldVar "att")) "i"))))
                        ]
                    )
                )
            )
        ]
    )

-- methodIntReferenceParamReturnAbstractByteCode
