module Test.AbstractTranslations.Attris where

import AbstrakteSyntax

attrisAbstractSyntax = 
    Class(
        [Public], 
        "Attris", 
        [
            FieldDecl(
                [], 
                "int", 
                "i"
            ),
            FieldDecl(
                [], 
                "char", 
                "c"
            ),
            FieldDecl(
                [], 
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