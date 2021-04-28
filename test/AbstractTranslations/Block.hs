module Test.AbstractTranslations.Block where

import ScannerParser.AbstrakteSyntax2

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
            Block [])])

-- blockAbstractTypedSyntax

-- blockAbstractByteCode