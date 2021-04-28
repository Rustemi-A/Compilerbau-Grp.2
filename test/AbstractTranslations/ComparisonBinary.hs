module Test.AbstractTranslations.ComparisonBinary where

import ScannerParser.AbstrakteSyntax2

comparisonBinaryAbstractSyntax = 
    Class(
        [Public], 
        "ComparisonBinary", 
        [],
        [Method(
            [], 
            "void", 
            "foo", 
            [("int", "x"),
            ("int", "y")],
            If (
                Binary (
                    Equals, 
                    LocalOrFieldVar "x", 
                    LocalOrFieldVar "y"), 
                Empty , 
                Nothing ))])

-- comparisonBinaryAbstractTypedSyntax

-- comparisonBinaryAbstractByteCode