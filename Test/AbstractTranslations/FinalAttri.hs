module Test.AbstractTranslations.FinalAttri where

import AbstrakteSyntax
import qualified TypedAST as T
import Jvm.Data.ClassFormat
import Data.ByteString.Lazy.Internal as B

finalAttriAbstractSyntax =
    Class(
        [Public],
        "FinalAttri",
        [
            FieldDecl (
                [
                    Public,
                    Final
                ],
                 "int",
                 "x"
            )
        ],
        [Method (
            [Public ],
            "void",
            "FinalAttri",
            [],
            Block [
                StmtExprStmt (
                    Assign (
                        LocalOrFieldVar "x",
                        Integer 42
                    )
                )
            ]
        )],
        []
    )

finalAttriAbstractTypedSyntax =
    T.Typed "FinalAttri" (T.Class
        [Public]
        "FinalAttri"
        [T.Typed "int" (T.Field
                [Public, Final]
                "int"
                "x"
            )]
        [T.Typed "void" (T.Method
            [Public]
            "void"
            "FinalAttri"
            []
            (T.Typed "void" (T.Block [
                T.Typed "int" (T.StmtExprStmt (
                    T.Typed "int" (T.Assign (T.Typed "int" (T.LocalOrFieldVar "x")) (T.Typed "int" (T.Int 42)))
                ))
            ])))
        ]
        []
    )

finalAttriAbstractByteCode = ClassFile {magic = Magic, minver = MinorVersion {numMinVer = 0}, maxver = MajorVersion {numMaxVer = 49}, count_cp = 20, array_cp = [Class_Info {tag_cp = TagClass, index_cp = 2, desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 10, cad_cp = "FinalAttri", desc = ""},Class_Info {tag_cp = TagClass, index_cp = 4, desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 16, cad_cp = "java/lang/Object", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 1, cad_cp = "x", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 1, cad_cp = "I", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 6, cad_cp = "<init>", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 3, cad_cp = "()V", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 4, cad_cp = "Code", desc = ""},MethodRef_Info {tag_cp = TagMethodRef, index_name_cp = 3, index_nameandtype_cp = 11, desc = ""},NameAndType_Info {tag_cp = TagNameAndType, index_name_cp = 7, index_descr_cp = 8, desc = ""},FieldRef_Info {tag_cp = TagFieldRef, index_name_cp = 1, index_nameandtype_cp = 13, desc = ""},NameAndType_Info {tag_cp = TagNameAndType, index_name_cp = 5, index_descr_cp = 6, desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 15, cad_cp = "LineNumberTable", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 18, cad_cp = "LocalVariableTable", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 4, cad_cp = "this", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 12, cad_cp = "LFinalAttri;", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 10, cad_cp = "SourceFile", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 15, cad_cp = "FinalAttri.java", desc = ""}], acfg = AccessFlags [1,32], this = ThisClass {index_th = 1}, super = SuperClass {index_sp = 3}, count_interfaces = 0, array_interfaces = [], count_fields = 1, array_fields = [Field_Info {af_fi = AccessFlags [16], index_name_fi = 5, index_descr_fi = 6, tam_fi = 0, array_attr_fi = []}], count_methods = 1, array_methods = [Method_Info {af_mi = AccessFlags [1], index_name_mi = 7, index_descr_mi = 8, tam_mi = 1, array_attr_mi = [AttributeCode {index_name_attr = 9, tam_len_attr = 61, len_stack_attr = 2, len_local_attr = 1, tam_code_attr = 11, array_code_attr = [42,183,0,10,42,16,42,181,0,12,177], tam_ex_attr = 0, array_ex_attr = [], tam_atrr_attr = 2, array_attr_attr = [AttributeLineNumberTable {index_name_attr = 14, tam_len_attr = 14, tam_table_attr = 3, array_line_attr = [(0,5),(4,6),(10,7)]},AttributeGeneric {index_name_attr = 15, tam_len_attr = 12, rest_attr = B.packChars "\NUL\SOH\NUL\NUL\NUL\v\NUL\DLE\NUL\DC1\NUL\NUL"}]}]}], count_attributes = 1, array_attributes = [AttributeSourceFile {index_name_attr = 18, tam_len_attr = 2, index_src_attr = 19}]}
