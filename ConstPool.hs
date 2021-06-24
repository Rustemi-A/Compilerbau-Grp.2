module ConstPool where

import Jvm.Data.ClassFormat
import TypedAST

buildConstPool :: Class -> CP_Infos
buildConstPool (Class mods classname fields constructors methods) =
  let constpool =
        [ {-MethodRef_Info
              { tag_cp = TagMethodRef  ---Fragen wegen index finden etc. und warten auf Konstruktoren
              , index_name_cp = 3
              , index_nameandtype_cp  :: Index_Constant_Pool
              , desc                  :: String
              }
          ,
          -}
          Class_Info
            { tag_cp = TagClass,
              index_cp = 2,
              desc = ""
            },
          Utf8_Info
            { tag_cp = TagUtf8,
              tam_cp = length classname,
              cad_cp = classname,
              desc = ""
            }
        ]
          ++ concatMap buildFields fields

      myContstpool = foldr buildMethods constpool methods
   in myContstpool

buildFields :: Typed Field -> CP_Infos
buildFields (Typed typ (Field _ _ name)) =
  [ Utf8_Info
      { tag_cp = TagUtf8,
        tam_cp = length name,
        cad_cp = name,
        desc = ""
      },
    Utf8_Info
      { tag_cp = TagUtf8,
        tam_cp = length typ,
        cad_cp = typ,
        desc = ""
      }
  ]

buildMethods :: Typed Method -> CP_Infos -> CP_Infos
buildMethods (Typed typ (Method _ _ name _ _)) cpInfos =
  let offset = length cpInfos
   in cpInfos
        ++ [ MethodRef_Info
               { tag_cp = TagMethodRef,
                 index_name_cp = 1, --später 2
                 index_nameandtype_cp = offset + 2,
                 desc = ""
               },
             NameAndType_Info
               { tag_cp = TagNameAndType,
                 index_name_cp = offset + 3,
                 index_descr_cp = offset + 4,
                 desc = ""
               },
             Utf8_Info
               { tag_cp = TagUtf8,
                 tam_cp = length name,
                 cad_cp = name,
                 desc = ""
               },
             Utf8_Info
               { tag_cp = TagUtf8,
                 tam_cp = length typ,
                 cad_cp = typ,
                 desc = ""
               }
           ]

exampleClass = Class [] "Klasse" [Typed "Java/lang/Integer" (Field [] "" "Zahl")] [Typed "void" (Method [] "" "myMethod" [] (Typed "void" (Block [])))]
