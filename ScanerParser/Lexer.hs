module Lexer (Token(..),lexer) where

import Data.Char

data Token = TOKEN_KLASSE --
           | TOKEN_BEZEICHNER String --
           | TOKEN_FOR --
           | TOKEN_WHILE --
           | TOKEN_IF --
           | TOKEN_ELSE --
           | TOKEN_ZUWEISUNG --
           | TOKEN_SEMIKOLON --
           | TOKEN_OPERATOR Char --
           | TOKEN_KLAAUF_RUND --
           | TOKEN_KLAZU_RUND --
           | TOKEN_KLAAUF_GESCH --
           | TOKEN_KLAZU_GESCH --
           | TOKEN_STRING --
           | TOKEN_STRING_LITERAL String --
           | TOKEN_INTEGER --
           | TOKEN_INTEGER_LITERAL Int --
           | TOKEN_CHAR --
           | TOKEN_CHAR_LITERAL Char --
           | TOKEN_ABSTRACT --
           | TOKEN_ZUGRIFFSRECHT String --
           | TOKEN_STATIC --
           | TOKEN_KOMMA --
           | TOKEN_KLAAUF_ECKIG --
           | TOKEN_KLAZU_ECKIG --
           | TOKEN_VOID --
           | TOKEN_NEW --
           | TOKEN_RETURN --
           | TOKEN_AKZESSOR --
           | TOKEN_BOOL --
           | TOKEN_BOOL_LITERAL Bool --
           | TOKEN_GLEICH --
           | TOKEN_GROESSER --
           | TOKEN_KLEINER --
           | TOKEN_GROESSER_GLEICH --
           | TOKEN_KLEINER_GLEICH --
           | TOKEN_INKREMENTIEREN --
           | TOKEN_DEKREMENTIEREN --
           | TOKEN_SWTICH --
           | TOKEN_CASE --
           | TOKEN_BREAK --
           | TOKEN_DEFAULT --
           | TOKEN_DOPPELPUNKT --
  deriving (Eq,Show)

lexer :: String -> [Token]
lexer [] = []
lexer (c:cs)
      | isSpace c = lexer cs
      | isAlpha c = lexChars (c:cs)
      | isDigit c = lexNum (c:cs)
lexer ('+':'+':cs) = TOKEN_INKREMENTIEREN : lexer cs
lexer ('-':'-':cs) = TOKEN_DEKREMENTIEREN : lexer cs
lexer ('=':'=':cs) = TOKEN_GLEICH : lexer cs
lexer ('<':'=':cs) = TOKEN_KLEINER_GLEICH : lexer cs
lexer ('>':'=':cs) = TOKEN_GROESSER_GLEICH : lexer cs
lexer ('+':cs) = TOKEN_OPERATOR '+' : lexer cs
lexer ('-':cs) = TOKEN_OPERATOR '-' : lexer cs
lexer ('*':cs) = TOKEN_OPERATOR '*' : lexer cs
lexer ('/':cs) = TOKEN_OPERATOR '/' : lexer cs
lexer ('=':cs) = TOKEN_ZUWEISUNG : lexer cs
lexer ('(':cs) = TOKEN_KLAAUF_RUND : lexer cs
lexer (')':cs) = TOKEN_KLAZU_RUND : lexer cs
lexer (',':cs) = TOKEN_KOMMA : lexer cs
lexer (';':cs) = TOKEN_SEMIKOLON : lexer cs
lexer ('{':cs) = TOKEN_KLAAUF_GESCH : lexer cs
lexer ('}':cs) = TOKEN_KLAZU_GESCH : lexer cs
lexer ('[':cs) = TOKEN_KLAAUF_ECKIG : lexer cs
lexer (']':cs) = TOKEN_KLAZU_ECKIG : lexer cs
lexer ('<':cs) = TOKEN_KLEINER : lexer cs
lexer ('>':cs) = TOKEN_GROESSER : lexer cs
lexer (':':cs) = TOKEN_DOPPELPUNKT : lexer cs
lexer ('\'':c:'\'':cs) = TOKEN_CHAR_LITERAL c : lexer cs
lexer ('"':cs) = TOKEN_STRING_LITERAL c : lexer rest
        where (c, rest) = 
                            let 
                                getString('"':xs) = []
                                getString(x:xs)  = x : getString xs
                                getTail ('"':xs) = xs
                                getTail (x:xs) = getTail xs
                            in (getString cs ,getTail cs )
lexer ('.':cs) = TOKEN_AKZESSOR : lexer cs

lexNum cs = TOKEN_INTEGER_LITERAL (read integeAsString) : lexer rest
      where (integeAsString, rest) = span isDigit cs

lexChars cs =
   case span isAlpha cs of
      ("class",rest) -> TOKEN_KLASSE : lexer rest
      ("if",rest)  -> TOKEN_IF : lexer rest
      ("else",rest)  -> TOKEN_ELSE : lexer rest
      ("for",rest)  -> TOKEN_FOR : lexer rest
      ("while",rest)  -> TOKEN_WHILE : lexer rest
      ("abstract",rest)  -> TOKEN_ABSTRACT : lexer rest
      ("public",rest)  -> TOKEN_ZUGRIFFSRECHT "public" : lexer rest
      ("private",rest)  -> TOKEN_ZUGRIFFSRECHT "private" : lexer rest
      ("protected",rest)  -> TOKEN_ZUGRIFFSRECHT "protected" : lexer rest
      ("String",rest)  -> TOKEN_STRING : lexer rest
      ("Integer",rest)  -> TOKEN_INTEGER : lexer rest
      ("int",rest)  -> TOKEN_INTEGER : lexer rest
      ("char",rest)  -> TOKEN_CHAR : lexer rest
      ("static",rest)  -> TOKEN_STATIC : lexer rest
      ("void",rest)  -> TOKEN_VOID : lexer rest
      ("new",rest)  -> TOKEN_NEW : lexer rest
      ("return",rest)  -> TOKEN_RETURN : lexer rest
      ("boolean",rest)  -> TOKEN_BOOL : lexer rest
      ("Boolean",rest)  -> TOKEN_BOOL : lexer rest
      ("false",rest)  -> TOKEN_BOOL_LITERAL False : lexer rest
      ("true",rest)  -> TOKEN_BOOL_LITERAL True : lexer rest
      ("switch",rest)  -> TOKEN_SWTICH : lexer rest
      ("case",rest)  -> TOKEN_CASE : lexer rest
      ("break",rest)  -> TOKEN_BREAK : lexer rest
      ("default",rest)  -> TOKEN_DEFAULT : lexer rest
      (var,rest)   -> TOKEN_BEZEICHNER var : lexer rest