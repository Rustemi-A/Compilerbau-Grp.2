module Test.AbstractTranslations.LocalVarDecl where

import ScannerParser.AbstrakteSyntax2

localVarDeclAbstractSyntax = Class(
    [Public,Final], 
    "LocalVarDecl", 
    [],
    [Method (
        [], 
        "void", 
        "foo", 
        [], 
        LocalVarDecl (
            "int", 
            "x"))]) -- oder: Assign(LocalVarDecl ("int", "x"), Integer 1)

-- localVarDeclAbstractTypedSyntax

-- localVarDeclAbstractByteCode