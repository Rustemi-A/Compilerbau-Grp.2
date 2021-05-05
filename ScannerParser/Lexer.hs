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
           | TOKEN_PLUS --
           | TOKEN_MINUS --
           | TOKEN_GETEILT --
           | TOKEN_MAL --
           | TOKEN_MODULO --
           | TOKEN_AND --
           | TOKEN_OR --
           | TOKEN_BITAND --
           | TOKEN_BITOR --
           | TOKEN_KLAAUF_RUND --
           | TOKEN_KLAZU_RUND --
           | TOKEN_KLAAUF_GESCH --
           | TOKEN_KLAZU_GESCH --
           | TOKEN_STRING_LITERAL String --
           | TOKEN_INTEGER --
           | TOKEN_INTEGER_LITERAL Int --
           | TOKEN_CHAR --
           | TOKEN_CHAR_LITERAL Char --
           | TOKEN_ABSTRACT --
           | TOKEN_ZUGRIFFSRECHT String --
           | TOKEN_STATIC --
           | TOKEN_KOMMA --
           | TOKEN_VOID --
           | TOKEN_NEW --
           | TOKEN_RETURN --
           | TOKEN_AKZESSOR --
           | TOKEN_BOOL --
           | TOKEN_BOOL_LITERAL Bool --
           | TOKEN_VERGLEICH --
           | TOKEN_GROESSER --
           | TOKEN_KLEINER --
           | TOKEN_GROESSER_GLEICH --
           | TOKEN_KLEINER_GLEICH --
--           | TOKEN_BREAK --
           | TOKEN_DEFAULT --
           | TOKEN_FINAL --
           | TOKEN_UNGLEICH
           | TOKEN_DO
           | TOKEN_NULL
           | TOKEN_NOT
           | TOKEN_THIS
  deriving (Eq,Show)

lexer :: String -> [Token]
lexer [] = []
lexer (c:cs)
      | isSpace c = lexer cs
      | isAlpha c = lexChars (c:cs)
      | isDigit c = lexNum (c:cs)
lexer ('/':'/':cs) = lexer rest
        where rest = 
                        let 
                              getTail ('\n':xs) = xs
                              getTail (x:xs) = getTail xs
                        in getTail cs     
lexer ('&':'&':cs) = TOKEN_AND : lexer cs
lexer ('|':'|':cs) = TOKEN_OR : lexer cs
lexer ('!':'=':cs) = TOKEN_UNGLEICH : lexer cs
lexer ('=':'=':cs) = TOKEN_VERGLEICH : lexer cs
lexer ('<':'=':cs) = TOKEN_KLEINER_GLEICH : lexer cs
lexer ('>':'=':cs) = TOKEN_GROESSER_GLEICH : lexer cs
lexer ('&':cs) = TOKEN_BITAND : lexer cs
lexer ('|':cs) = TOKEN_BITOR : lexer cs
lexer ('+':cs) = TOKEN_PLUS : lexer cs
lexer ('-':cs) = TOKEN_MINUS : lexer cs
lexer ('*':cs) = TOKEN_MAL : lexer cs
lexer ('/':cs) = TOKEN_GETEILT : lexer cs
lexer ('%':cs) = TOKEN_MODULO : lexer cs
lexer ('!':cs) = TOKEN_NOT : lexer cs
lexer ('=':cs) = TOKEN_ZUWEISUNG : lexer cs
lexer ('(':cs) = TOKEN_KLAAUF_RUND : lexer cs
lexer (')':cs) = TOKEN_KLAZU_RUND : lexer cs
lexer (',':cs) = TOKEN_KOMMA : lexer cs
lexer (';':cs) = TOKEN_SEMIKOLON : lexer cs
lexer ('{':cs) = TOKEN_KLAAUF_GESCH : lexer cs
lexer ('}':cs) = TOKEN_KLAZU_GESCH : lexer cs
lexer ('<':cs) = TOKEN_KLEINER : lexer cs
lexer ('>':cs) = TOKEN_GROESSER : lexer cs
lexer ('\'':c:'\'':cs) = TOKEN_CHAR_LITERAL c : lexer cs
lexer ('"':cs) = TOKEN_STRING_LITERAL c : lexer rest
        where (c, rest) = 
                            let 
                                getString('"':xs) = []
                                getString(x:xs)  = x : getString xs
                                getTail ('"':xs) = xs
                                getTail (x:xs) = getTail xs
                           in (getString cs, getTail cs )

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
--      ("break",rest)  -> TOKEN_BREAK : lexer rest
      ("default",rest)  -> TOKEN_DEFAULT : lexer rest
      ("final",rest)  -> TOKEN_FINAL : lexer rest
      ("do",rest)  -> TOKEN_DO : lexer rest
      ("null",rest)  -> TOKEN_NULL : lexer rest
      ("this",rest)  -> TOKEN_THIS : lexer rest
      (var,rest)   -> TOKEN_BEZEICHNER var : lexer rest

-- main = do
--      s <- getContents
--      print (lexer s)