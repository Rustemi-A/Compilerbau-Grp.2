module Test.AbstractTranslations.IfThenElse where

import ScannerParser.AbstrakteSyntax

ifThenElsenAbstractSyntax = 
    Class(
        [Public], 
        "IfThenElse", 
        [],
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