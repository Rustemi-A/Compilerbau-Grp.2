module Scanner (Token(..),scan) where

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
           | TOKEN_PUBLIC --
           | TOKEN_PRIVATE --
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

scan :: String -> [Token]
scan [] = []
scan (c:cs)
      | isSpace c = scan cs
      | isAlpha c = lexChars (c:cs)
      | isDigit c = lexNum (c:cs)
scan ('/':'/':cs) = scan rest
        where rest = 
                        let 
                              getTail ('\n':xs) = xs
                              getTail (x:xs) = getTail xs
                        in getTail cs     
scan ('&':'&':cs) = TOKEN_AND : scan cs
scan ('|':'|':cs) = TOKEN_OR : scan cs
scan ('!':'=':cs) = TOKEN_UNGLEICH : scan cs
scan ('=':'=':cs) = TOKEN_VERGLEICH : scan cs
scan ('<':'=':cs) = TOKEN_KLEINER_GLEICH : scan cs
scan ('>':'=':cs) = TOKEN_GROESSER_GLEICH : scan cs
scan ('&':cs) = TOKEN_BITAND : scan cs
scan ('|':cs) = TOKEN_BITOR : scan cs
scan ('+':cs) = TOKEN_PLUS : scan cs
scan ('-':cs) = TOKEN_MINUS : scan cs
scan ('*':cs) = TOKEN_MAL : scan cs
scan ('/':cs) = TOKEN_GETEILT : scan cs
scan ('%':cs) = TOKEN_MODULO : scan cs
scan ('!':cs) = TOKEN_NOT : scan cs
scan ('=':cs) = TOKEN_ZUWEISUNG : scan cs
scan ('(':cs) = TOKEN_KLAAUF_RUND : scan cs
scan (')':cs) = TOKEN_KLAZU_RUND : scan cs
scan (',':cs) = TOKEN_KOMMA : scan cs
scan (';':cs) = TOKEN_SEMIKOLON : scan cs
scan ('{':cs) = TOKEN_KLAAUF_GESCH : scan cs
scan ('}':cs) = TOKEN_KLAZU_GESCH : scan cs
scan ('<':cs) = TOKEN_KLEINER : scan cs
scan ('>':cs) = TOKEN_GROESSER : scan cs
scan ('\'':c:'\'':cs) = TOKEN_CHAR_LITERAL c : scan cs
scan ('"':cs) = TOKEN_STRING_LITERAL c : scan rest
        where (c, rest) = 
                            let 
                                getString('"':xs) = []
                                getString(x:xs)  = x : getString xs
                                getTail ('"':xs) = xs
                                getTail (x:xs) = getTail xs
                           in (getString cs, getTail cs )

scan ('.':cs) = TOKEN_AKZESSOR : scan cs

lexNum cs = TOKEN_INTEGER_LITERAL (read integeAsString) : scan rest
      where (integeAsString, rest) = span isDigit cs

lexChars cs =
   case span isAlpha cs of
      ("class",rest) -> TOKEN_KLASSE : scan rest
      ("if",rest)  -> TOKEN_IF : scan rest
      ("else",rest)  -> TOKEN_ELSE : scan rest
      ("for",rest)  -> TOKEN_FOR : scan rest
      ("while",rest)  -> TOKEN_WHILE : scan rest
      ("abstract",rest)  -> TOKEN_ABSTRACT : scan rest
      ("public",rest)  -> TOKEN_PUBLIC : scan rest
      ("private",rest)  -> TOKEN_PRIVATE : scan rest
      ("Integer",rest)  -> TOKEN_INTEGER : scan rest
      ("int",rest)  -> TOKEN_INTEGER : scan rest
      ("char",rest)  -> TOKEN_CHAR : scan rest
      ("static",rest)  -> TOKEN_STATIC : scan rest
      ("void",rest)  -> TOKEN_VOID : scan rest
      ("new",rest)  -> TOKEN_NEW : scan rest
      ("return",rest)  -> TOKEN_RETURN : scan rest
      ("boolean",rest)  -> TOKEN_BOOL : scan rest
      ("Boolean",rest)  -> TOKEN_BOOL : scan rest
      ("false",rest)  -> TOKEN_BOOL_LITERAL False : scan rest
      ("true",rest)  -> TOKEN_BOOL_LITERAL True : scan rest
--      ("break",rest)  -> TOKEN_BREAK : scan rest
      ("default",rest)  -> TOKEN_DEFAULT : scan rest
      ("final",rest)  -> TOKEN_FINAL : scan rest
      ("do",rest)  -> TOKEN_DO : scan rest
      ("null",rest)  -> TOKEN_NULL : scan rest
      ("this",rest)  -> TOKEN_THIS : scan rest
      (var,rest)   -> TOKEN_BEZEICHNER var : scan rest

-- main = do
--      s <- getContents
--      print (scan s)