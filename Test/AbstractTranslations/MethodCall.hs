module Test.AbstractTranslations.MethodCall where

import AbstrakteSyntax
import qualified TypedAST as T

methodCallAbstractSyntax =
  Class
    ( [Public],
      "MethodCall",
      [ FieldDecl
          ( [Public],
            "MethodIntZeroReturn",
            "o"
          )
      ],
      [ Method
          ( [Public],
            "void",
            "MethodCall",
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
              [ StmtExprStmt
                  ( Assign
                      ( LocalOrFieldVar "o",
                        StmtExprExpr
                          ( New
                              ( "MethodIntZeroReturn",
                                []
                              )
                          )
                      )
                  ),
                Return
                  ( Just
                      ( StmtExprExpr
                          ( MethodCall
                              ( LocalOrFieldVar "o",
                                "foo",
                                []
                              )
                          )
                      )
                  )
              ]
          )
      ]
    )

methodCallAbstractTypedSyntax =
  T.Typed
    "MethodCall"
    ( T.Class
        [Public]
        "MethodCall"
        [ T.Typed
            "MethodIntZeroReturn"
            ( T.Field
                [Public]
                "MethodIntZeroReturn"
                "o"
            )
        ]
        [ T.Typed
            "void"
            ( T.Method
                [Public]
                "void"
                "MethodCall"
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
                        [ T.Typed "MethodIntZeroReturn" (T.StmtExprStmt (T.Typed "MethodIntZeroReturn" (T.Assign (T.Typed "MethodIntZeroReturn" (T.LocalOrFieldVar "o")) (T.Typed "MethodIntZeroReturn" (T.StmtExprExpr (T.Typed "MethodIntZeroReturn" (T.New "MethodIntZeroReturn" []))))))),
                          T.Typed "int" (T.Return (Just (T.Typed "int" (T.StmtExprExpr (T.Typed "int" (T.MethodCall (T.Typed "MethodIntZeroReturn" (T.LocalOrFieldVar "o")) "foo" []))))))
                        ]
                    )
                )
            )
        ]
    )

-- methodCallAbstractByteCode
