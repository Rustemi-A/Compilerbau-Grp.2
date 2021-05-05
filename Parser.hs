{-# OPTIONS_GHC -w #-}
module Parser (parser) where
import AbstrakteSyntax
import Scanner
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26 t27 t28 t29
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

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,345) ([0,0,0,64,0,0,0,0,1,0,0,2,0,0,0,0,0,128,0,0,0,0,0,0,0,0,0,0,0,1024,0,0,0,0,2048,0,0,0,0,0,0,0,0,256,20480,256,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,48,0,0,0,49152,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,1,0,0,0,0,0,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,512,0,0,0,0,0,0,0,0,256,20480,272,0,0,256,0,0,0,0,0,48,0,0,0,0,1,0,0,0,1024,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,256,20480,256,0,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,1,0,0,0,0,0,0,0,0,4096,0,0,0,0,64,0,0,0,256,0,0,0,0,2048,0,0,0,0,0,0,0,0,0,0,32768,0,0,1,80,1,0,0,2,0,0,0,0,0,0,0,16384,0,16404,0,0,256,20480,256,0,0,2048,0,0,0,0,32,0,0,0,10688,15884,24792,1,0,0,0,0,0,0,1,0,0,0,2672,3971,22582,0,0,0,8192,0,0,0,0,0,0,0,128,0,0,0,4096,0,0,0,0,64,10764,24712,1,0,16,0,0,0,0,4,0,0,0,4096,0,0,0,0,0,0,0,0,42752,63536,33632,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16,0,0,0,16384,3080,34858,352,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,128,0,0,0,0,2,0,0,0,2672,3971,22582,0,49152,3113,55358,352,0,8192,0,128,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,256,0,0,0,0,1,0,0,0,16,2691,22562,0,16384,3072,34858,352,0,256,43056,33312,5,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,12289,8360,1410,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,0,0,4096,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,0,32,0,0,512,32768,0,0,0,0,0,0,0,16,2691,22562,0,0,0,0,0,0,16384,0,0,0,0,256,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,0,0,0,8,0,0,0,0,0,0,0,0,0,0,128,0,32768,0,0,0,0,512,0,0,0,4096,33536,8714,88,0,32768,0,0,0,0,12455,24824,1411,0,39936,57538,3459,22,0,16,2691,22562,0,0,0,0,0,0,0,0,0,0,0,256,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,8192,0,0,0,0,2048,0,0,0,49152,3113,55358,352,0,16384,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_classPars","classPars","classModifier","attriModifier","methodModifier","konstModifier","methoden","methode","attribute","attribut","konstruktoren","konstruktor","statements","statement","expression","expressionCore","stmtExpr","typ","methodDeclParams","methodDeclParamss","methodDeclParam","literal","params","paramss","param","binaryOp","unaryOp","Klasse","Bezeichner","While","If","Else","Zuweisung","Semikolon","Klazu_Gesch","Klaauf_Gesch","Klaauf_Rund","Klazu_Rund","Geteilt","Mal","Plu","Minu","Modul","An","O","BitOR","BitAND","String_Literal","Integer","Integer_Literal","Char","Char_Literal","Pub","Priv","Stat","Fin","Void","Neww","Return","Akzessor","Bool","Bool_Literal","Vergleich","Groesser","Kleiner","Groesser_Gleich","Kleiner_Gleich","Null","Not","Komma","Thi","%eof"]
        bit_start = st Prelude.* 74
        bit_end = (st Prelude.+ 1) Prelude.* 74
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..73]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (55) = happyShift action_3
action_0 (4) = happyGoto action_4
action_0 (5) = happyGoto action_2
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (55) = happyShift action_3
action_1 (5) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (30) = happyShift action_6
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (58) = happyShift action_5
action_3 _ = happyReduce_2

action_4 (74) = happyAccept
action_4 _ = happyFail (happyExpListPerState 4)

action_5 _ = happyReduce_3

action_6 (31) = happyShift action_7
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (38) = happyShift action_8
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (31) = happyReduce_19
action_8 (51) = happyReduce_19
action_8 (53) = happyReduce_19
action_8 (55) = happyShift action_14
action_8 (56) = happyShift action_15
action_8 (63) = happyReduce_19
action_8 (6) = happyGoto action_9
action_8 (7) = happyGoto action_10
action_8 (8) = happyGoto action_11
action_8 (11) = happyGoto action_12
action_8 (12) = happyGoto action_13
action_8 _ = happyReduce_19

action_9 (31) = happyShift action_27
action_9 (51) = happyShift action_28
action_9 (53) = happyShift action_29
action_9 (63) = happyShift action_30
action_9 (20) = happyGoto action_26
action_9 _ = happyFail (happyExpListPerState 9)

action_10 _ = happyReduce_4

action_11 _ = happyReduce_9

action_12 (31) = happyReduce_22
action_12 (55) = happyShift action_24
action_12 (56) = happyShift action_25
action_12 (8) = happyGoto action_21
action_12 (13) = happyGoto action_22
action_12 (14) = happyGoto action_23
action_12 _ = happyReduce_22

action_13 (31) = happyReduce_19
action_13 (51) = happyReduce_19
action_13 (53) = happyReduce_19
action_13 (55) = happyShift action_14
action_13 (56) = happyShift action_15
action_13 (63) = happyReduce_19
action_13 (6) = happyGoto action_9
action_13 (7) = happyGoto action_10
action_13 (8) = happyGoto action_11
action_13 (11) = happyGoto action_20
action_13 (12) = happyGoto action_13
action_13 _ = happyReduce_19

action_14 (57) = happyShift action_18
action_14 (58) = happyShift action_19
action_14 _ = happyReduce_12

action_15 (57) = happyShift action_16
action_15 (58) = happyShift action_17
action_15 _ = happyReduce_13

action_16 _ = happyReduce_11

action_17 (57) = happyShift action_40
action_17 _ = happyReduce_7

action_18 _ = happyReduce_10

action_19 (57) = happyShift action_39
action_19 _ = happyReduce_5

action_20 _ = happyReduce_20

action_21 (31) = happyShift action_38
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (37) = happyReduce_15
action_22 (55) = happyShift action_36
action_22 (56) = happyShift action_37
action_22 (7) = happyGoto action_33
action_22 (8) = happyGoto action_11
action_22 (9) = happyGoto action_34
action_22 (10) = happyGoto action_35
action_22 _ = happyReduce_14

action_23 (31) = happyReduce_22
action_23 (55) = happyShift action_24
action_23 (56) = happyShift action_25
action_23 (8) = happyGoto action_21
action_23 (13) = happyGoto action_32
action_23 (14) = happyGoto action_23
action_23 _ = happyReduce_22

action_24 _ = happyReduce_12

action_25 _ = happyReduce_13

action_26 (31) = happyShift action_31
action_26 _ = happyFail (happyExpListPerState 26)

action_27 _ = happyReduce_54

action_28 _ = happyReduce_51

action_29 _ = happyReduce_52

action_30 _ = happyReduce_53

action_31 (36) = happyShift action_46
action_31 _ = happyFail (happyExpListPerState 31)

action_32 _ = happyReduce_23

action_33 (31) = happyShift action_27
action_33 (51) = happyShift action_28
action_33 (53) = happyShift action_29
action_33 (59) = happyShift action_45
action_33 (63) = happyShift action_30
action_33 (20) = happyGoto action_44
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (37) = happyShift action_43
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (37) = happyReduce_15
action_35 (55) = happyShift action_36
action_35 (56) = happyShift action_37
action_35 (7) = happyGoto action_33
action_35 (8) = happyGoto action_11
action_35 (9) = happyGoto action_42
action_35 (10) = happyGoto action_35
action_35 _ = happyReduce_14

action_36 (57) = happyShift action_18
action_36 _ = happyReduce_12

action_37 (57) = happyShift action_16
action_37 _ = happyReduce_13

action_38 (39) = happyShift action_41
action_38 _ = happyFail (happyExpListPerState 38)

action_39 _ = happyReduce_6

action_40 _ = happyReduce_8

action_41 (31) = happyShift action_27
action_41 (51) = happyShift action_28
action_41 (53) = happyShift action_29
action_41 (63) = happyShift action_30
action_41 (20) = happyGoto action_49
action_41 (21) = happyGoto action_50
action_41 (22) = happyGoto action_51
action_41 (23) = happyGoto action_52
action_41 _ = happyReduce_55

action_42 _ = happyReduce_16

action_43 _ = happyReduce_1

action_44 (31) = happyShift action_48
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (31) = happyShift action_47
action_45 _ = happyFail (happyExpListPerState 45)

action_46 _ = happyReduce_21

action_47 (39) = happyShift action_57
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (39) = happyShift action_56
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (31) = happyShift action_55
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (40) = happyShift action_54
action_50 _ = happyFail (happyExpListPerState 50)

action_51 _ = happyReduce_56

action_52 (72) = happyShift action_53
action_52 _ = happyReduce_57

action_53 (31) = happyShift action_27
action_53 (51) = happyShift action_28
action_53 (53) = happyShift action_29
action_53 (63) = happyShift action_30
action_53 (20) = happyGoto action_49
action_53 (22) = happyGoto action_61
action_53 (23) = happyGoto action_52
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (38) = happyShift action_60
action_54 _ = happyFail (happyExpListPerState 54)

action_55 _ = happyReduce_59

action_56 (31) = happyShift action_27
action_56 (51) = happyShift action_28
action_56 (53) = happyShift action_29
action_56 (63) = happyShift action_30
action_56 (20) = happyGoto action_49
action_56 (21) = happyGoto action_59
action_56 (22) = happyGoto action_51
action_56 (23) = happyGoto action_52
action_56 _ = happyReduce_55

action_57 (31) = happyShift action_27
action_57 (51) = happyShift action_28
action_57 (53) = happyShift action_29
action_57 (63) = happyShift action_30
action_57 (20) = happyGoto action_49
action_57 (21) = happyGoto action_58
action_57 (22) = happyGoto action_51
action_57 (23) = happyGoto action_52
action_57 _ = happyReduce_55

action_58 (40) = happyShift action_86
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (40) = happyShift action_85
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (31) = happyShift action_69
action_60 (32) = happyShift action_70
action_60 (33) = happyShift action_71
action_60 (36) = happyShift action_72
action_60 (38) = happyShift action_73
action_60 (43) = happyShift action_74
action_60 (44) = happyShift action_75
action_60 (50) = happyShift action_76
action_60 (51) = happyShift action_28
action_60 (52) = happyShift action_77
action_60 (53) = happyShift action_29
action_60 (54) = happyShift action_78
action_60 (60) = happyShift action_79
action_60 (61) = happyShift action_80
action_60 (63) = happyShift action_30
action_60 (64) = happyShift action_81
action_60 (70) = happyShift action_82
action_60 (71) = happyShift action_83
action_60 (73) = happyShift action_84
action_60 (15) = happyGoto action_62
action_60 (16) = happyGoto action_63
action_60 (17) = happyGoto action_64
action_60 (18) = happyGoto action_65
action_60 (19) = happyGoto action_66
action_60 (20) = happyGoto action_67
action_60 (29) = happyGoto action_68
action_60 _ = happyReduce_25

action_61 _ = happyReduce_58

action_62 (37) = happyShift action_118
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (31) = happyShift action_69
action_63 (32) = happyShift action_70
action_63 (33) = happyShift action_71
action_63 (36) = happyShift action_72
action_63 (38) = happyShift action_73
action_63 (43) = happyShift action_74
action_63 (44) = happyShift action_75
action_63 (50) = happyShift action_76
action_63 (51) = happyShift action_28
action_63 (52) = happyShift action_77
action_63 (53) = happyShift action_29
action_63 (54) = happyShift action_78
action_63 (60) = happyShift action_79
action_63 (61) = happyShift action_80
action_63 (63) = happyShift action_30
action_63 (64) = happyShift action_81
action_63 (70) = happyShift action_82
action_63 (71) = happyShift action_83
action_63 (73) = happyShift action_84
action_63 (15) = happyGoto action_117
action_63 (16) = happyGoto action_63
action_63 (17) = happyGoto action_64
action_63 (18) = happyGoto action_65
action_63 (19) = happyGoto action_66
action_63 (20) = happyGoto action_67
action_63 (29) = happyGoto action_68
action_63 _ = happyReduce_25

action_64 (62) = happyShift action_116
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (41) = happyShift action_102
action_65 (42) = happyShift action_103
action_65 (43) = happyShift action_104
action_65 (44) = happyShift action_105
action_65 (45) = happyShift action_106
action_65 (46) = happyShift action_107
action_65 (47) = happyShift action_108
action_65 (48) = happyShift action_109
action_65 (49) = happyShift action_110
action_65 (65) = happyShift action_111
action_65 (66) = happyShift action_112
action_65 (67) = happyShift action_113
action_65 (68) = happyShift action_114
action_65 (69) = happyShift action_115
action_65 (28) = happyGoto action_101
action_65 _ = happyReduce_36

action_66 (36) = happyShift action_100
action_66 _ = happyReduce_45

action_67 (31) = happyShift action_99
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (31) = happyShift action_91
action_68 (43) = happyShift action_74
action_68 (44) = happyShift action_75
action_68 (50) = happyShift action_76
action_68 (52) = happyShift action_77
action_68 (54) = happyShift action_78
action_68 (60) = happyShift action_79
action_68 (64) = happyShift action_81
action_68 (70) = happyShift action_82
action_68 (71) = happyShift action_83
action_68 (73) = happyShift action_84
action_68 (17) = happyGoto action_98
action_68 (18) = happyGoto action_65
action_68 (19) = happyGoto action_90
action_68 (29) = happyGoto action_68
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (35) = happyShift action_97
action_69 (41) = happyReduce_46
action_69 (42) = happyReduce_46
action_69 (43) = happyReduce_46
action_69 (44) = happyReduce_46
action_69 (45) = happyReduce_46
action_69 (46) = happyReduce_46
action_69 (47) = happyReduce_46
action_69 (48) = happyReduce_46
action_69 (49) = happyReduce_46
action_69 (62) = happyReduce_46
action_69 (65) = happyReduce_46
action_69 (66) = happyReduce_46
action_69 (67) = happyReduce_46
action_69 (68) = happyReduce_46
action_69 (69) = happyReduce_46
action_69 _ = happyReduce_54

action_70 (39) = happyShift action_96
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (39) = happyShift action_95
action_71 _ = happyFail (happyExpListPerState 71)

action_72 _ = happyReduce_35

action_73 (31) = happyShift action_69
action_73 (32) = happyShift action_70
action_73 (33) = happyShift action_71
action_73 (36) = happyShift action_72
action_73 (38) = happyShift action_73
action_73 (43) = happyShift action_74
action_73 (44) = happyShift action_75
action_73 (50) = happyShift action_76
action_73 (51) = happyShift action_28
action_73 (52) = happyShift action_77
action_73 (53) = happyShift action_29
action_73 (54) = happyShift action_78
action_73 (60) = happyShift action_79
action_73 (61) = happyShift action_80
action_73 (63) = happyShift action_30
action_73 (64) = happyShift action_81
action_73 (70) = happyShift action_82
action_73 (71) = happyShift action_83
action_73 (73) = happyShift action_84
action_73 (15) = happyGoto action_94
action_73 (16) = happyGoto action_63
action_73 (17) = happyGoto action_64
action_73 (18) = happyGoto action_65
action_73 (19) = happyGoto action_66
action_73 (20) = happyGoto action_67
action_73 (29) = happyGoto action_68
action_73 _ = happyReduce_25

action_74 _ = happyReduce_81

action_75 _ = happyReduce_82

action_76 _ = happyReduce_43

action_77 _ = happyReduce_40

action_78 _ = happyReduce_42

action_79 (31) = happyShift action_93
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (31) = happyShift action_91
action_80 (36) = happyShift action_92
action_80 (43) = happyShift action_74
action_80 (44) = happyShift action_75
action_80 (50) = happyShift action_76
action_80 (52) = happyShift action_77
action_80 (54) = happyShift action_78
action_80 (60) = happyShift action_79
action_80 (64) = happyShift action_81
action_80 (70) = happyShift action_82
action_80 (71) = happyShift action_83
action_80 (73) = happyShift action_84
action_80 (17) = happyGoto action_89
action_80 (18) = happyGoto action_65
action_80 (19) = happyGoto action_90
action_80 (29) = happyGoto action_68
action_80 _ = happyFail (happyExpListPerState 80)

action_81 _ = happyReduce_41

action_82 _ = happyReduce_44

action_83 _ = happyReduce_80

action_84 _ = happyReduce_39

action_85 (38) = happyShift action_88
action_85 _ = happyFail (happyExpListPerState 85)

action_86 (38) = happyShift action_87
action_86 _ = happyFail (happyExpListPerState 86)

action_87 (31) = happyShift action_69
action_87 (32) = happyShift action_70
action_87 (33) = happyShift action_71
action_87 (36) = happyShift action_72
action_87 (38) = happyShift action_73
action_87 (43) = happyShift action_74
action_87 (44) = happyShift action_75
action_87 (50) = happyShift action_76
action_87 (51) = happyShift action_28
action_87 (52) = happyShift action_77
action_87 (53) = happyShift action_29
action_87 (54) = happyShift action_78
action_87 (60) = happyShift action_79
action_87 (61) = happyShift action_80
action_87 (63) = happyShift action_30
action_87 (64) = happyShift action_81
action_87 (70) = happyShift action_82
action_87 (71) = happyShift action_83
action_87 (73) = happyShift action_84
action_87 (15) = happyGoto action_130
action_87 (16) = happyGoto action_63
action_87 (17) = happyGoto action_64
action_87 (18) = happyGoto action_65
action_87 (19) = happyGoto action_66
action_87 (20) = happyGoto action_67
action_87 (29) = happyGoto action_68
action_87 _ = happyReduce_25

action_88 (31) = happyShift action_69
action_88 (32) = happyShift action_70
action_88 (33) = happyShift action_71
action_88 (36) = happyShift action_72
action_88 (38) = happyShift action_73
action_88 (43) = happyShift action_74
action_88 (44) = happyShift action_75
action_88 (50) = happyShift action_76
action_88 (51) = happyShift action_28
action_88 (52) = happyShift action_77
action_88 (53) = happyShift action_29
action_88 (54) = happyShift action_78
action_88 (60) = happyShift action_79
action_88 (61) = happyShift action_80
action_88 (63) = happyShift action_30
action_88 (64) = happyShift action_81
action_88 (70) = happyShift action_82
action_88 (71) = happyShift action_83
action_88 (73) = happyShift action_84
action_88 (15) = happyGoto action_129
action_88 (16) = happyGoto action_63
action_88 (17) = happyGoto action_64
action_88 (18) = happyGoto action_65
action_88 (19) = happyGoto action_66
action_88 (20) = happyGoto action_67
action_88 (29) = happyGoto action_68
action_88 _ = happyReduce_25

action_89 (36) = happyShift action_128
action_89 (62) = happyShift action_116
action_89 _ = happyFail (happyExpListPerState 89)

action_90 _ = happyReduce_45

action_91 (35) = happyShift action_97
action_91 _ = happyReduce_46

action_92 _ = happyReduce_28

action_93 (39) = happyShift action_127
action_93 _ = happyFail (happyExpListPerState 93)

action_94 (37) = happyShift action_126
action_94 _ = happyFail (happyExpListPerState 94)

action_95 (31) = happyShift action_91
action_95 (43) = happyShift action_74
action_95 (44) = happyShift action_75
action_95 (50) = happyShift action_76
action_95 (52) = happyShift action_77
action_95 (54) = happyShift action_78
action_95 (60) = happyShift action_79
action_95 (64) = happyShift action_81
action_95 (70) = happyShift action_82
action_95 (71) = happyShift action_83
action_95 (73) = happyShift action_84
action_95 (17) = happyGoto action_125
action_95 (18) = happyGoto action_65
action_95 (19) = happyGoto action_90
action_95 (29) = happyGoto action_68
action_95 _ = happyFail (happyExpListPerState 95)

action_96 (31) = happyShift action_91
action_96 (43) = happyShift action_74
action_96 (44) = happyShift action_75
action_96 (50) = happyShift action_76
action_96 (52) = happyShift action_77
action_96 (54) = happyShift action_78
action_96 (60) = happyShift action_79
action_96 (64) = happyShift action_81
action_96 (70) = happyShift action_82
action_96 (71) = happyShift action_83
action_96 (73) = happyShift action_84
action_96 (17) = happyGoto action_124
action_96 (18) = happyGoto action_65
action_96 (19) = happyGoto action_90
action_96 (29) = happyGoto action_68
action_96 _ = happyFail (happyExpListPerState 96)

action_97 (31) = happyShift action_91
action_97 (43) = happyShift action_74
action_97 (44) = happyShift action_75
action_97 (50) = happyShift action_76
action_97 (52) = happyShift action_77
action_97 (54) = happyShift action_78
action_97 (60) = happyShift action_79
action_97 (64) = happyShift action_81
action_97 (70) = happyShift action_82
action_97 (71) = happyShift action_83
action_97 (73) = happyShift action_84
action_97 (17) = happyGoto action_122
action_97 (18) = happyGoto action_65
action_97 (19) = happyGoto action_90
action_97 (24) = happyGoto action_123
action_97 (29) = happyGoto action_68
action_97 _ = happyFail (happyExpListPerState 97)

action_98 (62) = happyShift action_116
action_98 _ = happyReduce_38

action_99 (36) = happyShift action_121
action_99 _ = happyFail (happyExpListPerState 99)

action_100 _ = happyReduce_34

action_101 (31) = happyShift action_91
action_101 (43) = happyShift action_74
action_101 (44) = happyShift action_75
action_101 (50) = happyShift action_76
action_101 (52) = happyShift action_77
action_101 (54) = happyShift action_78
action_101 (60) = happyShift action_79
action_101 (64) = happyShift action_81
action_101 (70) = happyShift action_82
action_101 (71) = happyShift action_83
action_101 (73) = happyShift action_84
action_101 (17) = happyGoto action_120
action_101 (18) = happyGoto action_65
action_101 (19) = happyGoto action_90
action_101 (29) = happyGoto action_68
action_101 _ = happyFail (happyExpListPerState 101)

action_102 _ = happyReduce_72

action_103 _ = happyReduce_71

action_104 _ = happyReduce_78

action_105 _ = happyReduce_79

action_106 _ = happyReduce_73

action_107 _ = happyReduce_74

action_108 _ = happyReduce_75

action_109 _ = happyReduce_76

action_110 _ = happyReduce_77

action_111 _ = happyReduce_66

action_112 _ = happyReduce_68

action_113 _ = happyReduce_67

action_114 _ = happyReduce_69

action_115 _ = happyReduce_70

action_116 (31) = happyShift action_119
action_116 _ = happyFail (happyExpListPerState 116)

action_117 _ = happyReduce_26

action_118 _ = happyReduce_24

action_119 (39) = happyShift action_139
action_119 _ = happyReduce_47

action_120 (62) = happyShift action_116
action_120 _ = happyReduce_37

action_121 _ = happyReduce_31

action_122 (62) = happyShift action_116
action_122 _ = happyReduce_60

action_123 _ = happyReduce_48

action_124 (40) = happyShift action_138
action_124 (62) = happyShift action_116
action_124 _ = happyFail (happyExpListPerState 124)

action_125 (40) = happyShift action_137
action_125 (62) = happyShift action_116
action_125 _ = happyFail (happyExpListPerState 125)

action_126 _ = happyReduce_27

action_127 (31) = happyShift action_91
action_127 (43) = happyShift action_74
action_127 (44) = happyShift action_75
action_127 (50) = happyShift action_76
action_127 (52) = happyShift action_77
action_127 (54) = happyShift action_78
action_127 (60) = happyShift action_79
action_127 (64) = happyShift action_81
action_127 (70) = happyShift action_82
action_127 (71) = happyShift action_83
action_127 (73) = happyShift action_84
action_127 (17) = happyGoto action_133
action_127 (18) = happyGoto action_65
action_127 (19) = happyGoto action_90
action_127 (25) = happyGoto action_134
action_127 (26) = happyGoto action_135
action_127 (27) = happyGoto action_136
action_127 (29) = happyGoto action_68
action_127 _ = happyReduce_61

action_128 _ = happyReduce_29

action_129 (37) = happyShift action_132
action_129 _ = happyFail (happyExpListPerState 129)

action_130 (37) = happyShift action_131
action_130 _ = happyFail (happyExpListPerState 130)

action_131 _ = happyReduce_18

action_132 _ = happyReduce_17

action_133 (62) = happyShift action_116
action_133 _ = happyReduce_65

action_134 (40) = happyShift action_144
action_134 _ = happyFail (happyExpListPerState 134)

action_135 _ = happyReduce_62

action_136 (72) = happyShift action_143
action_136 _ = happyReduce_63

action_137 (38) = happyShift action_142
action_137 _ = happyFail (happyExpListPerState 137)

action_138 (38) = happyShift action_141
action_138 _ = happyFail (happyExpListPerState 138)

action_139 (31) = happyShift action_91
action_139 (43) = happyShift action_74
action_139 (44) = happyShift action_75
action_139 (50) = happyShift action_76
action_139 (52) = happyShift action_77
action_139 (54) = happyShift action_78
action_139 (60) = happyShift action_79
action_139 (64) = happyShift action_81
action_139 (70) = happyShift action_82
action_139 (71) = happyShift action_83
action_139 (73) = happyShift action_84
action_139 (17) = happyGoto action_133
action_139 (18) = happyGoto action_65
action_139 (19) = happyGoto action_90
action_139 (25) = happyGoto action_140
action_139 (26) = happyGoto action_135
action_139 (27) = happyGoto action_136
action_139 (29) = happyGoto action_68
action_139 _ = happyReduce_61

action_140 (40) = happyShift action_148
action_140 _ = happyFail (happyExpListPerState 140)

action_141 (31) = happyShift action_69
action_141 (32) = happyShift action_70
action_141 (33) = happyShift action_71
action_141 (36) = happyShift action_72
action_141 (38) = happyShift action_73
action_141 (43) = happyShift action_74
action_141 (44) = happyShift action_75
action_141 (50) = happyShift action_76
action_141 (51) = happyShift action_28
action_141 (52) = happyShift action_77
action_141 (53) = happyShift action_29
action_141 (54) = happyShift action_78
action_141 (60) = happyShift action_79
action_141 (61) = happyShift action_80
action_141 (63) = happyShift action_30
action_141 (64) = happyShift action_81
action_141 (70) = happyShift action_82
action_141 (71) = happyShift action_83
action_141 (73) = happyShift action_84
action_141 (15) = happyGoto action_147
action_141 (16) = happyGoto action_63
action_141 (17) = happyGoto action_64
action_141 (18) = happyGoto action_65
action_141 (19) = happyGoto action_66
action_141 (20) = happyGoto action_67
action_141 (29) = happyGoto action_68
action_141 _ = happyReduce_25

action_142 (31) = happyShift action_69
action_142 (32) = happyShift action_70
action_142 (33) = happyShift action_71
action_142 (36) = happyShift action_72
action_142 (38) = happyShift action_73
action_142 (43) = happyShift action_74
action_142 (44) = happyShift action_75
action_142 (50) = happyShift action_76
action_142 (51) = happyShift action_28
action_142 (52) = happyShift action_77
action_142 (53) = happyShift action_29
action_142 (54) = happyShift action_78
action_142 (60) = happyShift action_79
action_142 (61) = happyShift action_80
action_142 (63) = happyShift action_30
action_142 (64) = happyShift action_81
action_142 (70) = happyShift action_82
action_142 (71) = happyShift action_83
action_142 (73) = happyShift action_84
action_142 (15) = happyGoto action_146
action_142 (16) = happyGoto action_63
action_142 (17) = happyGoto action_64
action_142 (18) = happyGoto action_65
action_142 (19) = happyGoto action_66
action_142 (20) = happyGoto action_67
action_142 (29) = happyGoto action_68
action_142 _ = happyReduce_25

action_143 (31) = happyShift action_91
action_143 (43) = happyShift action_74
action_143 (44) = happyShift action_75
action_143 (50) = happyShift action_76
action_143 (52) = happyShift action_77
action_143 (54) = happyShift action_78
action_143 (60) = happyShift action_79
action_143 (64) = happyShift action_81
action_143 (70) = happyShift action_82
action_143 (71) = happyShift action_83
action_143 (73) = happyShift action_84
action_143 (17) = happyGoto action_133
action_143 (18) = happyGoto action_65
action_143 (19) = happyGoto action_90
action_143 (26) = happyGoto action_145
action_143 (27) = happyGoto action_136
action_143 (29) = happyGoto action_68
action_143 _ = happyFail (happyExpListPerState 143)

action_144 _ = happyReduce_49

action_145 _ = happyReduce_64

action_146 (37) = happyShift action_150
action_146 _ = happyFail (happyExpListPerState 146)

action_147 (37) = happyShift action_149
action_147 _ = happyFail (happyExpListPerState 147)

action_148 _ = happyReduce_50

action_149 _ = happyReduce_30

action_150 (34) = happyShift action_151
action_150 _ = happyReduce_32

action_151 (38) = happyShift action_152
action_151 _ = happyFail (happyExpListPerState 151)

action_152 (31) = happyShift action_69
action_152 (32) = happyShift action_70
action_152 (33) = happyShift action_71
action_152 (36) = happyShift action_72
action_152 (38) = happyShift action_73
action_152 (43) = happyShift action_74
action_152 (44) = happyShift action_75
action_152 (50) = happyShift action_76
action_152 (51) = happyShift action_28
action_152 (52) = happyShift action_77
action_152 (53) = happyShift action_29
action_152 (54) = happyShift action_78
action_152 (60) = happyShift action_79
action_152 (61) = happyShift action_80
action_152 (63) = happyShift action_30
action_152 (64) = happyShift action_81
action_152 (70) = happyShift action_82
action_152 (71) = happyShift action_83
action_152 (73) = happyShift action_84
action_152 (15) = happyGoto action_153
action_152 (16) = happyGoto action_63
action_152 (17) = happyGoto action_64
action_152 (18) = happyGoto action_65
action_152 (19) = happyGoto action_66
action_152 (20) = happyGoto action_67
action_152 (29) = happyGoto action_68
action_152 _ = happyReduce_25

action_153 (37) = happyShift action_154
action_153 _ = happyFail (happyExpListPerState 153)

action_154 _ = happyReduce_33

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
		 (Public:[]
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
	(HappyAbsSyn21  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_3)) `HappyStk`
	(HappyAbsSyn20  happy_var_2) `HappyStk`
	(HappyAbsSyn7  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (Method(happy_var_1, happy_var_2, happy_var_3, happy_var_5, Block happy_var_8)
	) `HappyStk` happyRest

happyReduce_18 = happyReduce 9 10 happyReduction_18
happyReduction_18 (_ `HappyStk`
	(HappyAbsSyn15  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn21  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (Method(happy_var_1, "void", happy_var_3, happy_var_5, Block happy_var_8)
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
	(HappyAbsSyn20  happy_var_2) `HappyStk`
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
	(HappyAbsSyn21  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_2)) `HappyStk`
	(HappyAbsSyn8  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (Method(happy_var_1, "", happy_var_2, happy_var_4, Block happy_var_7)
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
	(HappyAbsSyn20  happy_var_1)
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
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn16
		 (StmtExprStmt happy_var_1
	)
happyReduction_34 _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_1  16 happyReduction_35
happyReduction_35 _
	 =  HappyAbsSyn16
		 (Empty
	)

happyReduce_36 = happySpecReduce_1  17 happyReduction_36
happyReduction_36 (HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1
	)
happyReduction_36 _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_3  17 happyReduction_37
happyReduction_37 (HappyAbsSyn17  happy_var_3)
	(HappyAbsSyn28  happy_var_2)
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn17
		 (Binary (happy_var_2, happy_var_1, happy_var_3)
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_2  17 happyReduction_38
happyReduction_38 (HappyAbsSyn17  happy_var_2)
	(HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn17
		 (Unary (happy_var_1, happy_var_2)
	)
happyReduction_38 _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_1  18 happyReduction_39
happyReduction_39 _
	 =  HappyAbsSyn18
		 (This
	)

happyReduce_40 = happySpecReduce_1  18 happyReduction_40
happyReduction_40 (HappyTerminal (TOKEN_INTEGER_LITERAL happy_var_1))
	 =  HappyAbsSyn18
		 (Integer happy_var_1
	)
happyReduction_40 _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_1  18 happyReduction_41
happyReduction_41 (HappyTerminal (TOKEN_BOOL_LITERAL happy_var_1))
	 =  HappyAbsSyn18
		 (Bool happy_var_1
	)
happyReduction_41 _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_1  18 happyReduction_42
happyReduction_42 (HappyTerminal (TOKEN_CHAR_LITERAL happy_var_1))
	 =  HappyAbsSyn18
		 (Char happy_var_1
	)
happyReduction_42 _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_1  18 happyReduction_43
happyReduction_43 (HappyTerminal (TOKEN_STRING_LITERAL happy_var_1))
	 =  HappyAbsSyn18
		 (String happy_var_1
	)
happyReduction_43 _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_1  18 happyReduction_44
happyReduction_44 _
	 =  HappyAbsSyn18
		 (Jnull
	)

happyReduce_45 = happySpecReduce_1  18 happyReduction_45
happyReduction_45 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn18
		 (StmtExprExpr happy_var_1
	)
happyReduction_45 _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_1  18 happyReduction_46
happyReduction_46 (HappyTerminal (TOKEN_BEZEICHNER happy_var_1))
	 =  HappyAbsSyn18
		 (LocalOrFieldVar happy_var_1
	)
happyReduction_46 _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_3  18 happyReduction_47
happyReduction_47 (HappyTerminal (TOKEN_BEZEICHNER happy_var_3))
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn18
		 (InstVar (happy_var_1, happy_var_3)
	)
happyReduction_47 _ _ _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_3  19 happyReduction_48
happyReduction_48 (HappyAbsSyn24  happy_var_3)
	_
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_1))
	 =  HappyAbsSyn19
		 (Assign(LocalOrFieldVar happy_var_1,happy_var_3)
	)
happyReduction_48 _ _ _  = notHappyAtAll 

happyReduce_49 = happyReduce 5 19 happyReduction_49
happyReduction_49 (_ `HappyStk`
	(HappyAbsSyn25  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn19
		 (New (happy_var_2, happy_var_4)
	) `HappyStk` happyRest

happyReduce_50 = happyReduce 6 19 happyReduction_50
happyReduction_50 (_ `HappyStk`
	(HappyAbsSyn25  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn19
		 (MethodCall (happy_var_1, happy_var_3, happy_var_5)
	) `HappyStk` happyRest

happyReduce_51 = happySpecReduce_1  20 happyReduction_51
happyReduction_51 _
	 =  HappyAbsSyn20
		 ("int"
	)

happyReduce_52 = happySpecReduce_1  20 happyReduction_52
happyReduction_52 _
	 =  HappyAbsSyn20
		 ("char"
	)

happyReduce_53 = happySpecReduce_1  20 happyReduction_53
happyReduction_53 _
	 =  HappyAbsSyn20
		 ("boolean"
	)

happyReduce_54 = happySpecReduce_1  20 happyReduction_54
happyReduction_54 (HappyTerminal (TOKEN_BEZEICHNER happy_var_1))
	 =  HappyAbsSyn20
		 (happy_var_1
	)
happyReduction_54 _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_0  21 happyReduction_55
happyReduction_55  =  HappyAbsSyn21
		 ([]
	)

happyReduce_56 = happySpecReduce_1  21 happyReduction_56
happyReduction_56 (HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn21
		 (happy_var_1
	)
happyReduction_56 _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_1  22 happyReduction_57
happyReduction_57 (HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn22
		 (happy_var_1:[]
	)
happyReduction_57 _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_3  22 happyReduction_58
happyReduction_58 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn22
		 (happy_var_1:happy_var_3
	)
happyReduction_58 _ _ _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_2  23 happyReduction_59
happyReduction_59 (HappyTerminal (TOKEN_BEZEICHNER happy_var_2))
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn23
		 (happy_var_1, happy_var_2
	)
happyReduction_59 _ _  = notHappyAtAll 

happyReduce_60 = happySpecReduce_1  24 happyReduction_60
happyReduction_60 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn24
		 (happy_var_1
	)
happyReduction_60 _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_0  25 happyReduction_61
happyReduction_61  =  HappyAbsSyn25
		 ([]
	)

happyReduce_62 = happySpecReduce_1  25 happyReduction_62
happyReduction_62 (HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn25
		 (happy_var_1
	)
happyReduction_62 _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_1  26 happyReduction_63
happyReduction_63 (HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn26
		 (happy_var_1:[]
	)
happyReduction_63 _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_3  26 happyReduction_64
happyReduction_64 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn26
		 (happy_var_1:happy_var_3
	)
happyReduction_64 _ _ _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_1  27 happyReduction_65
happyReduction_65 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn27
		 (happy_var_1
	)
happyReduction_65 _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_1  28 happyReduction_66
happyReduction_66 _
	 =  HappyAbsSyn28
		 (Equals
	)

happyReduce_67 = happySpecReduce_1  28 happyReduction_67
happyReduction_67 _
	 =  HappyAbsSyn28
		 (LessT
	)

happyReduce_68 = happySpecReduce_1  28 happyReduction_68
happyReduction_68 _
	 =  HappyAbsSyn28
		 (GreaterT
	)

happyReduce_69 = happySpecReduce_1  28 happyReduction_69
happyReduction_69 _
	 =  HappyAbsSyn28
		 (GE
	)

happyReduce_70 = happySpecReduce_1  28 happyReduction_70
happyReduction_70 _
	 =  HappyAbsSyn28
		 (LE
	)

happyReduce_71 = happySpecReduce_1  28 happyReduction_71
happyReduction_71 _
	 =  HappyAbsSyn28
		 (Mult
	)

happyReduce_72 = happySpecReduce_1  28 happyReduction_72
happyReduction_72 _
	 =  HappyAbsSyn28
		 (Div
	)

happyReduce_73 = happySpecReduce_1  28 happyReduction_73
happyReduction_73 _
	 =  HappyAbsSyn28
		 (Modulo
	)

happyReduce_74 = happySpecReduce_1  28 happyReduction_74
happyReduction_74 _
	 =  HappyAbsSyn28
		 (AND
	)

happyReduce_75 = happySpecReduce_1  28 happyReduction_75
happyReduction_75 _
	 =  HappyAbsSyn28
		 (OR
	)

happyReduce_76 = happySpecReduce_1  28 happyReduction_76
happyReduction_76 _
	 =  HappyAbsSyn28
		 (BitwiseOR
	)

happyReduce_77 = happySpecReduce_1  28 happyReduction_77
happyReduction_77 _
	 =  HappyAbsSyn28
		 (BitwiseAND
	)

happyReduce_78 = happySpecReduce_1  28 happyReduction_78
happyReduction_78 _
	 =  HappyAbsSyn28
		 (Plus
	)

happyReduce_79 = happySpecReduce_1  28 happyReduction_79
happyReduction_79 _
	 =  HappyAbsSyn28
		 (Minus
	)

happyReduce_80 = happySpecReduce_1  29 happyReduction_80
happyReduction_80 _
	 =  HappyAbsSyn29
		 (Negation
	)

happyReduce_81 = happySpecReduce_1  29 happyReduction_81
happyReduction_81 _
	 =  HappyAbsSyn29
		 (Positiv
	)

happyReduce_82 = happySpecReduce_1  29 happyReduction_82
happyReduction_82 _
	 =  HappyAbsSyn29
		 (Negativ
	)

happyNewToken action sts stk [] =
	action 74 74 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TOKEN_KLASSE -> cont 30;
	TOKEN_BEZEICHNER happy_dollar_dollar -> cont 31;
	TOKEN_WHILE -> cont 32;
	TOKEN_IF -> cont 33;
	TOKEN_ELSE -> cont 34;
	TOKEN_ZUWEISUNG -> cont 35;
	TOKEN_SEMIKOLON -> cont 36;
	TOKEN_KLAZU_GESCH -> cont 37;
	TOKEN_KLAAUF_GESCH -> cont 38;
	TOKEN_KLAAUF_RUND -> cont 39;
	TOKEN_KLAZU_RUND -> cont 40;
	TOKEN_GETEILT -> cont 41;
	TOKEN_MAL -> cont 42;
	TOKEN_PLUS -> cont 43;
	TOKEN_MINUS -> cont 44;
	TOKEN_MODULO -> cont 45;
	TOKEN_AND -> cont 46;
	TOKEN_OR -> cont 47;
	TOKEN_BITOR -> cont 48;
	TOKEN_BITAND -> cont 49;
	TOKEN_STRING_LITERAL happy_dollar_dollar -> cont 50;
	TOKEN_INTEGER -> cont 51;
	TOKEN_INTEGER_LITERAL happy_dollar_dollar -> cont 52;
	TOKEN_CHAR -> cont 53;
	TOKEN_CHAR_LITERAL happy_dollar_dollar -> cont 54;
	TOKEN_PUBLIC -> cont 55;
	TOKEN_PRIVATE -> cont 56;
	TOKEN_STATIC -> cont 57;
	TOKEN_FINAL -> cont 58;
	TOKEN_VOID -> cont 59;
	TOKEN_NEW -> cont 60;
	TOKEN_RETURN -> cont 61;
	TOKEN_AKZESSOR -> cont 62;
	TOKEN_BOOL -> cont 63;
	TOKEN_BOOL_LITERAL happy_dollar_dollar -> cont 64;
	TOKEN_VERGLEICH -> cont 65;
	TOKEN_GROESSER -> cont 66;
	TOKEN_KLEINER -> cont 67;
	TOKEN_GROESSER_GLEICH -> cont 68;
	TOKEN_KLEINER_GLEICH -> cont 69;
	TOKEN_NULL -> cont 70;
	TOKEN_NOT -> cont 71;
	TOKEN_KOMMA -> cont 72;
	TOKEN_THIS -> cont 73;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 74 tk tks = happyError' (tks, explist)
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
