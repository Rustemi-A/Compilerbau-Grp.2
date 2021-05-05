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
            [Static], 
            "void", 
            "foo", 
            [], 
            Block []
        )]
    )

-- staticMethodAbstractTypedSyntax

-- staticMethodAbstractByteCode