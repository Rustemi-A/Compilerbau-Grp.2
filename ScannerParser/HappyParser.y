{
module Parser where
import Lexer
import AbstrakteSyntax
}

%name javaClass 
%tokentype { Token }
%error { parseError }
  
%token 
        Klasse {TOKEN_KLASSE}
        Bezeichner {TOKEN_BEZEICHNER $$}
        --- For {TOKEN_FOR}
        While {TOKEN_WHILE}
        If {TOKEN_IF}
        Else {TOKEN_ELSE}
        Zuweisung {TOKEN_ZUWEISUNG}
        Semikolon {TOKEN_SEMIKOLON}
        Klazu_Gesch {TOKEN_KLAZU_GESCH}
        Klaauf_Gesch {TOKEN_KLAAUF_GESCH}
        Klaauf_Rund {TOKEN_KLAAUF_RUND}
        Klazu_Rund {TOKEN_KLAZU_RUND}
        --Klaauf_Eckig {TOKEN_KLAAUF_ECKIG}
        --Klazu_Eckig {TOKEN_KLAZU_ECKIG}
        --- ArithmetischerOperator {TOKEN_ARITHMETISCHEOPERATOR $$}
        --- LogischerOperator {TOKEN_LOGISCHEROPERATOR $$}
       -- String {TOKEN_STRING}
       -- String_Literal {TOKEN_STRING_LITERAL $$}
        Integer {TOKEN_INTEGER}
        Integer_Literal {TOKEN_INTEGER_LITERAL $$}
        Char {TOKEN_CHAR}
        Char_Literal {TOKEN_CHAR_LITERAL $$}
        --Abstract {TOKEN_ABSTRACT}
        Zugriffsrecht {TOKEN_ZUGRIFFSRECHT $$}
        --- Static {TOKEN_STATIC}
        --- Komma {TOKEN_KOMMA}
        Void {TOKEN_VOID}
        ---New {TOKEN_NEW}
        Return {TOKEN_RETURN}
        ---Akzessor {TOKEN_AKZESSOR}
        Bool {TOKEN_BOOL}
        Bool_Literal {TOKEN_BOOL_LITERAL $$}
        Vergleich {TOKEN_VERGLEICH}
        Groesser {TOKEN_GROESSER}
        Kleiner {TOKEN_KLEINER}
        Groesser_Gleich {TOKEN_GROESSER_GLEICH}
        Kleiner_Gleich {TOKEN_KLEINER_GLEICH}
       --- Do {TOKEN_DO}
       --- Kommentar {TOKEN_KOMMENTAR $$}
       --- Ungleich {TOKEN_UNGLEICH}
       --- Final {TOKEN_FINAL}
        -- Inkrementieren {TOKEN_INKREMENTIEREN}
        -- Dekrementieren {TOKEN_DEKREMENTIEREN}
        -- Switch {TOKEN_SWTICH}
        -- Case {TOKEN_CASE}
        --Break {TOKEN_BREAK}
        --Default {TOKEN_DEFAULT}
        --Doppelpunkt {TOKEN_DOPPELPUNKT}

%%
javaClass : Zugriffsrecht Klasse Bezeichner Klaauf_Gesch javaAusdrucks Klazu_Gesch { Class_ ($1, $3, $5) }

javaStatements : { [] }   --> Basisfall um eine Liste an Statements zu generieren
               | javaStatement javaStatements { ($1:$2) } --> Generiert die Liste an Statements
			   
javaAusdruck :  methode  {$1}
	     |  attribut {$1}
		
		
javaAusdrucks : { [] }   --> Basisfall um eine Liste an attributen oder methoden zu generieren
               | javaAusdruck  javaAusdrucks { ($1:$2) } --> Generiert die Liste an Statements


javaStatement :  Semikolon { Semikolon_ }
              | While Klaauf_Rund bExpression Klazu_Rund Klaauf_Gesch javaStatements Klazu_Gesch { While_ ($3, $6) }
              | If Klaauf_Rund bExpression Klazu_Rund Klaauf_Gesch javaStatements Klazu_Gesch { If_ ($3, $6, Nothing) }
              | If Klaauf_Rund bExpression Klazu_Rund Klaauf_Gesch javaStatements Klazu_Gesch Else Klaauf_Gesch javaStatements Klazu_Gesch { If_ ($3, $6, Just $10) }
              | Klaauf_Gesch javaStatements Klazu_Gesch { Block_ ($2) }
              | Return literal Semikolon { Return_ (Just $2) }
              | Return Semikolon { Return_ (Nothing) }
              -- | For Klaauf_Rund Integer Bezeichner Zuweisung Integer_Literal Semikolon bExpression Semikolon Bezeichner decInc Klazu_Rund Klaauf_Gesch javaStatements Klazu_Gesch { For_ ($4,$6, $8, $11, $14)}

bExpression : Bezeichner binaryOp Integer_Literal {Bexp_ ($1, $2, $3)}
            | Bool_Literal { Boolean_ ($1)}

-- decInc  : Inkrementieren { Inc_ }
--        | Dekrementieren { Dec_ }

literal       : Integer_Literal { ILit_ ($1)}
              | Char_Literal { CLit_ ($1)}
            --  | String_Literal { SLit_ ($1)}
              | Bool_Literal { BLit_ ($1)}

binaryOp  : Vergleich { EQ_ }
          | Groesser { GT_ }
          | Kleiner { LT_ }
          | Kleiner_Gleich { LE_ }
          | Groesser_Gleich { GE_ }
 
methode : Zugriffsrecht attributType Bezeichner Klaauf_Rund Klazu_Rund Klaauf_Gesch javaStatements Klazu_Gesch {Meth_($1, $2, $3, $7)}
        | Zugriffsrecht Void Bezeichner Klaauf_Rund Klazu_Rund Klaauf_Gesch javaStatements Klazu_Gesch {Meth_($1, Void_, $3, $7)}

attribut : Zugriffsrecht attributType Bezeichner Zuweisung literal Semikolon {Attri_ ($1, $2, $3, $5)}

attributType : Integer {Int_}
          -- | String {String_}
           | Char {Char_}
           | Bool {Bool_}

{
parseError :: [Token] -> a
parseError _ = error "Parse error"

parser :: String -> Klasse_
parser = javaClass . lexer

main = do
  s <- getContents
  print (parser s)
}
