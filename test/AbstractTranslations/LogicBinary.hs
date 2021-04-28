module Test.AbstractTranslations.LogicBinary where

import ScannerParser.AbstrakteSyntax2

logicBinaryAbstractSyntax = Class(
    [Public,Final], 
    "LogicBinary", 
    [],
    [Method (
        [], 
        "void", 
        "foo", 
        [("boolean", "x"),
        ("boolean", "y")], 
        If (
            Binary (
                AND , 
                LocalOrFieldVar "x", 
                LocalOrFieldVar "y"), 
            Empty, 
            Nothing))])

-- logicBinaryAbstractTypedSyntax

-- logicBinaryAbstractByteCode