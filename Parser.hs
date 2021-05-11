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
happyExpList = Happy_Data_Array.listArray (0,349) ([0,0,0,64,0,0,0,0,1,0,0,2,0,0,0,0,0,128,0,0,0,0,0,0,0,0,0,0,0,1024,0,0,0,0,2048,0,0,0,0,0,512,0,0,256,20480,256,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2048,0,0,0,0,48,0,0,0,49152,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,16,0,0,0,0,0,0,16384,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,128,0,0,0,0,0,0,0,0,64,5120,68,0,0,64,0,0,0,0,0,28,0,0,0,16384,0,0,0,0,256,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,64,5120,64,0,0,0,0,0,0,0,0,0,0,0,16,0,0,0,16384,0,0,0,0,0,0,0,0,0,1024,0,0,0,0,16,0,0,0,64,0,0,0,0,512,0,0,0,0,0,0,0,0,0,0,8192,0,16384,0,16404,0,0,32768,0,0,0,0,0,0,0,0,4096,0,4101,0,0,64,5120,64,0,0,512,0,0,0,0,8,0,0,0,2672,3971,22582,0,0,0,0,0,0,16384,0,0,0,0,49820,33760,5645,0,0,0,2048,0,0,0,0,0,0,0,32,0,0,0,1024,0,0,0,0,16,2691,22562,0,0,4,0,0,0,0,1,0,0,0,1024,0,0,0,0,0,0,0,0,10688,15884,24792,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,0,0,0,4096,33538,8714,88,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32,0,0,0,32768,0,0,0,0,49820,33760,5645,0,28672,33546,13839,88,0,2048,0,32,0,0,0,0,0,0,16384,0,0,0,0,0,0,0,0,0,64,0,0,0,16384,0,0,0,0,49156,33440,5640,0,4096,33536,8714,88,0,64,10764,24712,1,0,0,0,0,0,32768,0,0,0,0,0,0,0,0,16384,3072,34858,352,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16,0,0,0,0,0,0,0,0,0,0,0,0,0,1024,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8192,0,8,0,0,128,8192,0,0,0,0,0,0,0,49156,33440,5640,0,0,0,0,0,0,4096,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8192,0,0,0,2,0,0,0,0,0,0,0,0,0,0,32,0,8192,0,0,0,0,128,0,0,0,1024,41152,2178,22,0,8192,0,0,0,49152,3113,55358,352,0,42752,63536,33632,5,0,49156,33440,5640,0,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,2048,0,0,0,0,512,0,0,0,28672,33546,13839,88,0,4096,0,0,0,0,0,0,0,0
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

action_8 (31) = happyReduce_22
action_8 (51) = happyReduce_22
action_8 (53) = happyReduce_22
action_8 (55) = happyShift action_14
action_8 (56) = happyShift action_15
action_8 (57) = happyShift action_16
action_8 (58) = happyShift action_17
action_8 (63) = happyReduce_22
action_8 (6) = happyGoto action_9
action_8 (7) = happyGoto action_10
action_8 (8) = happyGoto action_11
action_8 (11) = happyGoto action_12
action_8 (12) = happyGoto action_13
action_8 _ = happyReduce_22

action_9 (31) = happyShift action_30
action_9 (51) = happyShift action_31
action_9 (53) = happyShift action_32
action_9 (63) = happyShift action_33
action_9 (20) = happyGoto action_29
action_9 _ = happyFail (happyExpListPerState 9)

action_10 _ = happyReduce_4

action_11 _ = happyReduce_11

action_12 (31) = happyReduce_25
action_12 (55) = happyShift action_27
action_12 (56) = happyShift action_28
action_12 (8) = happyGoto action_24
action_12 (13) = happyGoto action_25
action_12 (14) = happyGoto action_26
action_12 _ = happyReduce_25

action_13 (31) = happyReduce_22
action_13 (51) = happyReduce_22
action_13 (53) = happyReduce_22
action_13 (55) = happyShift action_14
action_13 (56) = happyShift action_15
action_13 (57) = happyShift action_16
action_13 (58) = happyShift action_17
action_13 (63) = happyReduce_22
action_13 (6) = happyGoto action_9
action_13 (7) = happyGoto action_10
action_13 (8) = happyGoto action_11
action_13 (11) = happyGoto action_23
action_13 (12) = happyGoto action_13
action_13 _ = happyReduce_22

action_14 (57) = happyShift action_21
action_14 (58) = happyShift action_22
action_14 _ = happyReduce_15

action_15 (57) = happyShift action_19
action_15 (58) = happyShift action_20
action_15 _ = happyReduce_16

action_16 _ = happyReduce_14

action_17 (57) = happyShift action_18
action_17 _ = happyReduce_9

action_18 _ = happyReduce_10

action_19 _ = happyReduce_13

action_20 (57) = happyShift action_43
action_20 _ = happyReduce_7

action_21 _ = happyReduce_12

action_22 (57) = happyShift action_42
action_22 _ = happyReduce_5

action_23 _ = happyReduce_23

action_24 (31) = happyShift action_41
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (37) = happyReduce_18
action_25 (55) = happyShift action_39
action_25 (56) = happyShift action_40
action_25 (57) = happyShift action_16
action_25 (7) = happyGoto action_36
action_25 (8) = happyGoto action_11
action_25 (9) = happyGoto action_37
action_25 (10) = happyGoto action_38
action_25 _ = happyReduce_17

action_26 (31) = happyReduce_25
action_26 (55) = happyShift action_27
action_26 (56) = happyShift action_28
action_26 (8) = happyGoto action_24
action_26 (13) = happyGoto action_35
action_26 (14) = happyGoto action_26
action_26 _ = happyReduce_25

action_27 _ = happyReduce_15

action_28 _ = happyReduce_16

action_29 (31) = happyShift action_34
action_29 _ = happyFail (happyExpListPerState 29)

action_30 _ = happyReduce_57

action_31 _ = happyReduce_54

action_32 _ = happyReduce_55

action_33 _ = happyReduce_56

action_34 (36) = happyShift action_49
action_34 _ = happyFail (happyExpListPerState 34)

action_35 _ = happyReduce_26

action_36 (31) = happyShift action_30
action_36 (51) = happyShift action_31
action_36 (53) = happyShift action_32
action_36 (59) = happyShift action_48
action_36 (63) = happyShift action_33
action_36 (20) = happyGoto action_47
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (37) = happyShift action_46
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (37) = happyReduce_18
action_38 (55) = happyShift action_39
action_38 (56) = happyShift action_40
action_38 (57) = happyShift action_16
action_38 (7) = happyGoto action_36
action_38 (8) = happyGoto action_11
action_38 (9) = happyGoto action_45
action_38 (10) = happyGoto action_38
action_38 _ = happyReduce_17

action_39 (57) = happyShift action_21
action_39 _ = happyReduce_15

action_40 (57) = happyShift action_19
action_40 _ = happyReduce_16

action_41 (39) = happyShift action_44
action_41 _ = happyFail (happyExpListPerState 41)

action_42 _ = happyReduce_6

action_43 _ = happyReduce_8

action_44 (31) = happyShift action_30
action_44 (51) = happyShift action_31
action_44 (53) = happyShift action_32
action_44 (63) = happyShift action_33
action_44 (20) = happyGoto action_52
action_44 (21) = happyGoto action_53
action_44 (22) = happyGoto action_54
action_44 (23) = happyGoto action_55
action_44 _ = happyReduce_58

action_45 _ = happyReduce_19

action_46 _ = happyReduce_1

action_47 (31) = happyShift action_51
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (31) = happyShift action_50
action_48 _ = happyFail (happyExpListPerState 48)

action_49 _ = happyReduce_24

action_50 (39) = happyShift action_60
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (39) = happyShift action_59
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (31) = happyShift action_58
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (40) = happyShift action_57
action_53 _ = happyFail (happyExpListPerState 53)

action_54 _ = happyReduce_59

action_55 (72) = happyShift action_56
action_55 _ = happyReduce_60

action_56 (31) = happyShift action_30
action_56 (51) = happyShift action_31
action_56 (53) = happyShift action_32
action_56 (63) = happyShift action_33
action_56 (20) = happyGoto action_52
action_56 (22) = happyGoto action_64
action_56 (23) = happyGoto action_55
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (38) = happyShift action_63
action_57 _ = happyFail (happyExpListPerState 57)

action_58 _ = happyReduce_62

action_59 (31) = happyShift action_30
action_59 (51) = happyShift action_31
action_59 (53) = happyShift action_32
action_59 (63) = happyShift action_33
action_59 (20) = happyGoto action_52
action_59 (21) = happyGoto action_62
action_59 (22) = happyGoto action_54
action_59 (23) = happyGoto action_55
action_59 _ = happyReduce_58

action_60 (31) = happyShift action_30
action_60 (51) = happyShift action_31
action_60 (53) = happyShift action_32
action_60 (63) = happyShift action_33
action_60 (20) = happyGoto action_52
action_60 (21) = happyGoto action_61
action_60 (22) = happyGoto action_54
action_60 (23) = happyGoto action_55
action_60 _ = happyReduce_58

action_61 (40) = happyShift action_89
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (40) = happyShift action_88
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (31) = happyShift action_72
action_63 (32) = happyShift action_73
action_63 (33) = happyShift action_74
action_63 (36) = happyShift action_75
action_63 (38) = happyShift action_76
action_63 (43) = happyShift action_77
action_63 (44) = happyShift action_78
action_63 (50) = happyShift action_79
action_63 (51) = happyShift action_31
action_63 (52) = happyShift action_80
action_63 (53) = happyShift action_32
action_63 (54) = happyShift action_81
action_63 (60) = happyShift action_82
action_63 (61) = happyShift action_83
action_63 (63) = happyShift action_33
action_63 (64) = happyShift action_84
action_63 (70) = happyShift action_85
action_63 (71) = happyShift action_86
action_63 (73) = happyShift action_87
action_63 (15) = happyGoto action_65
action_63 (16) = happyGoto action_66
action_63 (17) = happyGoto action_67
action_63 (18) = happyGoto action_68
action_63 (19) = happyGoto action_69
action_63 (20) = happyGoto action_70
action_63 (29) = happyGoto action_71
action_63 _ = happyReduce_28

action_64 _ = happyReduce_61

action_65 (37) = happyShift action_121
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (31) = happyShift action_72
action_66 (32) = happyShift action_73
action_66 (33) = happyShift action_74
action_66 (36) = happyShift action_75
action_66 (38) = happyShift action_76
action_66 (43) = happyShift action_77
action_66 (44) = happyShift action_78
action_66 (50) = happyShift action_79
action_66 (51) = happyShift action_31
action_66 (52) = happyShift action_80
action_66 (53) = happyShift action_32
action_66 (54) = happyShift action_81
action_66 (60) = happyShift action_82
action_66 (61) = happyShift action_83
action_66 (63) = happyShift action_33
action_66 (64) = happyShift action_84
action_66 (70) = happyShift action_85
action_66 (71) = happyShift action_86
action_66 (73) = happyShift action_87
action_66 (15) = happyGoto action_120
action_66 (16) = happyGoto action_66
action_66 (17) = happyGoto action_67
action_66 (18) = happyGoto action_68
action_66 (19) = happyGoto action_69
action_66 (20) = happyGoto action_70
action_66 (29) = happyGoto action_71
action_66 _ = happyReduce_28

action_67 (62) = happyShift action_119
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (41) = happyShift action_105
action_68 (42) = happyShift action_106
action_68 (43) = happyShift action_107
action_68 (44) = happyShift action_108
action_68 (45) = happyShift action_109
action_68 (46) = happyShift action_110
action_68 (47) = happyShift action_111
action_68 (48) = happyShift action_112
action_68 (49) = happyShift action_113
action_68 (65) = happyShift action_114
action_68 (66) = happyShift action_115
action_68 (67) = happyShift action_116
action_68 (68) = happyShift action_117
action_68 (69) = happyShift action_118
action_68 (28) = happyGoto action_104
action_68 _ = happyReduce_39

action_69 (36) = happyShift action_103
action_69 _ = happyReduce_48

action_70 (31) = happyShift action_102
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (31) = happyShift action_94
action_71 (43) = happyShift action_77
action_71 (44) = happyShift action_78
action_71 (50) = happyShift action_79
action_71 (52) = happyShift action_80
action_71 (54) = happyShift action_81
action_71 (60) = happyShift action_82
action_71 (64) = happyShift action_84
action_71 (70) = happyShift action_85
action_71 (71) = happyShift action_86
action_71 (73) = happyShift action_87
action_71 (17) = happyGoto action_101
action_71 (18) = happyGoto action_68
action_71 (19) = happyGoto action_93
action_71 (29) = happyGoto action_71
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (35) = happyShift action_100
action_72 (41) = happyReduce_49
action_72 (42) = happyReduce_49
action_72 (43) = happyReduce_49
action_72 (44) = happyReduce_49
action_72 (45) = happyReduce_49
action_72 (46) = happyReduce_49
action_72 (47) = happyReduce_49
action_72 (48) = happyReduce_49
action_72 (49) = happyReduce_49
action_72 (62) = happyReduce_49
action_72 (65) = happyReduce_49
action_72 (66) = happyReduce_49
action_72 (67) = happyReduce_49
action_72 (68) = happyReduce_49
action_72 (69) = happyReduce_49
action_72 _ = happyReduce_57

action_73 (39) = happyShift action_99
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (39) = happyShift action_98
action_74 _ = happyFail (happyExpListPerState 74)

action_75 _ = happyReduce_38

action_76 (31) = happyShift action_72
action_76 (32) = happyShift action_73
action_76 (33) = happyShift action_74
action_76 (36) = happyShift action_75
action_76 (38) = happyShift action_76
action_76 (43) = happyShift action_77
action_76 (44) = happyShift action_78
action_76 (50) = happyShift action_79
action_76 (51) = happyShift action_31
action_76 (52) = happyShift action_80
action_76 (53) = happyShift action_32
action_76 (54) = happyShift action_81
action_76 (60) = happyShift action_82
action_76 (61) = happyShift action_83
action_76 (63) = happyShift action_33
action_76 (64) = happyShift action_84
action_76 (70) = happyShift action_85
action_76 (71) = happyShift action_86
action_76 (73) = happyShift action_87
action_76 (15) = happyGoto action_97
action_76 (16) = happyGoto action_66
action_76 (17) = happyGoto action_67
action_76 (18) = happyGoto action_68
action_76 (19) = happyGoto action_69
action_76 (20) = happyGoto action_70
action_76 (29) = happyGoto action_71
action_76 _ = happyReduce_28

action_77 _ = happyReduce_84

action_78 _ = happyReduce_85

action_79 _ = happyReduce_46

action_80 _ = happyReduce_43

action_81 _ = happyReduce_45

action_82 (31) = happyShift action_96
action_82 _ = happyFail (happyExpListPerState 82)

action_83 (31) = happyShift action_94
action_83 (36) = happyShift action_95
action_83 (43) = happyShift action_77
action_83 (44) = happyShift action_78
action_83 (50) = happyShift action_79
action_83 (52) = happyShift action_80
action_83 (54) = happyShift action_81
action_83 (60) = happyShift action_82
action_83 (64) = happyShift action_84
action_83 (70) = happyShift action_85
action_83 (71) = happyShift action_86
action_83 (73) = happyShift action_87
action_83 (17) = happyGoto action_92
action_83 (18) = happyGoto action_68
action_83 (19) = happyGoto action_93
action_83 (29) = happyGoto action_71
action_83 _ = happyFail (happyExpListPerState 83)

action_84 _ = happyReduce_44

action_85 _ = happyReduce_47

action_86 _ = happyReduce_83

action_87 _ = happyReduce_42

action_88 (38) = happyShift action_91
action_88 _ = happyFail (happyExpListPerState 88)

action_89 (38) = happyShift action_90
action_89 _ = happyFail (happyExpListPerState 89)

action_90 (31) = happyShift action_72
action_90 (32) = happyShift action_73
action_90 (33) = happyShift action_74
action_90 (36) = happyShift action_75
action_90 (38) = happyShift action_76
action_90 (43) = happyShift action_77
action_90 (44) = happyShift action_78
action_90 (50) = happyShift action_79
action_90 (51) = happyShift action_31
action_90 (52) = happyShift action_80
action_90 (53) = happyShift action_32
action_90 (54) = happyShift action_81
action_90 (60) = happyShift action_82
action_90 (61) = happyShift action_83
action_90 (63) = happyShift action_33
action_90 (64) = happyShift action_84
action_90 (70) = happyShift action_85
action_90 (71) = happyShift action_86
action_90 (73) = happyShift action_87
action_90 (15) = happyGoto action_133
action_90 (16) = happyGoto action_66
action_90 (17) = happyGoto action_67
action_90 (18) = happyGoto action_68
action_90 (19) = happyGoto action_69
action_90 (20) = happyGoto action_70
action_90 (29) = happyGoto action_71
action_90 _ = happyReduce_28

action_91 (31) = happyShift action_72
action_91 (32) = happyShift action_73
action_91 (33) = happyShift action_74
action_91 (36) = happyShift action_75
action_91 (38) = happyShift action_76
action_91 (43) = happyShift action_77
action_91 (44) = happyShift action_78
action_91 (50) = happyShift action_79
action_91 (51) = happyShift action_31
action_91 (52) = happyShift action_80
action_91 (53) = happyShift action_32
action_91 (54) = happyShift action_81
action_91 (60) = happyShift action_82
action_91 (61) = happyShift action_83
action_91 (63) = happyShift action_33
action_91 (64) = happyShift action_84
action_91 (70) = happyShift action_85
action_91 (71) = happyShift action_86
action_91 (73) = happyShift action_87
action_91 (15) = happyGoto action_132
action_91 (16) = happyGoto action_66
action_91 (17) = happyGoto action_67
action_91 (18) = happyGoto action_68
action_91 (19) = happyGoto action_69
action_91 (20) = happyGoto action_70
action_91 (29) = happyGoto action_71
action_91 _ = happyReduce_28

action_92 (36) = happyShift action_131
action_92 (62) = happyShift action_119
action_92 _ = happyFail (happyExpListPerState 92)

action_93 _ = happyReduce_48

action_94 (35) = happyShift action_100
action_94 _ = happyReduce_49

action_95 _ = happyReduce_31

action_96 (39) = happyShift action_130
action_96 _ = happyFail (happyExpListPerState 96)

action_97 (37) = happyShift action_129
action_97 _ = happyFail (happyExpListPerState 97)

action_98 (31) = happyShift action_94
action_98 (43) = happyShift action_77
action_98 (44) = happyShift action_78
action_98 (50) = happyShift action_79
action_98 (52) = happyShift action_80
action_98 (54) = happyShift action_81
action_98 (60) = happyShift action_82
action_98 (64) = happyShift action_84
action_98 (70) = happyShift action_85
action_98 (71) = happyShift action_86
action_98 (73) = happyShift action_87
action_98 (17) = happyGoto action_128
action_98 (18) = happyGoto action_68
action_98 (19) = happyGoto action_93
action_98 (29) = happyGoto action_71
action_98 _ = happyFail (happyExpListPerState 98)

action_99 (31) = happyShift action_94
action_99 (43) = happyShift action_77
action_99 (44) = happyShift action_78
action_99 (50) = happyShift action_79
action_99 (52) = happyShift action_80
action_99 (54) = happyShift action_81
action_99 (60) = happyShift action_82
action_99 (64) = happyShift action_84
action_99 (70) = happyShift action_85
action_99 (71) = happyShift action_86
action_99 (73) = happyShift action_87
action_99 (17) = happyGoto action_127
action_99 (18) = happyGoto action_68
action_99 (19) = happyGoto action_93
action_99 (29) = happyGoto action_71
action_99 _ = happyFail (happyExpListPerState 99)

action_100 (31) = happyShift action_94
action_100 (43) = happyShift action_77
action_100 (44) = happyShift action_78
action_100 (50) = happyShift action_79
action_100 (52) = happyShift action_80
action_100 (54) = happyShift action_81
action_100 (60) = happyShift action_82
action_100 (64) = happyShift action_84
action_100 (70) = happyShift action_85
action_100 (71) = happyShift action_86
action_100 (73) = happyShift action_87
action_100 (17) = happyGoto action_125
action_100 (18) = happyGoto action_68
action_100 (19) = happyGoto action_93
action_100 (24) = happyGoto action_126
action_100 (29) = happyGoto action_71
action_100 _ = happyFail (happyExpListPerState 100)

action_101 (62) = happyShift action_119
action_101 _ = happyReduce_41

action_102 (36) = happyShift action_124
action_102 _ = happyFail (happyExpListPerState 102)

action_103 _ = happyReduce_37

action_104 (31) = happyShift action_94
action_104 (43) = happyShift action_77
action_104 (44) = happyShift action_78
action_104 (50) = happyShift action_79
action_104 (52) = happyShift action_80
action_104 (54) = happyShift action_81
action_104 (60) = happyShift action_82
action_104 (64) = happyShift action_84
action_104 (70) = happyShift action_85
action_104 (71) = happyShift action_86
action_104 (73) = happyShift action_87
action_104 (17) = happyGoto action_123
action_104 (18) = happyGoto action_68
action_104 (19) = happyGoto action_93
action_104 (29) = happyGoto action_71
action_104 _ = happyFail (happyExpListPerState 104)

action_105 _ = happyReduce_75

action_106 _ = happyReduce_74

action_107 _ = happyReduce_81

action_108 _ = happyReduce_82

action_109 _ = happyReduce_76

action_110 _ = happyReduce_77

action_111 _ = happyReduce_78

action_112 _ = happyReduce_79

action_113 _ = happyReduce_80

action_114 _ = happyReduce_69

action_115 _ = happyReduce_71

action_116 _ = happyReduce_70

action_117 _ = happyReduce_72

action_118 _ = happyReduce_73

action_119 (31) = happyShift action_122
action_119 _ = happyFail (happyExpListPerState 119)

action_120 _ = happyReduce_29

action_121 _ = happyReduce_27

action_122 (39) = happyShift action_142
action_122 _ = happyReduce_50

action_123 (62) = happyShift action_119
action_123 _ = happyReduce_40

action_124 _ = happyReduce_34

action_125 (62) = happyShift action_119
action_125 _ = happyReduce_63

action_126 _ = happyReduce_51

action_127 (40) = happyShift action_141
action_127 (62) = happyShift action_119
action_127 _ = happyFail (happyExpListPerState 127)

action_128 (40) = happyShift action_140
action_128 (62) = happyShift action_119
action_128 _ = happyFail (happyExpListPerState 128)

action_129 _ = happyReduce_30

action_130 (31) = happyShift action_94
action_130 (43) = happyShift action_77
action_130 (44) = happyShift action_78
action_130 (50) = happyShift action_79
action_130 (52) = happyShift action_80
action_130 (54) = happyShift action_81
action_130 (60) = happyShift action_82
action_130 (64) = happyShift action_84
action_130 (70) = happyShift action_85
action_130 (71) = happyShift action_86
action_130 (73) = happyShift action_87
action_130 (17) = happyGoto action_136
action_130 (18) = happyGoto action_68
action_130 (19) = happyGoto action_93
action_130 (25) = happyGoto action_137
action_130 (26) = happyGoto action_138
action_130 (27) = happyGoto action_139
action_130 (29) = happyGoto action_71
action_130 _ = happyReduce_64

action_131 _ = happyReduce_32

action_132 (37) = happyShift action_135
action_132 _ = happyFail (happyExpListPerState 132)

action_133 (37) = happyShift action_134
action_133 _ = happyFail (happyExpListPerState 133)

action_134 _ = happyReduce_21

action_135 _ = happyReduce_20

action_136 (62) = happyShift action_119
action_136 _ = happyReduce_68

action_137 (40) = happyShift action_147
action_137 _ = happyFail (happyExpListPerState 137)

action_138 _ = happyReduce_65

action_139 (72) = happyShift action_146
action_139 _ = happyReduce_66

action_140 (38) = happyShift action_145
action_140 _ = happyFail (happyExpListPerState 140)

action_141 (38) = happyShift action_144
action_141 _ = happyFail (happyExpListPerState 141)

action_142 (31) = happyShift action_94
action_142 (43) = happyShift action_77
action_142 (44) = happyShift action_78
action_142 (50) = happyShift action_79
action_142 (52) = happyShift action_80
action_142 (54) = happyShift action_81
action_142 (60) = happyShift action_82
action_142 (64) = happyShift action_84
action_142 (70) = happyShift action_85
action_142 (71) = happyShift action_86
action_142 (73) = happyShift action_87
action_142 (17) = happyGoto action_136
action_142 (18) = happyGoto action_68
action_142 (19) = happyGoto action_93
action_142 (25) = happyGoto action_143
action_142 (26) = happyGoto action_138
action_142 (27) = happyGoto action_139
action_142 (29) = happyGoto action_71
action_142 _ = happyReduce_64

action_143 (40) = happyShift action_151
action_143 _ = happyFail (happyExpListPerState 143)

action_144 (31) = happyShift action_72
action_144 (32) = happyShift action_73
action_144 (33) = happyShift action_74
action_144 (36) = happyShift action_75
action_144 (38) = happyShift action_76
action_144 (43) = happyShift action_77
action_144 (44) = happyShift action_78
action_144 (50) = happyShift action_79
action_144 (51) = happyShift action_31
action_144 (52) = happyShift action_80
action_144 (53) = happyShift action_32
action_144 (54) = happyShift action_81
action_144 (60) = happyShift action_82
action_144 (61) = happyShift action_83
action_144 (63) = happyShift action_33
action_144 (64) = happyShift action_84
action_144 (70) = happyShift action_85
action_144 (71) = happyShift action_86
action_144 (73) = happyShift action_87
action_144 (15) = happyGoto action_150
action_144 (16) = happyGoto action_66
action_144 (17) = happyGoto action_67
action_144 (18) = happyGoto action_68
action_144 (19) = happyGoto action_69
action_144 (20) = happyGoto action_70
action_144 (29) = happyGoto action_71
action_144 _ = happyReduce_28

action_145 (31) = happyShift action_72
action_145 (32) = happyShift action_73
action_145 (33) = happyShift action_74
action_145 (36) = happyShift action_75
action_145 (38) = happyShift action_76
action_145 (43) = happyShift action_77
action_145 (44) = happyShift action_78
action_145 (50) = happyShift action_79
action_145 (51) = happyShift action_31
action_145 (52) = happyShift action_80
action_145 (53) = happyShift action_32
action_145 (54) = happyShift action_81
action_145 (60) = happyShift action_82
action_145 (61) = happyShift action_83
action_145 (63) = happyShift action_33
action_145 (64) = happyShift action_84
action_145 (70) = happyShift action_85
action_145 (71) = happyShift action_86
action_145 (73) = happyShift action_87
action_145 (15) = happyGoto action_149
action_145 (16) = happyGoto action_66
action_145 (17) = happyGoto action_67
action_145 (18) = happyGoto action_68
action_145 (19) = happyGoto action_69
action_145 (20) = happyGoto action_70
action_145 (29) = happyGoto action_71
action_145 _ = happyReduce_28

action_146 (31) = happyShift action_94
action_146 (43) = happyShift action_77
action_146 (44) = happyShift action_78
action_146 (50) = happyShift action_79
action_146 (52) = happyShift action_80
action_146 (54) = happyShift action_81
action_146 (60) = happyShift action_82
action_146 (64) = happyShift action_84
action_146 (70) = happyShift action_85
action_146 (71) = happyShift action_86
action_146 (73) = happyShift action_87
action_146 (17) = happyGoto action_136
action_146 (18) = happyGoto action_68
action_146 (19) = happyGoto action_93
action_146 (26) = happyGoto action_148
action_146 (27) = happyGoto action_139
action_146 (29) = happyGoto action_71
action_146 _ = happyFail (happyExpListPerState 146)

action_147 _ = happyReduce_52

action_148 _ = happyReduce_67

action_149 (37) = happyShift action_153
action_149 _ = happyFail (happyExpListPerState 149)

action_150 (37) = happyShift action_152
action_150 _ = happyFail (happyExpListPerState 150)

action_151 _ = happyReduce_53

action_152 _ = happyReduce_33

action_153 (34) = happyShift action_154
action_153 _ = happyReduce_35

action_154 (38) = happyShift action_155
action_154 _ = happyFail (happyExpListPerState 154)

action_155 (31) = happyShift action_72
action_155 (32) = happyShift action_73
action_155 (33) = happyShift action_74
action_155 (36) = happyShift action_75
action_155 (38) = happyShift action_76
action_155 (43) = happyShift action_77
action_155 (44) = happyShift action_78
action_155 (50) = happyShift action_79
action_155 (51) = happyShift action_31
action_155 (52) = happyShift action_80
action_155 (53) = happyShift action_32
action_155 (54) = happyShift action_81
action_155 (60) = happyShift action_82
action_155 (61) = happyShift action_83
action_155 (63) = happyShift action_33
action_155 (64) = happyShift action_84
action_155 (70) = happyShift action_85
action_155 (71) = happyShift action_86
action_155 (73) = happyShift action_87
action_155 (15) = happyGoto action_156
action_155 (16) = happyGoto action_66
action_155 (17) = happyGoto action_67
action_155 (18) = happyGoto action_68
action_155 (19) = happyGoto action_69
action_155 (20) = happyGoto action_70
action_155 (29) = happyGoto action_71
action_155 _ = happyReduce_28

action_156 (37) = happyShift action_157
action_156 _ = happyFail (happyExpListPerState 156)

action_157 _ = happyReduce_36

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

happyReduce_9 = happySpecReduce_1  6 happyReduction_9
happyReduction_9 _
	 =  HappyAbsSyn6
		 (Final:[]
	)

happyReduce_10 = happySpecReduce_2  6 happyReduction_10
happyReduction_10 _
	_
	 =  HappyAbsSyn6
		 (Final:Static:[]
	)

happyReduce_11 = happySpecReduce_1  7 happyReduction_11
happyReduction_11 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1
	)
happyReduction_11 _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_2  7 happyReduction_12
happyReduction_12 _
	_
	 =  HappyAbsSyn7
		 (Public:Static:[]
	)

happyReduce_13 = happySpecReduce_2  7 happyReduction_13
happyReduction_13 _
	_
	 =  HappyAbsSyn7
		 (Private:Static:[]
	)

happyReduce_14 = happySpecReduce_1  7 happyReduction_14
happyReduction_14 _
	 =  HappyAbsSyn7
		 (Static:[]
	)

happyReduce_15 = happySpecReduce_1  8 happyReduction_15
happyReduction_15 _
	 =  HappyAbsSyn8
		 (Public:[]
	)

happyReduce_16 = happySpecReduce_1  8 happyReduction_16
happyReduction_16 _
	 =  HappyAbsSyn8
		 (Private:[]
	)

happyReduce_17 = happySpecReduce_0  8 happyReduction_17
happyReduction_17  =  HappyAbsSyn8
		 ([]
	)

happyReduce_18 = happySpecReduce_0  9 happyReduction_18
happyReduction_18  =  HappyAbsSyn9
		 ([]
	)

happyReduce_19 = happySpecReduce_2  9 happyReduction_19
happyReduction_19 (HappyAbsSyn9  happy_var_2)
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1:happy_var_2
	)
happyReduction_19 _ _  = notHappyAtAll 

happyReduce_20 = happyReduce 9 10 happyReduction_20
happyReduction_20 (_ `HappyStk`
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

happyReduce_21 = happyReduce 9 10 happyReduction_21
happyReduction_21 (_ `HappyStk`
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

happyReduce_22 = happySpecReduce_0  11 happyReduction_22
happyReduction_22  =  HappyAbsSyn11
		 ([]
	)

happyReduce_23 = happySpecReduce_2  11 happyReduction_23
happyReduction_23 (HappyAbsSyn11  happy_var_2)
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1:happy_var_2
	)
happyReduction_23 _ _  = notHappyAtAll 

happyReduce_24 = happyReduce 4 12 happyReduction_24
happyReduction_24 (_ `HappyStk`
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_3)) `HappyStk`
	(HappyAbsSyn20  happy_var_2) `HappyStk`
	(HappyAbsSyn6  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (FieldDecl (happy_var_1, happy_var_2, happy_var_3)
	) `HappyStk` happyRest

happyReduce_25 = happySpecReduce_0  13 happyReduction_25
happyReduction_25  =  HappyAbsSyn13
		 ([]
	)

happyReduce_26 = happySpecReduce_2  13 happyReduction_26
happyReduction_26 (HappyAbsSyn13  happy_var_2)
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn13
		 (happy_var_1:happy_var_2
	)
happyReduction_26 _ _  = notHappyAtAll 

happyReduce_27 = happyReduce 8 14 happyReduction_27
happyReduction_27 (_ `HappyStk`
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

happyReduce_28 = happySpecReduce_0  15 happyReduction_28
happyReduction_28  =  HappyAbsSyn15
		 ([]
	)

happyReduce_29 = happySpecReduce_2  15 happyReduction_29
happyReduction_29 (HappyAbsSyn15  happy_var_2)
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1:happy_var_2
	)
happyReduction_29 _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  16 happyReduction_30
happyReduction_30 _
	(HappyAbsSyn15  happy_var_2)
	_
	 =  HappyAbsSyn16
		 (Block happy_var_2
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_2  16 happyReduction_31
happyReduction_31 _
	_
	 =  HappyAbsSyn16
		 (Return Nothing
	)

happyReduce_32 = happySpecReduce_3  16 happyReduction_32
happyReduction_32 _
	(HappyAbsSyn17  happy_var_2)
	_
	 =  HappyAbsSyn16
		 (Return (Just (happy_var_2))
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happyReduce 7 16 happyReduction_33
happyReduction_33 (_ `HappyStk`
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

happyReduce_34 = happySpecReduce_3  16 happyReduction_34
happyReduction_34 _
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_2))
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn16
		 (LocalVarDecl (happy_var_1,happy_var_2)
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happyReduce 7 16 happyReduction_35
happyReduction_35 (_ `HappyStk`
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

happyReduce_36 = happyReduce 11 16 happyReduction_36
happyReduction_36 (_ `HappyStk`
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

happyReduce_37 = happySpecReduce_2  16 happyReduction_37
happyReduction_37 _
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn16
		 (StmtExprStmt happy_var_1
	)
happyReduction_37 _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_1  16 happyReduction_38
happyReduction_38 _
	 =  HappyAbsSyn16
		 (Empty
	)

happyReduce_39 = happySpecReduce_1  17 happyReduction_39
happyReduction_39 (HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1
	)
happyReduction_39 _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_3  17 happyReduction_40
happyReduction_40 (HappyAbsSyn17  happy_var_3)
	(HappyAbsSyn28  happy_var_2)
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn17
		 (Binary (happy_var_2, happy_var_1, happy_var_3)
	)
happyReduction_40 _ _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_2  17 happyReduction_41
happyReduction_41 (HappyAbsSyn17  happy_var_2)
	(HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn17
		 (Unary (happy_var_1, happy_var_2)
	)
happyReduction_41 _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_1  18 happyReduction_42
happyReduction_42 _
	 =  HappyAbsSyn18
		 (This
	)

happyReduce_43 = happySpecReduce_1  18 happyReduction_43
happyReduction_43 (HappyTerminal (TOKEN_INTEGER_LITERAL happy_var_1))
	 =  HappyAbsSyn18
		 (Integer happy_var_1
	)
happyReduction_43 _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_1  18 happyReduction_44
happyReduction_44 (HappyTerminal (TOKEN_BOOL_LITERAL happy_var_1))
	 =  HappyAbsSyn18
		 (Bool happy_var_1
	)
happyReduction_44 _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_1  18 happyReduction_45
happyReduction_45 (HappyTerminal (TOKEN_CHAR_LITERAL happy_var_1))
	 =  HappyAbsSyn18
		 (Char happy_var_1
	)
happyReduction_45 _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_1  18 happyReduction_46
happyReduction_46 (HappyTerminal (TOKEN_STRING_LITERAL happy_var_1))
	 =  HappyAbsSyn18
		 (String happy_var_1
	)
happyReduction_46 _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_1  18 happyReduction_47
happyReduction_47 _
	 =  HappyAbsSyn18
		 (Jnull
	)

happyReduce_48 = happySpecReduce_1  18 happyReduction_48
happyReduction_48 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn18
		 (StmtExprExpr happy_var_1
	)
happyReduction_48 _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_1  18 happyReduction_49
happyReduction_49 (HappyTerminal (TOKEN_BEZEICHNER happy_var_1))
	 =  HappyAbsSyn18
		 (LocalOrFieldVar happy_var_1
	)
happyReduction_49 _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_3  18 happyReduction_50
happyReduction_50 (HappyTerminal (TOKEN_BEZEICHNER happy_var_3))
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn18
		 (InstVar (happy_var_1, happy_var_3)
	)
happyReduction_50 _ _ _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_3  19 happyReduction_51
happyReduction_51 (HappyAbsSyn24  happy_var_3)
	_
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_1))
	 =  HappyAbsSyn19
		 (Assign(LocalOrFieldVar happy_var_1,happy_var_3)
	)
happyReduction_51 _ _ _  = notHappyAtAll 

happyReduce_52 = happyReduce 5 19 happyReduction_52
happyReduction_52 (_ `HappyStk`
	(HappyAbsSyn25  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn19
		 (New (happy_var_2, happy_var_4)
	) `HappyStk` happyRest

happyReduce_53 = happyReduce 6 19 happyReduction_53
happyReduction_53 (_ `HappyStk`
	(HappyAbsSyn25  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn19
		 (MethodCall (happy_var_1, happy_var_3, happy_var_5)
	) `HappyStk` happyRest

happyReduce_54 = happySpecReduce_1  20 happyReduction_54
happyReduction_54 _
	 =  HappyAbsSyn20
		 ("int"
	)

happyReduce_55 = happySpecReduce_1  20 happyReduction_55
happyReduction_55 _
	 =  HappyAbsSyn20
		 ("char"
	)

happyReduce_56 = happySpecReduce_1  20 happyReduction_56
happyReduction_56 _
	 =  HappyAbsSyn20
		 ("boolean"
	)

happyReduce_57 = happySpecReduce_1  20 happyReduction_57
happyReduction_57 (HappyTerminal (TOKEN_BEZEICHNER happy_var_1))
	 =  HappyAbsSyn20
		 (happy_var_1
	)
happyReduction_57 _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_0  21 happyReduction_58
happyReduction_58  =  HappyAbsSyn21
		 ([]
	)

happyReduce_59 = happySpecReduce_1  21 happyReduction_59
happyReduction_59 (HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn21
		 (happy_var_1
	)
happyReduction_59 _  = notHappyAtAll 

happyReduce_60 = happySpecReduce_1  22 happyReduction_60
happyReduction_60 (HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn22
		 (happy_var_1:[]
	)
happyReduction_60 _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_3  22 happyReduction_61
happyReduction_61 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn22
		 (happy_var_1:happy_var_3
	)
happyReduction_61 _ _ _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_2  23 happyReduction_62
happyReduction_62 (HappyTerminal (TOKEN_BEZEICHNER happy_var_2))
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn23
		 (happy_var_1, happy_var_2
	)
happyReduction_62 _ _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_1  24 happyReduction_63
happyReduction_63 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn24
		 (happy_var_1
	)
happyReduction_63 _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_0  25 happyReduction_64
happyReduction_64  =  HappyAbsSyn25
		 ([]
	)

happyReduce_65 = happySpecReduce_1  25 happyReduction_65
happyReduction_65 (HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn25
		 (happy_var_1
	)
happyReduction_65 _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_1  26 happyReduction_66
happyReduction_66 (HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn26
		 (happy_var_1:[]
	)
happyReduction_66 _  = notHappyAtAll 

happyReduce_67 = happySpecReduce_3  26 happyReduction_67
happyReduction_67 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn26
		 (happy_var_1:happy_var_3
	)
happyReduction_67 _ _ _  = notHappyAtAll 

happyReduce_68 = happySpecReduce_1  27 happyReduction_68
happyReduction_68 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn27
		 (happy_var_1
	)
happyReduction_68 _  = notHappyAtAll 

happyReduce_69 = happySpecReduce_1  28 happyReduction_69
happyReduction_69 _
	 =  HappyAbsSyn28
		 (Equals
	)

happyReduce_70 = happySpecReduce_1  28 happyReduction_70
happyReduction_70 _
	 =  HappyAbsSyn28
		 (LessT
	)

happyReduce_71 = happySpecReduce_1  28 happyReduction_71
happyReduction_71 _
	 =  HappyAbsSyn28
		 (GreaterT
	)

happyReduce_72 = happySpecReduce_1  28 happyReduction_72
happyReduction_72 _
	 =  HappyAbsSyn28
		 (GE
	)

happyReduce_73 = happySpecReduce_1  28 happyReduction_73
happyReduction_73 _
	 =  HappyAbsSyn28
		 (LE
	)

happyReduce_74 = happySpecReduce_1  28 happyReduction_74
happyReduction_74 _
	 =  HappyAbsSyn28
		 (Mult
	)

happyReduce_75 = happySpecReduce_1  28 happyReduction_75
happyReduction_75 _
	 =  HappyAbsSyn28
		 (Div
	)

happyReduce_76 = happySpecReduce_1  28 happyReduction_76
happyReduction_76 _
	 =  HappyAbsSyn28
		 (Modulo
	)

happyReduce_77 = happySpecReduce_1  28 happyReduction_77
happyReduction_77 _
	 =  HappyAbsSyn28
		 (AND
	)

happyReduce_78 = happySpecReduce_1  28 happyReduction_78
happyReduction_78 _
	 =  HappyAbsSyn28
		 (OR
	)

happyReduce_79 = happySpecReduce_1  28 happyReduction_79
happyReduction_79 _
	 =  HappyAbsSyn28
		 (BitwiseOR
	)

happyReduce_80 = happySpecReduce_1  28 happyReduction_80
happyReduction_80 _
	 =  HappyAbsSyn28
		 (BitwiseAND
	)

happyReduce_81 = happySpecReduce_1  28 happyReduction_81
happyReduction_81 _
	 =  HappyAbsSyn28
		 (Plus
	)

happyReduce_82 = happySpecReduce_1  28 happyReduction_82
happyReduction_82 _
	 =  HappyAbsSyn28
		 (Minus
	)

happyReduce_83 = happySpecReduce_1  29 happyReduction_83
happyReduction_83 _
	 =  HappyAbsSyn29
		 (Negation
	)

happyReduce_84 = happySpecReduce_1  29 happyReduction_84
happyReduction_84 _
	 =  HappyAbsSyn29
		 (Positiv
	)

happyReduce_85 = happySpecReduce_1  29 happyReduction_85
happyReduction_85 _
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
defaultConst (Class(modi, name, fields, [], meth)) = Class(modi, name, fields, [Method([], "", name, [], Block [])], meth)
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
