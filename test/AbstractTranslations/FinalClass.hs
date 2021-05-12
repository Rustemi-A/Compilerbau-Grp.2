module Test.AbstractTranslations.FinalClass where

import AbstrakteSyntax

finalClassAbstractSyntax = 
    Class(
        [
            Public,
            Final
        ], 
        "FinalClass", 
        [],
        [Method (
            [Public], 
            "void", 
            "FinalClass", 
            [], 
            Block [])],
        []
    )

-- finalClassAbstractTypedSyntax

-- finalClassAbstractByteCode