{-# OPTIONS_GHC -w #-}
module Parser (parser) where
import AbstrakteSyntax
import Scanner
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26 t27 t28 t29 t30 t31
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16
	| HappyAbsSyn17 t17
	| HappyAbsSyn18 t18
	| HappyAbsSyn19 t19
	| HappyAbsSyn20 t20
	| HappyAbsSyn21 t21
	| HappyAbsSyn22 t22
	| HappyAbsSyn23 t23
	| HappyAbsSyn24 t24
	| HappyAbsSyn25 t25
	| HappyAbsSyn26 t26
	| HappyAbsSyn27 t27
	| HappyAbsSyn28 t28
	| HappyAbsSyn29 t29
	| HappyAbsSyn30 t30
	| HappyAbsSyn31 t31

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,297) ([0,0,0,256,0,0,0,0,16,0,0,128,0,0,0,0,0,32768,0,0,0,0,0,0,0,0,0,0,0,0,256,0,0,0,0,2048,0,0,0,0,0,0,0,0,4096,0,4101,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12,0,0,0,49152,0,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,16384,0,0,0,0,0,0,0,4096,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,256,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,512,0,0,0,0,0,0,0,0,4096,0,4357,0,0,16384,0,0,0,0,0,12288,0,0,0,0,1024,0,0,0,0,64,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,4096,0,4101,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,4096,0,0,0,0,0,0,0,0,0,4096,0,0,0,0,256,0,0,0,4096,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,512,0,4096,0,4101,0,0,32768,0,0,0,0,0,0,0,0,0,1,80,1,0,4096,0,4101,0,0,0,2,0,0,0,8192,0,0,0,0,167,24824,1155,0,0,0,0,0,0,16384,0,0,0,0,2672,3968,18486,0,0,0,32768,0,0,0,0,0,0,0,0,0,0,0,0,512,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,4096,0,0,0,0,0,0,0,0,28672,32778,13839,72,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4096,0,0,0,0,8448,43008,33312,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,0,0,0,0,2048,0,0,0,0,167,24824,1155,0,28672,32778,13839,72,0,8192,0,128,0,0,0,0,0,0,0,16,0,0,0,0,0,0,0,0,0,1,0,0,0,1024,0,0,0,0,1,8360,1154,0,4096,32768,8714,72,0,256,43008,33312,4,0,512,0,0,0,0,0,0,0,0,4096,0,0,0,0,0,0,0,0,0,0,0,0,0,0,256,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,512,32768,0,0,0,32,2048,0,0,0,0,0,0,0,16,2688,18466,0,0,0,0,0,0,0,4,0,0,0,16384,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2048,0,0,0,2,0,0,0,0,0,0,0,0,0,0,512,0,0,8,0,0,0,32768,0,0,0,0,16,2688,18466,0,0,512,0,0,0,28672,32778,13839,72,0,42752,63488,33632,4,0,16,2688,18466,0,0,0,0,0,0,0,0,0,0,0,16384,0,0,0,0,1024,0,0,0,0,0,0,0,0,0,0,0,0,0,2048,0,0,0,0,2048,0,0,0,0,167,24824,1155,0,0,4,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_classPars","classPars","classModifier","attriModifier","methodModifier","konstModifier","methoden","methode","attribute","attribut","konstruktoren","konstruktor","statements","statement","expression","expressionMain","expressionCore","stmtExpr","typ","methodDeclParams","methodDeclParamss","methodDeclParam","literal","params","paramss","param","binaryOp","unaryOp","op","Klasse","Bezeichner","While","If","Else","Zuweisung","Semikolon","Klazu_Gesch","Klaauf_Gesch","Klaauf_Rund","Klazu_Rund","Geteilt","Mal","Plu","Minu","Modul","An","O","BitOR","BitAND","String_Literal","Integer","Integer_Literal","Char","Char_Literal","Pub","Priv","Stat","Fin","Void","Neww","Return","Akzessor","Bool","Bool_Literal","Vergleich","Groesser","Kleiner","Groesser_Gleich","Kleiner_Gleich","Null","Not","Komma","Thi","%eof"]
        bit_start = st Prelude.* 76
        bit_end = (st Prelude.+ 1) Prelude.* 76
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..75]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (57) = happyShift action_3
action_0 (4) = happyGoto action_4
action_0 (5) = happyGoto action_2
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (57) = happyShift action_3
action_1 (5) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (32) = happyShift action_6
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (60) = happyShift action_5
action_3 _ = happyReduce_2

action_4 (76) = happyAccept
action_4 _ = happyFail (happyExpListPerState 4)

action_5 _ = happyReduce_3

action_6 (33) = happyShift action_7
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (40) = happyShift action_8
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (57) = happyShift action_14
action_8 (58) = happyShift action_15
action_8 (6) = happyGoto action_9
action_8 (7) = happyGoto action_10
action_8 (8) = happyGoto action_11
action_8 (11) = happyGoto action_12
action_8 (12) = happyGoto action_13
action_8 _ = happyReduce_18

action_9 (33) = happyShift action_27
action_9 (53) = happyShift action_28
action_9 (55) = happyShift action_29
action_9 (65) = happyShift action_30
action_9 (21) = happyGoto action_26
action_9 _ = happyFail (happyExpListPerState 9)

action_10 _ = happyReduce_4

action_11 _ = happyReduce_9

action_12 (57) = happyShift action_24
action_12 (58) = happyShift action_25
action_12 (8) = happyGoto action_21
action_12 (13) = happyGoto action_22
action_12 (14) = happyGoto action_23
action_12 _ = happyReduce_21

action_13 (57) = happyShift action_14
action_13 (58) = happyShift action_15
action_13 (6) = happyGoto action_9
action_13 (7) = happyGoto action_10
action_13 (8) = happyGoto action_11
action_13 (11) = happyGoto action_20
action_13 (12) = happyGoto action_13
action_13 _ = happyReduce_18

action_14 (59) = happyShift action_18
action_14 (60) = happyShift action_19
action_14 _ = happyReduce_12

action_15 (59) = happyShift action_16
action_15 (60) = happyShift action_17
action_15 _ = happyReduce_13

action_16 _ = happyReduce_11

action_17 (59) = happyShift action_40
action_17 _ = happyReduce_7

action_18 _ = happyReduce_10

action_19 (59) = happyShift action_39
action_19 _ = happyReduce_5

action_20 _ = happyReduce_19

action_21 (33) = happyShift action_38
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (57) = happyShift action_36
action_22 (58) = happyShift action_37
action_22 (7) = happyGoto action_33
action_22 (8) = happyGoto action_11
action_22 (9) = happyGoto action_34
action_22 (10) = happyGoto action_35
action_22 _ = happyReduce_14

action_23 (57) = happyShift action_24
action_23 (58) = happyShift action_25
action_23 (8) = happyGoto action_21
action_23 (13) = happyGoto action_32
action_23 (14) = happyGoto action_23
action_23 _ = happyReduce_21

action_24 _ = happyReduce_12

action_25 _ = happyReduce_13

action_26 (33) = happyShift action_31
action_26 _ = happyFail (happyExpListPerState 26)

action_27 _ = happyReduce_52

action_28 _ = happyReduce_49

action_29 _ = happyReduce_50

action_30 _ = happyReduce_51

action_31 (38) = happyShift action_46
action_31 _ = happyFail (happyExpListPerState 31)

action_32 _ = happyReduce_22

action_33 (33) = happyShift action_27
action_33 (53) = happyShift action_28
action_33 (55) = happyShift action_29
action_33 (61) = happyShift action_45
action_33 (65) = happyShift action_30
action_33 (21) = happyGoto action_44
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (39) = happyShift action_43
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (57) = happyShift action_36
action_35 (58) = happyShift action_37
action_35 (7) = happyGoto action_33
action_35 (8) = happyGoto action_11
action_35 (9) = happyGoto action_42
action_35 (10) = happyGoto action_35
action_35 _ = happyReduce_14

action_36 (59) = happyShift action_18
action_36 _ = happyReduce_12

action_37 (59) = happyShift action_16
action_37 _ = happyReduce_13

action_38 (41) = happyShift action_41
action_38 _ = happyFail (happyExpListPerState 38)

action_39 _ = happyReduce_6

action_40 _ = happyReduce_8

action_41 (33) = happyShift action_27
action_41 (53) = happyShift action_28
action_41 (55) = happyShift action_29
action_41 (65) = happyShift action_30
action_41 (21) = happyGoto action_49
action_41 (22) = happyGoto action_50
action_41 (23) = happyGoto action_51
action_41 (24) = happyGoto action_52
action_41 _ = happyReduce_53

action_42 _ = happyReduce_15

action_43 _ = happyReduce_1

action_44 (33) = happyShift action_48
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (33) = happyShift action_47
action_45 _ = happyFail (happyExpListPerState 45)

action_46 _ = happyReduce_20

action_47 (41) = happyShift action_57
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (41) = happyShift action_56
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (33) = happyShift action_55
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (42) = happyShift action_54
action_50 _ = happyFail (happyExpListPerState 50)

action_51 _ = happyReduce_54

action_52 (74) = happyShift action_53
action_52 _ = happyReduce_55

action_53 (33) = happyShift action_27
action_53 (53) = happyShift action_28
action_53 (55) = happyShift action_29
action_53 (65) = happyShift action_30
action_53 (21) = happyGoto action_49
action_53 (23) = happyGoto action_61
action_53 (24) = happyGoto action_52
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (40) = happyShift action_60
action_54 _ = happyFail (happyExpListPerState 54)

action_55 _ = happyReduce_57

action_56 (33) = happyShift action_27
action_56 (53) = happyShift action_28
action_56 (55) = happyShift action_29
action_56 (65) = happyShift action_30
action_56 (21) = happyGoto action_49
action_56 (22) = happyGoto action_59
action_56 (23) = happyGoto action_51
action_56 (24) = happyGoto action_52
action_56 _ = happyReduce_53

action_57 (33) = happyShift action_27
action_57 (53) = happyShift action_28
action_57 (55) = happyShift action_29
action_57 (65) = happyShift action_30
action_57 (21) = happyGoto action_49
action_57 (22) = happyGoto action_58
action_57 (23) = happyGoto action_51
action_57 (24) = happyGoto action_52
action_57 _ = happyReduce_53

action_58 (42) = happyShift action_83
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (42) = happyShift action_82
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (33) = happyShift action_69
action_60 (34) = happyShift action_70
action_60 (35) = happyShift action_71
action_60 (38) = happyShift action_72
action_60 (40) = happyShift action_73
action_60 (52) = happyShift action_74
action_60 (53) = happyShift action_28
action_60 (54) = happyShift action_75
action_60 (55) = happyShift action_29
action_60 (56) = happyShift action_76
action_60 (62) = happyShift action_77
action_60 (63) = happyShift action_78
action_60 (65) = happyShift action_30
action_60 (66) = happyShift action_79
action_60 (72) = happyShift action_80
action_60 (75) = happyShift action_81
action_60 (15) = happyGoto action_62
action_60 (16) = happyGoto action_63
action_60 (17) = happyGoto action_64
action_60 (18) = happyGoto action_65
action_60 (19) = happyGoto action_66
action_60 (20) = happyGoto action_67
action_60 (21) = happyGoto action_68
action_60 _ = happyReduce_24

action_61 _ = happyReduce_56

action_62 (39) = happyShift action_99
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (33) = happyShift action_69
action_63 (34) = happyShift action_70
action_63 (35) = happyShift action_71
action_63 (38) = happyShift action_72
action_63 (40) = happyShift action_73
action_63 (52) = happyShift action_74
action_63 (53) = happyShift action_28
action_63 (54) = happyShift action_75
action_63 (55) = happyShift action_29
action_63 (56) = happyShift action_76
action_63 (62) = happyShift action_77
action_63 (63) = happyShift action_78
action_63 (65) = happyShift action_30
action_63 (66) = happyShift action_79
action_63 (72) = happyShift action_80
action_63 (75) = happyShift action_81
action_63 (15) = happyGoto action_98
action_63 (16) = happyGoto action_63
action_63 (17) = happyGoto action_64
action_63 (18) = happyGoto action_65
action_63 (19) = happyGoto action_66
action_63 (20) = happyGoto action_67
action_63 (21) = happyGoto action_68
action_63 _ = happyReduce_24

action_64 (64) = happyShift action_97
action_64 _ = happyFail (happyExpListPerState 64)

action_65 _ = happyReduce_35

action_66 _ = happyReduce_36

action_67 (38) = happyShift action_96
action_67 _ = happyReduce_43

action_68 (33) = happyShift action_95
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (37) = happyShift action_94
action_69 (64) = happyReduce_44
action_69 _ = happyReduce_52

action_70 (41) = happyShift action_93
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (41) = happyShift action_92
action_71 _ = happyFail (happyExpListPerState 71)

action_72 _ = happyReduce_34

action_73 (33) = happyShift action_69
action_73 (34) = happyShift action_70
action_73 (35) = happyShift action_71
action_73 (38) = happyShift action_72
action_73 (40) = happyShift action_73
action_73 (52) = happyShift action_74
action_73 (53) = happyShift action_28
action_73 (54) = happyShift action_75
action_73 (55) = happyShift action_29
action_73 (56) = happyShift action_76
action_73 (62) = happyShift action_77
action_73 (63) = happyShift action_78
action_73 (65) = happyShift action_30
action_73 (66) = happyShift action_79
action_73 (72) = happyShift action_80
action_73 (75) = happyShift action_81
action_73 (15) = happyGoto action_91
action_73 (16) = happyGoto action_63
action_73 (17) = happyGoto action_64
action_73 (18) = happyGoto action_65
action_73 (19) = happyGoto action_66
action_73 (20) = happyGoto action_67
action_73 (21) = happyGoto action_68
action_73 _ = happyReduce_24

action_74 _ = happyReduce_41

action_75 _ = happyReduce_38

action_76 _ = happyReduce_40

action_77 (33) = happyShift action_90
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (33) = happyShift action_88
action_78 (38) = happyShift action_89
action_78 (52) = happyShift action_74
action_78 (54) = happyShift action_75
action_78 (56) = happyShift action_76
action_78 (62) = happyShift action_77
action_78 (66) = happyShift action_79
action_78 (72) = happyShift action_80
action_78 (75) = happyShift action_81
action_78 (17) = happyGoto action_86
action_78 (18) = happyGoto action_65
action_78 (19) = happyGoto action_66
action_78 (20) = happyGoto action_87
action_78 _ = happyFail (happyExpListPerState 78)

action_79 _ = happyReduce_39

action_80 _ = happyReduce_42

action_81 _ = happyReduce_37

action_82 (40) = happyShift action_85
action_82 _ = happyFail (happyExpListPerState 82)

action_83 (40) = happyShift action_84
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (33) = happyShift action_69
action_84 (34) = happyShift action_70
action_84 (35) = happyShift action_71
action_84 (38) = happyShift action_72
action_84 (40) = happyShift action_73
action_84 (52) = happyShift action_74
action_84 (53) = happyShift action_28
action_84 (54) = happyShift action_75
action_84 (55) = happyShift action_29
action_84 (56) = happyShift action_76
action_84 (62) = happyShift action_77
action_84 (63) = happyShift action_78
action_84 (65) = happyShift action_30
action_84 (66) = happyShift action_79
action_84 (72) = happyShift action_80
action_84 (75) = happyShift action_81
action_84 (15) = happyGoto action_110
action_84 (16) = happyGoto action_63
action_84 (17) = happyGoto action_64
action_84 (18) = happyGoto action_65
action_84 (19) = happyGoto action_66
action_84 (20) = happyGoto action_67
action_84 (21) = happyGoto action_68
action_84 _ = happyReduce_24

action_85 (33) = happyShift action_69
action_85 (34) = happyShift action_70
action_85 (35) = happyShift action_71
action_85 (38) = happyShift action_72
action_85 (40) = happyShift action_73
action_85 (52) = happyShift action_74
action_85 (53) = happyShift action_28
action_85 (54) = happyShift action_75
action_85 (55) = happyShift action_29
action_85 (56) = happyShift action_76
action_85 (62) = happyShift action_77
action_85 (63) = happyShift action_78
action_85 (65) = happyShift action_30
action_85 (66) = happyShift action_79
action_85 (72) = happyShift action_80
action_85 (75) = happyShift action_81
action_85 (15) = happyGoto action_109
action_85 (16) = happyGoto action_63
action_85 (17) = happyGoto action_64
action_85 (18) = happyGoto action_65
action_85 (19) = happyGoto action_66
action_85 (20) = happyGoto action_67
action_85 (21) = happyGoto action_68
action_85 _ = happyReduce_24

action_86 (38) = happyShift action_108
action_86 (64) = happyShift action_97
action_86 _ = happyFail (happyExpListPerState 86)

action_87 _ = happyReduce_43

action_88 (37) = happyShift action_94
action_88 _ = happyReduce_44

action_89 _ = happyReduce_27

action_90 (41) = happyShift action_107
action_90 _ = happyFail (happyExpListPerState 90)

action_91 (39) = happyShift action_106
action_91 _ = happyFail (happyExpListPerState 91)

action_92 (33) = happyShift action_88
action_92 (52) = happyShift action_74
action_92 (54) = happyShift action_75
action_92 (56) = happyShift action_76
action_92 (62) = happyShift action_77
action_92 (66) = happyShift action_79
action_92 (72) = happyShift action_80
action_92 (75) = happyShift action_81
action_92 (17) = happyGoto action_105
action_92 (18) = happyGoto action_65
action_92 (19) = happyGoto action_66
action_92 (20) = happyGoto action_87
action_92 _ = happyFail (happyExpListPerState 92)

action_93 (33) = happyShift action_88
action_93 (52) = happyShift action_74
action_93 (54) = happyShift action_75
action_93 (56) = happyShift action_76
action_93 (62) = happyShift action_77
action_93 (66) = happyShift action_79
action_93 (72) = happyShift action_80
action_93 (75) = happyShift action_81
action_93 (17) = happyGoto action_104
action_93 (18) = happyGoto action_65
action_93 (19) = happyGoto action_66
action_93 (20) = happyGoto action_87
action_93 _ = happyFail (happyExpListPerState 93)

action_94 (33) = happyShift action_88
action_94 (52) = happyShift action_74
action_94 (54) = happyShift action_75
action_94 (56) = happyShift action_76
action_94 (62) = happyShift action_77
action_94 (66) = happyShift action_79
action_94 (72) = happyShift action_80
action_94 (75) = happyShift action_81
action_94 (17) = happyGoto action_102
action_94 (18) = happyGoto action_65
action_94 (19) = happyGoto action_66
action_94 (20) = happyGoto action_87
action_94 (25) = happyGoto action_103
action_94 _ = happyFail (happyExpListPerState 94)

action_95 (38) = happyShift action_101
action_95 _ = happyFail (happyExpListPerState 95)

action_96 _ = happyReduce_33

action_97 (33) = happyShift action_100
action_97 _ = happyFail (happyExpListPerState 97)

action_98 _ = happyReduce_25

action_99 _ = happyReduce_23

action_100 (41) = happyShift action_119
action_100 _ = happyReduce_45

action_101 _ = happyReduce_30

action_102 (64) = happyShift action_97
action_102 _ = happyReduce_58

action_103 _ = happyReduce_46

action_104 (42) = happyShift action_118
action_104 (64) = happyShift action_97
action_104 _ = happyFail (happyExpListPerState 104)

action_105 (42) = happyShift action_117
action_105 (64) = happyShift action_97
action_105 _ = happyFail (happyExpListPerState 105)

action_106 _ = happyReduce_26

action_107 (33) = happyShift action_88
action_107 (52) = happyShift action_74
action_107 (54) = happyShift action_75
action_107 (56) = happyShift action_76
action_107 (62) = happyShift action_77
action_107 (66) = happyShift action_79
action_107 (72) = happyShift action_80
action_107 (75) = happyShift action_81
action_107 (17) = happyGoto action_113
action_107 (18) = happyGoto action_65
action_107 (19) = happyGoto action_66
action_107 (20) = happyGoto action_87
action_107 (26) = happyGoto action_114
action_107 (27) = happyGoto action_115
action_107 (28) = happyGoto action_116
action_107 _ = happyReduce_59

action_108 _ = happyReduce_28

action_109 (39) = happyShift action_112
action_109 _ = happyFail (happyExpListPerState 109)

action_110 (39) = happyShift action_111
action_110 _ = happyFail (happyExpListPerState 110)

action_111 _ = happyReduce_17

action_112 _ = happyReduce_16

action_113 (64) = happyShift action_97
action_113 _ = happyReduce_63

action_114 (42) = happyShift action_124
action_114 _ = happyFail (happyExpListPerState 114)

action_115 _ = happyReduce_60

action_116 (74) = happyShift action_123
action_116 _ = happyReduce_61

action_117 (40) = happyShift action_122
action_117 _ = happyFail (happyExpListPerState 117)

action_118 (40) = happyShift action_121
action_118 _ = happyFail (happyExpListPerState 118)

action_119 (33) = happyShift action_88
action_119 (52) = happyShift action_74
action_119 (54) = happyShift action_75
action_119 (56) = happyShift action_76
action_119 (62) = happyShift action_77
action_119 (66) = happyShift action_79
action_119 (72) = happyShift action_80
action_119 (75) = happyShift action_81
action_119 (17) = happyGoto action_113
action_119 (18) = happyGoto action_65
action_119 (19) = happyGoto action_66
action_119 (20) = happyGoto action_87
action_119 (26) = happyGoto action_120
action_119 (27) = happyGoto action_115
action_119 (28) = happyGoto action_116
action_119 _ = happyReduce_59

action_120 (42) = happyShift action_128
action_120 _ = happyFail (happyExpListPerState 120)

action_121 (33) = happyShift action_69
action_121 (34) = happyShift action_70
action_121 (35) = happyShift action_71
action_121 (38) = happyShift action_72
action_121 (40) = happyShift action_73
action_121 (52) = happyShift action_74
action_121 (53) = happyShift action_28
action_121 (54) = happyShift action_75
action_121 (55) = happyShift action_29
action_121 (56) = happyShift action_76
action_121 (62) = happyShift action_77
action_121 (63) = happyShift action_78
action_121 (65) = happyShift action_30
action_121 (66) = happyShift action_79
action_121 (72) = happyShift action_80
action_121 (75) = happyShift action_81
action_121 (15) = happyGoto action_127
action_121 (16) = happyGoto action_63
action_121 (17) = happyGoto action_64
action_121 (18) = happyGoto action_65
action_121 (19) = happyGoto action_66
action_121 (20) = happyGoto action_67
action_121 (21) = happyGoto action_68
action_121 _ = happyReduce_24

action_122 (33) = happyShift action_69
action_122 (34) = happyShift action_70
action_122 (35) = happyShift action_71
action_122 (38) = happyShift action_72
action_122 (40) = happyShift action_73
action_122 (52) = happyShift action_74
action_122 (53) = happyShift action_28
action_122 (54) = happyShift action_75
action_122 (55) = happyShift action_29
action_122 (56) = happyShift action_76
action_122 (62) = happyShift action_77
action_122 (63) = happyShift action_78
action_122 (65) = happyShift action_30
action_122 (66) = happyShift action_79
action_122 (72) = happyShift action_80
action_122 (75) = happyShift action_81
action_122 (15) = happyGoto action_126
action_122 (16) = happyGoto action_63
action_122 (17) = happyGoto action_64
action_122 (18) = happyGoto action_65
action_122 (19) = happyGoto action_66
action_122 (20) = happyGoto action_67
action_122 (21) = happyGoto action_68
action_122 _ = happyReduce_24

action_123 (33) = happyShift action_88
action_123 (52) = happyShift action_74
action_123 (54) = happyShift action_75
action_123 (56) = happyShift action_76
action_123 (62) = happyShift action_77
action_123 (66) = happyShift action_79
action_123 (72) = happyShift action_80
action_123 (75) = happyShift action_81
action_123 (17) = happyGoto action_113
action_123 (18) = happyGoto action_65
action_123 (19) = happyGoto action_66
action_123 (20) = happyGoto action_87
action_123 (27) = happyGoto action_125
action_123 (28) = happyGoto action_116
action_123 _ = happyFail (happyExpListPerState 123)

action_124 _ = happyReduce_47

action_125 _ = happyReduce_62

action_126 (39) = happyShift action_130
action_126 _ = happyFail (happyExpListPerState 126)

action_127 (39) = happyShift action_129
action_127 _ = happyFail (happyExpListPerState 127)

action_128 _ = happyReduce_48

action_129 _ = happyReduce_29

action_130 (36) = happyShift action_131
action_130 _ = happyReduce_31

action_131 (40) = happyShift action_132
action_131 _ = happyFail (happyExpListPerState 131)

action_132 (33) = happyShift action_69
action_132 (34) = happyShift action_70
action_132 (35) = happyShift action_71
action_132 (38) = happyShift action_72
action_132 (40) = happyShift action_73
action_132 (52) = happyShift action_74
action_132 (53) = happyShift action_28
action_132 (54) = happyShift action_75
action_132 (55) = happyShift action_29
action_132 (56) = happyShift action_76
action_132 (62) = happyShift action_77
action_132 (63) = happyShift action_78
action_132 (65) = happyShift action_30
action_132 (66) = happyShift action_79
action_132 (72) = happyShift action_80
action_132 (75) = happyShift action_81
action_132 (15) = happyGoto action_133
action_132 (16) = happyGoto action_63
action_132 (17) = happyGoto action_64
action_132 (18) = happyGoto action_65
action_132 (19) = happyGoto action_66
action_132 (20) = happyGoto action_67
action_132 (21) = happyGoto action_68
action_132 _ = happyReduce_24

action_133 (39) = happyShift action_134
action_133 _ = happyFail (happyExpListPerState 133)

action_134 _ = happyReduce_32

happyReduce_1 = happyReduce 8 4 happyReduction_1
happyReduction_1 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_7) `HappyStk`
	(HappyAbsSyn13  happy_var_6) `HappyStk`
	(HappyAbsSyn11  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Class(happy_var_1, happy_var_3, happy_var_5, happy_var_6, happy_var_7)
	) `HappyStk` happyRest

happyReduce_2 = happySpecReduce_1  5 happyReduction_2
happyReduction_2 _
	 =  HappyAbsSyn5
		 (Public:[]
	)

happyReduce_3 = happySpecReduce_2  5 happyReduction_3
happyReduction_3 _
	_
	 =  HappyAbsSyn5
		 (Public:Final:[]
	)

happyReduce_4 = happySpecReduce_1  6 happyReduction_4
happyReduction_4 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_4 _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_2  6 happyReduction_5
happyReduction_5 _
	_
	 =  HappyAbsSyn6
		 (Public:Final:[]
	)

happyReduce_6 = happySpecReduce_3  6 happyReduction_6
happyReduction_6 _
	_
	_
	 =  HappyAbsSyn6
		 (Public:Final:Static:[]
	)

happyReduce_7 = happySpecReduce_2  6 happyReduction_7
happyReduction_7 _
	_
	 =  HappyAbsSyn6
		 (Private:Final:[]
	)

happyReduce_8 = happySpecReduce_3  6 happyReduction_8
happyReduction_8 _
	_
	_
	 =  HappyAbsSyn6
		 (Private:Final:Static:[]
	)

happyReduce_9 = happySpecReduce_1  7 happyReduction_9
happyReduction_9 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1
	)
happyReduction_9 _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_2  7 happyReduction_10
happyReduction_10 _
	_
	 =  HappyAbsSyn7
		 (Public:Static:[]
	)

happyReduce_11 = happySpecReduce_2  7 happyReduction_11
happyReduction_11 _
	_
	 =  HappyAbsSyn7
		 (Private:Static:[]
	)

happyReduce_12 = happySpecReduce_1  8 happyReduction_12
happyReduction_12 _
	 =  HappyAbsSyn8
		 (Public:[]
	)

happyReduce_13 = happySpecReduce_1  8 happyReduction_13
happyReduction_13 _
	 =  HappyAbsSyn8
		 (Private:[]
	)

happyReduce_14 = happySpecReduce_0  9 happyReduction_14
happyReduction_14  =  HappyAbsSyn9
		 ([]
	)

happyReduce_15 = happySpecReduce_2  9 happyReduction_15
happyReduction_15 (HappyAbsSyn9  happy_var_2)
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1:happy_var_2
	)
happyReduction_15 _ _  = notHappyAtAll 

happyReduce_16 = happyReduce 9 10 happyReduction_16
happyReduction_16 (_ `HappyStk`
	(HappyAbsSyn15  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn22  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_3)) `HappyStk`
	(HappyAbsSyn21  happy_var_2) `HappyStk`
	(HappyAbsSyn7  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (Method(happy_var_1, happy_var_2, happy_var_3, happy_var_5, Block happy_var_8)
	) `HappyStk` happyRest

happyReduce_17 = happyReduce 9 10 happyReduction_17
happyReduction_17 (_ `HappyStk`
	(HappyAbsSyn15  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn22  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (Method(happy_var_1, "void", happy_var_3, happy_var_5, Block happy_var_8)
	) `HappyStk` happyRest

happyReduce_18 = happySpecReduce_0  11 happyReduction_18
happyReduction_18  =  HappyAbsSyn11
		 ([]
	)

happyReduce_19 = happySpecReduce_2  11 happyReduction_19
happyReduction_19 (HappyAbsSyn11  happy_var_2)
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1:happy_var_2
	)
happyReduction_19 _ _  = notHappyAtAll 

happyReduce_20 = happyReduce 4 12 happyReduction_20
happyReduction_20 (_ `HappyStk`
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_3)) `HappyStk`
	(HappyAbsSyn21  happy_var_2) `HappyStk`
	(HappyAbsSyn6  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (FieldDecl (happy_var_1, happy_var_2, happy_var_3)
	) `HappyStk` happyRest

happyReduce_21 = happySpecReduce_0  13 happyReduction_21
happyReduction_21  =  HappyAbsSyn13
		 ([]
	)

happyReduce_22 = happySpecReduce_2  13 happyReduction_22
happyReduction_22 (HappyAbsSyn13  happy_var_2)
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn13
		 (happy_var_1:happy_var_2
	)
happyReduction_22 _ _  = notHappyAtAll 

happyReduce_23 = happyReduce 8 14 happyReduction_23
happyReduction_23 (_ `HappyStk`
	(HappyAbsSyn15  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn22  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_2)) `HappyStk`
	(HappyAbsSyn8  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (Method(happy_var_1, "", happy_var_2, happy_var_4, Block happy_var_7)
	) `HappyStk` happyRest

happyReduce_24 = happySpecReduce_0  15 happyReduction_24
happyReduction_24  =  HappyAbsSyn15
		 ([]
	)

happyReduce_25 = happySpecReduce_2  15 happyReduction_25
happyReduction_25 (HappyAbsSyn15  happy_var_2)
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1:happy_var_2
	)
happyReduction_25 _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  16 happyReduction_26
happyReduction_26 _
	(HappyAbsSyn15  happy_var_2)
	_
	 =  HappyAbsSyn16
		 (Block happy_var_2
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_2  16 happyReduction_27
happyReduction_27 _
	_
	 =  HappyAbsSyn16
		 (Return Nothing
	)

happyReduce_28 = happySpecReduce_3  16 happyReduction_28
happyReduction_28 _
	(HappyAbsSyn17  happy_var_2)
	_
	 =  HappyAbsSyn16
		 (Return (Just (happy_var_2))
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happyReduce 7 16 happyReduction_29
happyReduction_29 (_ `HappyStk`
	(HappyAbsSyn15  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (While (happy_var_3, Block happy_var_6)
	) `HappyStk` happyRest

happyReduce_30 = happySpecReduce_3  16 happyReduction_30
happyReduction_30 _
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_2))
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn16
		 (LocalVarDecl (happy_var_1,happy_var_2)
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happyReduce 7 16 happyReduction_31
happyReduction_31 (_ `HappyStk`
	(HappyAbsSyn15  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (If (happy_var_3, Block happy_var_6, Nothing)
	) `HappyStk` happyRest

happyReduce_32 = happyReduce 11 16 happyReduction_32
happyReduction_32 (_ `HappyStk`
	(HappyAbsSyn15  happy_var_10) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (If (happy_var_3, Block happy_var_6, Just (Block happy_var_10))
	) `HappyStk` happyRest

happyReduce_33 = happySpecReduce_2  16 happyReduction_33
happyReduction_33 _
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn16
		 (StmtExprStmt happy_var_1
	)
happyReduction_33 _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_1  16 happyReduction_34
happyReduction_34 _
	 =  HappyAbsSyn16
		 (Empty
	)

happyReduce_35 = happySpecReduce_1  17 happyReduction_35
happyReduction_35 (HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1
	)
happyReduction_35 _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_1  18 happyReduction_36
happyReduction_36 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn18
		 (happy_var_1
	)
happyReduction_36 _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_1  19 happyReduction_37
happyReduction_37 _
	 =  HappyAbsSyn19
		 (This
	)

happyReduce_38 = happySpecReduce_1  19 happyReduction_38
happyReduction_38 (HappyTerminal (TOKEN_INTEGER_LITERAL happy_var_1))
	 =  HappyAbsSyn19
		 (Integer happy_var_1
	)
happyReduction_38 _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_1  19 happyReduction_39
happyReduction_39 (HappyTerminal (TOKEN_BOOL_LITERAL happy_var_1))
	 =  HappyAbsSyn19
		 (Bool happy_var_1
	)
happyReduction_39 _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_1  19 happyReduction_40
happyReduction_40 (HappyTerminal (TOKEN_CHAR_LITERAL happy_var_1))
	 =  HappyAbsSyn19
		 (Char happy_var_1
	)
happyReduction_40 _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_1  19 happyReduction_41
happyReduction_41 (HappyTerminal (TOKEN_STRING_LITERAL happy_var_1))
	 =  HappyAbsSyn19
		 (String happy_var_1
	)
happyReduction_41 _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_1  19 happyReduction_42
happyReduction_42 _
	 =  HappyAbsSyn19
		 (Jnull
	)

happyReduce_43 = happySpecReduce_1  19 happyReduction_43
happyReduction_43 (HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn19
		 (StmtExprExpr happy_var_1
	)
happyReduction_43 _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_1  19 happyReduction_44
happyReduction_44 (HappyTerminal (TOKEN_BEZEICHNER happy_var_1))
	 =  HappyAbsSyn19
		 (LocalOrFieldVar happy_var_1
	)
happyReduction_44 _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_3  19 happyReduction_45
happyReduction_45 (HappyTerminal (TOKEN_BEZEICHNER happy_var_3))
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn19
		 (InstVar (happy_var_1, happy_var_3)
	)
happyReduction_45 _ _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_3  20 happyReduction_46
happyReduction_46 (HappyAbsSyn25  happy_var_3)
	_
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_1))
	 =  HappyAbsSyn20
		 (Assign(LocalOrFieldVar happy_var_1,happy_var_3)
	)
happyReduction_46 _ _ _  = notHappyAtAll 

happyReduce_47 = happyReduce 5 20 happyReduction_47
happyReduction_47 (_ `HappyStk`
	(HappyAbsSyn26  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn20
		 (New (happy_var_2, happy_var_4)
	) `HappyStk` happyRest

happyReduce_48 = happyReduce 6 20 happyReduction_48
happyReduction_48 (_ `HappyStk`
	(HappyAbsSyn26  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn20
		 (MethodCall (happy_var_1, happy_var_3, happy_var_5)
	) `HappyStk` happyRest

happyReduce_49 = happySpecReduce_1  21 happyReduction_49
happyReduction_49 _
	 =  HappyAbsSyn21
		 ("int"
	)

happyReduce_50 = happySpecReduce_1  21 happyReduction_50
happyReduction_50 _
	 =  HappyAbsSyn21
		 ("char"
	)

happyReduce_51 = happySpecReduce_1  21 happyReduction_51
happyReduction_51 _
	 =  HappyAbsSyn21
		 ("boolean"
	)

happyReduce_52 = happySpecReduce_1  21 happyReduction_52
happyReduction_52 (HappyTerminal (TOKEN_BEZEICHNER happy_var_1))
	 =  HappyAbsSyn21
		 (happy_var_1
	)
happyReduction_52 _  = notHappyAtAll 

happyReduce_53 = happySpecReduce_0  22 happyReduction_53
happyReduction_53  =  HappyAbsSyn22
		 ([]
	)

happyReduce_54 = happySpecReduce_1  22 happyReduction_54
happyReduction_54 (HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn22
		 (happy_var_1
	)
happyReduction_54 _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_1  23 happyReduction_55
happyReduction_55 (HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn23
		 (happy_var_1:[]
	)
happyReduction_55 _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_3  23 happyReduction_56
happyReduction_56 (HappyAbsSyn23  happy_var_3)
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn23
		 (happy_var_1:happy_var_3
	)
happyReduction_56 _ _ _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_2  24 happyReduction_57
happyReduction_57 (HappyTerminal (TOKEN_BEZEICHNER happy_var_2))
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn24
		 (happy_var_1, happy_var_2
	)
happyReduction_57 _ _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_1  25 happyReduction_58
happyReduction_58 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn25
		 (happy_var_1
	)
happyReduction_58 _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_0  26 happyReduction_59
happyReduction_59  =  HappyAbsSyn26
		 ([]
	)

happyReduce_60 = happySpecReduce_1  26 happyReduction_60
happyReduction_60 (HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn26
		 (happy_var_1
	)
happyReduction_60 _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_1  27 happyReduction_61
happyReduction_61 (HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn27
		 (happy_var_1:[]
	)
happyReduction_61 _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_3  27 happyReduction_62
happyReduction_62 (HappyAbsSyn27  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn27
		 (happy_var_1:happy_var_3
	)
happyReduction_62 _ _ _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_1  28 happyReduction_63
happyReduction_63 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn28
		 (happy_var_1
	)
happyReduction_63 _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_1  29 happyReduction_64
happyReduction_64 _
	 =  HappyAbsSyn29
		 (Equals
	)

happyReduce_65 = happySpecReduce_1  29 happyReduction_65
happyReduction_65 _
	 =  HappyAbsSyn29
		 (LessT
	)

happyReduce_66 = happySpecReduce_1  29 happyReduction_66
happyReduction_66 _
	 =  HappyAbsSyn29
		 (GreaterT
	)

happyReduce_67 = happySpecReduce_1  29 happyReduction_67
happyReduction_67 _
	 =  HappyAbsSyn29
		 (GE
	)

happyReduce_68 = happySpecReduce_1  29 happyReduction_68
happyReduction_68 _
	 =  HappyAbsSyn29
		 (LE
	)

happyReduce_69 = happySpecReduce_1  29 happyReduction_69
happyReduction_69 _
	 =  HappyAbsSyn29
		 (Mult
	)

happyReduce_70 = happySpecReduce_1  29 happyReduction_70
happyReduction_70 _
	 =  HappyAbsSyn29
		 (Div
	)

happyReduce_71 = happySpecReduce_1  29 happyReduction_71
happyReduction_71 _
	 =  HappyAbsSyn29
		 (Modulo
	)

happyReduce_72 = happySpecReduce_1  29 happyReduction_72
happyReduction_72 _
	 =  HappyAbsSyn29
		 (AND
	)

happyReduce_73 = happySpecReduce_1  29 happyReduction_73
happyReduction_73 _
	 =  HappyAbsSyn29
		 (OR
	)

happyReduce_74 = happySpecReduce_1  29 happyReduction_74
happyReduction_74 _
	 =  HappyAbsSyn29
		 (BitwiseOR
	)

happyReduce_75 = happySpecReduce_1  29 happyReduction_75
happyReduction_75 _
	 =  HappyAbsSyn29
		 (BitwiseAND
	)

happyReduce_76 = happySpecReduce_1  29 happyReduction_76
happyReduction_76 (HappyAbsSyn31  happy_var_1)
	 =  HappyAbsSyn29
		 (happy_var_1
	)
happyReduction_76 _  = notHappyAtAll 

happyReduce_77 = happySpecReduce_1  30 happyReduction_77
happyReduction_77 _
	 =  HappyAbsSyn30
		 (Negation
	)

happyReduce_78 = happySpecReduce_1  30 happyReduction_78
happyReduction_78 (HappyAbsSyn31  happy_var_1)
	 =  HappyAbsSyn30
		 (happy_var_1
	)
happyReduction_78 _  = notHappyAtAll 

happyReduce_79 = happySpecReduce_1  31 happyReduction_79
happyReduction_79 _
	 =  HappyAbsSyn31
		 (Positiv
	)

happyReduce_80 = happySpecReduce_1  31 happyReduction_80
happyReduction_80 _
	 =  HappyAbsSyn31
		 (Negativ
	)

happyNewToken action sts stk [] =
	action 76 76 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TOKEN_KLASSE -> cont 32;
	TOKEN_BEZEICHNER happy_dollar_dollar -> cont 33;
	TOKEN_WHILE -> cont 34;
	TOKEN_IF -> cont 35;
	TOKEN_ELSE -> cont 36;
	TOKEN_ZUWEISUNG -> cont 37;
	TOKEN_SEMIKOLON -> cont 38;
	TOKEN_KLAZU_GESCH -> cont 39;
	TOKEN_KLAAUF_GESCH -> cont 40;
	TOKEN_KLAAUF_RUND -> cont 41;
	TOKEN_KLAZU_RUND -> cont 42;
	TOKEN_GETEILT -> cont 43;
	TOKEN_MAL -> cont 44;
	TOKEN_PLUS -> cont 45;
	TOKEN_MINUS -> cont 46;
	TOKEN_MODULO -> cont 47;
	TOKEN_AND -> cont 48;
	TOKEN_OR -> cont 49;
	TOKEN_BITOR -> cont 50;
	TOKEN_BITAND -> cont 51;
	TOKEN_STRING_LITERAL happy_dollar_dollar -> cont 52;
	TOKEN_INTEGER -> cont 53;
	TOKEN_INTEGER_LITERAL happy_dollar_dollar -> cont 54;
	TOKEN_CHAR -> cont 55;
	TOKEN_CHAR_LITERAL happy_dollar_dollar -> cont 56;
	TOKEN_PUBLIC -> cont 57;
	TOKEN_PRIVATE -> cont 58;
	TOKEN_STATIC -> cont 59;
	TOKEN_FINAL -> cont 60;
	TOKEN_VOID -> cont 61;
	TOKEN_NEW -> cont 62;
	TOKEN_RETURN -> cont 63;
	TOKEN_AKZESSOR -> cont 64;
	TOKEN_BOOL -> cont 65;
	TOKEN_BOOL_LITERAL happy_dollar_dollar -> cont 66;
	TOKEN_VERGLEICH -> cont 67;
	TOKEN_GROESSER -> cont 68;
	TOKEN_KLEINER -> cont 69;
	TOKEN_GROESSER_GLEICH -> cont 70;
	TOKEN_KLEINER_GLEICH -> cont 71;
	TOKEN_NULL -> cont 72;
	TOKEN_NOT -> cont 73;
	TOKEN_KOMMA -> cont 74;
	TOKEN_THIS -> cont 75;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 76 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
classPars tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError _ = error "Parse error"

parser :: String -> Class
parser =  defaultConst . classPars . scan

defaultConst :: Class -> Class
defaultConst (Class(modi, name, fields, [], meth)) = Class(modi, name, fields, [Method([Public], "", name, [], Block [])], meth)
defaultConst c = c

main = do
  s <- getContents
  print (parser s)
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
