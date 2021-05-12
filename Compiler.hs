module Compiler where

import Parser
import TypeCheck
import Jvm.Data.ClassFormat
import TypedAST

compiler:: String -> Typed Class
compiler =  extract . typeCheckClass [] [] . parser 

extract (Right r) = r
extract (Left e) = error e 


