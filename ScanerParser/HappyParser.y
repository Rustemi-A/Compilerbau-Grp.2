{
module Parser where
import Lexer
}

%name javaClass 
%tokentype { Token }
%error { parseError }
  
%token 
        Klasse {TOKEN_KLASSE}
        Bezeichner {TOKEN_BEZEICHNER $$}
        For {TOKEN_FOR}
        While {TOKEN_WHILE}
        If {TOKEN_IF}
        Else {TOKEN_ELSE}
        Zuweisung {TOKEN_ZUWEISUNG}
        Semikolon {TOKEN_SEMIKOLON}
        Klazu_Gesch {TOKEN_KLAZU_GESCH}
        Klaauf_Gesch {TOKEN_KLAAUF_GESCH}
        Klaauf_Rund {TOKEN_KLAAUF_RUND}
        Klazu_Rund {TOKEN_KLAZU_RUND}
        Klaauf_Eckig {TOKEN_KLAAUF_ECKIG}
        Klazu_Eckig {TOKEN_KLAZU_ECKIG}
        Operator {TOKEN_OPERATOR $$}
        String {TOKEN_STRING}
        String_Literal {TOKEN_STRING_LITERAL $$}
        Integer {TOKEN_INTEGER}
        Integer_Literal {TOKEN_INTEGER_LITERAL $$}
        Char {TOKEN_CHAR}
        Char_Literal {TOKEN_CHAR_LITERAL $$}
        Abstract {TOKEN_ABSTRACT}
        Zugriffsrecht {TOKEN_ZUGRIFFSRECHT $$}
        Static {TOKEN_STATIC}
        Komma {TOKEN_KOMMA}
        Void {TOKEN_VOID}
        New {TOKEN_NEW}
        Return {TOKEN_RETURN}
        Akzessor {TOKEN_AKZESSOR}
        Bool {TOKEN_BOOL}
        Bool_Literal {TOKEN_BOOL_LITERAL $$}
        Gleich {TOKEN_GLEICH}
        Groesser {TOKEN_GROESSER}
        Kleiner {TOKEN_KLEINER}
        Groesser_Gleich {TOKEN_GROESSER_GLEICH}
        Kleiner_Gleich {TOKEN_KLEINER_GLEICH}
        Inkrementieren {TOKEN_INKREMENTIEREN}
        Dekrementieren {TOKEN_DEKREMENTIEREN}
        Switch {TOKEN_SWTICH}
        Case {TOKEN_CASE}
        Break {TOKEN_BREAK}
        Default {TOKEN_DEFAULT}
        Doppelpunkt {TOKEN_DOPPELPUNKT}

%%
javaClass : Zugriffsrecht Klasse Bezeichner Klaauf_Gesch javaStatements Klazu_Gesch { Class_ ($1, $3, $5) }

javaStatements : { (Empty_:[]) }   --> Basisfall um eine Liste an Statements zu generieren
               | javaStatement javaStatements { ($1:$2) } --> Generiert die Liste an Statements

javaStatement :  Semikolon { Semikolon_ }
              | While Klaauf_Rund bExpression Klazu_Rund Klaauf_Gesch javaStatements Klazu_Gesch { While_ ($3, $6) }
              | If Klaauf_Rund bExpression Klazu_Rund Klaauf_Gesch javaStatements Klazu_Gesch { If_ ($3, $6, Nothing) }
              | If Klaauf_Rund bExpression Klazu_Rund Klaauf_Gesch javaStatements Klazu_Gesch Else Klaauf_Gesch javaStatements Klazu_Gesch { If_ ($3, $6, Just $10) }
              | Klaauf_Gesch javaStatements Klazu_Gesch { Block_ ($2) }
              | Return literal Semikolon { Return_ (Just $2) }
              | Return Semikolon { Return_ (Nothing) }
              | For Klaauf_Rund Integer Bezeichner Zuweisung Integer_Literal Semikolon bExpression Semikolon Bezeichner decInc Klazu_Rund Klaauf_Gesch javaStatements Klazu_Gesch { For_ ($4,$6, $8, $11, $14)}

bExpression : Bezeichner binaryOp Integer_Literal {Bexp_ ($1, $2, $3)}
            | Bool_Literal { Boolean_ ($1)}

decInc  : Inkrementieren { Inc_ }
        | Dekrementieren { Dec_ }

literal       : Integer_Literal { ILit_ ($1)}
              | Char_Literal { CLit_ ($1)}
              | String_Literal { SLit_ ($1)}

binaryOp  : Gleich { EQ_ }
          | Groesser { GT_ }
          | Kleiner { LT_ }
          | Kleiner_Gleich { LE_ }
          | Groesser_Gleich { GE_ }
 
{

data Klasse_ = Class_ (String, String, [Statement_])
              deriving (Eq, Show) 

data Statement_ = If_ (BExpression_, [Statement_], Maybe [Statement_])
               | While_ (BExpression_, [Statement_]) --while
               | For_ (String, Int, BExpression_, DecInc_, [Statement_])
               | Block_ ([Statement_])
               | Semikolon_
               | Empty_
               | Return_ (Maybe Literal_)
               deriving (Eq, Show)

data Literal_  = ILit_ (Int)
               | SLit_ (String)
               | CLit_ (Char) 
               deriving (Eq, Show)

data BExpression_ = Bexp_ (String, BinaryOp_, Int)
                  | Boolean_ (Bool)
           deriving (Eq, Show)

data DecInc_ = Dec_
             | Inc_ 
           deriving (Eq, Show)

data BinaryOp_  = EQ_ 
                | LT_
                | GT_
                | GE_
                | LE_
           deriving (Eq, Show)


parseError :: [Token] -> a
parseError _ = error "Parse error"

parser :: String -> Klasse_
parser = javaClass . lexer

main = do
  s <- getContents
  print (parser s)


}
