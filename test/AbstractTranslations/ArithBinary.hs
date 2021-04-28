module Test.AbstractTranslations.ArithBinary where

import ScannerParser.AbstrakteSyntax2

arithBinaryAbstractSyntax = 
    Class(
        [Public], 
        "ArithBinary", 
        [],
        [Method(
            [], 
            "int", 
            "foo", 
            [("int","x"),
            ("int", "y")], 
            Return(
                Binary(
                    Plus, 
                    LocalOrFieldVar "x",
                    LocalOrFieldVar "y")))])

-- arithBinaryAbstractTypedSyntax

-- arithBinaryAbstractByteCode