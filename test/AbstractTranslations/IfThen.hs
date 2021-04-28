module Test.AbstractTranslations.IfThen where

import ScannerParser.AbstrakteSyntax2

ifThenAbstractSyntax = Class(
    [Public,Final], 
    "IfThen", 
    [],
    [Method (
        [], 
        "void", 
        "foo", 
        [], 
        If (
            Bool True, 
            Empty, 
            Nothing))])

-- ifThenAbstractTypedSyntax

-- ifThenAbstractByteCode