{-# OPTIONS_GHC -w #-}
module Parser (parser) where
import AbstrakteSyntax
import Scanner
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25
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

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,363) ([0,0,0,4,0,0,0,256,0,0,32,0,0,0,0,0,128,0,0,0,0,0,0,0,0,0,0,16384,0,0,0,0,2048,0,0,0,0,0,60,0,0,1,80,1,0,64,5120,68,0,4096,0,4357,0,0,256,0,0,0,0,0,15,0,0,0,768,0,0,0,49152,0,0,0,0,32,0,0,0,1024,0,0,0,0,0,0,0,0,0,0,0,0,8192,0,0,0,0,4,0,0,0,512,0,0,0,16384,0,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,16,0,0,0,0,0,0,0,0,0,0,0,16384,0,0,0,0,0,0,0,0,1024,0,0,0,0,0,0,0,0,64,0,0,0,4096,0,0,0,0,128,0,0,0,0,1,0,0,0,72,0,0,0,4096,0,0,0,1024,16384,1025,0,0,288,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16,1280,16,0,1024,0,0,0,0,512,0,0,0,0,0,0,0,0,0,0,32,0,4,320,4,0,0,0,0,0,16384,0,16404,0,0,16,1280,16,0,0,0,0,0,0,512,0,0,0,32768,0,0,0,0,32,0,0,0,4,320,4,0,32768,0,0,0,0,0,0,0,0,8192,0,0,0,0,2,0,0,0,12455,24824,1411,0,0,0,0,0,0,8,0,0,0,512,0,0,0,32768,0,0,0,49152,3113,55358,352,0,2672,3971,22582,0,39936,57538,3459,22,0,64,0,0,0,10688,15884,24792,1,0,0,2048,0,0,0,0,0,0,8192,0,0,0,16384,0,0,0,0,16,2691,22562,0,16384,0,0,0,0,256,0,0,0,16384,0,0,0,0,0,0,0,0,49820,33760,5645,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64,0,0,0,4096,33538,8714,88,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,39936,57538,3459,22,0,64,0,0,0,2048,0,32,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,64,0,0,0,1024,0,0,0,1024,41152,2178,22,0,12289,8360,1410,0,64,10764,24712,1,0,0,0,0,0,128,0,0,0,0,0,0,0,16384,3072,34858,352,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,256,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,64,0,0,0,4096,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32,2048,0,0,2048,0,2,0,0,0,0,0,16384,3072,34858,352,0,0,0,0,0,0,0,0,0,0,0,32768,0,0,32768,0,0,0,0,0,0,0,0,0,0,2048,0,32768,0,0,0,0,32,0,0,0,16,2691,22562,0,0,8,0,0,0,12455,24824,1411,0,10688,15884,24792,1,4096,33536,8714,88,0,0,0,0,0,0,0,0,0,0,16,0,0,0,1024,0,0,0,0,0,0,0,0,0,0,0,0,512,0,0,0,0,8,0,0,0,49820,33760,5645,0,16384,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_classPars","classPars","classModifier","attriModifier","methodModifier","konstModifier","methodOrAttris","methodOrAttri","statements","statement","expression","expressionCore","stmtExpr","typ","methodDeclParams","methodDeclParamss","methodDeclParam","literal","params","paramss","param","binaryOp","unaryOp","Klasse","Bezeichner","While","If","Else","Zuweisung","Semikolon","Klazu_Gesch","Klaauf_Gesch","Klaauf_Rund","Klazu_Rund","Geteilt","Mal","Plu","Minu","Modul","An","O","BitOR","BitAND","String_Literal","Integer","Integer_Literal","Char","Char_Literal","Pub","Priv","Stat","Fin","Void","Neww","Return","Akzessor","Bool","Bool_Literal","Vergleich","Groesser","Kleiner","Groesser_Gleich","Kleiner_Gleich","Null","Not","Komma","Thi","%eof"]
        bit_start = st Prelude.* 70
        bit_end = (st Prelude.+ 1) Prelude.* 70
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..69]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (51) = happyShift action_3
action_0 (4) = happyGoto action_4
action_0 (5) = happyGoto action_2
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (51) = happyShift action_3
action_1 (5) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (26) = happyShift action_6
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (54) = happyShift action_5
action_3 _ = happyReduce_2

action_4 (70) = happyAccept
action_4 _ = happyFail (happyExpListPerState 4)

action_5 _ = happyReduce_3

action_6 (27) = happyShift action_7
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (34) = happyShift action_8
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (33) = happyReduce_19
action_8 (51) = happyShift action_14
action_8 (52) = happyShift action_15
action_8 (53) = happyShift action_16
action_8 (54) = happyShift action_17
action_8 (6) = happyGoto action_9
action_8 (7) = happyGoto action_10
action_8 (8) = happyGoto action_11
action_8 (9) = happyGoto action_12
action_8 (10) = happyGoto action_13
action_8 _ = happyReduce_18

action_9 (27) = happyShift action_33
action_9 (47) = happyShift action_28
action_9 (49) = happyShift action_29
action_9 (59) = happyShift action_31
action_9 (16) = happyGoto action_35
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (27) = happyShift action_33
action_10 (47) = happyShift action_28
action_10 (49) = happyShift action_29
action_10 (55) = happyShift action_34
action_10 (59) = happyShift action_31
action_10 (16) = happyGoto action_32
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (27) = happyShift action_27
action_11 (47) = happyShift action_28
action_11 (49) = happyShift action_29
action_11 (55) = happyShift action_30
action_11 (59) = happyShift action_31
action_11 (16) = happyGoto action_26
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (33) = happyShift action_25
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (33) = happyReduce_19
action_13 (51) = happyShift action_14
action_13 (52) = happyShift action_15
action_13 (53) = happyShift action_16
action_13 (54) = happyShift action_17
action_13 (6) = happyGoto action_9
action_13 (7) = happyGoto action_10
action_13 (8) = happyGoto action_11
action_13 (9) = happyGoto action_24
action_13 (10) = happyGoto action_13
action_13 _ = happyReduce_18

action_14 (53) = happyShift action_22
action_14 (54) = happyShift action_23
action_14 _ = happyReduce_16

action_15 (53) = happyShift action_20
action_15 (54) = happyShift action_21
action_15 _ = happyReduce_17

action_16 (54) = happyShift action_19
action_16 _ = happyReduce_15

action_17 (53) = happyShift action_18
action_17 _ = happyReduce_10

action_18 _ = happyReduce_11

action_19 _ = happyReduce_12

action_20 (54) = happyShift action_45
action_20 _ = happyReduce_14

action_21 (53) = happyShift action_44
action_21 _ = happyReduce_7

action_22 (54) = happyShift action_43
action_22 _ = happyReduce_13

action_23 (53) = happyShift action_42
action_23 _ = happyReduce_4

action_24 _ = happyReduce_20

action_25 _ = happyReduce_1

action_26 (27) = happyShift action_41
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (35) = happyShift action_40
action_27 _ = happyReduce_58

action_28 _ = happyReduce_55

action_29 _ = happyReduce_56

action_30 (27) = happyShift action_39
action_30 _ = happyFail (happyExpListPerState 30)

action_31 _ = happyReduce_57

action_32 (27) = happyShift action_38
action_32 _ = happyFail (happyExpListPerState 32)

action_33 _ = happyReduce_58

action_34 (27) = happyShift action_37
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (27) = happyShift action_36
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (32) = happyShift action_56
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (35) = happyShift action_55
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (32) = happyShift action_53
action_38 (35) = happyShift action_54
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (35) = happyShift action_52
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (27) = happyShift action_33
action_40 (47) = happyShift action_28
action_40 (49) = happyShift action_29
action_40 (59) = happyShift action_31
action_40 (16) = happyGoto action_48
action_40 (17) = happyGoto action_49
action_40 (18) = happyGoto action_50
action_40 (19) = happyGoto action_51
action_40 _ = happyReduce_59

action_41 (32) = happyShift action_46
action_41 (35) = happyShift action_47
action_41 _ = happyFail (happyExpListPerState 41)

action_42 _ = happyReduce_5

action_43 _ = happyReduce_6

action_44 _ = happyReduce_8

action_45 _ = happyReduce_9

action_46 _ = happyReduce_23

action_47 (27) = happyShift action_33
action_47 (47) = happyShift action_28
action_47 (49) = happyShift action_29
action_47 (59) = happyShift action_31
action_47 (16) = happyGoto action_48
action_47 (17) = happyGoto action_63
action_47 (18) = happyGoto action_50
action_47 (19) = happyGoto action_51
action_47 _ = happyReduce_59

action_48 (27) = happyShift action_62
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (36) = happyShift action_61
action_49 _ = happyFail (happyExpListPerState 49)

action_50 _ = happyReduce_60

action_51 (68) = happyShift action_60
action_51 _ = happyReduce_61

action_52 (27) = happyShift action_33
action_52 (47) = happyShift action_28
action_52 (49) = happyShift action_29
action_52 (59) = happyShift action_31
action_52 (16) = happyGoto action_48
action_52 (17) = happyGoto action_59
action_52 (18) = happyGoto action_50
action_52 (19) = happyGoto action_51
action_52 _ = happyReduce_59

action_53 _ = happyReduce_22

action_54 (27) = happyShift action_33
action_54 (47) = happyShift action_28
action_54 (49) = happyShift action_29
action_54 (59) = happyShift action_31
action_54 (16) = happyGoto action_48
action_54 (17) = happyGoto action_58
action_54 (18) = happyGoto action_50
action_54 (19) = happyGoto action_51
action_54 _ = happyReduce_59

action_55 (27) = happyShift action_33
action_55 (47) = happyShift action_28
action_55 (49) = happyShift action_29
action_55 (59) = happyShift action_31
action_55 (16) = happyGoto action_48
action_55 (17) = happyGoto action_57
action_55 (18) = happyGoto action_50
action_55 (19) = happyGoto action_51
action_55 _ = happyReduce_59

action_56 _ = happyReduce_21

action_57 (36) = happyShift action_69
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (36) = happyShift action_68
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (36) = happyShift action_67
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (27) = happyShift action_33
action_60 (47) = happyShift action_28
action_60 (49) = happyShift action_29
action_60 (59) = happyShift action_31
action_60 (16) = happyGoto action_48
action_60 (18) = happyGoto action_66
action_60 (19) = happyGoto action_51
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (34) = happyShift action_65
action_61 _ = happyFail (happyExpListPerState 61)

action_62 _ = happyReduce_63

action_63 (36) = happyShift action_64
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (34) = happyShift action_96
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (27) = happyShift action_80
action_65 (28) = happyShift action_81
action_65 (29) = happyShift action_82
action_65 (32) = happyShift action_83
action_65 (34) = happyShift action_84
action_65 (39) = happyShift action_85
action_65 (40) = happyShift action_86
action_65 (46) = happyShift action_87
action_65 (47) = happyShift action_28
action_65 (48) = happyShift action_88
action_65 (49) = happyShift action_29
action_65 (50) = happyShift action_89
action_65 (56) = happyShift action_90
action_65 (57) = happyShift action_91
action_65 (59) = happyShift action_31
action_65 (60) = happyShift action_92
action_65 (66) = happyShift action_93
action_65 (67) = happyShift action_94
action_65 (69) = happyShift action_95
action_65 (11) = happyGoto action_73
action_65 (12) = happyGoto action_74
action_65 (13) = happyGoto action_75
action_65 (14) = happyGoto action_76
action_65 (15) = happyGoto action_77
action_65 (16) = happyGoto action_78
action_65 (25) = happyGoto action_79
action_65 _ = happyReduce_29

action_66 _ = happyReduce_62

action_67 (34) = happyShift action_72
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (34) = happyShift action_71
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (34) = happyShift action_70
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (27) = happyShift action_80
action_70 (28) = happyShift action_81
action_70 (29) = happyShift action_82
action_70 (32) = happyShift action_83
action_70 (34) = happyShift action_84
action_70 (39) = happyShift action_85
action_70 (40) = happyShift action_86
action_70 (46) = happyShift action_87
action_70 (47) = happyShift action_28
action_70 (48) = happyShift action_88
action_70 (49) = happyShift action_29
action_70 (50) = happyShift action_89
action_70 (56) = happyShift action_90
action_70 (57) = happyShift action_91
action_70 (59) = happyShift action_31
action_70 (60) = happyShift action_92
action_70 (66) = happyShift action_93
action_70 (67) = happyShift action_94
action_70 (69) = happyShift action_95
action_70 (11) = happyGoto action_130
action_70 (12) = happyGoto action_74
action_70 (13) = happyGoto action_75
action_70 (14) = happyGoto action_76
action_70 (15) = happyGoto action_77
action_70 (16) = happyGoto action_78
action_70 (25) = happyGoto action_79
action_70 _ = happyReduce_29

action_71 (27) = happyShift action_80
action_71 (28) = happyShift action_81
action_71 (29) = happyShift action_82
action_71 (32) = happyShift action_83
action_71 (34) = happyShift action_84
action_71 (39) = happyShift action_85
action_71 (40) = happyShift action_86
action_71 (46) = happyShift action_87
action_71 (47) = happyShift action_28
action_71 (48) = happyShift action_88
action_71 (49) = happyShift action_29
action_71 (50) = happyShift action_89
action_71 (56) = happyShift action_90
action_71 (57) = happyShift action_91
action_71 (59) = happyShift action_31
action_71 (60) = happyShift action_92
action_71 (66) = happyShift action_93
action_71 (67) = happyShift action_94
action_71 (69) = happyShift action_95
action_71 (11) = happyGoto action_129
action_71 (12) = happyGoto action_74
action_71 (13) = happyGoto action_75
action_71 (14) = happyGoto action_76
action_71 (15) = happyGoto action_77
action_71 (16) = happyGoto action_78
action_71 (25) = happyGoto action_79
action_71 _ = happyReduce_29

action_72 (27) = happyShift action_80
action_72 (28) = happyShift action_81
action_72 (29) = happyShift action_82
action_72 (32) = happyShift action_83
action_72 (34) = happyShift action_84
action_72 (39) = happyShift action_85
action_72 (40) = happyShift action_86
action_72 (46) = happyShift action_87
action_72 (47) = happyShift action_28
action_72 (48) = happyShift action_88
action_72 (49) = happyShift action_29
action_72 (50) = happyShift action_89
action_72 (56) = happyShift action_90
action_72 (57) = happyShift action_91
action_72 (59) = happyShift action_31
action_72 (60) = happyShift action_92
action_72 (66) = happyShift action_93
action_72 (67) = happyShift action_94
action_72 (69) = happyShift action_95
action_72 (11) = happyGoto action_128
action_72 (12) = happyGoto action_74
action_72 (13) = happyGoto action_75
action_72 (14) = happyGoto action_76
action_72 (15) = happyGoto action_77
action_72 (16) = happyGoto action_78
action_72 (25) = happyGoto action_79
action_72 _ = happyReduce_29

action_73 (33) = happyShift action_127
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (27) = happyShift action_80
action_74 (28) = happyShift action_81
action_74 (29) = happyShift action_82
action_74 (32) = happyShift action_83
action_74 (34) = happyShift action_84
action_74 (39) = happyShift action_85
action_74 (40) = happyShift action_86
action_74 (46) = happyShift action_87
action_74 (47) = happyShift action_28
action_74 (48) = happyShift action_88
action_74 (49) = happyShift action_29
action_74 (50) = happyShift action_89
action_74 (56) = happyShift action_90
action_74 (57) = happyShift action_91
action_74 (59) = happyShift action_31
action_74 (60) = happyShift action_92
action_74 (66) = happyShift action_93
action_74 (67) = happyShift action_94
action_74 (69) = happyShift action_95
action_74 (11) = happyGoto action_126
action_74 (12) = happyGoto action_74
action_74 (13) = happyGoto action_75
action_74 (14) = happyGoto action_76
action_74 (15) = happyGoto action_77
action_74 (16) = happyGoto action_78
action_74 (25) = happyGoto action_79
action_74 _ = happyReduce_29

action_75 (58) = happyShift action_125
action_75 _ = happyFail (happyExpListPerState 75)

action_76 (37) = happyShift action_111
action_76 (38) = happyShift action_112
action_76 (39) = happyShift action_113
action_76 (40) = happyShift action_114
action_76 (41) = happyShift action_115
action_76 (42) = happyShift action_116
action_76 (43) = happyShift action_117
action_76 (44) = happyShift action_118
action_76 (45) = happyShift action_119
action_76 (61) = happyShift action_120
action_76 (62) = happyShift action_121
action_76 (63) = happyShift action_122
action_76 (64) = happyShift action_123
action_76 (65) = happyShift action_124
action_76 (24) = happyGoto action_110
action_76 _ = happyReduce_40

action_77 (32) = happyShift action_109
action_77 _ = happyReduce_49

action_78 (27) = happyShift action_108
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (27) = happyShift action_100
action_79 (39) = happyShift action_85
action_79 (40) = happyShift action_86
action_79 (46) = happyShift action_87
action_79 (48) = happyShift action_88
action_79 (50) = happyShift action_89
action_79 (56) = happyShift action_90
action_79 (60) = happyShift action_92
action_79 (66) = happyShift action_93
action_79 (67) = happyShift action_94
action_79 (69) = happyShift action_95
action_79 (13) = happyGoto action_107
action_79 (14) = happyGoto action_76
action_79 (15) = happyGoto action_99
action_79 (25) = happyGoto action_79
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (31) = happyShift action_106
action_80 (37) = happyReduce_50
action_80 (38) = happyReduce_50
action_80 (39) = happyReduce_50
action_80 (40) = happyReduce_50
action_80 (41) = happyReduce_50
action_80 (42) = happyReduce_50
action_80 (43) = happyReduce_50
action_80 (44) = happyReduce_50
action_80 (45) = happyReduce_50
action_80 (58) = happyReduce_50
action_80 (61) = happyReduce_50
action_80 (62) = happyReduce_50
action_80 (63) = happyReduce_50
action_80 (64) = happyReduce_50
action_80 (65) = happyReduce_50
action_80 _ = happyReduce_58

action_81 (35) = happyShift action_105
action_81 _ = happyFail (happyExpListPerState 81)

action_82 (35) = happyShift action_104
action_82 _ = happyFail (happyExpListPerState 82)

action_83 _ = happyReduce_39

action_84 (27) = happyShift action_80
action_84 (28) = happyShift action_81
action_84 (29) = happyShift action_82
action_84 (32) = happyShift action_83
action_84 (34) = happyShift action_84
action_84 (39) = happyShift action_85
action_84 (40) = happyShift action_86
action_84 (46) = happyShift action_87
action_84 (47) = happyShift action_28
action_84 (48) = happyShift action_88
action_84 (49) = happyShift action_29
action_84 (50) = happyShift action_89
action_84 (56) = happyShift action_90
action_84 (57) = happyShift action_91
action_84 (59) = happyShift action_31
action_84 (60) = happyShift action_92
action_84 (66) = happyShift action_93
action_84 (67) = happyShift action_94
action_84 (69) = happyShift action_95
action_84 (11) = happyGoto action_103
action_84 (12) = happyGoto action_74
action_84 (13) = happyGoto action_75
action_84 (14) = happyGoto action_76
action_84 (15) = happyGoto action_77
action_84 (16) = happyGoto action_78
action_84 (25) = happyGoto action_79
action_84 _ = happyReduce_29

action_85 _ = happyReduce_85

action_86 _ = happyReduce_86

action_87 _ = happyReduce_47

action_88 _ = happyReduce_44

action_89 _ = happyReduce_46

action_90 (27) = happyShift action_102
action_90 _ = happyFail (happyExpListPerState 90)

action_91 (27) = happyShift action_100
action_91 (32) = happyShift action_101
action_91 (39) = happyShift action_85
action_91 (40) = happyShift action_86
action_91 (46) = happyShift action_87
action_91 (48) = happyShift action_88
action_91 (50) = happyShift action_89
action_91 (56) = happyShift action_90
action_91 (60) = happyShift action_92
action_91 (66) = happyShift action_93
action_91 (67) = happyShift action_94
action_91 (69) = happyShift action_95
action_91 (13) = happyGoto action_98
action_91 (14) = happyGoto action_76
action_91 (15) = happyGoto action_99
action_91 (25) = happyGoto action_79
action_91 _ = happyFail (happyExpListPerState 91)

action_92 _ = happyReduce_45

action_93 _ = happyReduce_48

action_94 _ = happyReduce_84

action_95 _ = happyReduce_43

action_96 (27) = happyShift action_80
action_96 (28) = happyShift action_81
action_96 (29) = happyShift action_82
action_96 (32) = happyShift action_83
action_96 (34) = happyShift action_84
action_96 (39) = happyShift action_85
action_96 (40) = happyShift action_86
action_96 (46) = happyShift action_87
action_96 (47) = happyShift action_28
action_96 (48) = happyShift action_88
action_96 (49) = happyShift action_29
action_96 (50) = happyShift action_89
action_96 (56) = happyShift action_90
action_96 (57) = happyShift action_91
action_96 (59) = happyShift action_31
action_96 (60) = happyShift action_92
action_96 (66) = happyShift action_93
action_96 (67) = happyShift action_94
action_96 (69) = happyShift action_95
action_96 (11) = happyGoto action_97
action_96 (12) = happyGoto action_74
action_96 (13) = happyGoto action_75
action_96 (14) = happyGoto action_76
action_96 (15) = happyGoto action_77
action_96 (16) = happyGoto action_78
action_96 (25) = happyGoto action_79
action_96 _ = happyReduce_29

action_97 (33) = happyShift action_144
action_97 _ = happyFail (happyExpListPerState 97)

action_98 (32) = happyShift action_143
action_98 (58) = happyShift action_125
action_98 _ = happyFail (happyExpListPerState 98)

action_99 _ = happyReduce_49

action_100 (31) = happyShift action_106
action_100 _ = happyReduce_50

action_101 _ = happyReduce_32

action_102 (35) = happyShift action_142
action_102 _ = happyFail (happyExpListPerState 102)

action_103 (33) = happyShift action_141
action_103 _ = happyFail (happyExpListPerState 103)

action_104 (27) = happyShift action_100
action_104 (39) = happyShift action_85
action_104 (40) = happyShift action_86
action_104 (46) = happyShift action_87
action_104 (48) = happyShift action_88
action_104 (50) = happyShift action_89
action_104 (56) = happyShift action_90
action_104 (60) = happyShift action_92
action_104 (66) = happyShift action_93
action_104 (67) = happyShift action_94
action_104 (69) = happyShift action_95
action_104 (13) = happyGoto action_140
action_104 (14) = happyGoto action_76
action_104 (15) = happyGoto action_99
action_104 (25) = happyGoto action_79
action_104 _ = happyFail (happyExpListPerState 104)

action_105 (27) = happyShift action_100
action_105 (39) = happyShift action_85
action_105 (40) = happyShift action_86
action_105 (46) = happyShift action_87
action_105 (48) = happyShift action_88
action_105 (50) = happyShift action_89
action_105 (56) = happyShift action_90
action_105 (60) = happyShift action_92
action_105 (66) = happyShift action_93
action_105 (67) = happyShift action_94
action_105 (69) = happyShift action_95
action_105 (13) = happyGoto action_139
action_105 (14) = happyGoto action_76
action_105 (15) = happyGoto action_99
action_105 (25) = happyGoto action_79
action_105 _ = happyFail (happyExpListPerState 105)

action_106 (27) = happyShift action_100
action_106 (39) = happyShift action_85
action_106 (40) = happyShift action_86
action_106 (46) = happyShift action_87
action_106 (48) = happyShift action_88
action_106 (50) = happyShift action_89
action_106 (56) = happyShift action_90
action_106 (60) = happyShift action_92
action_106 (66) = happyShift action_93
action_106 (67) = happyShift action_94
action_106 (69) = happyShift action_95
action_106 (13) = happyGoto action_137
action_106 (14) = happyGoto action_76
action_106 (15) = happyGoto action_99
action_106 (20) = happyGoto action_138
action_106 (25) = happyGoto action_79
action_106 _ = happyFail (happyExpListPerState 106)

action_107 (58) = happyShift action_125
action_107 _ = happyReduce_42

action_108 (32) = happyShift action_136
action_108 _ = happyFail (happyExpListPerState 108)

action_109 _ = happyReduce_38

action_110 (27) = happyShift action_100
action_110 (39) = happyShift action_85
action_110 (40) = happyShift action_86
action_110 (46) = happyShift action_87
action_110 (48) = happyShift action_88
action_110 (50) = happyShift action_89
action_110 (56) = happyShift action_90
action_110 (60) = happyShift action_92
action_110 (66) = happyShift action_93
action_110 (67) = happyShift action_94
action_110 (69) = happyShift action_95
action_110 (13) = happyGoto action_135
action_110 (14) = happyGoto action_76
action_110 (15) = happyGoto action_99
action_110 (25) = happyGoto action_79
action_110 _ = happyFail (happyExpListPerState 110)

action_111 _ = happyReduce_76

action_112 _ = happyReduce_75

action_113 _ = happyReduce_82

action_114 _ = happyReduce_83

action_115 _ = happyReduce_77

action_116 _ = happyReduce_78

action_117 _ = happyReduce_79

action_118 _ = happyReduce_80

action_119 _ = happyReduce_81

action_120 _ = happyReduce_70

action_121 _ = happyReduce_72

action_122 _ = happyReduce_71

action_123 _ = happyReduce_73

action_124 _ = happyReduce_74

action_125 (27) = happyShift action_134
action_125 _ = happyFail (happyExpListPerState 125)

action_126 _ = happyReduce_30

action_127 _ = happyReduce_28

action_128 (33) = happyShift action_133
action_128 _ = happyFail (happyExpListPerState 128)

action_129 (33) = happyShift action_132
action_129 _ = happyFail (happyExpListPerState 129)

action_130 (33) = happyShift action_131
action_130 _ = happyFail (happyExpListPerState 130)

action_131 _ = happyReduce_25

action_132 _ = happyReduce_24

action_133 _ = happyReduce_27

action_134 (35) = happyShift action_151
action_134 _ = happyReduce_51

action_135 (58) = happyShift action_125
action_135 _ = happyReduce_41

action_136 _ = happyReduce_35

action_137 (58) = happyShift action_125
action_137 _ = happyReduce_64

action_138 _ = happyReduce_52

action_139 (36) = happyShift action_150
action_139 (58) = happyShift action_125
action_139 _ = happyFail (happyExpListPerState 139)

action_140 (36) = happyShift action_149
action_140 (58) = happyShift action_125
action_140 _ = happyFail (happyExpListPerState 140)

action_141 _ = happyReduce_31

action_142 (27) = happyShift action_100
action_142 (39) = happyShift action_85
action_142 (40) = happyShift action_86
action_142 (46) = happyShift action_87
action_142 (48) = happyShift action_88
action_142 (50) = happyShift action_89
action_142 (56) = happyShift action_90
action_142 (60) = happyShift action_92
action_142 (66) = happyShift action_93
action_142 (67) = happyShift action_94
action_142 (69) = happyShift action_95
action_142 (13) = happyGoto action_145
action_142 (14) = happyGoto action_76
action_142 (15) = happyGoto action_99
action_142 (21) = happyGoto action_146
action_142 (22) = happyGoto action_147
action_142 (23) = happyGoto action_148
action_142 (25) = happyGoto action_79
action_142 _ = happyReduce_65

action_143 _ = happyReduce_33

action_144 _ = happyReduce_26

action_145 (58) = happyShift action_125
action_145 _ = happyReduce_69

action_146 (36) = happyShift action_156
action_146 _ = happyFail (happyExpListPerState 146)

action_147 _ = happyReduce_66

action_148 (68) = happyShift action_155
action_148 _ = happyReduce_67

action_149 (34) = happyShift action_154
action_149 _ = happyFail (happyExpListPerState 149)

action_150 (34) = happyShift action_153
action_150 _ = happyFail (happyExpListPerState 150)

action_151 (27) = happyShift action_100
action_151 (39) = happyShift action_85
action_151 (40) = happyShift action_86
action_151 (46) = happyShift action_87
action_151 (48) = happyShift action_88
action_151 (50) = happyShift action_89
action_151 (56) = happyShift action_90
action_151 (60) = happyShift action_92
action_151 (66) = happyShift action_93
action_151 (67) = happyShift action_94
action_151 (69) = happyShift action_95
action_151 (13) = happyGoto action_145
action_151 (14) = happyGoto action_76
action_151 (15) = happyGoto action_99
action_151 (21) = happyGoto action_152
action_151 (22) = happyGoto action_147
action_151 (23) = happyGoto action_148
action_151 (25) = happyGoto action_79
action_151 _ = happyReduce_65

action_152 (36) = happyShift action_160
action_152 _ = happyFail (happyExpListPerState 152)

action_153 (27) = happyShift action_80
action_153 (28) = happyShift action_81
action_153 (29) = happyShift action_82
action_153 (32) = happyShift action_83
action_153 (34) = happyShift action_84
action_153 (39) = happyShift action_85
action_153 (40) = happyShift action_86
action_153 (46) = happyShift action_87
action_153 (47) = happyShift action_28
action_153 (48) = happyShift action_88
action_153 (49) = happyShift action_29
action_153 (50) = happyShift action_89
action_153 (56) = happyShift action_90
action_153 (57) = happyShift action_91
action_153 (59) = happyShift action_31
action_153 (60) = happyShift action_92
action_153 (66) = happyShift action_93
action_153 (67) = happyShift action_94
action_153 (69) = happyShift action_95
action_153 (11) = happyGoto action_159
action_153 (12) = happyGoto action_74
action_153 (13) = happyGoto action_75
action_153 (14) = happyGoto action_76
action_153 (15) = happyGoto action_77
action_153 (16) = happyGoto action_78
action_153 (25) = happyGoto action_79
action_153 _ = happyReduce_29

action_154 (27) = happyShift action_80
action_154 (28) = happyShift action_81
action_154 (29) = happyShift action_82
action_154 (32) = happyShift action_83
action_154 (34) = happyShift action_84
action_154 (39) = happyShift action_85
action_154 (40) = happyShift action_86
action_154 (46) = happyShift action_87
action_154 (47) = happyShift action_28
action_154 (48) = happyShift action_88
action_154 (49) = happyShift action_29
action_154 (50) = happyShift action_89
action_154 (56) = happyShift action_90
action_154 (57) = happyShift action_91
action_154 (59) = happyShift action_31
action_154 (60) = happyShift action_92
action_154 (66) = happyShift action_93
action_154 (67) = happyShift action_94
action_154 (69) = happyShift action_95
action_154 (11) = happyGoto action_158
action_154 (12) = happyGoto action_74
action_154 (13) = happyGoto action_75
action_154 (14) = happyGoto action_76
action_154 (15) = happyGoto action_77
action_154 (16) = happyGoto action_78
action_154 (25) = happyGoto action_79
action_154 _ = happyReduce_29

action_155 (27) = happyShift action_100
action_155 (39) = happyShift action_85
action_155 (40) = happyShift action_86
action_155 (46) = happyShift action_87
action_155 (48) = happyShift action_88
action_155 (50) = happyShift action_89
action_155 (56) = happyShift action_90
action_155 (60) = happyShift action_92
action_155 (66) = happyShift action_93
action_155 (67) = happyShift action_94
action_155 (69) = happyShift action_95
action_155 (13) = happyGoto action_145
action_155 (14) = happyGoto action_76
action_155 (15) = happyGoto action_99
action_155 (22) = happyGoto action_157
action_155 (23) = happyGoto action_148
action_155 (25) = happyGoto action_79
action_155 _ = happyFail (happyExpListPerState 155)

action_156 _ = happyReduce_53

action_157 _ = happyReduce_68

action_158 (33) = happyShift action_162
action_158 _ = happyFail (happyExpListPerState 158)

action_159 (33) = happyShift action_161
action_159 _ = happyFail (happyExpListPerState 159)

action_160 _ = happyReduce_54

action_161 _ = happyReduce_34

action_162 (30) = happyShift action_163
action_162 _ = happyReduce_36

action_163 (34) = happyShift action_164
action_163 _ = happyFail (happyExpListPerState 163)

action_164 (27) = happyShift action_80
action_164 (28) = happyShift action_81
action_164 (29) = happyShift action_82
action_164 (32) = happyShift action_83
action_164 (34) = happyShift action_84
action_164 (39) = happyShift action_85
action_164 (40) = happyShift action_86
action_164 (46) = happyShift action_87
action_164 (47) = happyShift action_28
action_164 (48) = happyShift action_88
action_164 (49) = happyShift action_29
action_164 (50) = happyShift action_89
action_164 (56) = happyShift action_90
action_164 (57) = happyShift action_91
action_164 (59) = happyShift action_31
action_164 (60) = happyShift action_92
action_164 (66) = happyShift action_93
action_164 (67) = happyShift action_94
action_164 (69) = happyShift action_95
action_164 (11) = happyGoto action_165
action_164 (12) = happyGoto action_74
action_164 (13) = happyGoto action_75
action_164 (14) = happyGoto action_76
action_164 (15) = happyGoto action_77
action_164 (16) = happyGoto action_78
action_164 (25) = happyGoto action_79
action_164 _ = happyReduce_29

action_165 (33) = happyShift action_166
action_165 _ = happyFail (happyExpListPerState 165)

action_166 _ = happyReduce_37

happyReduce_1 = happyReduce 6 4 happyReduction_1
happyReduction_1 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (ClassHybrid(happy_var_1, happy_var_3, happy_var_5)
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

happyReduce_4 = happySpecReduce_2  6 happyReduction_4
happyReduction_4 _
	_
	 =  HappyAbsSyn6
		 ([Public,Final]
	)

happyReduce_5 = happySpecReduce_3  6 happyReduction_5
happyReduction_5 _
	_
	_
	 =  HappyAbsSyn6
		 ([Public,Final,Static]
	)

happyReduce_6 = happySpecReduce_3  6 happyReduction_6
happyReduction_6 _
	_
	_
	 =  HappyAbsSyn6
		 ([Public,Static,Final]
	)

happyReduce_7 = happySpecReduce_2  6 happyReduction_7
happyReduction_7 _
	_
	 =  HappyAbsSyn6
		 ([Private,Final]
	)

happyReduce_8 = happySpecReduce_3  6 happyReduction_8
happyReduction_8 _
	_
	_
	 =  HappyAbsSyn6
		 ([Private,Final,Static]
	)

happyReduce_9 = happySpecReduce_3  6 happyReduction_9
happyReduction_9 _
	_
	_
	 =  HappyAbsSyn6
		 ([Private,Static,Final]
	)

happyReduce_10 = happySpecReduce_1  6 happyReduction_10
happyReduction_10 _
	 =  HappyAbsSyn6
		 ([Public,Final]
	)

happyReduce_11 = happySpecReduce_2  6 happyReduction_11
happyReduction_11 _
	_
	 =  HappyAbsSyn6
		 ([Public,Final,Static]
	)

happyReduce_12 = happySpecReduce_2  6 happyReduction_12
happyReduction_12 _
	_
	 =  HappyAbsSyn6
		 ([Public,Static,Final]
	)

happyReduce_13 = happySpecReduce_2  7 happyReduction_13
happyReduction_13 _
	_
	 =  HappyAbsSyn7
		 ([Public,Static]
	)

happyReduce_14 = happySpecReduce_2  7 happyReduction_14
happyReduction_14 _
	_
	 =  HappyAbsSyn7
		 ([Private,Static]
	)

happyReduce_15 = happySpecReduce_1  7 happyReduction_15
happyReduction_15 _
	 =  HappyAbsSyn7
		 ([Public,Static]
	)

happyReduce_16 = happySpecReduce_1  8 happyReduction_16
happyReduction_16 _
	 =  HappyAbsSyn8
		 ([Public]
	)

happyReduce_17 = happySpecReduce_1  8 happyReduction_17
happyReduction_17 _
	 =  HappyAbsSyn8
		 ([Private]
	)

happyReduce_18 = happySpecReduce_0  8 happyReduction_18
happyReduction_18  =  HappyAbsSyn8
		 ([Public]
	)

happyReduce_19 = happySpecReduce_0  9 happyReduction_19
happyReduction_19  =  HappyAbsSyn9
		 ([]
	)

happyReduce_20 = happySpecReduce_2  9 happyReduction_20
happyReduction_20 (HappyAbsSyn9  happy_var_2)
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1:happy_var_2
	)
happyReduction_20 _ _  = notHappyAtAll 

happyReduce_21 = happyReduce 4 10 happyReduction_21
happyReduction_21 (_ `HappyStk`
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_3)) `HappyStk`
	(HappyAbsSyn16  happy_var_2) `HappyStk`
	(HappyAbsSyn6  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (F(FieldDecl (happy_var_1, happy_var_2, happy_var_3))
	) `HappyStk` happyRest

happyReduce_22 = happyReduce 4 10 happyReduction_22
happyReduction_22 (_ `HappyStk`
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_3)) `HappyStk`
	(HappyAbsSyn16  happy_var_2) `HappyStk`
	(HappyAbsSyn7  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (F(FieldDecl (happy_var_1, happy_var_2, happy_var_3))
	) `HappyStk` happyRest

happyReduce_23 = happyReduce 4 10 happyReduction_23
happyReduction_23 (_ `HappyStk`
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_3)) `HappyStk`
	(HappyAbsSyn16  happy_var_2) `HappyStk`
	(HappyAbsSyn8  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (F(FieldDecl (happy_var_1, happy_var_2, happy_var_3))
	) `HappyStk` happyRest

happyReduce_24 = happyReduce 9 10 happyReduction_24
happyReduction_24 (_ `HappyStk`
	(HappyAbsSyn11  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_3)) `HappyStk`
	(HappyAbsSyn16  happy_var_2) `HappyStk`
	(HappyAbsSyn7  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (M(Method(happy_var_1, happy_var_2, happy_var_3, happy_var_5, Block happy_var_8))
	) `HappyStk` happyRest

happyReduce_25 = happyReduce 9 10 happyReduction_25
happyReduction_25 (_ `HappyStk`
	(HappyAbsSyn11  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (M(Method(happy_var_1, "void", happy_var_3, happy_var_5, Block happy_var_8))
	) `HappyStk` happyRest

happyReduce_26 = happyReduce 9 10 happyReduction_26
happyReduction_26 (_ `HappyStk`
	(HappyAbsSyn11  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_3)) `HappyStk`
	(HappyAbsSyn16  happy_var_2) `HappyStk`
	(HappyAbsSyn8  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (M(Method(happy_var_1, happy_var_2, happy_var_3, happy_var_5, Block happy_var_8))
	) `HappyStk` happyRest

happyReduce_27 = happyReduce 9 10 happyReduction_27
happyReduction_27 (_ `HappyStk`
	(HappyAbsSyn11  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (M(Method(happy_var_1, "void", happy_var_3, happy_var_5, Block happy_var_8))
	) `HappyStk` happyRest

happyReduce_28 = happyReduce 8 10 happyReduction_28
happyReduction_28 (_ `HappyStk`
	(HappyAbsSyn11  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_2)) `HappyStk`
	(HappyAbsSyn8  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (M(Method(happy_var_1, "", happy_var_2, happy_var_4, Block happy_var_7))
	) `HappyStk` happyRest

happyReduce_29 = happySpecReduce_0  11 happyReduction_29
happyReduction_29  =  HappyAbsSyn11
		 ([]
	)

happyReduce_30 = happySpecReduce_2  11 happyReduction_30
happyReduction_30 (HappyAbsSyn11  happy_var_2)
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1:happy_var_2
	)
happyReduction_30 _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  12 happyReduction_31
happyReduction_31 _
	(HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn12
		 (Block happy_var_2
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_2  12 happyReduction_32
happyReduction_32 _
	_
	 =  HappyAbsSyn12
		 (Return Nothing
	)

happyReduce_33 = happySpecReduce_3  12 happyReduction_33
happyReduction_33 _
	(HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn12
		 (Return (Just (happy_var_2))
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happyReduce 7 12 happyReduction_34
happyReduction_34 (_ `HappyStk`
	(HappyAbsSyn11  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (While (happy_var_3, Block happy_var_6)
	) `HappyStk` happyRest

happyReduce_35 = happySpecReduce_3  12 happyReduction_35
happyReduction_35 _
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_2))
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn12
		 (LocalVarDecl (happy_var_1,happy_var_2)
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happyReduce 7 12 happyReduction_36
happyReduction_36 (_ `HappyStk`
	(HappyAbsSyn11  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (If (happy_var_3, Block happy_var_6, Nothing)
	) `HappyStk` happyRest

happyReduce_37 = happyReduce 11 12 happyReduction_37
happyReduction_37 (_ `HappyStk`
	(HappyAbsSyn11  happy_var_10) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (If (happy_var_3, Block happy_var_6, Just (Block happy_var_10))
	) `HappyStk` happyRest

happyReduce_38 = happySpecReduce_2  12 happyReduction_38
happyReduction_38 _
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn12
		 (StmtExprStmt happy_var_1
	)
happyReduction_38 _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_1  12 happyReduction_39
happyReduction_39 _
	 =  HappyAbsSyn12
		 (Empty
	)

happyReduce_40 = happySpecReduce_1  13 happyReduction_40
happyReduction_40 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn13
		 (happy_var_1
	)
happyReduction_40 _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_3  13 happyReduction_41
happyReduction_41 (HappyAbsSyn13  happy_var_3)
	(HappyAbsSyn24  happy_var_2)
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn13
		 (Binary (happy_var_2, happy_var_1, happy_var_3)
	)
happyReduction_41 _ _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_2  13 happyReduction_42
happyReduction_42 (HappyAbsSyn13  happy_var_2)
	(HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn13
		 (Unary (happy_var_1, happy_var_2)
	)
happyReduction_42 _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_1  14 happyReduction_43
happyReduction_43 _
	 =  HappyAbsSyn14
		 (This
	)

happyReduce_44 = happySpecReduce_1  14 happyReduction_44
happyReduction_44 (HappyTerminal (TOKEN_INTEGER_LITERAL happy_var_1))
	 =  HappyAbsSyn14
		 (Integer happy_var_1
	)
happyReduction_44 _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_1  14 happyReduction_45
happyReduction_45 (HappyTerminal (TOKEN_BOOL_LITERAL happy_var_1))
	 =  HappyAbsSyn14
		 (Bool happy_var_1
	)
happyReduction_45 _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_1  14 happyReduction_46
happyReduction_46 (HappyTerminal (TOKEN_CHAR_LITERAL happy_var_1))
	 =  HappyAbsSyn14
		 (Char happy_var_1
	)
happyReduction_46 _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_1  14 happyReduction_47
happyReduction_47 (HappyTerminal (TOKEN_STRING_LITERAL happy_var_1))
	 =  HappyAbsSyn14
		 (String happy_var_1
	)
happyReduction_47 _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_1  14 happyReduction_48
happyReduction_48 _
	 =  HappyAbsSyn14
		 (Jnull
	)

happyReduce_49 = happySpecReduce_1  14 happyReduction_49
happyReduction_49 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn14
		 (StmtExprExpr happy_var_1
	)
happyReduction_49 _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_1  14 happyReduction_50
happyReduction_50 (HappyTerminal (TOKEN_BEZEICHNER happy_var_1))
	 =  HappyAbsSyn14
		 (LocalOrFieldVar happy_var_1
	)
happyReduction_50 _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_3  14 happyReduction_51
happyReduction_51 (HappyTerminal (TOKEN_BEZEICHNER happy_var_3))
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn14
		 (InstVar (happy_var_1, happy_var_3)
	)
happyReduction_51 _ _ _  = notHappyAtAll 

happyReduce_52 = happySpecReduce_3  15 happyReduction_52
happyReduction_52 (HappyAbsSyn20  happy_var_3)
	_
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_1))
	 =  HappyAbsSyn15
		 (Assign(LocalOrFieldVar happy_var_1,happy_var_3)
	)
happyReduction_52 _ _ _  = notHappyAtAll 

happyReduce_53 = happyReduce 5 15 happyReduction_53
happyReduction_53 (_ `HappyStk`
	(HappyAbsSyn21  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (New (happy_var_2, happy_var_4)
	) `HappyStk` happyRest

happyReduce_54 = happyReduce 6 15 happyReduction_54
happyReduction_54 (_ `HappyStk`
	(HappyAbsSyn21  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (MethodCall (happy_var_1, happy_var_3, happy_var_5)
	) `HappyStk` happyRest

happyReduce_55 = happySpecReduce_1  16 happyReduction_55
happyReduction_55 _
	 =  HappyAbsSyn16
		 ("int"
	)

happyReduce_56 = happySpecReduce_1  16 happyReduction_56
happyReduction_56 _
	 =  HappyAbsSyn16
		 ("char"
	)

happyReduce_57 = happySpecReduce_1  16 happyReduction_57
happyReduction_57 _
	 =  HappyAbsSyn16
		 ("boolean"
	)

happyReduce_58 = happySpecReduce_1  16 happyReduction_58
happyReduction_58 (HappyTerminal (TOKEN_BEZEICHNER happy_var_1))
	 =  HappyAbsSyn16
		 (happy_var_1
	)
happyReduction_58 _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_0  17 happyReduction_59
happyReduction_59  =  HappyAbsSyn17
		 ([]
	)

happyReduce_60 = happySpecReduce_1  17 happyReduction_60
happyReduction_60 (HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1
	)
happyReduction_60 _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_1  18 happyReduction_61
happyReduction_61 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn18
		 (happy_var_1:[]
	)
happyReduction_61 _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_3  18 happyReduction_62
happyReduction_62 (HappyAbsSyn18  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn18
		 (happy_var_1:happy_var_3
	)
happyReduction_62 _ _ _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_2  19 happyReduction_63
happyReduction_63 (HappyTerminal (TOKEN_BEZEICHNER happy_var_2))
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn19
		 (happy_var_1, happy_var_2
	)
happyReduction_63 _ _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_1  20 happyReduction_64
happyReduction_64 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn20
		 (happy_var_1
	)
happyReduction_64 _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_0  21 happyReduction_65
happyReduction_65  =  HappyAbsSyn21
		 ([]
	)

happyReduce_66 = happySpecReduce_1  21 happyReduction_66
happyReduction_66 (HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn21
		 (happy_var_1
	)
happyReduction_66 _  = notHappyAtAll 

happyReduce_67 = happySpecReduce_1  22 happyReduction_67
happyReduction_67 (HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn22
		 (happy_var_1:[]
	)
happyReduction_67 _  = notHappyAtAll 

happyReduce_68 = happySpecReduce_3  22 happyReduction_68
happyReduction_68 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn22
		 (happy_var_1:happy_var_3
	)
happyReduction_68 _ _ _  = notHappyAtAll 

happyReduce_69 = happySpecReduce_1  23 happyReduction_69
happyReduction_69 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn23
		 (happy_var_1
	)
happyReduction_69 _  = notHappyAtAll 

happyReduce_70 = happySpecReduce_1  24 happyReduction_70
happyReduction_70 _
	 =  HappyAbsSyn24
		 (Equals
	)

happyReduce_71 = happySpecReduce_1  24 happyReduction_71
happyReduction_71 _
	 =  HappyAbsSyn24
		 (LessT
	)

happyReduce_72 = happySpecReduce_1  24 happyReduction_72
happyReduction_72 _
	 =  HappyAbsSyn24
		 (GreaterT
	)

happyReduce_73 = happySpecReduce_1  24 happyReduction_73
happyReduction_73 _
	 =  HappyAbsSyn24
		 (GE
	)

happyReduce_74 = happySpecReduce_1  24 happyReduction_74
happyReduction_74 _
	 =  HappyAbsSyn24
		 (LE
	)

happyReduce_75 = happySpecReduce_1  24 happyReduction_75
happyReduction_75 _
	 =  HappyAbsSyn24
		 (Mult
	)

happyReduce_76 = happySpecReduce_1  24 happyReduction_76
happyReduction_76 _
	 =  HappyAbsSyn24
		 (Div
	)

happyReduce_77 = happySpecReduce_1  24 happyReduction_77
happyReduction_77 _
	 =  HappyAbsSyn24
		 (Modulo
	)

happyReduce_78 = happySpecReduce_1  24 happyReduction_78
happyReduction_78 _
	 =  HappyAbsSyn24
		 (AND
	)

happyReduce_79 = happySpecReduce_1  24 happyReduction_79
happyReduction_79 _
	 =  HappyAbsSyn24
		 (OR
	)

happyReduce_80 = happySpecReduce_1  24 happyReduction_80
happyReduction_80 _
	 =  HappyAbsSyn24
		 (BitwiseOR
	)

happyReduce_81 = happySpecReduce_1  24 happyReduction_81
happyReduction_81 _
	 =  HappyAbsSyn24
		 (BitwiseAND
	)

happyReduce_82 = happySpecReduce_1  24 happyReduction_82
happyReduction_82 _
	 =  HappyAbsSyn24
		 (Plus
	)

happyReduce_83 = happySpecReduce_1  24 happyReduction_83
happyReduction_83 _
	 =  HappyAbsSyn24
		 (Minus
	)

happyReduce_84 = happySpecReduce_1  25 happyReduction_84
happyReduction_84 _
	 =  HappyAbsSyn25
		 (Negation
	)

happyReduce_85 = happySpecReduce_1  25 happyReduction_85
happyReduction_85 _
	 =  HappyAbsSyn25
		 (Positiv
	)

happyReduce_86 = happySpecReduce_1  25 happyReduction_86
happyReduction_86 _
	 =  HappyAbsSyn25
		 (Negativ
	)

happyNewToken action sts stk [] =
	action 70 70 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TOKEN_KLASSE -> cont 26;
	TOKEN_BEZEICHNER happy_dollar_dollar -> cont 27;
	TOKEN_WHILE -> cont 28;
	TOKEN_IF -> cont 29;
	TOKEN_ELSE -> cont 30;
	TOKEN_ZUWEISUNG -> cont 31;
	TOKEN_SEMIKOLON -> cont 32;
	TOKEN_KLAZU_GESCH -> cont 33;
	TOKEN_KLAAUF_GESCH -> cont 34;
	TOKEN_KLAAUF_RUND -> cont 35;
	TOKEN_KLAZU_RUND -> cont 36;
	TOKEN_GETEILT -> cont 37;
	TOKEN_MAL -> cont 38;
	TOKEN_PLUS -> cont 39;
	TOKEN_MINUS -> cont 40;
	TOKEN_MODULO -> cont 41;
	TOKEN_AND -> cont 42;
	TOKEN_OR -> cont 43;
	TOKEN_BITOR -> cont 44;
	TOKEN_BITAND -> cont 45;
	TOKEN_STRING_LITERAL happy_dollar_dollar -> cont 46;
	TOKEN_INTEGER -> cont 47;
	TOKEN_INTEGER_LITERAL happy_dollar_dollar -> cont 48;
	TOKEN_CHAR -> cont 49;
	TOKEN_CHAR_LITERAL happy_dollar_dollar -> cont 50;
	TOKEN_PUBLIC -> cont 51;
	TOKEN_PRIVATE -> cont 52;
	TOKEN_STATIC -> cont 53;
	TOKEN_FINAL -> cont 54;
	TOKEN_VOID -> cont 55;
	TOKEN_NEW -> cont 56;
	TOKEN_RETURN -> cont 57;
	TOKEN_AKZESSOR -> cont 58;
	TOKEN_BOOL -> cont 59;
	TOKEN_BOOL_LITERAL happy_dollar_dollar -> cont 60;
	TOKEN_VERGLEICH -> cont 61;
	TOKEN_GROESSER -> cont 62;
	TOKEN_KLEINER -> cont 63;
	TOKEN_GROESSER_GLEICH -> cont 64;
	TOKEN_KLEINER_GLEICH -> cont 65;
	TOKEN_NULL -> cont 66;
	TOKEN_NOT -> cont 67;
	TOKEN_KOMMA -> cont 68;
	TOKEN_THIS -> cont 69;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 70 tk tks = happyError' (tks, explist)
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
parseError _ = error "Parse error!"

parser :: String -> Class
parser =  defaultConst . hybridClassToClass . classPars . scan

testparse:: String -> ClassHybrid
testparse = classPars . scan

hybridClassToClass:: ClassHybrid -> Class
hybridClassToClass (ClassHybrid(modi, name, methOrAttri)) = Class(modi, name, getAttris methOrAttri, getKonst methOrAttri, getMethod methOrAttri)

defaultConst :: Class -> Class
defaultConst (Class(modi, name, fields, [], meth)) = Class(modi, name, fields, [Method([Public], "", name, [], Block [])], meth)
defaultConst c = c

getAttris:: [FieldOrMethod] -> [FieldDecl]
getAttris [] = []
getAttris ((F f):x) = f : (getAttris x)
getAttris (y:x) = getAttris x

getKonst:: [FieldOrMethod] -> [MethodDecl]
getKonst [] = []
getKonst (M (Method(m, "", kname, args, stmt)):x) = (Method(m, "", kname, args, stmt)) : (getKonst x)
getKonst (y:x) = getKonst x

getMethod:: [FieldOrMethod] -> [MethodDecl]
getMethod [] = []
getMethod (M (Method(m, typ, kname, args, stmt)):x) 
        | typ /= "" = (Method(m, typ, kname, args, stmt)) : (getMethod x)
        | otherwise = getMethod x
getMethod (y:x) = getMethod x

main = do
  s <- getContents
  print (scan s)
--  print (parser s)
  print (testparse s)
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
