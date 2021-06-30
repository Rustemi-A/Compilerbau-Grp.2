module CF where

import Jvm.Data.ClassFormat
import Data.Char (ord)
import TypedAST
import ConstPool
import qualified AbstrakteSyntax as U


-- Startmethoden

buildAllClassFiles  :: [Class] -> [ClassFile]
buildAllClassFiles([]) = []
buildAllClassFiles(c:cs) = (buildClassFile(c) : buildAllClassFiles(cs))

buildClassFile :: Class -> ClassFile
buildClassFile (Class modifier typ fields constructors methods) =
	let
		constPool = buildConstPool(Class modifier typ fields constructors methods)
		constPoolCount = getSize(constPool) + 1
		fieldInfos = transformFields(constPool, fields)
		fiCount = getSize(fieldInfos)
		methodInfos = allMethods(constPool, constructors, methods)
		methodCount = getSize(methodInfos)
		accFlg = cAF(modifier)
		this = findClassInCp(constPool, typ)
		super = findClassInCp(constPool, "java/lang/Object")
	in
		ClassFile Magic (MinorVersion(0)) (MajorVersion(48)) constPoolCount constPool accFlg (ThisClass(this)) (SuperClass(super)) 0 [] fiCount fieldInfos methodCount methodInfos 0 []



-- Fields

transformFields :: ([CP_Info], [Typed Field]) -> [Field_Info]
transformFields(_, []) = []
transformFields(constPool, (c:cs)) =
	let
		info = buildFieldInfo(constPool, c)
		rest = transformFields(constPool, cs)
	in
		(info: rest)

buildFieldInfo :: ([CP_Info], Typed Field) -> Field_Info
buildFieldInfo(constPool, (Typed _ (Field modifier typ name))) =
	let
		id = findInCp(constPool, name)
		typeId = findInCp(constPool, typ)
		accFlg = cAF(modifier)
	in
		Field_Info accFlg id typeId 0 []



-- Methods

allMethods :: ([CP_Info], [Typed Method], [Typed Method]) -> [Method_Info]
allMethods(constPool, constructors, methods) =
    let
		constr = transformConstructors(constPool, constructors)
		method = transformMethod(constPool, methods)
	in
        connectLists(constr, method)

transformMethod :: ([CP_Info], [Typed Method]) -> [Method_Info]
transformMethod(constPool, []) = []
transformMethod(constPool, (c:cs)) = (buildMethodInfo(constPool, c) : transformMethod(constPool, cs))

transformConstructors :: ([CP_Info], [Typed Method]) -> [Method_Info]
transformConstructors(constPool, []) = [createDefaultConstructor(constPool)]
transformConstructors(constPool, (c : [])) = [buildMethodInfo(constPool, c)]
transformConstructors(constPool, (c : cs)) = (buildMethodInfo(constPool, c) : transformConstructors(constPool, cs))

buildMethodInfo :: ([CP_Info], Typed Method) -> Method_Info
buildMethodInfo(constPool, (Typed _ (Method modifier typ name parameter statement))) =
	let
	    id = findInCp(constPool, name)
	    typeId = findInCp(constPool, typ)
	    accFlg = cAF(modifier)
	in
		Method_Info accFlg id typeId 1 [getCode(constPool, parameter, statement)]

getCode :: ([CP_Info], [(U.Type, String)], (Typed Stmt)) -> Attribute_Info
getCode(constPool, parameter, statements) =
    let
        code = generateCode(statements, parameter, constPool)
        size = getSize(code)
    in
        AttributeCode 0 0 1 1 size code 0 [] 0 []



--DefaultConstructor

createDefaultConstructor :: ([CP_Info]) -> (Method_Info)
createDefaultConstructor (cInfos) =
	let
		firstId = findInCp(cInfos, "")
		secondId = findInCp(cInfos, "()V")
		code = codeConstr(cInfos)
	in
		Method_Info (AccessFlags[1]) firstId secondId 1 [code]

codeConstr :: ([CP_Info]) -> Attribute_Info
codeConstr (cInfos) =
	let
		id = findInCp(cInfos, "Code")
	in
		AttributeCode id 17 1 1 5 [42, 183, 0, 1, 177] 0 [] 0 []



-- AccessFlags

cAF :: ([U.Modifier]) -> AccessFlags
cAF(mods) = AccessFlags (createAF(mods))

createAF :: ([U.Modifier]) -> [Int]
createAF ([]) = []
createAF (U.Public:cs) =
	let
		rest = createAF(cs)
	in (1 : rest)
createAF (U.Private:cs) =
	let
		rest = createAF(cs)
	in (2 : rest)
createAF (U.Static:cs) =
	let
		rest = createAF(cs)
	in (8 : rest)
createAF (U.Final:cs) =
	let
		rest = createAF(cs)
	in (16 : rest)



-- AssemblerCode

-- Expressions (Ohne Unary und Binary)

codeForExpr :: (Typed Expr, [CP_Info], [(U.Type, String)]) -> [Int]      
codeForExpr(Typed t This, _, _) = [42]
codeForExpr(Typed t Jnull, _, _) = [1]
codeForExpr(Typed t (Bool(True)), _, _) = [4]
codeForExpr(Typed t (Bool(False)), _, _) = [3]
codeForExpr(Typed t (Int(i)), _, _) = if ((i < 0) || (i > 5)) then [16, fromIntegral i] else [(3 + (fromIntegral i))]
codeForExpr(Typed t (Char(c)), _, _) = [16, ord c]
codeForExpr(Typed t (String(content)), constPool, _) = [18, findInConstPool(content)]
codeForExpr(Typed t (LocalOrFieldVar(name)), constPool, localVars) = localFieldVarCode(constPool, getLocalVar(name, localVars, 1), name)
codeForExpr(Typed t (InstVar exp name), constPool, localVars) =
    let
        expCode = codeForExpr(exp, constPool, localVars)
        fieldCode = [180, 0, findInConstPool(name)]
    in
        connectLists(expCode, fieldCode)
codeForExpr(Typed t (StmtExprExpr(x)), constPool, localVars) = stmtcodeForExpr(x, constPool, localVars)

getLocalVar :: (String, [(U.Type, String)],  Int) -> Maybe (Int, U.Type)
getLocalVar(_, [], _) = Nothing
getLocalVar(name, ((t, c):cs), id) = if (name == c) then Just (id, t) else getLocalVar(name, cs, id+1)

localFieldVarCode :: ([CP_Info], Maybe (Int, U.Type), String) -> [Int]
localFieldVarCode(_, Just (id, t), _) = if (id > 3) then generalLoad(id, t) else specificLoad(id, t)
localFieldVarCode(constPool, Nothing, name) = [42, 180, 0 , findInConstPool(name)]

generalLoad :: (Int, U.Type) -> [Int]
generalLoad(id, typ) = if ((typ == "int") || (typ == "boolean") || (typ == "char")) then [21, id] else [25, id]

specificLoad :: (Int, U.Type) -> [Int]
specificLoad(id, typ) = if ((typ == "int") || (typ == "boolean") || (typ == "char")) then [26 + id] else [42 + id]



-- StatementExpression

stmtcodeForExpr :: (Typed StmtExpr, [CP_Info], [(U.Type, String)]) -> [Int]
stmtcodeForExpr(Typed t (Assign(Typed typ (LocalOrFieldVar(name))) exp), constPool, localVars) = assignCode(getLocalVar(name, localVars, 1), name, exp, constPool, localVars)
stmtcodeForExpr((Typed retType (MethodCall exp  name  params)), constPool, localVars) =
    let
        methodId = findInConstPool(name)
        invokeCode = [182, 0, methodId]
        expr = codeForExpr(exp, constPool, localVars)
        loads = loadParamsCode(constPool, localVars, params)
        code = connectLists(expr, loads)
    in
        connectLists(code, invokeCode)
stmtcodeForExpr(Typed t (New name params), constPool, localVars) =
    let
        classId = findInConstPool(name)
        methodID = findInConstPool("<init>")  
        newCode = [187, 0, classId, 89]
        invokeCode = [183, 0, methodID]
        loads = loadParamsCode(constPool, localVars, params)                     
        code = connectLists(newCode, loads)
    in
        connectLists(code, invokeCode)

assignCode :: (Maybe (Int, U.Type), String, Typed Expr, [CP_Info], [(U.Type, String)]) -> [Int]
assignCode (Nothing, name, exp, constPool, localVars) =
    let
        id = findInConstPool(name)
        storeCode = [181, 0, id]
        expCode = codeForExpr(exp, constPool, localVars)
    in
        (42 : connectLists(expCode, storeCode))
assignCode(Just (id, typ), name, exp, constPool, localVars) = connectLists(codeForExpr(exp, constPool, localVars), storeCode(id, typ))

storeCode :: (Int, U.Type) -> [Int]
storeCode(id, typ) = 
    if ((typ == "int") || (typ == "boolean") || (typ == "char")) then 
        if (id > 3) then [54, id] else [59 + id]
    else 
        if (id > 3) then [58, id] else [75 + id]

loadParamsCode :: ([CP_Info],  [(U.Type, String)], [Typed Expr]) -> [Int]
loadParamsCode(_, _, []) = []
loadParamsCode(constPool, localVars, (c : cs)) = connectLists(codeForExpr(c, constPool, localVars), loadParamsCode(constPool, localVars, cs))



-- Statements

generateCode ::  (Typed Stmt, [(U.Type, String)], [CP_Info]) -> [Int]
generateCode(Typed t (Block([])), _, _) = []
generateCode(Typed _ (Block(Typed _ (LocalVarDecl t s):cs)), locVars, constPool) =
    let
        newVars = connectLists(locVars, [(t, s)])
    in
        generateCode(Typed "" (Block(cs)), newVars, constPool)
generateCode(Typed t (Block(c:cs)), locVars, constPool) = 
    let
        code = generateCode(c, locVars, constPool)
        buffer = generateCode(Typed "" (Block(cs)), locVars, constPool)
    in
        connectLists(code, buffer)
generateCode(Typed _ Empty, _, _) = []
generateCode(Typed _ (Return(exp)), localVars, constPool) = generateCodeForReturn(constPool, localVars, exp)
generateCode(Typed _ (While exp stm), localVars, constPool) = generateCodeForWhile(constPool, localVars,exp,stm)
generateCode(Typed _ (If x y z), localVars, constPool) = generateCodeForIf(constPool, localVars, (x,y,z))
generateCode(Typed _ (StmtExprStmt(x)), localVars, constPool) = stmtcodeForExpr(x, constPool, localVars)

generateCodeForReturn :: ([CP_Info], [(U.Type, String)], Maybe (Typed Expr)) -> [Int]
generateCodeForReturn(constPool, localVars, Nothing) = [177]
generateCodeForReturn(constPool, localVars, Just (Typed t exp)) = connectLists(codeForExpr((Typed t exp), constPool, localVars), [typeReturn(t)])

typeReturn :: String -> Int
typeReturn(typ) = if ((typ == "int") || (typ == "boolean") || (typ == "char")) then 172 else 176

generateCodeForWhile :: ([CP_Info], [(U.Type, String)], Typed Expr, Typed Stmt) -> [Int]
generateCodeForWhile(constPool, localVars, exp, stm) =
    let
        condition = codeForExpr(exp, constPool, localVars)
        condSize = getSize(condition)
        stmt = generateCode(stm, localVars, constPool)
        stmtSize = getSize(stmt)
        checkCode = [3, 159, 0, stmtSize + 6]
        goBack = [167, 255,  255 - (stmtSize + condSize + 3)]
        goToFinal = if (goBack == [167, 255, 255]) then
                [167, 0, 0]
            else
                goBack
        code1 = connectLists(condition, checkCode)
        code2 = connectLists(code1, stmt)
        fullCode = connectLists(code2, goToFinal)
    in
        connectLists(code2, goToFinal)

generateCodeForIf :: ([CP_Info], [(U.Type, String)], (Typed Expr, Typed Stmt, Maybe (Typed Stmt))) -> [Int]
generateCodeForIf(constPool, localVars, (cond, mThen, Nothing)) = 
    let
        expCode = codeForExpr(cond, constPool, localVars)
        stmtCode = generateCode(mThen, localVars, constPool)
        jmptoCode = [153, 0, getSize(stmtCode) + 3]
        expAndJmp = connectLists(expCode, jmptoCode)
    in
        connectLists(expAndJmp, stmtCode)
generateCodeForIf(constPool, localVars, (cond, mThen, Just mElse)) = 
    let
        expCode = codeForExpr(cond, constPool, localVars)
        expCodeLength = getSize(expCode)
        thenCode = generateCode(mThen, localVars, constPool)
        jmpto1Code = [153, 0, 6 + getSize(thenCode)]
        elseCode = generateCode(mElse, localVars, constPool)
        jmpto2Code = [167, 0, getSize(elseCode) + 3]
        code1 = connectLists(expCode, jmpto1Code)
        code2 = connectLists(code1, thenCode)
        code3 = connectLists(code2, jmpto2Code)
    in
        connectLists(code3, elseCode)



-- Suchen im  Konstantenpool

findInConstPool :: String -> Int		-- ConstPool wird nicht richtig befüllt, daher so
findInConstPool(x) = 0

findInCp :: ([CP_Info], String) -> Int
findInCp (x, y) = findInCpRek(x,y,0)

findInCpRek :: ([CP_Info], String, Int) -> Int
findInCpRek ([],x,y) = 0
findInCpRek (((Utf8_Info _ _ name _) :cs), x, y)
	| name == x = y
	| otherwise = findInCpRek (cs, x, y + 1)
findInCpRek (x,y,z) = -1

findClassInCp :: ([CP_Info], String) -> Int
findClassInCp (x,y)=
	let
		index = findInCp(x,y)
	in
		findClassInCpRek(x, index, 0)

findClassInCpRek :: ([CP_Info], Int, Int) -> Int
findClassInCpRek ([],x,y) = 0
findClassInCpRek (((Class_Info _ name _) :cs), x, y)
	| name == x = y
	| otherwise = findClassInCpRek (cs, x, y + 1)
findClassInCpRek (x,y,z) = -1



-- Hilfsmethoden

getSize ::[a] -> Int
getSize [] = 0
getSize (_:tail) = 1 + getSize (tail)

connectLists :: ([a], [a]) -> [a]
connectLists(x, []) = x
connectLists([], x) = x
connectLists((c:cs), x) = (c : connectLists(cs, x))
