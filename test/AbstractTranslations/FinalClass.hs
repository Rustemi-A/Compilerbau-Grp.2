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
            "", 
            "FinalClass", 
            [], 
            Block [])],
        []
    )

-- finalClassAbstractTypedSyntax

-- finalClassAbstractByteCode