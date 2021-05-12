{
module Parser (parser) where
import AbstrakteSyntax
import Scanner
}

%name classPars 
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
classPars : classModifier Klasse Bezeichner Klaauf_Gesch methodOrAttris Klazu_Gesch { ClassHybrid($1, $3, $5) }

classModifier: Pub { Public:[] }
        | Pub Fin { Public:Final:[] }

attriModifier: Pub Fin { [Public,Final] }
        | Pub Fin Stat { [Public,Final,Static] }
        | Pub Stat Fin { [Public,Static,Final] }
        | Priv Fin { [Private,Final] }
        | Priv Fin Stat { [Private,Final,Static] }
        | Priv Stat Fin { [Private,Static,Final] }
        | Fin { [Public,Final] }
        | Fin Stat { [Public,Final,Static] }
        | Stat Fin { [Public,Static,Final] }

methodModifier: Pub Stat { [Public,Static] }
        | Priv Stat { [Private,Static] }
        | Stat { [Public,Static] }

konstModifier: Pub { [Public] }
        | Priv { [Private] }
        | { [Public] }

methodOrAttris: { [] }
        | methodOrAttri methodOrAttris { $1:$2 }

methodOrAttri: attriModifier typ Bezeichner Semikolon { F(FieldDecl ($1, $2, $3)) } 
        | methodModifier typ Bezeichner Semikolon { F(FieldDecl ($1, $2, $3)) } 
        | konstModifier typ Bezeichner Semikolon { F(FieldDecl ($1, $2, $3)) } 
        | methodModifier typ Bezeichner Klaauf_Rund methodDeclParams Klazu_Rund Klaauf_Gesch statements Klazu_Gesch { M(Method($1, $2, $3, $5, Block $8)) }
        | methodModifier Void Bezeichner Klaauf_Rund methodDeclParams Klazu_Rund Klaauf_Gesch statements Klazu_Gesch { M(Method($1, "void", $3, $5, Block $8)) }
        | konstModifier typ Bezeichner Klaauf_Rund methodDeclParams Klazu_Rund Klaauf_Gesch statements Klazu_Gesch { M(Method($1, $2, $3, $5, Block $8)) }
        | konstModifier Void Bezeichner Klaauf_Rund methodDeclParams Klazu_Rund Klaauf_Gesch statements Klazu_Gesch { M(Method($1, "void", $3, $5, Block $8)) }
        | konstModifier Bezeichner Klaauf_Rund methodDeclParams Klazu_Rund Klaauf_Gesch statements Klazu_Gesch { M(Method($1, "", $2, $4, Block $7)) }
        
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
        | Semikolon { Empty }        

expression: expressionCore { $1 }
        | expressionCore binaryOp expression { Binary ($2, $1, $3) }
        | unaryOp expression { Unary ($1, $2) }

 expressionCore: Thi { This }
        | Integer_Literal { Integer $1 }
        | Bool_Literal { Bool $1 }
        | Char_Literal { Char $1 }
        | String_Literal { String $1 }
        | Null { Jnull }
        | stmtExpr { StmtExprExpr $1 }
        | Bezeichner { LocalOrFieldVar $1 }
        | expression Akzessor Bezeichner { InstVar ($1, $3) }

stmtExpr: Bezeichner Zuweisung literal { Assign(LocalOrFieldVar $1,$3) }
        | Neww Bezeichner Klaauf_Rund params Klazu_Rund { New ($2, $4) }
        | expression Akzessor Bezeichner Klaauf_Rund params Klazu_Rund { MethodCall ($1, $3, $5) }

typ: Integer { "int" }
        | Char { "char" }
        | Bool { "boolean" }
        | Bezeichner { $1 }

methodDeclParams: { [] }
methodDeclParams: methodDeclParamss { $1 }

methodDeclParamss: methodDeclParam { $1:[] }
methodDeclParamss: methodDeclParam Komma methodDeclParamss { $1:$3 }

methodDeclParam: typ Bezeichner { $1, $2 }

literal: expression { $1 }

params: { [] }
params: paramss { $1 }

paramss: param { $1:[] }
paramss: param Komma paramss { $1:$3 }

param: expression { $1 }

binaryOp: Vergleich { Equals }
        | Kleiner { LessT }
        | Groesser { GreaterT }
        | Groesser_Gleich { GE }
        | Kleiner_Gleich { LE }
        | Mal { Mult }
        | Geteilt { Div }
        | Modul { Modulo }
        | An { AND }
        | O { OR }
        | BitOR { BitwiseOR }
        | BitAND { BitwiseAND }
        | Plu { Plus }
        | Minu { Minus }

unaryOp: Not { Negation }
        | Plu { Positiv }
        | Minu { Negativ }

{
parseError :: [Token] -> a
parseError _ = error "Parse error!"

parser :: String -> Class
parser =  defaultConst . hybridClassToClass . classPars . scan

testparse:: String -> ClassHybrid
testparse = classPars . scan

hybridClassToClass:: ClassHybrid -> Class
hybridClassToClass (ClassHybrid(modi, name, methOrAttri)) = Class(modi, name, getAttris methOrAttri, getKonst methOrAttri, getMethod methOrAttri)

defaultConst :: Class -> Class
defaultConst (Class(modi, name, fields, [], meth)) = Class(modi, name, fields, [Method([Public], "", name, [], Block [])], meth)
defaultConst c = c

getAttris:: [FieldOrMethod] -> [FieldDecl]
getAttris [] = []
getAttris ((F f):x) = f : (getAttris x)
getAttris (y:x) = getAttris x

getKonst:: [FieldOrMethod] -> [MethodDecl]
getKonst [] = []
getKonst (M (Method(m, "", kname, args, stmt)):x) = (Method(m, "", kname, args, stmt)) : (getKonst x)
getKonst (y:x) = getKonst x

getMethod:: [FieldOrMethod] -> [MethodDecl]
getMethod [] = []
getMethod (M (Method(m, typ, kname, args, stmt)):x) 
        | typ /= "" = (Method(m, typ, kname, args, stmt)) : (getMethod x)
        | otherwise = getMethod x
getMethod (y:x) = getMethod x

main = do
  s <- getContents
  print (scan s)
--  print (parser s)
  print (testparse s)
}
