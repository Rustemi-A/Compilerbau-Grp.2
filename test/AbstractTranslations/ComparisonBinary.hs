module Test.AbstractTranslations.ComparisonBinary where

import AbstrakteSyntax
import qualified TypedAST as T

comparisonBinaryAbstractSyntax = 
    Class(
        [Public], 
        "ComparisonBinary", 
        [],
        [Method (
            [Public], 
            "void", 
            "ComparisonBinary", 
            [], 
            Block [])],
        [Method(
            [Public], 
            "void", 
            "foo", 
            [
                ("int", "x"),
                ("int", "y")
            ],
            Block [
                If (
                    Binary (
                        Equals, 
                        LocalOrFieldVar "x", 
                        LocalOrFieldVar "y"), 
                    Block [], 
                    Nothing 
                )
            ]
        )]
    )

comparisonBinaryAbstractTypedSyntax = 
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

-- comparisonBinaryAbstractByteCode