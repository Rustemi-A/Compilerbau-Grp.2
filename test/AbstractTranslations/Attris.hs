module Test.AbstractTranslations.Attris where

import AbstrakteSyntax

attrisAbstractSyntax = 
    Class(
        [Public], 
        "Attris", 
        [
            FieldDecl(
                [Public], 
                "int", 
                "i"
            ),
            FieldDecl(
                [Public], 
                "char", 
                "c"
            ),
            FieldDecl(
                [Public], 
                "boolean", 
                "x"
            )
        ],
        [Method (
            [Public], 
            "", 
            "Attris", 
            [], 
            Block [])],
        [])

-- attrisAbstractTypedSyntax

-- attrisAbstractByteCode