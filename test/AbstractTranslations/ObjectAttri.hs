module Test.AbstractTranslations.ObjectAttri where

import ScannerParser.AbstrakteSyntax2

objectAttriAbstractSyntax = 
    Class(
        [Public], 
        "ObjectAttri", 
        [FieldDecl (
            [], 
            "Object", 
            "x"
        ),
        FieldDecl (
            [], 
            "String", 
            "y"
        )],
        []
    )

-- objectAttriAbstractTypedSyntax

-- objectAttriAbstractByteCode