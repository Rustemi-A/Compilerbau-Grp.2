module Test.AbstractTranslations.StaticAttri where

import AbstrakteSyntax

staticAttriAbstractSyntax = 
    Class(
        [Public], 
        "StaticAttri", 
        [FieldDecl (
            [Static], 
            "int", 
            "i"
        ),
        FieldDecl (
            [Static], 
            "char", 
            "c"
        ),
        FieldDecl (
            [Static], 
            "boolean", 
            "x"
        )],
        [Method (
            [], 
            "", 
            "StaticAttri", 
            [], 
            Block [])],
        []
    )

-- staticAttriAbstractTypedSyntax

-- staticAttriAbstractByteCode