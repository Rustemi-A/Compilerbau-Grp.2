module Test.JavaAbstractSyntax.Empty where

import AbstrakteSyntax

emptyAbstractSyntax = 
    Class(
        [Public], 
        "Empty", 
        [],
        [Method (
            [], 
            "", 
            "Empty", 
            [], 
            Block []
        )],
        []
    )

-- emptyAbstractTypedSyntax

-- emptyAbstractByteCode
