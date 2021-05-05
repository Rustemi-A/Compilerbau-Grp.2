module Test.AbstractTranslations.StaticMethod where

import ScannerParser.AbstrakteSyntax

staticMethodAbstractSyntax = 
    Class(
        [Public], 
        "StaticMethod", 
        [],
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