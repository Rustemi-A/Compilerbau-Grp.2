module Test.AbstractTranslations.IfThenElse where

import AbstrakteSyntax
import qualified TypedAST as T

ifThenElsenAbstractSyntax = 
    Class(
        [Public], 
        "IfThenElse", 
        [],
        [Method (
            [Public], 
            "void", 
            "IfThenElse", 
            [], 
            Block [])],
        [Method (
            [Public], 
            "void", 
            "foo", 
            [],
            Block [
                If (
                    Bool False, 
                    Block [], 
                    Just (
                        Block []
                    )
                )
            ] 
        )]
    )

ifThenElseAbstractTypedSyntax = 
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

-- ifThenElseAbstractByteCode