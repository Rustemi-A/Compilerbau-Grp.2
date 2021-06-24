module Test.AbstractTranslations.MethodObjectZeroReturn where

import AbstrakteSyntax
import qualified TypedAST as T

methodObjectZeroReturnAbstractSyntax =
  Class
    ( [Public],
      "MethodObjectZeroReturn",
      [],
      [ Method
          ( [Public],
            "void",
            "MethodObjectZeroReturn",
            [],
            Block []
          )
      ],
      [ Method
          ( [Public],
            "Object",
            "foo",
            [],
            Block
              [ Return
                  ( Just
                      ( StmtExprExpr
                          ( New
                              ( "Object",
                                []
                              )
                          )
                      )
                  )
              ]
          )
      ]
    )

methodObjectZeroReturnAbstractTypedSyntax =
  T.Typed
    "MethodObjectZeroReturn"
    ( T.Class
        [Public]
        "MethodObjectZeroReturn"
        []
        [ T.Typed
            "void"
            ( T.Method
                [Public]
                "void"
                "MethodObjectZeroReturn"
                []
                (T.Typed "void" (T.Block []))
            )
        ]
        [ T.Typed
            "Object"
            ( T.Method
                [Public]
                "Object"
                "foo"
                []
                ( T.Typed
                    "Object"
                    ( T.Block
                        [ T.Typed "Object" (T.Return (Just (T.Typed "Object" (T.StmtExprExpr (T.Typed "Object" (T.New "Object" []))))))
                        ]
                    )
                )
            )
        ]
    )

-- methodObjectZeroReturnAbstractByteCode
