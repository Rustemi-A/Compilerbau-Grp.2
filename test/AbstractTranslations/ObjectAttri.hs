module Test.AbstractTranslations.ObjectAttri where

import ScannerParser.AbstrakteSyntax

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