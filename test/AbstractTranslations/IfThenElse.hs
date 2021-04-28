module Test.AbstractTranslations.IfThenElse where

import ScannerParser.AbstrakteSyntax2

ifThenElsenAbstractSyntax = Class(
    [Public,Final], 
    "IfThenElse", 
    [],
    [Method (
        [], 
        "void", 
        "foo", 
        [], 
        If (
            Bool False, 
            Empty, 
            Just Empty))])

-- ifThenElseAbstractTypedSyntax

-- ifThenElseAbstractByteCode