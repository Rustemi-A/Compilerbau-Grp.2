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
            [], 
            "", 
            "ObjectAttri", 
            [], 
            Block [])],
        []
    )

-- objectAttriAbstractTypedSyntax

-- objectAttriAbstractByteCode