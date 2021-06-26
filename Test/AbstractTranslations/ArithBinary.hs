module Test.AbstractTranslations.ArithBinary where

import AbstrakteSyntax
import qualified TypedAST as T
import Jvm.Data.ClassFormat
import Data.ByteString.Lazy.Internal as B
arithBinaryAbstractSyntax = 
    Class(
        [Public], 
        "ArithBinary", 
        [],
        [Method (
            [Public], 
            "void", 
            "ArithBinary", 
            [], 
            Block [])],
        [Method(
            [Public], 
            "int", 
            "foo", 
            [
                ("int","x"),
                ("int", "y")
            ], 
            Block [
                Return(
                    Just (
                        Binary(
                            Plus, 
                            LocalOrFieldVar "x",
                            LocalOrFieldVar "y"
                        )
                    )
                )
            ]
        )]
    )

arithBinaryAbstractTypedSyntax = 
    T.Typed "ArithBinary" (T.Class
        [Public] 
        "ArithBinary" 
        []
        [T.Typed "void" (T.Method
            [Public] 
            "void" 
            "ArithBinary" 
            [] 
            (T.Typed "void" (T.Block [])))
        ]
        [T.Typed "int" (
            T.Method 
            [Public] 
            "int" 
            "foo" 
            [("int", "x"), 
            ("int", "y")] 
            (T.Typed "int" (T.Block [
                T.Typed "int" (T.Return (Just (T.Typed "int" (T.Binary (T.Typed "int" (T.LocalOrFieldVar "x")) Plus (T.Typed "int" (T.LocalOrFieldVar "y"))))))
            ]))
        )]
    )
    

arithBinaryAbstractByteCode = ClassFile {magic = Magic, minver = MinorVersion {numMinVer = 0}, maxver = MajorVersion {numMaxVer = 49}, count_cp = 21, array_cp = [Class_Info {tag_cp = TagClass, index_cp = 2, desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 11, cad_cp = "ArithBinary", desc = ""},Class_Info {tag_cp = TagClass, index_cp = 4, desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 16, cad_cp = "java/lang/Object", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 6, cad_cp = "<init>", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 3, cad_cp = "()V", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 4, cad_cp = "Code", desc = ""},MethodRef_Info {tag_cp = TagMethodRef, index_name_cp = 3, index_nameandtype_cp = 9, desc = ""},NameAndType_Info {tag_cp = TagNameAndType, index_name_cp = 5, index_descr_cp = 6, desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 15, cad_cp = "LineNumberTable", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 18, cad_cp = "LocalVariableTable", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 4, cad_cp = "this", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 13, cad_cp = "LArithBinary;", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 3, cad_cp = "foo", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 5, cad_cp = "(II)I", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 1, cad_cp = "x", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 1, cad_cp = "I", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 1, cad_cp = "y", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 10, cad_cp = "SourceFile", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 16, cad_cp = "ArithBinary.java", desc = ""}], acfg = AccessFlags [1,32], this = ThisClass {index_th = 1}, super = SuperClass {index_sp = 3}, count_interfaces = 0, array_interfaces = [], count_fields = 0, array_fields = [], count_methods = 2, array_methods = [Method_Info {af_mi = AccessFlags [1], index_name_mi = 5, index_descr_mi = 6, tam_mi = 1, array_attr_mi = [AttributeCode {index_name_attr = 7, tam_len_attr = 47, len_stack_attr = 1, len_local_attr = 1, tam_code_attr = 5, array_code_attr = [42,183,0,8,177], tam_ex_attr = 0, array_ex_attr = [], tam_atrr_attr = 2, array_attr_attr = [AttributeLineNumberTable {index_name_attr = 10, tam_len_attr = 6, tam_table_attr = 1, array_line_attr = [(0,2)]},AttributeGeneric {index_name_attr = 11, tam_len_attr = 12, rest_attr = B.packChars "\NUL\SOH\NUL\NUL\NUL\ENQ\NUL\f\NUL\r\NUL\NUL"}]}]},Method_Info {af_mi = AccessFlags [], index_name_mi = 14, index_descr_mi = 15, tam_mi = 1, array_attr_mi = [AttributeCode {index_name_attr = 7, tam_len_attr = 66, len_stack_attr = 2, len_local_attr = 3, tam_code_attr = 4, array_code_attr = [27,28,96,172], tam_ex_attr = 0, array_ex_attr = [], tam_atrr_attr = 2, array_attr_attr = [AttributeLineNumberTable {index_name_attr = 10, tam_len_attr = 6, tam_table_attr = 1, array_line_attr = [(0,4)]},AttributeGeneric {index_name_attr = 11, tam_len_attr = 32, rest_attr = B.packChars "\NUL\ETX\NUL\NUL\NUL\EOT\NUL\f\NUL\r\NUL\NUL\NUL\NUL\NUL\EOT\NUL\DLE\NUL\DC1\NUL\SOH\NUL\NUL\NUL\EOT\NUL\DC2\NUL\DC1\NUL\STX"}]}]}], count_attributes = 1, array_attributes = [AttributeSourceFile {index_name_attr = 19, tam_len_attr = 2, index_src_attr = 20}]}