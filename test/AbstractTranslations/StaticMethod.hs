module Test.AbstractTranslations.StaticMethod where

import AbstrakteSyntax

staticMethodAbstractSyntax = 
    Class(
        [Public], 
        "StaticMethod", 
        [],
        [Method (
            [], 
            "", 
            "StaticMethod", 
            [], 
            Block [])],
        [Method (
            [Static], 
            "void", 
            "foo", 
            [], 
            Block []
        )]
    )

-- staticMethodAbstractTypedSyntax

-- staticMethodAbstractByteCode