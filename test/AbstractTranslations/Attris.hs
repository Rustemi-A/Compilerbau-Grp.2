module Test.AbstractTranslations.Attris where

import AbstrakteSyntax
import qualified TypedAST as T

attrisAbstractSyntax = 
    Class(
        [Public], 
        "Attris", 
        [
            FieldDecl(
                [Public], 
                "int", 
                "i"
            ),
            FieldDecl(
                [Public], 
                "char", 
                "c"
            ),
            FieldDecl(
                [Public], 
                "boolean", 
                "x"
            )
        ],
        [Method (
            [Public], 
            "void", 
            "Attris", 
            [], 
            Block [])],
        [])

attrisAbstractTypedSyntax = 
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

-- attrisAbstractByteCode