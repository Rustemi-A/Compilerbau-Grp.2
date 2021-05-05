module Test.AbstractTranslations.IfThenElse where

import AbstrakteSyntax

ifThenElsenAbstractSyntax = 
    Class(
        [Public], 
        "IfThenElse", 
        [],
        [Method (
            [Public], 
            "", 
            "IfThenElse", 
            [], 
            Block [])],
        [Method (
            [], 
            "void", 
            "foo", 
            [],
            Block [
                If (
                    Bool False, 
                    Block [], 
                    Just (
                        Block []
                    )
                )
            ] 
        )]
    )

-- ifThenElseAbstractTypedSyntax

-- ifThenElseAbstractByteCode