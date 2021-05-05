module Test.AbstractTranslations.MethodIntReferenceParamReturn where

import ScannerParser.AbstrakteSyntax

methodIntReferenceParamReturnAbstractSyntax = 
    Class(
        [Public], 
        "MethodIntReferenceParamReturn", 
        [],
        [Method (
            [], 
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