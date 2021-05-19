module Test.AbstractTranslations.FinalAttri where

import AbstrakteSyntax
import qualified TypedAST as T

finalAttriAbstractSyntax = 
    Class(
        [Public], 
        "FinalAttri", 
        [
            FieldDecl (
                [
                    Public,
                    Final
                ],
                 "int", 
                 "x"
            )
        ],
        [Method (
            [Public ], 
            "void", 
            "FinalAttri", 
            [],
            Block [
                StmtExprStmt (
                    Assign (
                        LocalOrFieldVar "x",
                        Integer 42
                    )
                )
            ]
        )],
        []
    )

finalAttriAbstractTypedSyntax = 
    T.Typed "Empty" (T.Class
        [Public] 
        "Empty" 
        []
        [T.Typed "void" (T.Method
            [Public] 
            "void" 
            "Empty" 
            [] 
            (T.Typed "void" (T.Block [])))
        ]
        []
    )

-- finalAttriAbstractByteCode