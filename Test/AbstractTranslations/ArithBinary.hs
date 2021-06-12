module Test.AbstractTranslations.ArithBinary where

import AbstrakteSyntax
import qualified TypedAST as T

arithBinaryAbstractSyntax = 
    Class(
        [Public], 
        "ArithBinary", 
        [],
        [Method (
            [Public], 
            "void", 
            "ArithBinary", 
            [], 
            Block [])],
        [Method(
            [Public], 
            "int", 
            "foo", 
            [
                ("int","x"),
                ("int", "y")
            ], 
            Block [
                Return(
                    Just (
                        Binary(
                            Plus, 
                            LocalOrFieldVar "x",
                            LocalOrFieldVar "y"
                        )
                    )
                )
            ]
        )]
    )

arithBinaryAbstractTypedSyntax = 
    T.Typed "ArithBinary" (T.Class
        [Public] 
        "ArithBinary" 
        []
        [T.Typed "void" (T.Method
            [Public] 
            "void" 
            "ArithBinary" 
            [] 
            (T.Typed "void" (T.Block [])))
        ]
        [T.Typed "int" (
            T.Method 
            [Public] 
            "int" 
            "foo" 
            [("int", "x"), 
            ("int", "y")] 
            (T.Typed "int" (T.Block [
                T.Typed "int" (T.Return (Just (T.Typed "int" (T.Binary (T.Typed "int" (T.LocalOrFieldVar "x")) Plus (T.Typed "int" (T.LocalOrFieldVar "y"))))))
            ]))
        )]
    )
    

-- arithBinaryAbstractByteCode