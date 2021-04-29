module Test.AbstractTranslations.FinalAttri where

import ScannerParser.AbstrakteSyntax2

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
            -- stimmt der Konstruktor so?!
            [Public ], 
            "void", 
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