module Compiler where

import qualified AbstrakteSyntax as AS
import Data.List
-- import Jvm.Data.ClassFormat
import Parser
import System.Directory
import TypeCheck
import TypedAST
import ConstPool

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
  mapM_ print constPool


