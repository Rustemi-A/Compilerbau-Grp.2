module HaskellTests where

import AbstrakteSyntax
import Parser
import Test.AbstractTranslations.ArithBinary
import Test.AbstractTranslations.ArithUnary
import Test.AbstractTranslations.Attris
import Test.AbstractTranslations.Block
import Test.AbstractTranslations.ComparisonBinary
import Test.AbstractTranslations.Empty
import Test.AbstractTranslations.FinalAttri
import Test.AbstractTranslations.FinalClass
import Test.AbstractTranslations.IfThen
import Test.AbstractTranslations.IfThenElse
import Test.AbstractTranslations.LocalVarDecl
import Test.AbstractTranslations.LogicBinary
import Test.AbstractTranslations.MethodCall
import Test.AbstractTranslations.MethodIntReferenceParamReturn
import Test.AbstractTranslations.MethodIntZeroReturn
import Test.AbstractTranslations.MethodObjectZeroReturn
import Test.AbstractTranslations.MethodVoidOneEmpty
import Test.AbstractTranslations.MethodVoidTwoEmpty
import Test.AbstractTranslations.MethodVoidZeroEmpty
import Test.AbstractTranslations.NegUnary
import Test.AbstractTranslations.ObjectAttri
import Test.AbstractTranslations.StaticAttri
import Test.AbstractTranslations.StaticCalls
import Test.AbstractTranslations.StaticMethod
import Test.AbstractTranslations.While
import TypeCheck
import qualified TypedAST as T

checkIfAbstractIsSame :: String -> Class -> String
checkIfAbstractIsSame loadedClass testClass = show $ testClass == parser loadedClass

allClasses =
  [ arithBinaryAbstractSyntax,
    arithUnaryAbstractSyntax,
    attrisAbstractSyntax,
    blockAbstractSyntax,
    comparisonBinaryAbstractSyntax,
    emptyAbstractSyntax,
    finalAttriAbstractSyntax,
    finalClassAbstractSyntax,
    ifThenAbstractSyntax,
    ifThenElsenAbstractSyntax,
    localVarDeclAbstractSyntax,
    logicBinaryAbstractSyntax,
    methodCallAbstractSyntax,
    methodIntReferenceParamReturnAbstractSyntax,
    methodIntZeroReturnAbstractSyntax,
    methodObjectZeroReturnAbstractSyntax,
    methodVoidOneEmptyAbstractSyntax,
    methodVoidTwoEmptyAbstractSyntax,
    methodVoidZeroEmptyAbstractSyntax,
    negUnaryAbstractSyntax,
    objectAttriAbstractSyntax,
    staticAttriAbstractSyntax,
    staticCallsAbstractSyntax,
    staticMethodAbstractSyntax,
    whileAbstractSyntax
  ]

checkIfAbstractTypedIsSame :: T.Typed T.Class -> Class -> String
checkIfAbstractTypedIsSame testTypedClass abstractClass = show (testTypedClass == typeCheck abstractClass allClasses)

main = do
  arithBinaryClass <- readFile "Test/JavaClasses/ArithBinary.java"
  arithUnaryClass <- readFile "Test/JavaClasses/ArithUnary.java"
  attrisClass <- readFile "Test/JavaClasses/Attris.java"
  blockClass <- readFile "Test/JavaClasses/Block.java"
  comparisonBinaryClass <- readFile "Test/JavaClasses/ComparisonBinary.java"
  emptyClass <- readFile "Test/JavaClasses/Empty.java"
  finalAttriClass <- readFile "Test/JavaClasses/FinalAttri.java"
  finalClass <- readFile "Test/JavaClasses/FinalClass.java"
  ifThenClass <- readFile "Test/JavaClasses/IfThen.java"
  ifThenElseClass <- readFile "Test/JavaClasses/IfThenElse.java"
  localVarDeclClass <- readFile "Test/JavaClasses/LocalVarDecl.java"
  logicBinaryClass <- readFile "Test/JavaClasses/LogicBinary.java"
  methodCallClass <- readFile "Test/JavaClasses/MethodCall.java"
  methodIntReferenceParamReturnClass <- readFile "Test/JavaClasses/MethodIntReferenceParamReturn.java"
  methodIntZeroReturnClass <- readFile "Test/JavaClasses/MethodIntZeroReturn.java"
  methodObjectZeroReturnClass <- readFile "Test/JavaClasses/MethodObjectZeroReturn.java"
  methodVoidOneEmptyClass <- readFile "Test/JavaClasses/MethodVoidOneEmpty.java"
  methodVoidTwoEmptyClass <- readFile "Test/JavaClasses/MethodVoidTwoEmpty.java"
  methodVoidZeroEmptyClass <- readFile "Test/JavaClasses/MethodVoidZeroEmpty.java"
  negUnaryClass <- readFile "Test/JavaClasses/NegUnary.java"
  objectAttriClass <- readFile "Test/JavaClasses/ObjectAttri.java"
  staticAttriClass <- readFile "Test/JavaClasses/StaticAttri.java"
  staticCallsClass <- readFile "Test/JavaClasses/StaticCalls.java"
  staticMethodClass <- readFile "Test/JavaClasses/StaticMethod.java"
  whileClass <- readFile "Test/JavaClasses/While.java"

  print "Abstrakte Syntax Tests:"
  print $ "ArithBinary:                   " ++ checkIfAbstractIsSame arithBinaryClass arithBinaryAbstractSyntax
  print $ "ArithUnary:                    " ++ checkIfAbstractIsSame arithUnaryClass arithUnaryAbstractSyntax
  print $ "Attris:                        " ++ checkIfAbstractIsSame attrisClass attrisAbstractSyntax
  print $ "Block:                         " ++ checkIfAbstractIsSame blockClass blockAbstractSyntax
  print $ "ComparisonBinary:              " ++ checkIfAbstractIsSame comparisonBinaryClass comparisonBinaryAbstractSyntax
  print $ "Empty:                         " ++ checkIfAbstractIsSame emptyClass emptyAbstractSyntax
  print $ "FinalAttri:                    " ++ checkIfAbstractIsSame finalAttriClass finalAttriAbstractSyntax
  print $ "FinalClass:                    " ++ checkIfAbstractIsSame finalClass finalClassAbstractSyntax
  print $ "IfThen:                        " ++ checkIfAbstractIsSame ifThenClass ifThenAbstractSyntax
  print $ "IfThenElse:                    " ++ checkIfAbstractIsSame ifThenElseClass ifThenElsenAbstractSyntax
  print $ "LocalVarDecl:                  " ++ checkIfAbstractIsSame localVarDeclClass localVarDeclAbstractSyntax
  print $ "LogicBinary:                   " ++ checkIfAbstractIsSame logicBinaryClass logicBinaryAbstractSyntax
  print $ "MethodCall:                    " ++ checkIfAbstractIsSame methodCallClass methodCallAbstractSyntax
  print $ "MethodIntReferenceParamReturn: " ++ checkIfAbstractIsSame methodIntReferenceParamReturnClass methodIntReferenceParamReturnAbstractSyntax
  print $ "MethodIntZeroReturn:           " ++ checkIfAbstractIsSame methodIntZeroReturnClass methodIntZeroReturnAbstractSyntax
  print $ "MethodObjectZeroReturn:        " ++ checkIfAbstractIsSame methodObjectZeroReturnClass methodObjectZeroReturnAbstractSyntax
  print $ "MethodVoidOneEmpty:            " ++ checkIfAbstractIsSame methodVoidOneEmptyClass methodVoidOneEmptyAbstractSyntax
  print $ "MethodVoidTwoEmpty:            " ++ checkIfAbstractIsSame methodVoidTwoEmptyClass methodVoidTwoEmptyAbstractSyntax
  print $ "MethodVoidZeroEmpty:           " ++ checkIfAbstractIsSame methodVoidZeroEmptyClass methodVoidZeroEmptyAbstractSyntax
  print $ "NegUnary:                      " ++ checkIfAbstractIsSame negUnaryClass negUnaryAbstractSyntax
  print $ "ObjectAttri:                   " ++ checkIfAbstractIsSame objectAttriClass objectAttriAbstractSyntax
  print $ "StaticAttri:                   " ++ checkIfAbstractIsSame staticAttriClass staticAttriAbstractSyntax
  print $ "StaticCalls:                   " ++ checkIfAbstractIsSame staticCallsClass staticCallsAbstractSyntax
  print $ "StaticMethod:                  " ++ checkIfAbstractIsSame staticMethodClass staticMethodAbstractSyntax
  print $ "While:                         " ++ checkIfAbstractIsSame whileClass whileAbstractSyntax

  print ""
  print "Abstrakte getypte Syntax Tests:"
  print $ "ArithBinary:                   " ++ checkIfAbstractTypedIsSame arithBinaryAbstractTypedSyntax arithBinaryAbstractSyntax
  print $ "ArithUnary:                    " ++ checkIfAbstractTypedIsSame arithUnaryAbstractTypedSyntax arithUnaryAbstractSyntax
  print $ "Attris:                        " ++ checkIfAbstractTypedIsSame attrisAbstractTypedSyntax attrisAbstractSyntax
  print $ "Block:                         " ++ checkIfAbstractTypedIsSame blockAbstractTypedSyntax blockAbstractSyntax
  print $ "ComparisonBinary:              " ++ checkIfAbstractTypedIsSame comparisonBinaryAbstractTypedSyntax comparisonBinaryAbstractSyntax
  print $ "Empty:                         " ++ checkIfAbstractTypedIsSame emptyAbstractTypedSyntax emptyAbstractSyntax
  print $ "FinalAttri:                    " ++ checkIfAbstractTypedIsSame finalAttriAbstractTypedSyntax finalAttriAbstractSyntax
  print $ "FinalClass:                    " ++ checkIfAbstractTypedIsSame finalClassAbstractTypedSyntax finalClassAbstractSyntax
  print $ "IfThen:                        " ++ checkIfAbstractTypedIsSame ifThenAbstractTypedSyntax ifThenAbstractSyntax
  print $ "IfThenElse:                    " ++ checkIfAbstractTypedIsSame ifThenElseAbstractTypedSyntax ifThenElsenAbstractSyntax
  print $ "LocalVarDecl:                  " ++ checkIfAbstractTypedIsSame localVarDeclAbstractTypedSyntax localVarDeclAbstractSyntax
  print $ "LogicBinary:                   " ++ checkIfAbstractTypedIsSame logicBinaryAbstractTypedSyntax logicBinaryAbstractSyntax
  print $ "MethodCall:                    " ++ checkIfAbstractTypedIsSame methodCallAbstractTypedSyntax methodCallAbstractSyntax
  print $ "MethodIntReferenceParamReturn: " ++ checkIfAbstractTypedIsSame methodIntReferenceParamReturnAbstractTypedSyntax methodIntReferenceParamReturnAbstractSyntax
  print $ "MethodIntZeroReturn:           " ++ checkIfAbstractTypedIsSame methodIntZeroReturnAbstractTypedSyntax methodIntZeroReturnAbstractSyntax
  print $ "MethodObjectZeroReturn:        " ++ checkIfAbstractTypedIsSame methodObjectZeroReturnAbstractTypedSyntax methodObjectZeroReturnAbstractSyntax
  print $ "MethodVoidOneEmpty:            " ++ checkIfAbstractTypedIsSame methodVoidOneEmptyAbstractTypedSyntax methodVoidOneEmptyAbstractSyntax
  print $ "MethodVoidTwoEmpty:            " ++ checkIfAbstractTypedIsSame methodVoidTwoEmptyAbstractTypedSyntax methodVoidTwoEmptyAbstractSyntax
  print $ "MethodVoidZeroEmpty:           " ++ checkIfAbstractTypedIsSame methodVoidZeroEmptyAbstractTypedSyntax methodVoidZeroEmptyAbstractSyntax
  print $ "NegUnary:                      " ++ checkIfAbstractTypedIsSame negUnaryAbstractTypedSyntax negUnaryAbstractSyntax
  print $ "ObjectAttri:                   " ++ checkIfAbstractTypedIsSame objectAttriAbstractTypedSyntax objectAttriAbstractSyntax
  print $ "StaticAttri:                   " ++ checkIfAbstractTypedIsSame staticAttriAbstractTypedSyntax staticAttriAbstractSyntax
  print $ "StaticCalls:                   " ++ checkIfAbstractTypedIsSame staticCallsAbstractTypedSyntax staticCallsAbstractSyntax
  print $ "StaticMethod:                  " ++ checkIfAbstractTypedIsSame staticMethodAbstractTypedSyntax staticMethodAbstractSyntax
  print $ "While:                         " ++ checkIfAbstractTypedIsSame whileAbstractTypedSyntax whileAbstractSyntax
