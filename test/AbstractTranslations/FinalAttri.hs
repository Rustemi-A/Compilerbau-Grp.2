module Test.AbstractTranslations.FinalAttri where

import ScannerParser.AbstrakteSyntax2

finalAttriAbstractSyntax = 
    Class(
        [Public], 
        "FinalAttri", 
        [FieldDecl ([Final], "int", "x")],
        [])

-- finalAttriAbstractTypedSyntax

-- finalAttriAbstractByteCode