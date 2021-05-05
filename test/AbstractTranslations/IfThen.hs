module Test.AbstractTranslations.IfThen where

import ScannerParser.AbstrakteSyntax

ifThenAbstractSyntax = 
    Class(
        [Public], 
        "IfThen", 
        [],
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