module Test.AbstractTranslations.While where

import ScannerParser.AbstrakteSyntax

whileAbstractSyntax = 
    Class(
        [Public], 
        "While", 
        [],
        [Method (
            [], 
            "void", 
            "foo", 
            [], 
            Block [
                While (
                    Bool True, 
                    Block [])
            ]
        )]
    )

-- whileAbstractTypedSyntax

-- whileAbstractByteCode