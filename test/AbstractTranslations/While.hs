module Test.AbstractTranslations.While where

import AbstrakteSyntax

whileAbstractSyntax = 
    Class(
        [Public], 
        "While", 
        [],
        [Method (
            [], 
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