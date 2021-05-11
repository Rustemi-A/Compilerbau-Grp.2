module Test.AbstractTranslations.StaticMethod where

import AbstrakteSyntax

staticMethodAbstractSyntax = 
    Class(
        [Public], 
        "StaticMethod", 
        [],
        [Method (
            [Public], 
            "", 
            "StaticMethod", 
            [], 
            Block [])],
        [Method (
            [
                Public,
                Static
            ], 
            "void", 
            "foo", 
            [], 
            Block []
        )]
    )

-- staticMethodAbstractTypedSyntax

-- staticMethodAbstractByteCode