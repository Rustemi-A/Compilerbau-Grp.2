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
        [])

-- attrisAbstractTypedSyntax

-- attrisAbstractByteCode