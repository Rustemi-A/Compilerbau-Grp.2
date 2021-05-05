{-# OPTIONS_GHC -w #-}
module Parser where
import Scanner
import ScannerParser.AbstrakteSyntax
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
happyExpList = Happy_Data_Array.listArray (0,395) ([0,0,0,256,0,0,0,0,16,0,0,128,0,0,0,0,0,32768,0,0,0,0,0,0,0,0,0,0,0,0,256,0,0,0,0,2048,0,0,0,0,0,0,0,0,4096,0,4101,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12,0,0,0,49152,0,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,16384,0,0,0,0,0,0,0,4096,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,256,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,512,0,0,0,0,0,0,0,0,4096,0,4357,0,0,16384,0,0,0,0,0,12288,0,0,0,0,1024,0,0,0,0,64,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,4096,0,4101,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,4096,0,0,0,0,0,0,0,0,0,4096,0,0,0,0,256,0,0,0,4096,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,512,0,4096,0,4101,0,0,32768,0,0,0,0,0,0,0,0,0,1,80,1,0,4096,0,4101,0,0,0,2,0,0,0,8192,0,0,0,0,12455,24824,1411,0,0,0,0,0,0,16384,0,0,0,0,2672,3971,22582,0,0,0,32768,0,0,0,0,0,0,0,0,0,0,0,0,512,0,0,0,0,1,0,0,0,4096,33536,8714,88,0,0,0,0,0,0,256,0,0,0,0,256,0,0,0,0,16,0,0,0,0,0,0,0,0,2672,3971,22582,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4096,0,0,0,0,8448,43056,33312,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2048,0,0,0,0,128,0,0,0,28672,33546,13839,88,0,42752,63536,33632,5,0,512,0,8,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,4096,0,0,0,0,64,0,0,0,4096,33536,8714,88,0,256,43056,33312,5,0,16,2691,22562,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,16,2691,22562,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4096,0,0,0,0,0,0,0,0,0,0,0,0,0,0,256,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32,2048,0,0,0,2,128,0,0,0,0,0,0,0,12289,8360,1410,0,0,0,0,0,0,16384,0,0,0,0,1024,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,128,0,0,8192,0,0,0,0,0,0,0,0,0,0,0,32,0,32768,0,0,0,0,2048,0,0,0,0,12289,8360,1410,0,0,32,0,0,0,42752,63536,33632,5,0,2672,3971,22582,0,0,12289,8360,1410,0,0,0,0,0,0,0,0,0,0,0,1024,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,0,0,128,0,0,0,0,128,0,0,0,28672,33546,13839,88,0,16384,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_class","class","classModifier","attriModifier","methodModifier","konstModifier","methoden","methode","attribute","attribut","konstruktoren","konstruktor","statements","statement","expression","expressionMain","expressionCore","stmtExpr","typ","methodDeclParams","methodDeclParamss","methodDeclParam","literal","params","paramss","param","binaryOp","unaryOp","op","Klasse","Bezeichner","While","If","Else","Zuweisung","Semikolon","Klazu_Gesch","Klaauf_Gesch","Klaauf_Rund","Klazu_Rund","Geteilt","Mal","Plu","Minu","Modul","An","O","BitOR","BitAND","String_Literal","Integer","Integer_Literal","Char","Char_Literal","Pub","Priv","Stat","Fin","Void","Neww","Return","Akzessor","Bool","Bool_Literal","Vergleich","Groesser","Kleiner","Groesser_Gleich","Kleiner_Gleich","Null","Not","Komma","Thi","%eof"]
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

action_8 (33) = happyReduce_19
action_8 (53) = happyReduce_19
action_8 (55) = happyReduce_19
action_8 (57) = happyShift action_14
action_8 (58) = happyShift action_15
action_8 (65) = happyReduce_19
action_8 (6) = happyGoto action_9
action_8 (7) = happyGoto action_10
action_8 (8) = happyGoto action_11
action_8 (11) = happyGoto action_12
action_8 (12) = happyGoto action_13
action_8 _ = happyReduce_19

action_9 (33) = happyShift action_27
action_9 (53) = happyShift action_28
action_9 (55) = happyShift action_29
action_9 (65) = happyShift action_30
action_9 (21) = happyGoto action_26
action_9 _ = happyFail (happyExpListPerState 9)

action_10 _ = happyReduce_4

action_11 _ = happyReduce_9

action_12 (33) = happyReduce_22
action_12 (57) = happyShift action_24
action_12 (58) = happyShift action_25
action_12 (8) = happyGoto action_21
action_12 (13) = happyGoto action_22
action_12 (14) = happyGoto action_23
action_12 _ = happyReduce_22

action_13 (33) = happyReduce_19
action_13 (53) = happyReduce_19
action_13 (55) = happyReduce_19
action_13 (57) = happyShift action_14
action_13 (58) = happyShift action_15
action_13 (65) = happyReduce_19
action_13 (6) = happyGoto action_9
action_13 (7) = happyGoto action_10
action_13 (8) = happyGoto action_11
action_13 (11) = happyGoto action_20
action_13 (12) = happyGoto action_13
action_13 _ = happyReduce_19

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

action_20 _ = happyReduce_20

action_21 (33) = happyShift action_38
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (39) = happyReduce_15
action_22 (57) = happyShift action_36
action_22 (58) = happyShift action_37
action_22 (7) = happyGoto action_33
action_22 (8) = happyGoto action_11
action_22 (9) = happyGoto action_34
action_22 (10) = happyGoto action_35
action_22 _ = happyReduce_14

action_23 (33) = happyReduce_22
action_23 (57) = happyShift action_24
action_23 (58) = happyShift action_25
action_23 (8) = happyGoto action_21
action_23 (13) = happyGoto action_32
action_23 (14) = happyGoto action_23
action_23 _ = happyReduce_22

action_24 _ = happyReduce_12

action_25 _ = happyReduce_13

action_26 (33) = happyShift action_31
action_26 _ = happyFail (happyExpListPerState 26)

action_27 _ = happyReduce_55

action_28 _ = happyReduce_52

action_29 _ = happyReduce_53

action_30 _ = happyReduce_54

action_31 (38) = happyShift action_46
action_31 _ = happyFail (happyExpListPerState 31)

action_32 _ = happyReduce_23

action_33 (33) = happyShift action_27
action_33 (53) = happyShift action_28
action_33 (55) = happyShift action_29
action_33 (61) = happyShift action_45
action_33 (65) = happyShift action_30
action_33 (21) = happyGoto action_44
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (39) = happyShift action_43
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (39) = happyReduce_15
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
action_41 _ = happyReduce_56

action_42 _ = happyReduce_16

action_43 _ = happyReduce_1

action_44 (33) = happyShift action_48
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (33) = happyShift action_47
action_45 _ = happyFail (happyExpListPerState 45)

action_46 _ = happyReduce_21

action_47 (41) = happyShift action_57
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (41) = happyShift action_56
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (33) = happyShift action_55
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (42) = happyShift action_54
action_50 _ = happyFail (happyExpListPerState 50)

action_51 _ = happyReduce_57

action_52 (74) = happyShift action_53
action_52 _ = happyReduce_58

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

action_55 _ = happyReduce_60

action_56 (33) = happyShift action_27
action_56 (53) = happyShift action_28
action_56 (55) = happyShift action_29
action_56 (65) = happyShift action_30
action_56 (21) = happyGoto action_49
action_56 (22) = happyGoto action_59
action_56 (23) = happyGoto action_51
action_56 (24) = happyGoto action_52
action_56 _ = happyReduce_56

action_57 (33) = happyShift action_27
action_57 (53) = happyShift action_28
action_57 (55) = happyShift action_29
action_57 (65) = happyShift action_30
action_57 (21) = happyGoto action_49
action_57 (22) = happyGoto action_58
action_57 (23) = happyGoto action_51
action_57 (24) = happyGoto action_52
action_57 _ = happyReduce_56

action_58 (42) = happyShift action_88
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (42) = happyShift action_87
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (33) = happyShift action_71
action_60 (34) = happyShift action_72
action_60 (35) = happyShift action_73
action_60 (38) = happyShift action_74
action_60 (40) = happyShift action_75
action_60 (45) = happyShift action_76
action_60 (46) = happyShift action_77
action_60 (52) = happyShift action_78
action_60 (53) = happyShift action_28
action_60 (54) = happyShift action_79
action_60 (55) = happyShift action_29
action_60 (56) = happyShift action_80
action_60 (62) = happyShift action_81
action_60 (63) = happyShift action_82
action_60 (65) = happyShift action_30
action_60 (66) = happyShift action_83
action_60 (72) = happyShift action_84
action_60 (73) = happyShift action_85
action_60 (75) = happyShift action_86
action_60 (15) = happyGoto action_62
action_60 (16) = happyGoto action_63
action_60 (17) = happyGoto action_64
action_60 (18) = happyGoto action_65
action_60 (19) = happyGoto action_66
action_60 (20) = happyGoto action_67
action_60 (21) = happyGoto action_68
action_60 (30) = happyGoto action_69
action_60 (31) = happyGoto action_70
action_60 _ = happyReduce_25

action_61 _ = happyReduce_59

action_62 (39) = happyShift action_119
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (33) = happyShift action_71
action_63 (34) = happyShift action_72
action_63 (35) = happyShift action_73
action_63 (38) = happyShift action_74
action_63 (40) = happyShift action_75
action_63 (45) = happyShift action_76
action_63 (46) = happyShift action_77
action_63 (52) = happyShift action_78
action_63 (53) = happyShift action_28
action_63 (54) = happyShift action_79
action_63 (55) = happyShift action_29
action_63 (56) = happyShift action_80
action_63 (62) = happyShift action_81
action_63 (63) = happyShift action_82
action_63 (65) = happyShift action_30
action_63 (66) = happyShift action_83
action_63 (72) = happyShift action_84
action_63 (73) = happyShift action_85
action_63 (75) = happyShift action_86
action_63 (15) = happyGoto action_118
action_63 (16) = happyGoto action_63
action_63 (17) = happyGoto action_64
action_63 (18) = happyGoto action_65
action_63 (19) = happyGoto action_66
action_63 (20) = happyGoto action_67
action_63 (21) = happyGoto action_68
action_63 (30) = happyGoto action_69
action_63 (31) = happyGoto action_70
action_63 _ = happyReduce_25

action_64 (64) = happyShift action_117
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (43) = happyShift action_105
action_65 (44) = happyShift action_106
action_65 (45) = happyShift action_76
action_65 (46) = happyShift action_77
action_65 (47) = happyShift action_107
action_65 (48) = happyShift action_108
action_65 (49) = happyShift action_109
action_65 (50) = happyShift action_110
action_65 (51) = happyShift action_111
action_65 (67) = happyShift action_112
action_65 (68) = happyShift action_113
action_65 (69) = happyShift action_114
action_65 (70) = happyShift action_115
action_65 (71) = happyShift action_116
action_65 (29) = happyGoto action_103
action_65 (31) = happyGoto action_104
action_65 _ = happyReduce_37

action_66 _ = happyReduce_38

action_67 (38) = happyShift action_102
action_67 _ = happyReduce_46

action_68 (33) = happyShift action_101
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (33) = happyShift action_93
action_69 (45) = happyShift action_76
action_69 (46) = happyShift action_77
action_69 (52) = happyShift action_78
action_69 (54) = happyShift action_79
action_69 (56) = happyShift action_80
action_69 (62) = happyShift action_81
action_69 (66) = happyShift action_83
action_69 (72) = happyShift action_84
action_69 (73) = happyShift action_85
action_69 (75) = happyShift action_86
action_69 (17) = happyGoto action_64
action_69 (18) = happyGoto action_65
action_69 (19) = happyGoto action_100
action_69 (20) = happyGoto action_92
action_69 (30) = happyGoto action_69
action_69 (31) = happyGoto action_70
action_69 _ = happyFail (happyExpListPerState 69)

action_70 _ = happyReduce_81

action_71 (37) = happyShift action_99
action_71 (43) = happyReduce_47
action_71 (44) = happyReduce_47
action_71 (45) = happyReduce_47
action_71 (46) = happyReduce_47
action_71 (47) = happyReduce_47
action_71 (48) = happyReduce_47
action_71 (49) = happyReduce_47
action_71 (50) = happyReduce_47
action_71 (51) = happyReduce_47
action_71 (64) = happyReduce_47
action_71 (67) = happyReduce_47
action_71 (68) = happyReduce_47
action_71 (69) = happyReduce_47
action_71 (70) = happyReduce_47
action_71 (71) = happyReduce_47
action_71 _ = happyReduce_55

action_72 (41) = happyShift action_98
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (41) = happyShift action_97
action_73 _ = happyFail (happyExpListPerState 73)

action_74 _ = happyReduce_35

action_75 (33) = happyShift action_71
action_75 (34) = happyShift action_72
action_75 (35) = happyShift action_73
action_75 (38) = happyShift action_74
action_75 (40) = happyShift action_75
action_75 (45) = happyShift action_76
action_75 (46) = happyShift action_77
action_75 (52) = happyShift action_78
action_75 (53) = happyShift action_28
action_75 (54) = happyShift action_79
action_75 (55) = happyShift action_29
action_75 (56) = happyShift action_80
action_75 (62) = happyShift action_81
action_75 (63) = happyShift action_82
action_75 (65) = happyShift action_30
action_75 (66) = happyShift action_83
action_75 (72) = happyShift action_84
action_75 (73) = happyShift action_85
action_75 (75) = happyShift action_86
action_75 (15) = happyGoto action_96
action_75 (16) = happyGoto action_63
action_75 (17) = happyGoto action_64
action_75 (18) = happyGoto action_65
action_75 (19) = happyGoto action_66
action_75 (20) = happyGoto action_67
action_75 (21) = happyGoto action_68
action_75 (30) = happyGoto action_69
action_75 (31) = happyGoto action_70
action_75 _ = happyReduce_25

action_76 _ = happyReduce_82

action_77 _ = happyReduce_83

action_78 _ = happyReduce_44

action_79 _ = happyReduce_41

action_80 _ = happyReduce_43

action_81 (33) = happyShift action_95
action_81 _ = happyFail (happyExpListPerState 81)

action_82 (33) = happyShift action_93
action_82 (38) = happyShift action_94
action_82 (45) = happyShift action_76
action_82 (46) = happyShift action_77
action_82 (52) = happyShift action_78
action_82 (54) = happyShift action_79
action_82 (56) = happyShift action_80
action_82 (62) = happyShift action_81
action_82 (66) = happyShift action_83
action_82 (72) = happyShift action_84
action_82 (73) = happyShift action_85
action_82 (75) = happyShift action_86
action_82 (17) = happyGoto action_91
action_82 (18) = happyGoto action_65
action_82 (19) = happyGoto action_66
action_82 (20) = happyGoto action_92
action_82 (30) = happyGoto action_69
action_82 (31) = happyGoto action_70
action_82 _ = happyFail (happyExpListPerState 82)

action_83 _ = happyReduce_42

action_84 _ = happyReduce_45

action_85 _ = happyReduce_80

action_86 _ = happyReduce_40

action_87 (40) = happyShift action_90
action_87 _ = happyFail (happyExpListPerState 87)

action_88 (40) = happyShift action_89
action_88 _ = happyFail (happyExpListPerState 88)

action_89 (33) = happyShift action_71
action_89 (34) = happyShift action_72
action_89 (35) = happyShift action_73
action_89 (38) = happyShift action_74
action_89 (40) = happyShift action_75
action_89 (45) = happyShift action_76
action_89 (46) = happyShift action_77
action_89 (52) = happyShift action_78
action_89 (53) = happyShift action_28
action_89 (54) = happyShift action_79
action_89 (55) = happyShift action_29
action_89 (56) = happyShift action_80
action_89 (62) = happyShift action_81
action_89 (63) = happyShift action_82
action_89 (65) = happyShift action_30
action_89 (66) = happyShift action_83
action_89 (72) = happyShift action_84
action_89 (73) = happyShift action_85
action_89 (75) = happyShift action_86
action_89 (15) = happyGoto action_131
action_89 (16) = happyGoto action_63
action_89 (17) = happyGoto action_64
action_89 (18) = happyGoto action_65
action_89 (19) = happyGoto action_66
action_89 (20) = happyGoto action_67
action_89 (21) = happyGoto action_68
action_89 (30) = happyGoto action_69
action_89 (31) = happyGoto action_70
action_89 _ = happyReduce_25

action_90 (33) = happyShift action_71
action_90 (34) = happyShift action_72
action_90 (35) = happyShift action_73
action_90 (38) = happyShift action_74
action_90 (40) = happyShift action_75
action_90 (45) = happyShift action_76
action_90 (46) = happyShift action_77
action_90 (52) = happyShift action_78
action_90 (53) = happyShift action_28
action_90 (54) = happyShift action_79
action_90 (55) = happyShift action_29
action_90 (56) = happyShift action_80
action_90 (62) = happyShift action_81
action_90 (63) = happyShift action_82
action_90 (65) = happyShift action_30
action_90 (66) = happyShift action_83
action_90 (72) = happyShift action_84
action_90 (73) = happyShift action_85
action_90 (75) = happyShift action_86
action_90 (15) = happyGoto action_130
action_90 (16) = happyGoto action_63
action_90 (17) = happyGoto action_64
action_90 (18) = happyGoto action_65
action_90 (19) = happyGoto action_66
action_90 (20) = happyGoto action_67
action_90 (21) = happyGoto action_68
action_90 (30) = happyGoto action_69
action_90 (31) = happyGoto action_70
action_90 _ = happyReduce_25

action_91 (38) = happyShift action_129
action_91 (64) = happyShift action_117
action_91 _ = happyFail (happyExpListPerState 91)

action_92 _ = happyReduce_46

action_93 (37) = happyShift action_99
action_93 _ = happyReduce_47

action_94 _ = happyReduce_28

action_95 (41) = happyShift action_128
action_95 _ = happyFail (happyExpListPerState 95)

action_96 (39) = happyShift action_127
action_96 _ = happyFail (happyExpListPerState 96)

action_97 (33) = happyShift action_93
action_97 (45) = happyShift action_76
action_97 (46) = happyShift action_77
action_97 (52) = happyShift action_78
action_97 (54) = happyShift action_79
action_97 (56) = happyShift action_80
action_97 (62) = happyShift action_81
action_97 (66) = happyShift action_83
action_97 (72) = happyShift action_84
action_97 (73) = happyShift action_85
action_97 (75) = happyShift action_86
action_97 (17) = happyGoto action_126
action_97 (18) = happyGoto action_65
action_97 (19) = happyGoto action_66
action_97 (20) = happyGoto action_92
action_97 (30) = happyGoto action_69
action_97 (31) = happyGoto action_70
action_97 _ = happyFail (happyExpListPerState 97)

action_98 (33) = happyShift action_93
action_98 (45) = happyShift action_76
action_98 (46) = happyShift action_77
action_98 (52) = happyShift action_78
action_98 (54) = happyShift action_79
action_98 (56) = happyShift action_80
action_98 (62) = happyShift action_81
action_98 (66) = happyShift action_83
action_98 (72) = happyShift action_84
action_98 (73) = happyShift action_85
action_98 (75) = happyShift action_86
action_98 (17) = happyGoto action_125
action_98 (18) = happyGoto action_65
action_98 (19) = happyGoto action_66
action_98 (20) = happyGoto action_92
action_98 (30) = happyGoto action_69
action_98 (31) = happyGoto action_70
action_98 _ = happyFail (happyExpListPerState 98)

action_99 (33) = happyShift action_93
action_99 (45) = happyShift action_76
action_99 (46) = happyShift action_77
action_99 (52) = happyShift action_78
action_99 (54) = happyShift action_79
action_99 (56) = happyShift action_80
action_99 (62) = happyShift action_81
action_99 (66) = happyShift action_83
action_99 (72) = happyShift action_84
action_99 (73) = happyShift action_85
action_99 (75) = happyShift action_86
action_99 (17) = happyGoto action_123
action_99 (18) = happyGoto action_65
action_99 (19) = happyGoto action_66
action_99 (20) = happyGoto action_92
action_99 (25) = happyGoto action_124
action_99 (30) = happyGoto action_69
action_99 (31) = happyGoto action_70
action_99 _ = happyFail (happyExpListPerState 99)

action_100 (43) = happyReduce_39
action_100 (44) = happyReduce_39
action_100 (45) = happyReduce_39
action_100 (46) = happyReduce_39
action_100 (47) = happyReduce_39
action_100 (48) = happyReduce_39
action_100 (49) = happyReduce_39
action_100 (50) = happyReduce_39
action_100 (51) = happyReduce_39
action_100 (64) = happyReduce_39
action_100 (67) = happyReduce_39
action_100 (68) = happyReduce_39
action_100 (69) = happyReduce_39
action_100 (70) = happyReduce_39
action_100 (71) = happyReduce_39
action_100 _ = happyReduce_39

action_101 (38) = happyShift action_122
action_101 _ = happyFail (happyExpListPerState 101)

action_102 _ = happyReduce_34

action_103 (33) = happyShift action_93
action_103 (45) = happyShift action_76
action_103 (46) = happyShift action_77
action_103 (52) = happyShift action_78
action_103 (54) = happyShift action_79
action_103 (56) = happyShift action_80
action_103 (62) = happyShift action_81
action_103 (66) = happyShift action_83
action_103 (72) = happyShift action_84
action_103 (73) = happyShift action_85
action_103 (75) = happyShift action_86
action_103 (17) = happyGoto action_121
action_103 (18) = happyGoto action_65
action_103 (19) = happyGoto action_66
action_103 (20) = happyGoto action_92
action_103 (30) = happyGoto action_69
action_103 (31) = happyGoto action_70
action_103 _ = happyFail (happyExpListPerState 103)

action_104 _ = happyReduce_79

action_105 _ = happyReduce_73

action_106 _ = happyReduce_72

action_107 _ = happyReduce_74

action_108 _ = happyReduce_75

action_109 _ = happyReduce_76

action_110 _ = happyReduce_77

action_111 _ = happyReduce_78

action_112 _ = happyReduce_67

action_113 _ = happyReduce_69

action_114 _ = happyReduce_68

action_115 _ = happyReduce_70

action_116 _ = happyReduce_71

action_117 (33) = happyShift action_120
action_117 _ = happyFail (happyExpListPerState 117)

action_118 _ = happyReduce_26

action_119 _ = happyReduce_24

action_120 (41) = happyShift action_140
action_120 _ = happyReduce_48

action_121 (64) = happyShift action_117
action_121 _ = happyReduce_36

action_122 _ = happyReduce_31

action_123 (64) = happyShift action_117
action_123 _ = happyReduce_61

action_124 _ = happyReduce_49

action_125 (42) = happyShift action_139
action_125 (64) = happyShift action_117
action_125 _ = happyFail (happyExpListPerState 125)

action_126 (42) = happyShift action_138
action_126 (64) = happyShift action_117
action_126 _ = happyFail (happyExpListPerState 126)

action_127 _ = happyReduce_27

action_128 (33) = happyShift action_93
action_128 (45) = happyShift action_76
action_128 (46) = happyShift action_77
action_128 (52) = happyShift action_78
action_128 (54) = happyShift action_79
action_128 (56) = happyShift action_80
action_128 (62) = happyShift action_81
action_128 (66) = happyShift action_83
action_128 (72) = happyShift action_84
action_128 (73) = happyShift action_85
action_128 (75) = happyShift action_86
action_128 (17) = happyGoto action_134
action_128 (18) = happyGoto action_65
action_128 (19) = happyGoto action_66
action_128 (20) = happyGoto action_92
action_128 (26) = happyGoto action_135
action_128 (27) = happyGoto action_136
action_128 (28) = happyGoto action_137
action_128 (30) = happyGoto action_69
action_128 (31) = happyGoto action_70
action_128 _ = happyReduce_62

action_129 _ = happyReduce_29

action_130 (39) = happyShift action_133
action_130 _ = happyFail (happyExpListPerState 130)

action_131 (39) = happyShift action_132
action_131 _ = happyFail (happyExpListPerState 131)

action_132 _ = happyReduce_18

action_133 _ = happyReduce_17

action_134 (64) = happyShift action_117
action_134 _ = happyReduce_66

action_135 (42) = happyShift action_145
action_135 _ = happyFail (happyExpListPerState 135)

action_136 _ = happyReduce_63

action_137 (74) = happyShift action_144
action_137 _ = happyReduce_64

action_138 (40) = happyShift action_143
action_138 _ = happyFail (happyExpListPerState 138)

action_139 (40) = happyShift action_142
action_139 _ = happyFail (happyExpListPerState 139)

action_140 (33) = happyShift action_93
action_140 (45) = happyShift action_76
action_140 (46) = happyShift action_77
action_140 (52) = happyShift action_78
action_140 (54) = happyShift action_79
action_140 (56) = happyShift action_80
action_140 (62) = happyShift action_81
action_140 (66) = happyShift action_83
action_140 (72) = happyShift action_84
action_140 (73) = happyShift action_85
action_140 (75) = happyShift action_86
action_140 (17) = happyGoto action_134
action_140 (18) = happyGoto action_65
action_140 (19) = happyGoto action_66
action_140 (20) = happyGoto action_92
action_140 (26) = happyGoto action_141
action_140 (27) = happyGoto action_136
action_140 (28) = happyGoto action_137
action_140 (30) = happyGoto action_69
action_140 (31) = happyGoto action_70
action_140 _ = happyReduce_62

action_141 (42) = happyShift action_149
action_141 _ = happyFail (happyExpListPerState 141)

action_142 (33) = happyShift action_71
action_142 (34) = happyShift action_72
action_142 (35) = happyShift action_73
action_142 (38) = happyShift action_74
action_142 (40) = happyShift action_75
action_142 (45) = happyShift action_76
action_142 (46) = happyShift action_77
action_142 (52) = happyShift action_78
action_142 (53) = happyShift action_28
action_142 (54) = happyShift action_79
action_142 (55) = happyShift action_29
action_142 (56) = happyShift action_80
action_142 (62) = happyShift action_81
action_142 (63) = happyShift action_82
action_142 (65) = happyShift action_30
action_142 (66) = happyShift action_83
action_142 (72) = happyShift action_84
action_142 (73) = happyShift action_85
action_142 (75) = happyShift action_86
action_142 (15) = happyGoto action_148
action_142 (16) = happyGoto action_63
action_142 (17) = happyGoto action_64
action_142 (18) = happyGoto action_65
action_142 (19) = happyGoto action_66
action_142 (20) = happyGoto action_67
action_142 (21) = happyGoto action_68
action_142 (30) = happyGoto action_69
action_142 (31) = happyGoto action_70
action_142 _ = happyReduce_25

action_143 (33) = happyShift action_71
action_143 (34) = happyShift action_72
action_143 (35) = happyShift action_73
action_143 (38) = happyShift action_74
action_143 (40) = happyShift action_75
action_143 (45) = happyShift action_76
action_143 (46) = happyShift action_77
action_143 (52) = happyShift action_78
action_143 (53) = happyShift action_28
action_143 (54) = happyShift action_79
action_143 (55) = happyShift action_29
action_143 (56) = happyShift action_80
action_143 (62) = happyShift action_81
action_143 (63) = happyShift action_82
action_143 (65) = happyShift action_30
action_143 (66) = happyShift action_83
action_143 (72) = happyShift action_84
action_143 (73) = happyShift action_85
action_143 (75) = happyShift action_86
action_143 (15) = happyGoto action_147
action_143 (16) = happyGoto action_63
action_143 (17) = happyGoto action_64
action_143 (18) = happyGoto action_65
action_143 (19) = happyGoto action_66
action_143 (20) = happyGoto action_67
action_143 (21) = happyGoto action_68
action_143 (30) = happyGoto action_69
action_143 (31) = happyGoto action_70
action_143 _ = happyReduce_25

action_144 (33) = happyShift action_93
action_144 (45) = happyShift action_76
action_144 (46) = happyShift action_77
action_144 (52) = happyShift action_78
action_144 (54) = happyShift action_79
action_144 (56) = happyShift action_80
action_144 (62) = happyShift action_81
action_144 (66) = happyShift action_83
action_144 (72) = happyShift action_84
action_144 (73) = happyShift action_85
action_144 (75) = happyShift action_86
action_144 (17) = happyGoto action_134
action_144 (18) = happyGoto action_65
action_144 (19) = happyGoto action_66
action_144 (20) = happyGoto action_92
action_144 (27) = happyGoto action_146
action_144 (28) = happyGoto action_137
action_144 (30) = happyGoto action_69
action_144 (31) = happyGoto action_70
action_144 _ = happyFail (happyExpListPerState 144)

action_145 _ = happyReduce_50

action_146 _ = happyReduce_65

action_147 (39) = happyShift action_151
action_147 _ = happyFail (happyExpListPerState 147)

action_148 (39) = happyShift action_150
action_148 _ = happyFail (happyExpListPerState 148)

action_149 _ = happyReduce_51

action_150 _ = happyReduce_30

action_151 (36) = happyShift action_152
action_151 _ = happyReduce_32

action_152 (40) = happyShift action_153
action_152 _ = happyFail (happyExpListPerState 152)

action_153 (33) = happyShift action_71
action_153 (34) = happyShift action_72
action_153 (35) = happyShift action_73
action_153 (38) = happyShift action_74
action_153 (40) = happyShift action_75
action_153 (45) = happyShift action_76
action_153 (46) = happyShift action_77
action_153 (52) = happyShift action_78
action_153 (53) = happyShift action_28
action_153 (54) = happyShift action_79
action_153 (55) = happyShift action_29
action_153 (56) = happyShift action_80
action_153 (62) = happyShift action_81
action_153 (63) = happyShift action_82
action_153 (65) = happyShift action_30
action_153 (66) = happyShift action_83
action_153 (72) = happyShift action_84
action_153 (73) = happyShift action_85
action_153 (75) = happyShift action_86
action_153 (15) = happyGoto action_154
action_153 (16) = happyGoto action_63
action_153 (17) = happyGoto action_64
action_153 (18) = happyGoto action_65
action_153 (19) = happyGoto action_66
action_153 (20) = happyGoto action_67
action_153 (21) = happyGoto action_68
action_153 (30) = happyGoto action_69
action_153 (31) = happyGoto action_70
action_153 _ = happyReduce_25

action_154 (39) = happyShift action_155
action_154 _ = happyFail (happyExpListPerState 154)

action_155 _ = happyReduce_33

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

happyReduce_14 = happySpecReduce_0  8 happyReduction_14
happyReduction_14  =  HappyAbsSyn8
		 ([]
	)

happyReduce_15 = happySpecReduce_0  9 happyReduction_15
happyReduction_15  =  HappyAbsSyn9
		 ([]
	)

happyReduce_16 = happySpecReduce_2  9 happyReduction_16
happyReduction_16 (HappyAbsSyn9  happy_var_2)
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1:happy_var_2
	)
happyReduction_16 _ _  = notHappyAtAll 

happyReduce_17 = happyReduce 9 10 happyReduction_17
happyReduction_17 (_ `HappyStk`
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
		 (MethodDecl(happy_var_1, happy_var_2 happy_var_3, happy_var_5, Block happy_var_8)
	) `HappyStk` happyRest

happyReduce_18 = happyReduce 9 10 happyReduction_18
happyReduction_18 (_ `HappyStk`
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
		 (MethodDecl(happy_var_1, "void" happy_var_3, happy_var_5, Block happy_var_8)
	) `HappyStk` happyRest

happyReduce_19 = happySpecReduce_0  11 happyReduction_19
happyReduction_19  =  HappyAbsSyn11
		 ([]
	)

happyReduce_20 = happySpecReduce_2  11 happyReduction_20
happyReduction_20 (HappyAbsSyn11  happy_var_2)
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1:happy_var_2
	)
happyReduction_20 _ _  = notHappyAtAll 

happyReduce_21 = happyReduce 4 12 happyReduction_21
happyReduction_21 (_ `HappyStk`
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_3)) `HappyStk`
	(HappyAbsSyn21  happy_var_2) `HappyStk`
	(HappyAbsSyn6  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (FieldDecl (happy_var_1, happy_var_2, happy_var_3)
	) `HappyStk` happyRest

happyReduce_22 = happySpecReduce_0  13 happyReduction_22
happyReduction_22  =  HappyAbsSyn13
		 ([]
	)

happyReduce_23 = happySpecReduce_2  13 happyReduction_23
happyReduction_23 (HappyAbsSyn13  happy_var_2)
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn13
		 (happy_var_1:happy_var_2
	)
happyReduction_23 _ _  = notHappyAtAll 

happyReduce_24 = happyReduce 8 14 happyReduction_24
happyReduction_24 (_ `HappyStk`
	(HappyAbsSyn15  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn22  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_2)) `HappyStk`
	(HappyAbsSyn8  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (MethodDecl(happy_var_1, "", happy_var_2, happy_var_4, Block happy_var_7)
	) `HappyStk` happyRest

happyReduce_25 = happySpecReduce_0  15 happyReduction_25
happyReduction_25  =  HappyAbsSyn15
		 ([]
	)

happyReduce_26 = happySpecReduce_2  15 happyReduction_26
happyReduction_26 (HappyAbsSyn15  happy_var_2)
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1:happy_var_2
	)
happyReduction_26 _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  16 happyReduction_27
happyReduction_27 _
	(HappyAbsSyn15  happy_var_2)
	_
	 =  HappyAbsSyn16
		 (Block happy_var_2
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_2  16 happyReduction_28
happyReduction_28 _
	_
	 =  HappyAbsSyn16
		 (Return Nothing
	)

happyReduce_29 = happySpecReduce_3  16 happyReduction_29
happyReduction_29 _
	(HappyAbsSyn17  happy_var_2)
	_
	 =  HappyAbsSyn16
		 (Return (Just (happy_var_2))
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happyReduce 7 16 happyReduction_30
happyReduction_30 (_ `HappyStk`
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

happyReduce_31 = happySpecReduce_3  16 happyReduction_31
happyReduction_31 _
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_2))
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn16
		 (LocalVarDecl (happy_var_1,happy_var_2)
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happyReduce 7 16 happyReduction_32
happyReduction_32 (_ `HappyStk`
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

happyReduce_33 = happyReduce 11 16 happyReduction_33
happyReduction_33 (_ `HappyStk`
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

happyReduce_34 = happySpecReduce_2  16 happyReduction_34
happyReduction_34 _
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn16
		 (StmtExprStmt happy_var_1
	)
happyReduction_34 _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_1  16 happyReduction_35
happyReduction_35 _
	 =  HappyAbsSyn16
		 (Empty
	)

happyReduce_36 = happySpecReduce_3  17 happyReduction_36
happyReduction_36 (HappyAbsSyn17  happy_var_3)
	(HappyAbsSyn29  happy_var_2)
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn17
		 (Binary (happy_var_2, happy_var_1, happy_var_3)
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_1  17 happyReduction_37
happyReduction_37 (HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1
	)
happyReduction_37 _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_1  18 happyReduction_38
happyReduction_38 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn18
		 (happy_var_1
	)
happyReduction_38 _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_2  18 happyReduction_39
happyReduction_39 (HappyAbsSyn19  happy_var_2)
	(HappyAbsSyn30  happy_var_1)
	 =  HappyAbsSyn18
		 (Unary (happy_var_1, happy_var_2)
	)
happyReduction_39 _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_1  19 happyReduction_40
happyReduction_40 _
	 =  HappyAbsSyn19
		 (This
	)

happyReduce_41 = happySpecReduce_1  19 happyReduction_41
happyReduction_41 (HappyTerminal (TOKEN_INTEGER_LITERAL happy_var_1))
	 =  HappyAbsSyn19
		 (Integer happy_var_1
	)
happyReduction_41 _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_1  19 happyReduction_42
happyReduction_42 (HappyTerminal (TOKEN_BOOL_LITERAL happy_var_1))
	 =  HappyAbsSyn19
		 (Bool happy_var_1
	)
happyReduction_42 _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_1  19 happyReduction_43
happyReduction_43 (HappyTerminal (TOKEN_CHAR_LITERAL happy_var_1))
	 =  HappyAbsSyn19
		 (Char happy_var_1
	)
happyReduction_43 _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_1  19 happyReduction_44
happyReduction_44 (HappyTerminal (TOKEN_STRING_LITERAL happy_var_1))
	 =  HappyAbsSyn19
		 (String happy_var_1
	)
happyReduction_44 _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_1  19 happyReduction_45
happyReduction_45 _
	 =  HappyAbsSyn19
		 (Jnull
	)

happyReduce_46 = happySpecReduce_1  19 happyReduction_46
happyReduction_46 (HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn19
		 (StmtExprExpr happy_var_1
	)
happyReduction_46 _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_1  19 happyReduction_47
happyReduction_47 (HappyTerminal (TOKEN_BEZEICHNER happy_var_1))
	 =  HappyAbsSyn19
		 (LocalOrFieldVar happy_var_1
	)
happyReduction_47 _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_3  19 happyReduction_48
happyReduction_48 (HappyTerminal (TOKEN_BEZEICHNER happy_var_3))
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn19
		 (InstVar (happy_var_1, happy_var_3)
	)
happyReduction_48 _ _ _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_3  20 happyReduction_49
happyReduction_49 (HappyAbsSyn25  happy_var_3)
	_
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_1))
	 =  HappyAbsSyn20
		 (Assign(happy_var_1,happy_var_3)
	)
happyReduction_49 _ _ _  = notHappyAtAll 

happyReduce_50 = happyReduce 5 20 happyReduction_50
happyReduction_50 (_ `HappyStk`
	(HappyAbsSyn26  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn20
		 (New (happy_var_1, happy_var_4)
	) `HappyStk` happyRest

happyReduce_51 = happyReduce 6 20 happyReduction_51
happyReduction_51 (_ `HappyStk`
	(HappyAbsSyn26  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn20
		 (MethodCall (happy_var_1, happy_var_3, happy_var_5)
	) `HappyStk` happyRest

happyReduce_52 = happySpecReduce_1  21 happyReduction_52
happyReduction_52 _
	 =  HappyAbsSyn21
		 ("int"
	)

happyReduce_53 = happySpecReduce_1  21 happyReduction_53
happyReduction_53 _
	 =  HappyAbsSyn21
		 ("char"
	)

happyReduce_54 = happySpecReduce_1  21 happyReduction_54
happyReduction_54 _
	 =  HappyAbsSyn21
		 ("boolean"
	)

happyReduce_55 = happySpecReduce_1  21 happyReduction_55
happyReduction_55 (HappyTerminal (TOKEN_BEZEICHNER happy_var_1))
	 =  HappyAbsSyn21
		 (happy_var_1
	)
happyReduction_55 _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_0  22 happyReduction_56
happyReduction_56  =  HappyAbsSyn22
		 ([]
	)

happyReduce_57 = happySpecReduce_1  22 happyReduction_57
happyReduction_57 (HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn22
		 (happy_var_1
	)
happyReduction_57 _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_1  23 happyReduction_58
happyReduction_58 (HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn23
		 (happy_var_1:[]
	)
happyReduction_58 _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_3  23 happyReduction_59
happyReduction_59 (HappyAbsSyn23  happy_var_3)
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn23
		 (happy_var_1:happy_var_3
	)
happyReduction_59 _ _ _  = notHappyAtAll 

happyReduce_60 = happySpecReduce_2  24 happyReduction_60
happyReduction_60 (HappyTerminal (TOKEN_BEZEICHNER happy_var_2))
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn24
		 ((happy_var_1, happy_var_2)
	)
happyReduction_60 _ _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_1  25 happyReduction_61
happyReduction_61 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn25
		 (happy_var_1
	)
happyReduction_61 _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_0  26 happyReduction_62
happyReduction_62  =  HappyAbsSyn26
		 ([]
	)

happyReduce_63 = happySpecReduce_1  26 happyReduction_63
happyReduction_63 (HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn26
		 (happy_var_1
	)
happyReduction_63 _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_1  27 happyReduction_64
happyReduction_64 (HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn27
		 (happy_var_1:[]
	)
happyReduction_64 _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_3  27 happyReduction_65
happyReduction_65 (HappyAbsSyn27  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn27
		 (happy_var_1:happy_var_3
	)
happyReduction_65 _ _ _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_1  28 happyReduction_66
happyReduction_66 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn28
		 (happy_var_1
	)
happyReduction_66 _  = notHappyAtAll 

happyReduce_67 = happySpecReduce_1  29 happyReduction_67
happyReduction_67 _
	 =  HappyAbsSyn29
		 (Equals
	)

happyReduce_68 = happySpecReduce_1  29 happyReduction_68
happyReduction_68 _
	 =  HappyAbsSyn29
		 (LT
	)

happyReduce_69 = happySpecReduce_1  29 happyReduction_69
happyReduction_69 _
	 =  HappyAbsSyn29
		 (GT
	)

happyReduce_70 = happySpecReduce_1  29 happyReduction_70
happyReduction_70 _
	 =  HappyAbsSyn29
		 (GE
	)

happyReduce_71 = happySpecReduce_1  29 happyReduction_71
happyReduction_71 _
	 =  HappyAbsSyn29
		 (LE
	)

happyReduce_72 = happySpecReduce_1  29 happyReduction_72
happyReduction_72 _
	 =  HappyAbsSyn29
		 (Mult
	)

happyReduce_73 = happySpecReduce_1  29 happyReduction_73
happyReduction_73 _
	 =  HappyAbsSyn29
		 (Div
	)

happyReduce_74 = happySpecReduce_1  29 happyReduction_74
happyReduction_74 _
	 =  HappyAbsSyn29
		 (Modulo
	)

happyReduce_75 = happySpecReduce_1  29 happyReduction_75
happyReduction_75 _
	 =  HappyAbsSyn29
		 (AND
	)

happyReduce_76 = happySpecReduce_1  29 happyReduction_76
happyReduction_76 _
	 =  HappyAbsSyn29
		 (OR
	)

happyReduce_77 = happySpecReduce_1  29 happyReduction_77
happyReduction_77 _
	 =  HappyAbsSyn29
		 (BitwiseOR
	)

happyReduce_78 = happySpecReduce_1  29 happyReduction_78
happyReduction_78 _
	 =  HappyAbsSyn29
		 (BitwiseAND
	)

happyReduce_79 = happySpecReduce_1  29 happyReduction_79
happyReduction_79 (HappyAbsSyn31  happy_var_1)
	 =  HappyAbsSyn29
		 (happy_var_1
	)
happyReduction_79 _  = notHappyAtAll 

happyReduce_80 = happySpecReduce_1  30 happyReduction_80
happyReduction_80 _
	 =  HappyAbsSyn30
		 (Negation
	)

happyReduce_81 = happySpecReduce_1  30 happyReduction_81
happyReduction_81 (HappyAbsSyn31  happy_var_1)
	 =  HappyAbsSyn30
		 (happy_var_1
	)
happyReduction_81 _  = notHappyAtAll 

happyReduce_82 = happySpecReduce_1  31 happyReduction_82
happyReduction_82 _
	 =  HappyAbsSyn31
		 (Positiv
	)

happyReduce_83 = happySpecReduce_1  31 happyReduction_83
happyReduction_83 _
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
class tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError _ = error "Parse error"

parser :: String -> Class
parser = constuctor . class . scan

constructor :: Class -> Class
constructor Class (Modi, Name, Fields, [], Methoden) = Class (Modi, Name, Fields, [MethodDecl([Public], "", Name, [], Block [])] ,Methoden)
constructor x = x

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
