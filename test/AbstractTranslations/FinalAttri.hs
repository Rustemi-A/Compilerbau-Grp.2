module Test.AbstractTranslations.FinalAttri where

import AbstrakteSyntax

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
            "", 
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

-- finalAttriAbstractTypedSyntax

-- finalAttriAbstractByteCode