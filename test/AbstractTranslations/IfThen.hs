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

-- ifThenAbstractByteCode