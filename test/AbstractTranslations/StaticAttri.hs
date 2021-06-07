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
    T.Typed "StaticAttri" (T.Class
        [Public] 
        "StaticAttri" 
        [
            T.Typed "int" (T.Field
                [Public, Static] 
                "int" 
                "i"
            ),
            T.Typed "char" (T.Field
                [Public, Static] 
                "char" 
                "c"
            ),
            T.Typed "boolean" (T.Field
                [Public, Static] 
                "boolean" 
                "x"
            )
        ]
        [T.Typed "void" (T.Method
            [Public] 
            "void" 
            "StaticAttri" 
            [] 
            (T.Typed "void" (T.Block [])))
        ]
        []
    )

-- staticAttriAbstractByteCode