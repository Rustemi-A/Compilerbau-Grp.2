module Test.AbstractTranslations.While where

import AbstrakteSyntax

whileAbstractSyntax = 
    Class(
        [Public], 
        "While", 
        [],
        [Method (
            [Public], 
            "", 
            "While", 
            [], 
            Block [])],
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