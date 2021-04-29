module Test.AbstractTranslations.IfThenElse where

import ScannerParser.AbstrakteSyntax2

ifThenElsenAbstractSyntax = 
    Class(
        [Public,Final], 
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