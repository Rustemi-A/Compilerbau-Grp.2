module Test.AbstractTranslations.LogicBinary where

import AbstrakteSyntax
import qualified TypedAST as T

logicBinaryAbstractSyntax = 
    Class(
        [Public], 
        "LogicBinary", 
        [],
        [Method (
            [Public], 
            "void", 
            "LogicBinary", 
            [], 
            Block [])],
        [Method (
            [Public], 
            "void", 
            "foo", 
            [
                ("boolean", "x"),
                ("boolean", "y")
            ], 
            Block [
                If (
                    Binary (
                        AND , 
                        LocalOrFieldVar "x", 
                        LocalOrFieldVar "y"), 
                Block [], 
                Nothing)
            ]
        )]
    )

logicBinaryAbstractTypedSyntax = 
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

-- logicBinaryAbstractByteCode