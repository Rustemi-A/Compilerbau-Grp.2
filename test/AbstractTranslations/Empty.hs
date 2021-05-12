module Test.AbstractTranslations.Empty where

import AbstrakteSyntax

emptyAbstractSyntax = 
    Class(
        [Public], 
        "Empty", 
        [],
        [Method (
            [Public], 
            "void", 
            "Empty", 
            [], 
            Block []
        )],
        []
    )

-- emptyAbstractTypedSyntax

-- emptyAbstractByteCode
