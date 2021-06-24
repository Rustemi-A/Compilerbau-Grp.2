module Test.AbstractTranslations.Empty where

import AbstrakteSyntax
import qualified TypedAST as T

emptyAbstractSyntax =
  Class
    ( [Public],
      "Empty",
      [],
      [ Method
          ( [Public],
            "void",
            "Empty",
            [],
            Block []
          )
      ],
      []
    )

emptyAbstractTypedSyntax =
  T.Typed
    "Empty"
    ( T.Class
        [Public]
        "Empty"
        []
        [ T.Typed
            "void"
            ( T.Method
                [Public]
                "void"
                "Empty"
                []
                (T.Typed "void" (T.Block []))
            )
        ]
        []
    )

-- emptyAbstractByteCode
