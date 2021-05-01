module Test.AbstractTranslations.LogicBinary where

import ScannerParser.AbstrakteSyntax2

logicBinaryAbstractSyntax = 
    Class(
        [Public], 
        "LogicBinary", 
        [],
        [Method (
            [], 
            "void", 
            "foo", 
            [
                ("boolean", "x"),
                ("boolean", "y")
            ], 
            Block [
                If (
                    Binary (
                        AND , 
                        LocalOrFieldVar "x", 
                        LocalOrFieldVar "y"), 
                Block [], 
                Nothing)
            ]
        )]
    )

-- logicBinaryAbstractTypedSyntax

-- logicBinaryAbstractByteCode