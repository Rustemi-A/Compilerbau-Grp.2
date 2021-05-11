module Test.AbstractTranslations.ObjectAttri where

import AbstrakteSyntax

objectAttriAbstractSyntax = 
    Class(
        [Public], 
        "ObjectAttri", 
        [FieldDecl (
            [Public], 
            "Object", 
            "x"
        ),
        FieldDecl (
            [Public], 
            "String", 
            "y"
        )],
        [Method (
            [Public], 
            "", 
            "ObjectAttri", 
            [], 
            Block [])],
        []
    )

-- objectAttriAbstractTypedSyntax

-- objectAttriAbstractByteCode