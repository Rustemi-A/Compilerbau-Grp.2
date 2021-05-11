module Test.AbstractTranslations.MethodIntReferenceParamReturn where

import AbstrakteSyntax

methodIntReferenceParamReturnAbstractSyntax = 
    Class(
        [Public], 
        "MethodIntReferenceParamReturn", 
        [],
        [Method (
            [Public], 
            "", 
            "MethodIntReferenceParamReturn", 
            [], 
            Block [])],
        [Method (
            [Public], 
            "int", 
            "foo", 
            [
                ("Attris", "att")
            ], 
            Block [
                Return (
                    Just (
                        InstVar (
                            LocalOrFieldVar "att", 
                            "i") 
                    ) 
                )
            ]
        )]
    )

-- methodIntReferenceParamReturnAbstractTypedSyntax

-- methodIntReferenceParamReturnAbstractByteCode