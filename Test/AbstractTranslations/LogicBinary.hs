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
    T.Typed "LogicBinary" (T.Class
        [Public] 
        "LogicBinary" 
        []
        [T.Typed "void" (T.Method
            [Public] 
            "void" 
            "LogicBinary" 
            [] 
            (T.Typed "void" (T.Block [])))
        ]
        [T.Typed "void" (T.Method 
            [Public] 
            "void" 
            "foo" 
            [
                ("boolean", "x"),
                ("boolean", "y")
            ] 
            (T.Typed "void" (T.Block [
                T.Typed "void" (T.If 
                (T.Typed "boolean" (T.Binary 
                    (T.Typed "boolean" (T.LocalOrFieldVar "x")) 
                    AND 
                    (T.Typed "boolean" (T.LocalOrFieldVar "y"))
                ))
                (T.Typed "void" (T.Block []))
                Nothing)
            ]))
        )]
    )

-- logicBinaryAbstractByteCode