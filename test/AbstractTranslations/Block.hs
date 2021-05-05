module Test.AbstractTranslations.Block where

import ScannerParser.AbstrakteSyntax

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