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
    T.Typed "StaticCalls" (T.Class
        [Public] 
        "StaticCalls" 
        []
        [T.Typed "void" (T.Method
            [Public] 
            "void" 
            "StaticCalls" 
            [] 
            (T.Typed "void" (T.Block [])))
        ]
        [
            T.Typed "int" (T.Method 
            [Public] 
            "int" 
            "foo" 
            [] 
            (T.Typed "int" (T.Block [
                T.Typed "void" (T.StmtExprStmt (T.Typed "void" (T.MethodCall (T.Typed "StaticMethod" (T.LocalOrFieldVar "StaticMethod")) "foo" []))),
                T.Typed "int" (T.Return (Just (T.Typed "int" (T.InstVar (T.Typed "StaticAttri" (T.LocalOrFieldVar "StaticAttri")) "i"))))
            ])))
        ]
    )

-- staticCallsAbstractByteCode