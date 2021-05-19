module Test.AbstractTranslations.StaticAttri where

import AbstrakteSyntax
import qualified TypedAST as T

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
            "void", 
            "StaticAttri", 
            [], 
            Block [])],
        []
    )

staticAttriAbstractTypedSyntax = 
    T.Typed "Empty" (T.Class
        [Public] 
        "Empty" 
        []
        [T.Typed "void" (T.Method
            [Public] 
            "void" 
            "Empty" 
            [] 
            (T.Typed "void" (T.Block [])))
        ]
        []
    )

-- staticAttriAbstractByteCode