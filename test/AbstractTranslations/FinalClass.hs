module Test.AbstractTranslations.FinalClass where

import AbstrakteSyntax

finalClassAbstractSyntax = 
    Class(
        [Public,Final], 
        "FinalClass", 
        [],
        [Method (
            [], 
            "", 
            "FinalClass", 
            [], 
            Block [])],
        []
    )

-- finalClassAbstractTypedSyntax

-- finalClassAbstractByteCode