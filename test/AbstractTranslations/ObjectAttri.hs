module Test.AbstractTranslations.ObjectAttri where

import AbstrakteSyntax
import qualified TypedAST as T

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
            "void", 
            "ObjectAttri", 
            [], 
            Block [])],
        []
    )

objectAttriAbstractTypedSyntax = 
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

-- objectAttriAbstractByteCode