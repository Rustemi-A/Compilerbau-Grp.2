module ConstPool where
import Jvm.Data.ClassFormat
import TypedAST
import Data.List
import qualified AbstrakteSyntax as U

buildConstPool :: Class -> CP_Infos
buildConstPool (Class mods classname fields constructors methods) =
    let
        obj = "java/lang/Object"

        constpool=[
            MethodRef_Info
                { tag_cp = TagMethodRef
                , index_name_cp = 3
                , index_nameandtype_cp = 6
                , desc = ""
                }
            ,
            Class_Info
                { tag_cp = TagClass
                , index_cp = 4
                , desc = ""
                }
                ,
            Class_Info
                { tag_cp = TagClass
                , index_cp = 5
                , desc = ""
                }
            ,
            genUtf8 classname , genUtf8 obj ,
            NameAndType_Info
               { tag_cp = TagNameAndType
               , index_name_cp = 7
               , index_descr_cp = 8
               , desc = ""
               }
            ,
            genUtf8 "<init>" , genUtf8 "()V"
            ] ++ concatMap buildFields fields ++ concatMap buildMethods methods

        allMeths = constructors ++ methods

        constpoolMethRef = foldr buildMethodCalls constpool allMeths
    in
        buildFieldCalls constpoolMethRef fields allMeths


buildFields ::  Typed Field -> CP_Infos
buildFields (Typed typ (Field _ _ name)) =  [ genUtf8 name , genUtf8 (genTypString typ) ]



buildMethods :: Typed Method -> CP_Infos
buildMethods (Typed typ(Method _ _ name parameters _)) =
    let
        methodTyp = "(" ++ concatMap (genTypString . fst) parameters ++ ")" ++ genTypString typ
    in
        [ genUtf8 name , genUtf8 methodTyp ]


buildMethodCalls :: Typed Method -> CP_Infos -> CP_Infos
buildMethodCalls  (Typed _ (Method _ _ _ _ stmt))=
        findMethStmt  stmt


findMethExpr :: Typed Expr -> CP_Infos -> CP_Infos
findMethExpr (Typed _ (InstVar expr _)) cpInfos =  findMethExpr expr cpInfos
findMethExpr (Typed _ (Unary _ expr)) cpInfos = findMethExpr expr cpInfos
findMethExpr (Typed _ (Binary expr _ expr2)) cpInfos = (findMethExpr expr . findMethExpr expr2) cpInfos
findMethExpr (Typed _ (StmtExprExpr stmtExpr))  cpInfos = findMethStmtExpr stmtExpr cpInfos
findMethExpr (Typed typ (LocalOrFieldVar var)) cpInfos =  cpInfos
findMethExpr _ cpInfos = cpInfos


findMethStmt :: Typed Stmt -> CP_Infos -> CP_Infos
findMethStmt (Typed _ (Block block)) = foldr ((.) . findMethStmt) id block           -- foldr (findMethStmt ) block  
findMethStmt (Typed _ (Return (Just expr))) = findMethExpr expr
findMethStmt (Typed _ (Return Nothing)) = id
findMethStmt (Typed _ (While expr stmt)) = findMethExpr expr . findMethStmt stmt
findMethStmt (Typed _ (If expr stmt (Just stmt2))) = findMethExpr expr . findMethStmt stmt . findMethStmt stmt2
findMethStmt (Typed _ (If expr stmt Nothing)) = findMethExpr expr . findMethStmt stmt
findMethStmt (Typed _ (StmtExprStmt stmtExpr))  = findMethStmtExpr stmtExpr 
findMethStmt _ = id



findMethStmtExpr :: Typed StmtExpr -> CP_Infos -> CP_Infos
findMethStmtExpr (Typed _ (Assign expr1 expr2)) cpInfos = (findMethExpr expr1 . findMethExpr expr2) cpInfos
findMethStmtExpr (Typed typ (New klasse exprs)) cpInfos =
    let
        offset = length cpInfos
        methodTyp = "(" ++ concatMap genMethodSig exprs ++ ")V"

        cpi = cpInfos ++ [
            MethodRef_Info -- offset 1
                { tag_cp = TagMethodRef
                , index_name_cp = offset + 5
                , index_nameandtype_cp  = offset + 2
                , desc = ""
                }
            ,
            NameAndType_Info  -- offset 2
                { tag_cp = TagNameAndType
                , index_name_cp = offset + 3
                , index_descr_cp = offset + 4
                , desc = ""
                }
            ,
            genUtf8 "<init>" , genUtf8 methodTyp ,

            Class_Info  -- offset 5
                { tag_cp = TagClass
                , index_cp = offset + 6
                , desc = ""
                }
            ,
             genUtf8  $ genTypString klasse -- offset 6 
            ]
    in
        -- (findMethExpr expr . foldr ((.) . findMethExpr) id args) cpi
        foldr findMethExpr cpi exprs
--
-- todo konstruktoraufruf
-- man braucht ClassInfo für die Klasse des Objekts
-- ff
findMethStmtExpr (Typed returnTyp(MethodCall expr name args)) cpInfos =
    let
        offset = length cpInfos
        methodTyp = "(" ++ concatMap genMethodSig args ++ ")" ++ genTypString returnTyp
        -- methodTyp = "(" ++ concat (map (genTypString . fst) parameters) ++ ")" ++ genTypString typ
        cpi = cpInfos ++[
            MethodRef_Info -- offset 1
                { tag_cp = TagMethodRef
                , index_name_cp = 2
                , index_nameandtype_cp  = offset + 2
                , desc = ""
                }
            ,
            NameAndType_Info  -- offset 2
                { tag_cp = TagNameAndType
                , index_name_cp = offset + 3
                , index_descr_cp = offset + 4
                , desc = ""
                }
            ,
            genUtf8 name , genUtf8 methodTyp  -- offset 3 4
            -- Class_Info  -- offset 5
            --     { tag_cp = TagClass
            --     , index_cp = offset + 6
            --     , desc = ""
            --     }
            -- ,
            -- genUtf8 $ getType expr -- offset 6
            ]
    in
        (findMethExpr expr . foldr ((.) . findMethExpr) id args) cpi


--
--buildFieldRefs :: Typed Field -> Typed Method -> CP_Infos -> CP_Infos
--buildFieldRefs _ = id
--
-- Fieldref ---------------------------------------------------------------------------------------------

buildFieldCalls ::  CP_Infos -> [Typed Field] -> [Typed Method] -> CP_Infos
buildFieldCalls cp fields = foldl (\ cp x -> fieldCall x fields cp) cp

-- buildFieldCalls cp fields (x:xs) = buildFieldCalls (fieldCall x fields cp) fields xs
-- buildFieldCalls cp fields []  = cp

fieldCall :: Typed Method -> [Typed Field] -> CP_Infos -> CP_Infos
fieldCall (Typed _ (Method _ _ _ _ stmt)) = findFieldStmt stmt


findFieldExpr :: Typed Expr -> [Typed Field] -> CP_Infos -> CP_Infos
findFieldExpr (Typed typ (InstVar (Typed exprTyp expr) name)) fields cpInfos =
        let
            offset = length cpInfos
            typString = genTypString typ
        in
          cpInfos ++ [
        FieldRef_Info -- offset 1
            { tag_cp = TagFieldRef
            , index_name_cp = 2-- verweist auf bestehenden offset + 3
            , index_nameandtype_cp = offset + 2
            , desc = ""
            }
        ,
        NameAndType_Info -- offset 2
            { tag_cp = TagNameAndType
            , index_name_cp = offset + 3
            , index_descr_cp = offset + 4
            , desc = ""
            }
        ,
        genUtf8 name
        ,
        genUtf8 $ genTypString typ -- offset 4
        ]

         -- findFieldExpr expr fields cpInfos --
findFieldExpr (Typed _ (Unary _ expr)) fields cpInfos= findFieldExpr expr fields cpInfos
findFieldExpr (Typed _ (Binary expr1 _ expr2)) fields cpInfos = (findFieldExpr expr1 fields  . findFieldExpr expr2 fields) cpInfos
findFieldExpr (Typed _ (StmtExprExpr stmtExpr)) fields cpInfos = findFieldStmtExpr stmtExpr fields cpInfos
findFieldExpr (Typed _ (StaticClass _)) fields cpInfos = cpInfos
findFieldExpr (Typed typ (LocalOrFieldVar var)) fields cpInfos =
    if isFieldVar fields
    then
        let
            offset = length cpInfos
            typString = genTypString typ
        in
          cpInfos ++ [
        FieldRef_Info -- offset 1
            { tag_cp = TagFieldRef
            , index_name_cp = 2-- verweist auf bestehenden offset + 3
            , index_nameandtype_cp = offset + 2
            , desc = ""
            }
        ,
        NameAndType_Info -- offset 2
            { tag_cp = TagNameAndType
            , index_name_cp = offset + 3
            , index_descr_cp = offset + 4
            , desc = ""
            }
        ,
        genUtf8 var
        ,
        genUtf8 $ genTypString typ -- offset 4
        ]


    else cpInfos -- fieldref? es muss nachgeprüft werden, ob es sich um ein field handelt
  where
      isFieldVar :: [Typed Field] -> Bool
      -- isFieldVar _ = True
      isFieldVar  ((Typed typ2 (Field _ _ name)) : xs) = (var == name) && (typ == typ2) || isFieldVar xs
      isFieldVar   [] = False
findFieldExpr _ _ cpInfos = cpInfos

findFieldStmt :: Typed Stmt -> [Typed Field] -> CP_Infos -> CP_Infos
findFieldStmt (Typed a (Block (x:xs))) fields = findFieldStmt (Typed a {-geht das erstellen einer expr so? -} (Block xs)) fields . findFieldStmt x fields  -- ????  foldr ((.) . findFieldStmt) id block           -- foldr (findMethStmt ) block   -- es muss ein neuer block gemacht werden, der die statements enthält, die üblig sind 
findFieldStmt (Typed _ (Block [])) fields  = id
findFieldStmt (Typed _ (Return (Just expr))) fields = findFieldExpr expr fields
findFieldStmt (Typed _ (Return Nothing)) fields = id
findFieldStmt (Typed _ (While expr stmt)) fields = findFieldExpr expr fields . findFieldStmt stmt fields
findFieldStmt (Typed _ (If expr stmt (Just stmt2))) fields = findFieldExpr expr fields . findFieldStmt stmt fields . findFieldStmt stmt2 fields
findFieldStmt (Typed _ (If expr stmt Nothing)) fields = findFieldExpr expr fields . findFieldStmt stmt fields
findFieldStmt (Typed _ (StmtExprStmt stmtExpr)) fields = findFieldStmtExpr stmtExpr fields
findFieldStmt _ fields = id


findFieldStmtExpr :: Typed StmtExpr -> [Typed Field] -> CP_Infos -> CP_Infos
findFieldStmtExpr (Typed _ (Assign expr1 expr2)) fields = findFieldExpr expr1 fields . findFieldExpr expr2 fields
findFieldStmtExpr (Typed _ (New _ exprs)) fields = findFieldExprs exprs fields
findFieldStmtExpr (Typed _ (MethodCall expr _ exprs)) fields = findFieldExprs exprs fields . findFieldExpr expr fields         -- (findMethExpr expr . foldr ((.) . findMethExpr) id args) cpi

findFieldExprs :: [Typed Expr] -> [Typed Field] -> CP_Infos -> CP_Infos
findFieldExprs (x:xs) fields = findFieldExprs xs fields . findFieldExpr x fields
findFieldExprs [] fields = id

-- isFieldVar :: String -> [Typed Field] -> Bool
-- isFieldVar s ((Typed _ (Field _ _ name)) : xs) = (s == name) || isFieldVar s xs
-- isFieldVar _ [] = False


-- Hilfsfunktionen ---------------------------------------------------------------------------------------

-- isAttribute :: string -> CP_Infos -> boolean
-- isAttribute localOrField cpInfos = takeWhile 




genMethodSig (Typed typ _ ) = genTypString typ

getType (Typed typ _) = typ

genTypString :: U.Type -> U.Type
genTypString "int" = "I"
genTypString "boolean" = "Z"
genTypString "void" = "V"
genTypString "char" = "C"
genTypString "Object" = genTypString "java/lang/Object"
genTypString typ = "L" ++ typ ++ ";"


genUtf8 :: String -> CP_Info
genUtf8 "Object" = genUtf8 "java/lang/Object"
genUtf8 string =
    Utf8_Info
        { tag_cp = TagUtf8
        , tam_cp = length string
        , cad_cp = string
        , desc = ""
        }


