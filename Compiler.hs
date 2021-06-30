module Compiler where

import Data.List
import System.Directory
import Parser
import qualified AbstrakteSyntax as AS
import TypeCheck
import TypedAST
import ConstPool
import CF
import Jvm.BinaryClass

parseToTypedSyntax :: String -> [AS.Class] -> Typed Class
parseToTypedSyntax s = typeCheck (parser s)

parseFiles :: [String] -> [AS.Class]
parseFiles = map parser

readFiles :: [FilePath] -> [IO String]
readFiles = map readFile

main = do
  s <- getContents
  fileNames <- getDirectoryContents "."
  let filtered = filter (isSuffixOf "java") fileNames
  fileContents <- traverse readFile filtered
  let classes = parseFiles fileContents

  let (Typed _ abstractTypedClass) = parseToTypedSyntax s classes
  print abstractTypedClass
  let constPool = buildConstPool abstractTypedClass
      cf = buildClassFile abstractTypedClass
  mapM_ print constPool
  print cf

  encodeClassFile "out.class" cf
