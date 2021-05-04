module ConstPool where 
import Jvm.Data.ClassFormat
import TypedAST

buildConstPool :: Class -> CP_Infos

buildConstPool (Class mods classname fields methods) = 
    let 
        constpool=[
            {-MethodRef_Info 
                { tag_cp = TagMethodRef  ---Fragen wegen index finden etc.
                , index_name_cp = 3
                , index_nameandtype_cp  :: Index_Constant_Pool
                , desc                  :: String
                }
            ,
            -}
            Class_Info
                { tag_cp = TagClass
                , index_cp = 2
                , desc = ""
                }
            ,
            Utf8_Info 
                { tag_cp = TagUtf8
                , tam_cp = length classname
                , cad_cp = classname
                , desc = ""
                }    

            ] ++ concatMap buildFields fields
        
    in 
        constpool 


buildFields ::  Typed Field -> CP_Infos

buildFields (Typed typ (Field _ _ name)) =
    [
        Utf8_Info 
            { tag_cp = TagUtf8
            , tam_cp = length name
            , cad_cp = name
            , desc = ""
            }  
        ,
        Utf8_Info 
            { tag_cp = TagUtf8
            , tam_cp = length typ
            , cad_cp = typ
            , desc = ""
            }   
    ]

buildMethods 


exampleClass = (Class [] "irgend ein string" [Typed "Java/lang/Integer" (Field [] "" "Zahl")] [] )