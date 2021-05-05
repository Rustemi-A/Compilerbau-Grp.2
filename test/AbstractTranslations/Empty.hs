module Test.JavaAbstractSyntax.Empty where

import AbstrakteSyntax

emptyAbstractSyntax = 
    Class(
        [Public], 
        "Empty", 
        [],
        [Method (
            [Public], 
            "", 
            "Empty", 
            [], 
            Block []
        )],
        []
    )

-- emptyAbstractTypedSyntax

-- emptyAbstractByteCode
