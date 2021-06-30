{-# LANGUAGE MultiWayIf #-}

module TypeCheck (typeCheck) where

import AbstrakteSyntax
import Control.Applicative
import Control.Arrow ((&&&))
import Control.Monad
import Control.Monad.Except
import Data.Functor ((<&>))
import Data.List
import Data.Maybe (fromMaybe)
import qualified TypedAST as T

-- Hilfsfunktionen ungetypter AST

getClassName (Class (_, name, _, _, _)) = name

getConstructors (Class (_, _, _, constrs, _)) = constrs

findField field = find ((field ==) . (getFieldType &&& getFieldName)) . getFields

getFields (Class (_, _, fields, _, _)) = fields

getFieldType (FieldDecl (_, typ, _)) = typ

getFieldName (FieldDecl (_, _, name)) = name

getFieldMods (FieldDecl (mods, _, _)) = mods

getMethods (Class (_, _, _, _, methods)) = methods

getMethodName (Method (_, _, name, _, _)) = name

getMethodType (Method (_, typ, _, _, _)) = typ

getMethodMods (Method (mods, _, _, _, _)) = mods

getParams (Method (_, _, _, params, _)) = params

getAST (T.Typed _ ast) = ast

getType (T.Typed typ _) = typ

-- getMods (T.Typed _ _ mods) = mods

-- Hilfstypen /-funktionen für type check

(~=) :: Type -> Type -> Bool
"null" ~= typ
  | typ == "void" || typ == "int" || typ == "char" || typ == "boolean" = False
  | otherwise = True
typ ~= "null" = "null" ~= typ
typ ~= typ2 = typ == typ2

(?:) = flip fromMaybe

infixr 0 ?:

type ClsList = (Class, [Class])

this = fst

allClss :: ClsList -> [Class]
allClss (this, rest) = this : rest

findClass :: String -> ClsList -> Maybe Class
findClass "this" = Just . this
findClass name = find ((==) name . getClassName) . allClss

data Context = Static' | Constructor | Instance deriving (Eq)

typeCheck :: Class -> [Class] -> T.Typed T.Class
typeCheck cls classes =
  let allClss = (cls, java'lang'String : java'lang'Object : classes)
   in case typeCheckClass [] allClss Instance cls of
        Right typed -> typed
        Left e -> error e

type TypeChecker u t = [(Type, String)] -> ClsList -> Context -> u -> Either String (T.Typed t)

-- Semantische Analyse

typeCheckClass :: TypeChecker Class T.Class
typeCheckClass symtab classes ctx (Class (modifier, typ, fields, constrs, methods)) =
  do
    tfields <- mapM (typeCheckField symtab classes ctx) fields
    tmeths <- mapM (\m -> typeCheckMethod symtab classes (getMethodContext m) m) methods
    tconstrs <- mapM (typeCheckMethod symtab classes Constructor) constrs
    return $ T.Typed typ (T.Class modifier typ tfields tconstrs tmeths)
  where
    getMethodContext m = if Static `elem` getMethodMods m then Static' else Instance

typeCheckMethod :: TypeChecker MethodDecl T.Method
typeCheckMethod symtab classes ctx (Method (modifier, mType, name, args, stmt)) =
  typeCheckStmt (args ++ symtab) classes ctx stmt >>= \tstmt ->
    let innerType = getType tstmt
     in if innerType ~= mType
          then return $ T.Typed mType $ T.Method modifier mType name args tstmt
          else throwError $ "Returntyp und Methodentyp stimmen nicht überein. Erwartet: " ++ mType ++ ". Gefunden: " ++ innerType

typeCheckField :: TypeChecker FieldDecl T.Field
typeCheckField _ _ _ (FieldDecl (modifier, typ, name)) = return $ T.Typed typ $ T.Field modifier typ name

--
--
typeCheckStmt :: TypeChecker Stmt T.Stmt
--
-- Block
--
mightReturn :: T.Stmt -> Bool
mightReturn (T.Block _) = True
mightReturn (T.Return _) = True
mightReturn T.If {} = True
mightReturn T.While {} = True
mightReturn _ = False

willReturn :: T.Stmt -> Bool
willReturn (T.Block []) = False
willReturn (T.Block [s]) = willReturn $ getAST s
willReturn (T.Block ss) = any (willReturn . getAST) ss
willReturn (T.Return _) = True
willReturn _ = False

--
typeCheckStmt _ _ _ (Block []) = return $ T.Typed "void" $ T.Block []
-- Block only has a type /= void if last statement is return or other block
typeCheckStmt symtab classes ctx (Block [stmt]) = toBlock <$> typeCheckStmt symtab classes ctx stmt
  where
    toBlock stmt =
      if mightReturn $ getAST stmt
        then T.Typed (getType stmt) $ T.Block [stmt]
        else T.Typed "void" $ T.Block [stmt]
--
typeCheckStmt symtab classes ctx (Block (head : tail)) = typeCheckStmt symtab classes ctx head >>= checkTail
  where
    checkTail typedHead =
      let newSymTab = case getAST typedHead of
            (T.LocalVarDecl varType varName) -> symtab ++ [(varType, varName)]
            _ -> symtab
       in do
            T.Typed tailType ~(T.Block typedTail) <- typeCheckStmt newSymTab classes ctx $ Block tail
            let headType = getType typedHead
            if
                | willReturn $ getAST typedHead -> throwError "Return Statement nur als letzte Anweisung erwartet"
                | (mightReturn . getAST) typedHead && headType /= "void" && headType ~= tailType ->
                  throwError $ "Typen der Statements stimmen nicht überein: " ++ headType ++ " und " ++ tailType
                | otherwise -> return $ T.Typed tailType $ T.Block (typedHead : typedTail)
--
-- Return
typeCheckStmt _ _ ctx (Return Nothing) = return $ T.Typed "void" (T.Return Nothing)
typeCheckStmt symtab cls ctx (Return (Just e)) = do
  texpr <- typeCheckExpr symtab cls ctx e
  return $ T.Typed (getType texpr) (T.Return $ Just texpr)
--
-- If
typeCheckStmt symtab cls ctx (If (cond, ifs, maybeElses)) = do
  tcond <- typeCheckExpr symtab cls ctx cond
  tifs <- typeCheckStmt symtab cls ctx ifs
  let iftyp = getType tifs
  if getType tcond ~= "boolean"
    then case maybeElses of
      Just elses -> do
        telse <- typeCheckStmt symtab cls ctx elses
        if getType telse ~= iftyp
          then return $ T.Typed iftyp $ T.If tcond tifs $ Just telse
          else throwError "If und Else haben verschiedene Typen"
      Nothing -> return $ T.Typed iftyp $ T.If tcond tifs Nothing
    else throwError $ "If-Bedingung muss vom Typ boolean sein. Aktuell: " ++ getType tcond
--
-- While
typeCheckStmt symtab cls ctx (While (cond, stmt)) = do
  tcond <- typeCheckExpr symtab cls ctx cond
  tstmt <- typeCheckStmt symtab cls ctx stmt
  if getType tcond ~= "boolean"
    then return $ T.Typed (getType tstmt) $ T.While tcond tstmt
    else throwError $ "While-Bedingung muss vom Typ boolean sein. Aktuell: " ++ getType tcond
--
-- LocalVarDecl
typeCheckStmt symtab cls _ (LocalVarDecl (typ, name)) =
  if any ((name ==) . snd) symtab
    then throwError $ "Variable " ++ name ++ " bereits deklariert"
    else return $ T.Typed typ (T.LocalVarDecl typ name)
--
-- Empty
typeCheckStmt _ _ _ Empty = return $ T.Typed "void" T.Empty
--
-- StmtExprExpr
typeCheckStmt symtab cls ctx (StmtExprStmt expr) = toStmtExpr <$> typeCheckStmtExpr symtab cls ctx expr
  where
    toStmtExpr tstmExpr = T.Typed (getType tstmExpr) $ T.StmtExprStmt tstmExpr

--
--
--
--
typeCheckStmtExpr :: TypeChecker StmtExpr T.StmtExpr
--
-- Assign
typeCheckStmtExpr symtab cls ctx (Assign (exprLeft, exprRight)) = do
  tExprL <- typeCheckExpr symtab cls ctx exprLeft
  tExprR <- typeCheckExpr symtab cls ctx exprRight
  let leftType = getType tExprL
      rightType = getType tExprR
      mods = case tExprL of
        (T.Typed varType (T.LocalOrFieldVar var)) ->
          if (varType, var) `elem` symtab
            then []
            else getFieldMods <$> findField (varType, var) (this cls) ?: []
        (T.Typed varType (T.InstVar clsExpr var)) -> (findClass varType cls >>= findField (varType, var)) <&> getFieldMods ?: []
        _ -> []

  if ctx /= Constructor && Final `elem` mods
    then throwError "Finalem Ausdruck kann nichts zugewiesen werden"
    else
      if leftType ~= rightType
        then return $ T.Typed leftType $ T.Assign tExprL tExprR
        else throwError $ "Kann " ++ rightType ++ " nicht " ++ leftType ++ " zuweisen"
--
-- New
typeCheckStmtExpr symtab cls ctx (New (typ, params)) =
  case findClass typ cls of
    Just newClass -> do
      typedArgs <- mapM (typeCheckExpr symtab cls ctx) params
      if any (matchParams typedArgs . getParams) (getConstructors newClass)
        then return $ T.Typed typ (T.New typ typedArgs)
        else throwError $ "Kein Konstruktor in Klasse " ++ typ ++ " mit Parametern " ++ show params ++ " gefunden"
    Nothing -> throwError $ "Klasse " ++ typ ++ " nicht gefunden"
--
-- MethodCall
typeCheckStmtExpr symtab cls ctx (MethodCall (exprLeft, name, params)) = do
  tExprL <- typeCheckExpr symtab cls ctx exprLeft
  typedArgs <- mapM (typeCheckExpr symtab cls ctx) params
  methClass <- case findClass (getType tExprL) cls of
    Just clazz -> return clazz
    Nothing -> throwError $ "Klasse " ++ getType tExprL ++ " nicht gefunden"
  let methodsWithSameName = filter ((name ==) . getMethodName) $ getMethods methClass
  case find (matchParams typedArgs . getParams) methodsWithSameName of
    Just method -> case tExprL of
        (T.Typed _ (T.StaticClass _)) | Static `notElem` getMethodMods method ->
          throwError $ "Kann Instanzmethode " ++ name ++ " nicht aus einem statischen Kontext aufrufen"
        _ -> return $ T.Typed (getMethodType method) (T.MethodCall tExprL name typedArgs)
    Nothing -> throwError $ "Methode " ++ name ++ " mit Parametern " ++ show params ++ " nicht gefunden"

--
--
matchParams :: [T.Typed a] -> [(Type, String)] -> Bool
matchParams args params = sameLength && sameTypes
  where
    sameLength = length args == length params
    sameTypes = and (zipWith (\typed (typ, _) -> typ ~= getType typed) args params)

--
--
-- Expressions
--
typeCheckExpr :: TypeChecker Expr T.Expr
--
typeCheckExpr symtab cls ctx Jnull = return $ T.Typed "null" T.Jnull
--
typeCheckExpr symtab cls ctx (Integer i) = return $ T.Typed "int" $ T.Int i
--
typeCheckExpr symtab cls ctx (Bool b) = return $ T.Typed "boolean" $ T.Bool b
--
typeCheckExpr symtab cls ctx (Char c) = return $ T.Typed "char" $ T.Char c
--
typeCheckExpr symtab cls ctx (String s) = return $ T.Typed "String" $ T.String s
--
typeCheckExpr symtab cls ctx This = if ctx == Static'
  then throwError "this kann nicht in einem statischen Kontext aufgerufen werden"
  else return $ T.Typed (getClassName $ this cls) T.This

--
typeCheckExpr symtab cls ctx (StmtExprExpr e) = toStmtExpr <$> typeCheckStmtExpr symtab cls ctx e
  where
    toStmtExpr stmExpr = T.Typed (getType stmExpr) $ T.StmtExprExpr stmExpr
--
--
typeCheckExpr symtab cls ctx (Binary (op, left, right)) = do
  lTyped <- typeCheckExpr symtab cls ctx left
  rTyped <- typeCheckExpr symtab cls ctx right
  let binaryType = case op of
        op | op `elem` [Equals, LessT, GreaterT, GE, LE, AND, OR, BitwiseAND, BitwiseOR] -> "boolean"
        _ -> getType rTyped
  if getType lTyped == getType rTyped
    then return $ T.Typed binaryType $ T.Binary lTyped op rTyped
    else throwError $ "Typen in dem binären Ausdruck haben verschiedene Typen: " ++ getType lTyped ++ " und " ++ getType rTyped

--
--
typeCheckExpr symtab cls ctx (Unary (op, expr)) = toTyped <$> typeCheckExpr symtab cls ctx expr
  where
    toTyped e = T.Typed (getType e) $ T.Unary op e

--
--
typeCheckExpr symtab cls ctx (LocalOrFieldVar name) = instanceField <|> staticClass
  where
    local = find ((name ==) . snd) symtab <&> (fst &&& const [Static]) --Static weil lokale Variablen auch in statischen Methoden vorkommen können
    field = find ((name ==) . getFieldName) (getFields $ this cls) <&> (getFieldType &&& getFieldMods)
    instanceField = case local <|> field of
      Just (varType, varMods) ->
        if ctx == Static' && notElem Static varMods
          then throwError $ "Kann Instanzfeld " ++ name ++ " nicht aus einem statischen Kontext aufrufen"
          else return $ T.Typed varType (T.LocalOrFieldVar name)
      Nothing -> Left $ "Variable " ++ name ++ " nicht gefunden"
    staticClass = case findClass name cls of
      (Just c) -> return $ T.Typed name (T.StaticClass name)
      Nothing -> throwError $ "Variable " ++ name ++ " nicht gefunden"
--
--
typeCheckExpr symtab clss ctx (InstVar (expr, name)) = typeCheckExpr symtab clss ctx expr >>= checkVar
  where
    checkVar :: T.Typed T.Expr -> Either String (T.Typed T.Expr)
    checkVar typedExpr = case findClass (getType typedExpr) clss of
      Just cls -> case (getFieldType &&& getFieldMods) <$> find ((name ==) . getFieldName) (getFields cls) of
        Just (fieldType, mods) -> case typedExpr of
          (T.Typed _ (T.StaticClass _))
            | Static `notElem` mods ->
              throwError $ "Kann Instanzfeld " ++ name ++ " nicht aus einem statischen Kontext aufrufen"
          _ -> return $ T.Typed fieldType (T.InstVar typedExpr name)
        Nothing -> throwError $ "Feld " ++ name ++ " existiert nicht in Klasse " ++ getType typedExpr
      Nothing -> throwError $ "Klasse " ++ getType typedExpr ++ " nicht gefunden."

-- java.lang Klassen

java'lang'Object :: Class
java'lang'Object =
  Class
    ( [Public],
      "Object",
      [],
      [ Method
          ( [Public],
            "void",
            "Object",
            [],
            Block []
          )
      ],
      []
    )

java'lang'String :: Class
java'lang'String =
  Class
    ( [Public],
      "String",
      [],
      [],
      []
    )
