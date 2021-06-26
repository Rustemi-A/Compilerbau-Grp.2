module Test.AbstractTranslations.StaticCalls where

import AbstrakteSyntax
import qualified TypedAST as T
import Jvm.Data.ClassFormat
import Data.ByteString.Lazy.Internal as B

staticCallsAbstractSyntax = 
    Class(
        [Public], 
        "StaticCalls", 
        [],
        [Method (
            [Public], 
            "void", 
            "StaticCalls", 
            [], 
            Block [])],
        [Method (
            [Public], 
            "int", 
            "foo", 
            [], 
            Block [
                StmtExprStmt (
                    MethodCall (
                        LocalOrFieldVar "StaticMethod", 
                        "foo", 
                        []
                    )
                ),
                Return (
                    Just(
                        InstVar (
                            LocalOrFieldVar "StaticAttri", 
                            "i")
                    )
                )
            ]
        )]
    )

staticCallsAbstractTypedSyntax = 
    T.Typed "StaticCalls" (T.Class
        [Public] 
        "StaticCalls" 
        []
        [T.Typed "void" (T.Method
            [Public] 
            "void" 
            "StaticCalls" 
            [] 
            (T.Typed "void" (T.Block [])))
        ]
        [
            T.Typed "int" (T.Method 
            [Public] 
            "int" 
            "foo" 
            [] 
            (T.Typed "int" (T.Block [
                T.Typed "void" (T.StmtExprStmt (T.Typed "void" (T.MethodCall (T.Typed "StaticMethod" (T.LocalOrFieldVar "StaticMethod")) "foo" []))),
                T.Typed "int" (T.Return (Just (T.Typed "int" (T.InstVar (T.Typed "StaticAttri" (T.LocalOrFieldVar "StaticAttri")) "i"))))
            ])))
        ]
    )

staticCallsAbstractByteCode = ClassFile {magic = Magic, minver = MinorVersion {numMinVer = 0}, maxver = MajorVersion {numMaxVer = 49}, count_cp = 28, array_cp = [Class_Info {tag_cp = TagClass, index_cp = 2, desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 11, cad_cp = "StaticCalls", desc = ""},Class_Info {tag_cp = TagClass, index_cp = 4, desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 16, cad_cp = "java/lang/Object", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 6, cad_cp = "<init>", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 3, cad_cp = "()V", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 4, cad_cp = "Code", desc = ""},MethodRef_Info {tag_cp = TagMethodRef, index_name_cp = 3, index_nameandtype_cp = 9, desc = ""},NameAndType_Info {tag_cp = TagNameAndType, index_name_cp = 5, index_descr_cp = 6, desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 15, cad_cp = "LineNumberTable", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 18, cad_cp = "LocalVariableTable", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 4, cad_cp = "this", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 13, cad_cp = "LStaticCalls;", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 3, cad_cp = "foo", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 3, cad_cp = "()I", desc = ""},MethodRef_Info {tag_cp = TagMethodRef, index_name_cp = 17, index_nameandtype_cp = 19, desc = ""},Class_Info {tag_cp = TagClass, index_cp = 18, desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 12, cad_cp = "StaticMethod", desc = ""},NameAndType_Info {tag_cp = TagNameAndType, index_name_cp = 14, index_descr_cp = 6, desc = ""},FieldRef_Info {tag_cp = TagFieldRef, index_name_cp = 21, index_nameandtype_cp = 23, desc = ""},Class_Info {tag_cp = TagClass, index_cp = 22, desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 11, cad_cp = "StaticAttri", desc = ""},NameAndType_Info {tag_cp = TagNameAndType, index_name_cp = 24, index_descr_cp = 25, desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 1, cad_cp = "i", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 1, cad_cp = "I", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 10, cad_cp = "SourceFile", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 16, cad_cp = "StaticCalls.java", desc = ""}], acfg = AccessFlags [1,32], this = ThisClass {index_th = 1}, super = SuperClass {index_sp = 3}, count_interfaces = 0, array_interfaces = [], count_fields = 0, array_fields = [], count_methods = 2, array_methods = [Method_Info {af_mi = AccessFlags [1], index_name_mi = 5, index_descr_mi = 6, tam_mi = 1, array_attr_mi = [AttributeCode {index_name_attr = 7, tam_len_attr = 47, len_stack_attr = 1, len_local_attr = 1, tam_code_attr = 5, array_code_attr = [42,183,0,8,177], tam_ex_attr = 0, array_ex_attr = [], tam_atrr_attr = 2, array_attr_attr = [AttributeLineNumberTable {index_name_attr = 10, tam_len_attr = 6, tam_table_attr = 1, array_line_attr = [(0,2)]},AttributeGeneric {index_name_attr = 11, tam_len_attr = 12, rest_attr = B.packChars "\NUL\SOH\NUL\NUL\NUL\ENQ\NUL\f\NUL\r\NUL\NUL"}]}]},Method_Info {af_mi = AccessFlags [], index_name_mi = 14, index_descr_mi = 15, tam_mi = 1, array_attr_mi = [AttributeCode {index_name_attr = 7, tam_len_attr = 53, len_stack_attr = 1, len_local_attr = 1, tam_code_attr = 7, array_code_attr = [184,0,16,178,0,20,172], tam_ex_attr = 0, array_ex_attr = [], tam_atrr_attr = 2, array_attr_attr = [AttributeLineNumberTable {index_name_attr = 10, tam_len_attr = 10, tam_table_attr = 2, array_line_attr = [(0,4),(3,5)]},AttributeGeneric {index_name_attr = 11, tam_len_attr = 12, rest_attr = B.packChars "\NUL\SOH\NUL\NUL\NUL\a\NUL\f\NUL\r\NUL\NUL"}]}]}], count_attributes = 1, array_attributes = [AttributeSourceFile {index_name_attr = 26, tam_len_attr = 2, index_src_attr = 27}]}