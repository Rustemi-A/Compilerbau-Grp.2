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
    T.Typed "IfThenElse" (T.Class
        [Public] 
        "IfThenElse" 
        []
        [T.Typed "void" (T.Method
            [Public] 
            "void" 
            "IfThenElse" 
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
                (T.Typed "boolean" (T.Bool False)) 
                (T.Typed "void" (T.Block []))
                (Just (T.Typed "void" (T.Block []))))
            ])))]
    )

-- ifThenElseAbstractByteCode