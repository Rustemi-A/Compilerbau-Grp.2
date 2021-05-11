module Test.AbstractTranslations.Block where

import AbstrakteSyntax

blockAbstractSyntax = 
    Class(
        [Public], 
        "Block", 
        [],
        [Method (
            [Public], 
            "", 
            "Block", 
            [], 
            Block [])],
        [Method(
            [Public], 
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