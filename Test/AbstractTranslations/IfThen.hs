module Test.AbstractTranslations.IfThen where

import AbstrakteSyntax
import qualified TypedAST as T

ifThenAbstractSyntax = 
    Class(
        [Public], 
        "IfThen", 
        [],
        [Method (
            [Public], 
            "void", 
            "IfThen", 
            [], 
            Block [])],
        [Method (
            [Public], 
            "void", 
            "foo", 
            [],
            Block [
                If (
                    Bool True, 
                    Block [], 
                    Nothing
                )
            ] 
        )]
    )

ifThenAbstractTypedSyntax = 
    T.Typed "IfThen" (T.Class
        [Public] 
        "IfThen" 
        []
        [T.Typed "void" (T.Method
            [Public] 
            "void" 
            "IfThen" 
            [] 
            (T.Typed "void" (T.Block [])))
        ]
        [T.Typed "void" (T.Method 
            [Public] 
            "void" 
            "foo" 
            []
            (T.Typed "void" (T.Block [
            T.Typed "void" (T.If 
                (T.Typed "boolean" (T.Bool True)) 
                (T.Typed "void" (T.Block []))
                Nothing)
            ])))
        ]
    )

-- ifThenAbstractByteCode