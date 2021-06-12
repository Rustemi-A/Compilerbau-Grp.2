module Test.AbstractTranslations.FinalAttri where

import AbstrakteSyntax
import qualified TypedAST as T

finalAttriAbstractSyntax =
  Class
    ( [Public],
      "FinalAttri",
      [ FieldDecl
          ( [ Public,
              Final
            ],
            "int",
            "x"
          )
      ],
      [ Method
          ( [Public],
            "void",
            "FinalAttri",
            [],
            Block
              [ StmtExprStmt
                  ( Assign
                      ( LocalOrFieldVar "x",
                        Integer 42
                      )
                  )
              ]
          )
      ],
      []
    )

finalAttriAbstractTypedSyntax =
  T.Typed
    "FinalAttri"
    ( T.Class
        [Public]
        "FinalAttri"
        [ T.Typed
            "int"
            ( T.Field
                [Public, Final]
                "int"
                "x"
            )
        ]
        [ T.Typed
            "void"
            ( T.Method
                [Public]
                "void"
                "FinalAttri"
                []
                ( T.Typed
                    "void"
                    ( T.Block
                        [ T.Typed
                            "int"
                            ( T.StmtExprStmt
                                ( T.Typed "int" (T.Assign (T.Typed "int" (T.LocalOrFieldVar "x")) (T.Typed "int" (T.Int 42)))
                                )
                            )
                        ]
                    )
                )
            )
        ]
        []
    )

-- finalAttriAbstractByteCode
