module CF where
import ClassFormat 
import TypedAST
import ConstPool
import qualified AbstrakteSyntax as U

buildClassFile :: Class -> ClassFile
buildClassFile (Class modifier typ fields methods) =
	let
		constPool = buildConstPool(Class modifier typ fields methods)
		constPoolCount = getSize(constPool)
		fieldInfos = transformFields(constPool, fields)
		fiCount = getSize(fieldInfos)
		methodInfos = transformMethod(constPool, methods)
		methodCount = getSize(methodInfos)
		accFlg = cAF(modifier)
	in 
		ClassFile Magic (MinorVersion(0)) (MajorVersion(48)) constPoolCount constPool accFlg (ThisClass(0)) (SuperClass(0)) 0 [] fiCount fieldInfos methodCount methodInfos 0 []


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


transformMethod :: ([CP_Info], [Typed Method]) -> [Method_Info]
transformMethod(_, []) = []
transformMethod(constPool, (c:cs)) = 
	let
		info = buildMethodInfo(constPool, c)
		rest = transformMethod(constPool, cs)
	in 
		(info: rest)


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
