module Test.AbstractTranslations.MethodCall where

import AbstrakteSyntax
import qualified TypedAST as T

methodCallAbstractSyntax = 
    Class(
        [Public], 
        "MethodCall", 
        [FieldDecl (
            [Public],
            "MethodIntZeroReturn", 
            "o"
        )],
        [Method (
            [Public], 
            "void", 
            "MethodCall", 
            [], 
            Block [])],
        [Method (
            [Public], 
            "int", 
            "foo", 
            [], 
            Block [
                StmtExprStmt(
                    Assign (
                        LocalOrFieldVar "o", 
                        StmtExprExpr ( 
                            New (
                                "MethodIntZeroReturn", 
                                []
                            )
                        )
                    )
                ),
                Return (
                    Just (
                        StmtExprExpr  (
                            MethodCall (
                                LocalOrFieldVar "o", 
                                "foo", 
                                [])
                        )  
                    ) 
                )
            ]
        )]
    )

methodCallAbstractTypedSyntax = 
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

-- methodCallAbstractByteCode