module Test.AbstractTranslations.FinalAttri where

import AbstrakteSyntax

finalAttriAbstractSyntax = 
    Class(
        [Public], 
        "FinalAttri", 
        [
            FieldDecl ([
                Final],
                 "int", 
                 "x"
            )
        ],
        [Method (
            [], 
            "", 
            "FinalAttri", 
            [], 
            Block [])],
        [Method (
            [Public ], 
            "", 
            "FinalAttri", 
            [],
            Block [
                StmtExprStmt (
                    Assign (
                        LocalOrFieldVar "x",
                        Integer 1
                    )
                )
            ]
        )]
    )

-- finalAttriAbstractTypedSyntax

-- finalAttriAbstractByteCode