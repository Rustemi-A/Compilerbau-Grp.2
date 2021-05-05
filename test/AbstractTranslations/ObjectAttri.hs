module Test.AbstractTranslations.ObjectAttri where

import AbstrakteSyntax

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