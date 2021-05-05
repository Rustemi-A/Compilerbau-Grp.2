module Test.AbstractTranslations.Block where

import AbstrakteSyntax

blockAbstractSyntax = 
    Class(
        [Public], 
        "Block", 
        [],
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