module Test.AbstractTranslations.StaticAttri where

import AbstrakteSyntax

staticAttriAbstractSyntax = 
    Class(
        [Public], 
        "StaticAttri", 
        [FieldDecl (
            [
                Public,
                Static
            ], 
            "int", 
            "i"
        ),
        FieldDecl (
            [
                Public,
                Static
            ], 
            "char", 
            "c"
        ),
        FieldDecl (
            [
                Public,
                Static
            ], 
            "boolean", 
            "x"
        )],
        [Method (
            [Public], 
            "", 
            "StaticAttri", 
            [], 
            Block [])],
        []
    )

-- staticAttriAbstractTypedSyntax

-- staticAttriAbstractByteCode