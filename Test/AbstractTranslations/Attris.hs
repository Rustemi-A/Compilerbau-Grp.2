module Test.AbstractTranslations.Attris where

import AbstrakteSyntax
import qualified TypedAST as T
import Jvm.Data.ClassFormat
import Data.ByteString.Lazy.Internal as B

attrisAbstractSyntax = 
    Class(
        [Public], 
        "Attris", 
        [
            FieldDecl(
                [Public], 
                "int", 
                "i"
            ),
            FieldDecl(
                [Public], 
                "char", 
                "c"
            ),
            FieldDecl(
                [Public], 
                "boolean", 
                "x"
            )
        ],
        [Method (
            [Public], 
            "void", 
            "Attris", 
            [], 
            Block [])],
        [])

attrisAbstractTypedSyntax = 
    T.Typed "Attris" (T.Class
        [Public] 
        "Attris" 
        [
            T.Typed "int" (T.Field
                [Public] 
                "int" 
                "i"
            ),
            T.Typed "char" (T.Field
                [Public] 
                "char" 
                "c"
            ),
            T.Typed "boolean" (T.Field
                [Public] 
                "boolean" 
                "x"
            )]
        [T.Typed "void" (T.Method
            [Public] 
            "void" 
            "Attris" 
            [] 
            (T.Typed "void" (T.Block [])))
        ]
        []
    )

attrisAbstractByteCode = ClassFile {magic = Magic, minver = MinorVersion {numMinVer = 0}, maxver = MajorVersion {numMaxVer = 49}, count_cp = 22, array_cp = [Class_Info {tag_cp = TagClass, index_cp = 2, desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 6, cad_cp = "Attris", desc = ""},Class_Info {tag_cp = TagClass, index_cp = 4, desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 16, cad_cp = "java/lang/Object", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 1, cad_cp = "i", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 1, cad_cp = "I", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 1, cad_cp = "c", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 1, cad_cp = "C", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 1, cad_cp = "x", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 1, cad_cp = "Z", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 6, cad_cp = "<init>", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 3, cad_cp = "()V", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 4, cad_cp = "Code", desc = ""},MethodRef_Info {tag_cp = TagMethodRef, index_name_cp = 3, index_nameandtype_cp = 15, desc = ""},NameAndType_Info {tag_cp = TagNameAndType, index_name_cp = 11, index_descr_cp = 12, desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 15, cad_cp = "LineNumberTable", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 18, cad_cp = "LocalVariableTable", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 4, cad_cp = "this", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 8, cad_cp = "LAttris;", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 10, cad_cp = "SourceFile", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 11, cad_cp = "Attris.java", desc = ""}], acfg = AccessFlags [1,32], this = ThisClass {index_th = 1}, super = SuperClass {index_sp = 3}, count_interfaces = 0, array_interfaces = [], count_fields = 3, array_fields = [Field_Info {af_fi = AccessFlags [], index_name_fi = 5, index_descr_fi = 6, tam_fi = 0, array_attr_fi = []},Field_Info {af_fi = AccessFlags [], index_name_fi = 7, index_descr_fi = 8, tam_fi = 0, array_attr_fi = []},Field_Info {af_fi = AccessFlags [], index_name_fi = 9, index_descr_fi = 10, tam_fi = 0, array_attr_fi = []}], count_methods = 1, array_methods = [Method_Info {af_mi = AccessFlags [1], index_name_mi = 11, index_descr_mi = 12, tam_mi = 1, array_attr_mi = [AttributeCode {index_name_attr = 13, tam_len_attr = 47, len_stack_attr = 1, len_local_attr = 1, tam_code_attr = 5, array_code_attr = [42,183,0,14,177], tam_ex_attr = 0, array_ex_attr = [], tam_atrr_attr = 2, array_attr_attr = [AttributeLineNumberTable {index_name_attr = 16, tam_len_attr = 6, tam_table_attr = 1, array_line_attr = [(0,2)]},AttributeGeneric {index_name_attr = 17, tam_len_attr = 12, rest_attr = B.packChars "\NUL\SOH\NUL\NUL\NUL\ENQ\NUL\DC2\NUL\DC3\NUL\NUL"}]}]}], count_attributes = 1, array_attributes = [AttributeSourceFile {index_name_attr = 20, tam_len_attr = 2, index_src_attr = 21}]}