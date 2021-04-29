module Test.AbstractTranslations.IfThen where

import ScannerParser.AbstrakteSyntax2

ifThenAbstractSyntax = 
    Class(
        [Public,Final], 
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