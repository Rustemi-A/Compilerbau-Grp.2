module CF where

import Jvm.Data.ClassFormat
import TypedAST
import ConstPool
import qualified AbstrakteSyntax as U

buildClassFile :: Class -> ClassFile
buildClassFile (Class modifier typ fields constructors methods) =
	let
		constPool = buildConstPool(Class modifier typ fields constructors methods)
		constPoolCount = getSize(constPool) + 1
		fieldInfos = transformFields(constPool, fields)
		fiCount = getSize(fieldInfos)
		methodInfos = transformMethod(constPool, typ, methods)
		methodCount = getSize(methodInfos)
		accFlg = cAF(modifier)
		this = findClassInCp(constPool, typ)
		super = findClassInCp(constPool, "java/lang/Object")
	in
		ClassFile Magic (MinorVersion(0)) (MajorVersion(48)) constPoolCount constPool accFlg (ThisClass(this)) (SuperClass(super)) 0 [] fiCount fieldInfos methodCount methodInfos 0 []



getSize ::[a] -> Int
getSize [] = 0
getSize (_:tail) = 1 + getSize (tail)


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


transformMethod :: ([CP_Info], String, [Typed Method]) -> [Method_Info]
transformMethod(_, _, []) = []
transformMethod(constPool, name, (c:cs)) =
	let
		defconst = getConstr((c:cs), name , constPool)
		info = buildMethodInfo(constPool, c)
		rest = transformMethod(constPool, name, cs)
	in
		constr(defconst, (info : rest))

constr :: (Maybe Method_Info, [Method_Info]) -> [Method_Info]
constr(Nothing, x) = x
constr(Just x, y) = (x:y)


buildMethodInfo :: ([CP_Info], Typed Method) -> Method_Info
buildMethodInfo(constPool, (Typed _ (Method modifier typ name x statment))) =
	let
		id = findInCp(constPool, name)
		typeId = findInCp(constPool, typ)
		accFlg = cAF(modifier)
	in
		Method_Info accFlg id typeId 1 []

cAF :: ([U.Modifier]) -> AccessFlags
cAF(mods) =
	let
		ints = createAF(mods)
	in
		AccessFlags ints


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

getConstr :: ([Typed Method], String, [CP_Info]) -> (Maybe Method_Info)
getConstr ([], name, cInfos) =
	let
		constructor = createDefaultConstructor(cInfos)
	in
		Just constructor
getConstr(((Typed _ (Method _ _ name _ _ )):cs), className, cInfos)
	| name == className = Nothing
	| otherwise = getConstr(cs, className, cInfos)

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
