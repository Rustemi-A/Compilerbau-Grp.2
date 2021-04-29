module Test.AbstractTranslations.Attris where

import ScannerParser.AbstrakteSyntax2

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