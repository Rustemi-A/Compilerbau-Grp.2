{
module Parser where
import Lexer
import ScannerParser.AbstrakteSyntax2
}

%name class 
%tokentype { Token }
%error { parseError }
  
%token 
        Klasse {TOKEN_KLASSE}
        Bezeichner {TOKEN_BEZEICHNER $$}
        While {TOKEN_WHILE}
        If {TOKEN_IF}
        Else {TOKEN_ELSE}
        Zuweisung {TOKEN_ZUWEISUNG}
        Semikolon {TOKEN_SEMIKOLON}
        Klazu_Gesch {TOKEN_KLAZU_GESCH}
        Klaauf_Gesch {TOKEN_KLAAUF_GESCH}
        Klaauf_Rund {TOKEN_KLAAUF_RUND}
        Klazu_Rund {TOKEN_KLAZU_RUND}
        Geteilt {TOKEN_GETEILT}
        Mal {TOKEN_MAL}
        Plu {TOKEN_PLUS}
        Minu {TOKEN_MINUS}
        Modul {TOKEN_MODULO}
        An {TOKEN_AND}
        O {TOKEN_OR}
        BitOR {TOKEN_BITOR}
        BitAND {TOKEN_BITAND}
        LogischerOperator {TOKEN_LOGISCHEROPERATOR $$}
        String_Literal {TOKEN_STRING_LITERAL $$}
        Integer {TOKEN_INTEGER}
        Integer_Literal {TOKEN_INTEGER_LITERAL $$}
        Char {TOKEN_CHAR}
        Char_Literal {TOKEN_CHAR_LITERAL $$}
        Public {TOKEN_PUBLIC}
        Private {TOKEN_PRIVATE}
        Static {TOKEN_STATIC}
        Final {TOKEN_FINAL}
        Void {TOKEN_VOID}
        New {TOKEN_NEW}
        Return {TOKEN_RETURN}
        Akzessor {TOKEN_AKZESSOR}
        Bool {TOKEN_BOOL}
        Bool_Literal {TOKEN_BOOL_LITERAL $$}
        Vergleich {TOKEN_VERGLEICH}
        Groesser {TOKEN_GROESSER}
        Kleiner {TOKEN_KLEINER}
        Groesser_Gleich {TOKEN_GROESSER_GLEICH}
        Kleiner_Gleich {TOKEN_KLEINER_GLEICH}
        Ungleich {TOKEN_UNGLEICH}
        Final {TOKEN_FINAL}
        Null {TOKEN_NULL}
        Not {TOKEN_NOT}
        Komma {TOKEN_KOMMA}
        Thi {TOKEN_THIS}
%%
class : classModifier Klasse Bezeichner Klaauf_Gesch attribute maybeKonstruktor methoden Klazu_Gesch { Class($1, $3, $5, $6:$7) }

classModifier: Public { Public:[] }
        | Public Final { Public:Final:[] }

attriModifier: { [] }
        | Public { Public:[] }
        | Private { Private:[] }
        | Public Final { Public:Final:[] }
        | Public Static { Public:Static:[] }
        | Public Final Static { Public:Final:Static:[] }
        | Private Final { Private:Final:[] }
        | Private Static {Private:Static:[] }
        | Private Final Static { Private:Final:Static:[] }

methodModifier: { [] }
        | Public { Public:[] }
        | Private { Private:[] }
        | Public Static { Public:Static:[] }
        | Private Static { Private:Static:[] }

methoden: { [] }
methoden: methode methoden { $1:$2 }

methode: methodModifier typ Bezeichner Klaauf_Rund methodParams Klazu_Rund Klaauf_Gesch statements Klazu_Gesch { MethodDecl($1, $2 $3, $5, Block $8) }

attribute: { [] }
attribute: attribut attribute { $1:$2 }

attribut: 

maybeKonstruktor: defaultKonstruktor { $1 }
        | konstruktoren { $1 }

konstruktoren: konstruktor { $1 }
konstruktoren: konstruktor konstruktoren { $1:$2 }

konstruktor: 

defaultKonstruktor: {}

statements: { [] }
statements: statement statements { $1:$2 }
        		   
statement: Klaauf_Gesch statements Klazu_Gesch { Block $2 }
        | Return Semikolon { Return Nothing}
        | Return expression Semikolon { Return (Just ($2))}
        | While Klaauf_Rund expression Klazu_Rund Klaauf_Gesch statements Klazu_Gesch { While ($3, Block $6) }
        | typ Bezeichner Semikolon { LocalVarDecl ($1,$2) }
        | If Klaauf_Rund expression Klazu_Rund Klaauf_Gesch statements Klazu_Gesch { If ($3, Block $6, Nothing) }
        | If Klaauf_Rund expression Klazu_Rund Klaauf_Gesch statements Klazu_Gesch Else Klaauf_Gesch statements Klazu_Gesch{ If ($3, Block $6, Just (Block $10)) }
        | stmtExpr Semikolon { StmtExprStmt $1 }

expression: Thi { This }
        | Bezeichner { LocalOrFieldVar $1 }
        | expression Akzessor Bezeichner { InstVar ($1, $3) }
        | unaryOp expression { Unary ($1, $2) }
        | expression binaryOp expression { Binary ($2, $1, $3) }
        | Integer_Literal { Integer $1 }
        | Bool_Literal { Bool $1 }
        | Char_Literal { Char $1 }
        | String_Literal { String $1 }
        | Null { Jnull }
        | stmtExpr { StmtExprExpr $1 }

stmtExpr: Bezeichner Zuweisung literal { Assign($1,$3) }
        | New Bezeichner Klaauf_Rund params Klazu_Rund { New ($1, $4) }
        | expression Akzessor Bezeichner Klaauf_Rund params Klazu_Rund { MethodCall ($1, $3, $5) }

typ: Integer { "int" }
        | Char { "char" }
        | Bool { "boolean" }
        | Bezeichner { $1 }

-- [(Type, String)] Typ bon methodParams
methodParams: 

literal: expression

params: { [] }
params: paramss { $1 }

paramss: param { $1:[] }
paramss: param Komma paramss { $1:$3 }

param: expression

binaryOp: Vergleich { Equals }
        | Kleiner { LT }
        | Groesser { GT }
        | Groesser_Gleich { GE }
        | Kleiner_Gleich { LE }
        | Plu { Plus }
        | Minu { Minus }
        | Mal { Mult }
        | Geteilt { Div }
        | Modul { Modulo }
        | An { AND }
        | O { OR }
        | BitOR { BitwiseOR }
        | BitAND { BitwiseAND }

unaryOp: Not { Negation }
        | Plus { Positiv }
        | Minus { Negativ }

{
parseError :: [Token] -> a
parseError _ = error "Parse error"

parser :: String -> Klasse_
parser = class . lexer

main = do
  s <- getContents
  print (parser s)
}
