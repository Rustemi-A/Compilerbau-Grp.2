{
module Parser where
import Scanner
import ScannerParser.AbstrakteSyntax
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
        String_Literal {TOKEN_STRING_LITERAL $$}
        Integer {TOKEN_INTEGER}
        Integer_Literal {TOKEN_INTEGER_LITERAL $$}
        Char {TOKEN_CHAR}
        Char_Literal {TOKEN_CHAR_LITERAL $$}
        Pub {TOKEN_PUBLIC}
        Priv {TOKEN_PRIVATE}
        Stat {TOKEN_STATIC}
        Fin {TOKEN_FINAL}
        Void {TOKEN_VOID}
        Neww {TOKEN_NEW}
        Return {TOKEN_RETURN}
        Akzessor {TOKEN_AKZESSOR}
        Bool {TOKEN_BOOL}
        Bool_Literal {TOKEN_BOOL_LITERAL $$}
        Vergleich {TOKEN_VERGLEICH}
        Groesser {TOKEN_GROESSER}
        Kleiner {TOKEN_KLEINER}
        Groesser_Gleich {TOKEN_GROESSER_GLEICH}
        Kleiner_Gleich {TOKEN_KLEINER_GLEICH}
        Null {TOKEN_NULL}
        Not {TOKEN_NOT}
        Komma {TOKEN_KOMMA}
        Thi {TOKEN_THIS}
%%
class : classModifier Klasse Bezeichner Klaauf_Gesch attribute konstruktoren methoden Klazu_Gesch { Class($1, $3, $5, $6, $7) }

classModifier: Pub { Public:[] }
        | Pub Fin { Public:Final:[] }

attriModifier: methodModifier { $1 }
        | Pub Fin { Public:Final:[] }
        | Pub Fin Stat { Public:Final:Static:[] }
        | Priv Fin { Private:Final:[] }
        | Priv Fin Stat { Private:Final:Static:[] }

methodModifier: konstModifier { $1 }
        | Pub Stat { Public:Static:[] }
        | Priv Stat { Private:Static:[] }
--ToDo des Empty macht 10 R:R Conflicts
konstModifier: Pub { Public:[] }
        | Priv { Private:[] }
        |  { [] }

methoden: { [] }
methoden: methode methoden { $1:$2 }

methode: methodModifier typ Bezeichner Klaauf_Rund methodDeclParams Klazu_Rund Klaauf_Gesch statements Klazu_Gesch { MethodDecl($1, $2 $3, $5, Block $8) }
methode: methodModifier Void Bezeichner Klaauf_Rund methodDeclParams Klazu_Rund Klaauf_Gesch statements Klazu_Gesch { MethodDecl($1, "void" $3, $5, Block $8) }

attribute: { [] }
attribute: attribut attribute { $1:$2 }

attribut: attriModifier typ Bezeichner Semikolon { FieldDecl ($1, $2, $3) }

konstruktoren: { [] }
konstruktoren: konstruktor konstruktoren { $1:$2 }

konstruktor: konstModifier Bezeichner Klaauf_Rund methodDeclParams Klazu_Rund Klaauf_Gesch statements Klazu_Gesch { MethodDecl($1, "", $2, $4, Block $7) }

statements: { [] }
statements: statement statements { $1:$2 }

-- Empty noch hinzufügen oder umgehen?!	   
statement: Klaauf_Gesch statements Klazu_Gesch { Block $2 }
        | Return Semikolon { Return Nothing}
        | Return expression Semikolon { Return (Just ($2))}
        | While Klaauf_Rund expression Klazu_Rund Klaauf_Gesch statements Klazu_Gesch { While ($3, Block $6) }
        | typ Bezeichner Semikolon { LocalVarDecl ($1,$2) }
        | If Klaauf_Rund expression Klazu_Rund Klaauf_Gesch statements Klazu_Gesch { If ($3, Block $6, Nothing) }
        | If Klaauf_Rund expression Klazu_Rund Klaauf_Gesch statements Klazu_Gesch Else Klaauf_Gesch statements Klazu_Gesch{ If ($3, Block $6, Just (Block $10)) }
        | stmtExpr Semikolon { StmtExprStmt $1 }
        | Semikolon { Empty }        

--ToDo expression "Circle" ausbessern
expression: expressionMain binaryOp expression { Binary ($2, $1, $3) }
        | expressionMain { $1 }

expressionMain: expressionCore { $1 }
        | unaryOp expressionCore { Unary ($1, $2) }

expressionCore: Thi { This }
        | Integer_Literal { Integer $1 }
        | Bool_Literal { Bool $1 }
        | Char_Literal { Char $1 }
        | String_Literal { String $1 }
        | Null { Jnull }
        | stmtExpr { StmtExprExpr $1 }
        | Bezeichner { LocalOrFieldVar $1 }
        | expression Akzessor Bezeichner { InstVar ($1, $3) }

stmtExpr: Bezeichner Zuweisung literal { Assign($1,$3) }
        | Neww Bezeichner Klaauf_Rund params Klazu_Rund { New ($1, $4) }
        | expression Akzessor Bezeichner Klaauf_Rund params Klazu_Rund { MethodCall ($1, $3, $5) }

typ: Integer { "int" }
        | Char { "char" }
        | Bool { "boolean" }
        | Bezeichner { $1 }

methodDeclParams: { [] }
methodDeclParams: methodDeclParamss { $1 }

methodDeclParamss: methodDeclParam { $1:[] }
methodDeclParamss: methodDeclParam Komma methodDeclParamss { $1:$3 }

methodDeclParam: typ Bezeichner { ($1, $2) }

literal: expression { $1 }

params: { [] }
params: paramss { $1 }

paramss: param { $1:[] }
paramss: param Komma paramss { $1:$3 }

param: expression { $1 }

binaryOp: Vergleich { Equals }
        | Kleiner { LT }
        | Groesser { GT }
        | Groesser_Gleich { GE }
        | Kleiner_Gleich { LE }
        | Mal { Mult }
        | Geteilt { Div }
        | Modul { Modulo }
        | An { AND }
        | O { OR }
        | BitOR { BitwiseOR }
        | BitAND { BitwiseAND }
        | op { $1 }

unaryOp: Not { Negation }
        | op { $1 }

op: Plu { Positiv }
        | Minu { Negativ }

{
parseError :: [Token] -> a
parseError _ = error "Parse error"

parser :: String -> Class
parser = constuctor . class . scan

constructor :: Class -> Class
constructor Class (Modi, Name, Fields, [], Methoden) = Class (Modi, Name, Fields, [MethodDecl([Public], "", Name, [], Block [])] ,Methoden)
constructor x = x

main = do
  s <- getContents
  print (parser s)
}
