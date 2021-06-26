module Test.AbstractTranslations.MethodCall where

import AbstrakteSyntax
import qualified TypedAST as T
import Jvm.Data.ClassFormat
import Data.ByteString.Lazy.Internal as B

methodCallAbstractSyntax = 
    Class(
        [Public], 
        "MethodCall", 
        [FieldDecl (
            [Public],
            "MethodIntZeroReturn", 
            "o"
        )],
        [Method (
            [Public], 
            "void", 
            "MethodCall", 
            [], 
            Block [])],
        [Method (
            [Public], 
            "int", 
            "foo", 
            [], 
            Block [
                StmtExprStmt(
                    Assign (
                        LocalOrFieldVar "o", 
                        StmtExprExpr ( 
                            New (
                                "MethodIntZeroReturn", 
                                []
                            )
                        )
                    )
                ),
                Return (
                    Just (
                        StmtExprExpr  (
                            MethodCall (
                                LocalOrFieldVar "o", 
                                "foo", 
                                [])
                        )  
                    ) 
                )
            ]
        )]
    )

methodCallAbstractTypedSyntax = 
    T.Typed "MethodCall" (T.Class
        [Public] 
        "MethodCall" 
        [T.Typed "int" (T.Field
                [Public] 
                "MethodIntZeroReturn" 
                "o"
            )]
        [T.Typed "void" (T.Method
            [Public] 
            "void" 
            "MethodCall" 
            [] 
            (T.Typed "void" (T.Block [])))
        ]
        [T.Typed "int" (T.Method 
            [Public] 
            "int" 
            "foo" 
            [] 
            (T.Typed "int" (T.Block [
                T.Typed "MethodIntZeroReturn" (T.StmtExprStmt (T.Typed "MethodIntZeroReturn" (T.Assign (T.Typed "MethodIntZeroReturn" (T.LocalOrFieldVar "o")) (T.Typed "MethodIntZeroReturn" (T.StmtExprExpr (T.Typed "MethodIntZeroReturn" (T.New "MethodIntZeroReturn" []))))))),
                T.Typed "int" (T.Return (Just (T.Typed "int" (T.StmtExprExpr (T.Typed "int" (T.MethodCall (T.Typed "MethodIntZeroReturn" (T.LocalOrFieldVar "o")) "foo" []))))))
            ])))]
    )

methodCallAbstractByteCode = ClassFile {magic = Magic, minver = MinorVersion {numMinVer = 0}, maxver = MajorVersion {numMaxVer = 49}, count_cp = 27, array_cp = [Class_Info {tag_cp = TagClass, index_cp = 2, desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 10, cad_cp = "MethodCall", desc = ""},Class_Info {tag_cp = TagClass, index_cp = 4, desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 16, cad_cp = "java/lang/Object", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 1, cad_cp = "o", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 21, cad_cp = "LMethodIntZeroReturn;", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 6, cad_cp = "<init>", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 3, cad_cp = "()V", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 4, cad_cp = "Code", desc = ""},MethodRef_Info {tag_cp = TagMethodRef, index_name_cp = 3, index_nameandtype_cp = 11, desc = ""},NameAndType_Info {tag_cp = TagNameAndType, index_name_cp = 7, index_descr_cp = 8, desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 15, cad_cp = "LineNumberTable", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 18, cad_cp = "LocalVariableTable", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 4, cad_cp = "this", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 12, cad_cp = "LMethodCall;", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 3, cad_cp = "foo", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 3, cad_cp = "()I", desc = ""},Class_Info {tag_cp = TagClass, index_cp = 19, desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 19, cad_cp = "MethodIntZeroReturn", desc = ""},MethodRef_Info {tag_cp = TagMethodRef, index_name_cp = 18, index_nameandtype_cp = 11, desc = ""},FieldRef_Info {tag_cp = TagFieldRef, index_name_cp = 1, index_nameandtype_cp = 22, desc = ""},NameAndType_Info {tag_cp = TagNameAndType, index_name_cp = 5, index_descr_cp = 6, desc = ""},MethodRef_Info {tag_cp = TagMethodRef, index_name_cp = 18, index_nameandtype_cp = 24, desc = ""},NameAndType_Info {tag_cp = TagNameAndType, index_name_cp = 16, index_descr_cp = 17, desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 10, cad_cp = "SourceFile", desc = ""},Utf8_Info {tag_cp = TagUtf8, tam_cp = 15, cad_cp = "MethodCall.java", desc = ""}], acfg = AccessFlags [1,32], this = ThisClass {index_th = 1}, super = SuperClass {index_sp = 3}, count_interfaces = 0, array_interfaces = [], count_fields = 1, array_fields = [Field_Info {af_fi = AccessFlags [], index_name_fi = 5, index_descr_fi = 6, tam_fi = 0, array_attr_fi = []}], count_methods = 2, array_methods = [Method_Info {af_mi = AccessFlags [1], index_name_mi = 7, index_descr_mi = 8, tam_mi = 1, array_attr_mi = [AttributeCode {index_name_attr = 9, tam_len_attr = 47, len_stack_attr = 1, len_local_attr = 1, tam_code_attr = 5, array_code_attr = [42,183,0,10,177], tam_ex_attr = 0, array_ex_attr = [], tam_atrr_attr = 2, array_attr_attr = [AttributeLineNumberTable {index_name_attr = 12, tam_len_attr = 6, tam_table_attr = 1, array_line_attr = [(0,2)]},AttributeGeneric {index_name_attr = 13, tam_len_attr = 12, rest_attr = B.packChars "\NUL\SOH\NUL\NUL\NUL\ENQ\NUL\SO\NUL\SI\NUL\NUL"}]}]},Method_Info {af_mi = AccessFlags [], index_name_mi = 16, index_descr_mi = 17, tam_mi = 1, array_attr_mi = [AttributeCode {index_name_attr = 9, tam_len_attr = 65, len_stack_attr = 3, len_local_attr = 1, tam_code_attr = 19, array_code_attr = [42,187,0,18,89,183,0,20,181,0,21,42,180,0,21,182,0,23,172], tam_ex_attr = 0, array_ex_attr = [], tam_atrr_attr = 2, array_attr_attr = [AttributeLineNumberTable {index_name_attr = 12, tam_len_attr = 10, tam_table_attr = 2, array_line_attr = [(0,6),(11,7)]},AttributeGeneric {index_name_attr = 13, tam_len_attr = 12, rest_attr = B.packChars "\NUL\SOH\NUL\NUL\NUL\DC3\NUL\SO\NUL\SI\NUL\NUL"}]}]}], count_attributes = 1, array_attributes = [AttributeSourceFile {index_name_attr = 25, tam_len_attr = 2, index_src_attr = 26}]}
