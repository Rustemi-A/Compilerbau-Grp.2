module Test.AbstractTranslations.ObjectAttri where

import AbstrakteSyntax
import qualified TypedAST as T

objectAttriAbstractSyntax =
  Class
    ( [Public],
      "ObjectAttri",
      [ FieldDecl
          ( [Public],
            "Object",
            "x"
          ),
        FieldDecl
          ( [Public],
            "String",
            "y"
          )
      ],
      [ Method
          ( [Public],
            "void",
            "ObjectAttri",
            [],
            Block []
          )
      ],
      []
    )

objectAttriAbstractTypedSyntax =
  T.Typed
    "ObjectAttri"
    ( T.Class
        [Public]
        "ObjectAttri"
        [ T.Typed
            "Object"
            ( T.Field
                [Public]
                "Object"
                "x"
            ),
          T.Typed
            "String"
            ( T.Field
                [Public]
                "String"
                "y"
            )
        ]
        [ T.Typed
            "void"
            ( T.Method
                [Public]
                "void"
                "ObjectAttri"
                []
                (T.Typed "void" (T.Block []))
            )
        ]
        []
    )

-- objectAttriAbstractByteCode
