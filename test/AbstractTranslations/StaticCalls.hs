module Test.AbstractTranslations.StaticCalls where

import AbstrakteSyntax
import qualified TypedAST as T

staticCallsAbstractSyntax = 
    Class(
        [Public], 
        "StaticCalls", 
        [],
        [Method (
            [Public], 
            "void", 
            "StaticCalls", 
            [], 
            Block [])],
        [Method (
            [Public], 
            "int", 
            "foo", 
            [], 
            Block [
                StmtExprStmt (
                    MethodCall (
                        LocalOrFieldVar "StaticMethod", 
                        "foo", 
                        []
                    )
                ),
                Return (
                    Just(
                        InstVar (
                            LocalOrFieldVar "StaticAttri", 
                            "i")
                    )
                )
            ]
        )]
    )

staticCallsAbstractTypedSyntax = 
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

-- staticCallsAbstractByteCode