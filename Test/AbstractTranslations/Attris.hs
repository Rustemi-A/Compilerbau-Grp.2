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
    T.Typed "Attris" (T.Class
        [Public] 
        "Attris" 
        [
            T.Typed "int" (T.Field
                [Public] 
                "int" 
                "i"
            ),
            T.Typed "char" (T.Field
                [Public] 
                "char" 
                "c"
            ),
            T.Typed "boolean" (T.Field
                [Public] 
                "boolean" 
                "x"
            )]
        [T.Typed "void" (T.Method
            [Public] 
            "void" 
            "Attris" 
            [] 
            (T.Typed "void" (T.Block [])))
        ]
        []
    )

-- attrisAbstractByteCode