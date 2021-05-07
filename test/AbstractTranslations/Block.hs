module Test.AbstractTranslations.Block where

import AbstrakteSyntax

blockAbstractSyntax = 
    Class(
        [Public], 
        "Block", 
        [],
        [Method (
            [], 
            "", 
            "Block", 
            [], 
            Block [])],
        [Method(
            [], 
            "void", 
            "foo", 
            [],
            Block [
                Block []
            ]
        )]
    )

-- blockAbstractTypedSyntax

-- blockAbstractByteCode