module Test.AbstractTranslations.IfThen where

import AbstrakteSyntax

ifThenAbstractSyntax = 
    Class(
        [Public], 
        "IfThen", 
        [],
        [Method (
            [Public], 
            "", 
            "IfThen", 
            [], 
            Block [])],
        [Method (
            [], 
            "void", 
            "foo", 
            [],
            Block [
                If (
                    Bool True, 
                    Block [], 
                    Nothing
                )
            ] 
        )]
    )

-- ifThenAbstractTypedSyntax

-- ifThenAbstractByteCode