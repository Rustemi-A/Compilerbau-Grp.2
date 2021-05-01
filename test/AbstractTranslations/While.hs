module Test.AbstractTranslations.While where

import ScannerParser.AbstrakteSyntax2

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