module Test.AbstractTranslations.MethodObjectZeroReturn where

import AbstrakteSyntax
import qualified TypedAST as T

methodObjectZeroReturnAbstractSyntax = 
    Class(
        [Public], 
        "MethodObjectZeroReturn", 
        [],
        [Method (
            [Public], 
            "void", 
            "MethodObjectZeroReturn", 
            [], 
            Block [])],
        [Method (
            [Public], 
            "Object", 
            "foo", 
            [], 
            Block [
                Return (
                    Just (
                        StmtExprExpr (
                            New (
                                "Object", 
                                [])
                        )
                    ) 
                )
            ]
        )]
    )

methodObjectZeroReturnAbstractTypedSyntax = 
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

-- methodObjectZeroReturnAbstractByteCode