module Compiler where

import Parser
import TypeCheck ( typeCheckClass )
import Jvm.Data.ClassFormat
import TypedAST
import System.Directory
import Data.List
import qualified AbstrakteSyntax as AS

parseToTypedSyntax:: String -> [AS.Class] -> Typed Class
parseToTypedSyntax s classes =  extract . typeCheckClass [] classes $ parser s
    
parseFiles:: [String] -> [AS.Class]
parseFiles [] = []
parseFiles s = map parser s

readFiles :: [FilePath] -> [IO String]
readFiles = map readFile

extract (Right r) = r
extract (Left e) = error e 


main = do
    s <- getContents
    fileNames <- getDirectoryContents "."
    let filtered = filter (isSuffixOf "java") fileNames
    fileContents <- traverse readFile filtered
    let classes = parseFiles fileContents
    
    let abstractTypedClass =  parseToTypedSyntax s classes
    print abstractTypedClass

