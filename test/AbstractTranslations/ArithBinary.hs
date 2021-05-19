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
    

-- arithBinaryAbstractByteCode