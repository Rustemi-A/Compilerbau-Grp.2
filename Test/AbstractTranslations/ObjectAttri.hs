module Test.AbstractTranslations.ObjectAttri where

import AbstrakteSyntax
import qualified TypedAST as T
import Jvm.Data.ClassFormat
import Data.ByteString.Lazy.Internal as B

objectAttriAbstractSyntax = 
    Class(
        [Public], 
        "ObjectAttri", 
        [FieldDecl (
            [Public], 
            "Object", 
            "x"
        ),
        FieldDecl (
            [Public], 
            "String", 
            "y"
        )],
        [Method (
            [Public], 
            "void", 
            "ObjectAttri", 
            [], 
            Block [])],
        []
    )

objectAttriAbstractTypedSyntax = 
    T.Typed "ObjectAttri" (T.Class
        [Public] 
        "ObjectAttri" 
        [
            T.Typed "Object" (T.Field
                [Public] 
                "Object" 
                "x"
            ),
            T.Typed "String" (T.Field
                [Public] 
                "String" 
                "y"
            )
        ]
        [T.Typed "void" (T.Method
            [Public] 
            "void" 
            "ObjectAttri" 
            [] 
            (T.Typed "void" (T.Block [])))
        ]
        []
    )

objectAttriAbstractByteCode = ClassFile {magic = Magic, minver = MinorVersion {numMinVer = 0}, maxver = MajorVersion {numMaxVer = 49}, count_cp = 20, array_cp = [Class_Info {tag_cp = TagClass, index_cp = 2, desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 11, cad_cp = "ObjectAttri", desc = ""},Class_Info {tag_cp = TagClass, index_cp = 4, desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 16, cad_cp = "java/lang/Object", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 1, cad_cp = "x", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 18, cad_cp = "Ljava/lang/Object;", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 1, cad_cp = "y", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 18, cad_cp = "Ljava/lang/String;", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 6, cad_cp = "<init>", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 3, cad_cp = "()V", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 4, cad_cp = "Code", desc = ""},MethodRef_Info {tag_cp = TagMethodRef, index_name_cp = 3, index_nameandtype_cp = 13, desc = ""},NameAndType_Info {tag_cp = TagNameAndType, index_name_cp = 9, index_descr_cp = 10, desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 15, cad_cp = "LineNumberTable", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 18, cad_cp = "LocalVariableTable", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 4, cad_cp = "this", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 13, cad_cp = "LObjectAttri;", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 10, cad_cp = "SourceFile", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 16, cad_cp = "ObjectAttri.java", desc = ""}], acfg = AccessFlags [1,32], this = ThisClass {index_th = 1}, super = SuperClass {index_sp = 3}, count_interfaces = 0, array_interfaces = [], count_fields = 2, array_fields = [Field_Info {af_fi = AccessFlags [], index_name_fi = 5, index_descr_fi = 6, tam_fi = 0, array_attr_fi = []},Field_Info {af_fi = AccessFlags [], index_name_fi = 7, index_descr_fi = 8, tam_fi = 0, array_attr_fi = []}], count_methods = 1, array_methods = [Method_Info {af_mi = AccessFlags [1], index_name_mi = 9, index_descr_mi = 10, tam_mi = 1, array_attr_mi = [AttributeCode {index_name_attr = 11, tam_len_attr = 47, len_stack_attr = 1, len_local_attr = 1, tam_code_attr = 5, array_code_attr = [42,183,0,12,177], tam_ex_attr = 0, array_ex_attr = [], tam_atrr_attr = 2, array_attr_attr = [AttributeLineNumberTable {index_name_attr = 14, tam_len_attr = 6, tam_table_attr = 1, array_line_attr = [(0,2)]},AttributeGeneric {index_name_attr = 15, tam_len_attr = 12, rest_attr = B.packChars "\NUL\SOH\NUL\NUL\NUL\ENQ\NUL\DLE\NUL\DC1\NUL\NUL"}]}]}], count_attributes = 1, array_attributes = [AttributeSourceFile {index_name_attr = 18, tam_len_attr = 2, index_src_attr = 19}]}
