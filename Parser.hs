{-# OPTIONS_GHC -w #-}
module Parser (parser) where
import AbstrakteSyntax
import Scanner
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26 t27 t28 t29 t30 t31 t32 t33
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
	| HappyAbsSyn32 t32
	| HappyAbsSyn33 t33

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,346) ([0,0,0,1024,0,0,0,0,256,0,0,8192,0,0,0,0,0,0,128,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16,0,0,0,0,512,0,0,0,0,0,0,0,0,16384,0,16404,0,0,0,0,128,0,0,0,0,32,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16384,0,0,0,0,0,0,48,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16384,0,0,0,0,4096,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2048,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4096,0,4357,0,0,0,0,0,0,0,16384,0,0,0,0,0,49152,0,0,0,0,16384,0,0,0,0,4096,0,0,0,256,0,0,0,16384,0,16404,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16,0,0,0,0,4,0,0,0,0,0,0,0,0,0,64,0,0,0,0,16,0,0,0,1024,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,8192,0,0,4,320,4,0,0,128,0,0,0,0,0,0,0,0,4096,0,4101,0,0,1024,16384,1025,0,0,0,2,0,0,0,32768,0,0,0,0,2672,3971,22582,0,0,0,0,0,0,0,64,0,0,0,49152,3113,55358,352,0,0,0,2048,0,0,0,0,0,0,0,8192,0,0,0,0,64,0,0,0,0,16,2691,22562,0,0,64,0,0,0,0,256,0,0,0,0,64,0,0,0,0,0,0,0,0,39936,57538,3459,22,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16384,0,0,0,0,4096,33538,8714,88,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,512,0,0,0,0,128,0,0,0,49152,3113,55358,352,0,28672,33546,13839,88,0,32768,0,512,0,0,0,0,0,0,0,1024,0,0,0,0,0,0,0,0,0,1024,0,0,0,0,64,0,0,0,16384,3072,34858,352,0,4096,33536,8714,88,0,1024,41152,2178,22,0,0,0,0,0,0,2048,0,0,0,0,0,0,0,0,0,49156,33440,5640,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8192,0,8,0,0,2048,0,2,0,0,0,0,0,0,16384,3072,34858,352,0,0,0,0,0,0,0,1,0,0,0,16384,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,512,0,0,0,0,0,0,0,0,0,0,0,32,0,0,2,0,0,0,32768,0,0,0,0,64,10764,24712,1,0,8192,0,0,0,0,49820,33760,5645,0,0,12455,24824,1411,0,16384,3072,34858,352,0,0,0,0,0,0,0,0,0,0,0,16384,0,0,0,0,4096,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,0,0,0,0,32,0,0,0,28672,33546,13839,88,0,0,1,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_classPars","classPars","classModifier","attriModifier","methodModifier","konstModifier","maybeFinal","mybeStatic","maybePublic","maybePrivate","methoden","methode","attribute","attribut","konstruktoren","konstruktor","statements","statement","expression","expressionCore","stmtExpr","typ","methodDeclParams","methodDeclParamss","methodDeclParam","literal","params","paramss","param","binaryOp","unaryOp","Klasse","Bezeichner","While","If","Else","Zuweisung","Semikolon","Klazu_Gesch","Klaauf_Gesch","Klaauf_Rund","Klazu_Rund","Geteilt","Mal","Plu","Minu","Modul","An","O","BitOR","BitAND","String_Literal","Integer","Integer_Literal","Char","Char_Literal","Pub","Priv","Stat","Fin","Void","Neww","Return","Akzessor","Bool","Bool_Literal","Vergleich","Groesser","Kleiner","Groesser_Gleich","Kleiner_Gleich","Null","Not","Komma","Thi","%eof"]
        bit_start = st Prelude.* 78
        bit_end = (st Prelude.+ 1) Prelude.* 78
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..77]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (59) = happyShift action_3
action_0 (4) = happyGoto action_4
action_0 (5) = happyGoto action_2
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (59) = happyShift action_3
action_1 (5) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (34) = happyShift action_7
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (62) = happyShift action_6
action_3 (9) = happyGoto action_5
action_3 _ = happyReduce_12

action_4 (78) = happyAccept
action_4 _ = happyFail (happyExpListPerState 4)

action_5 _ = happyReduce_2

action_6 _ = happyReduce_13

action_7 (35) = happyShift action_8
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (42) = happyShift action_9
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (35) = happyReduce_24
action_9 (55) = happyReduce_24
action_9 (57) = happyReduce_24
action_9 (59) = happyShift action_15
action_9 (60) = happyShift action_16
action_9 (61) = happyReduce_18
action_9 (62) = happyReduce_18
action_9 (67) = happyReduce_24
action_9 (6) = happyGoto action_10
action_9 (11) = happyGoto action_11
action_9 (12) = happyGoto action_12
action_9 (15) = happyGoto action_13
action_9 (16) = happyGoto action_14
action_9 _ = happyReduce_24

action_10 (35) = happyShift action_26
action_10 (55) = happyShift action_27
action_10 (57) = happyShift action_28
action_10 (67) = happyShift action_29
action_10 (24) = happyGoto action_25
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (62) = happyShift action_6
action_11 (9) = happyGoto action_24
action_11 _ = happyReduce_12

action_12 (62) = happyShift action_6
action_12 (9) = happyGoto action_23
action_12 _ = happyReduce_12

action_13 (35) = happyReduce_27
action_13 (59) = happyShift action_21
action_13 (60) = happyShift action_22
action_13 (8) = happyGoto action_18
action_13 (17) = happyGoto action_19
action_13 (18) = happyGoto action_20
action_13 _ = happyReduce_27

action_14 (35) = happyReduce_24
action_14 (55) = happyReduce_24
action_14 (57) = happyReduce_24
action_14 (59) = happyShift action_15
action_14 (60) = happyShift action_16
action_14 (61) = happyReduce_18
action_14 (62) = happyReduce_18
action_14 (67) = happyReduce_24
action_14 (6) = happyGoto action_10
action_14 (11) = happyGoto action_11
action_14 (12) = happyGoto action_12
action_14 (15) = happyGoto action_17
action_14 (16) = happyGoto action_14
action_14 _ = happyReduce_24

action_15 _ = happyReduce_17

action_16 _ = happyReduce_19

action_17 _ = happyReduce_25

action_18 (35) = happyShift action_41
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (41) = happyReduce_20
action_19 (59) = happyShift action_39
action_19 (60) = happyShift action_40
action_19 (7) = happyGoto action_35
action_19 (8) = happyGoto action_36
action_19 (13) = happyGoto action_37
action_19 (14) = happyGoto action_38
action_19 _ = happyReduce_11

action_20 (35) = happyReduce_27
action_20 (59) = happyShift action_21
action_20 (60) = happyShift action_22
action_20 (8) = happyGoto action_18
action_20 (17) = happyGoto action_34
action_20 (18) = happyGoto action_20
action_20 _ = happyReduce_27

action_21 _ = happyReduce_9

action_22 _ = happyReduce_10

action_23 (61) = happyShift action_32
action_23 (10) = happyGoto action_33
action_23 _ = happyReduce_14

action_24 (61) = happyShift action_32
action_24 (10) = happyGoto action_31
action_24 _ = happyReduce_14

action_25 (35) = happyShift action_30
action_25 _ = happyFail (happyExpListPerState 25)

action_26 _ = happyReduce_59

action_27 _ = happyReduce_56

action_28 _ = happyReduce_57

action_29 _ = happyReduce_58

action_30 (40) = happyShift action_49
action_30 _ = happyFail (happyExpListPerState 30)

action_31 _ = happyReduce_4

action_32 _ = happyReduce_15

action_33 _ = happyReduce_5

action_34 _ = happyReduce_28

action_35 (35) = happyShift action_26
action_35 (55) = happyShift action_27
action_35 (57) = happyShift action_28
action_35 (63) = happyShift action_48
action_35 (67) = happyShift action_29
action_35 (24) = happyGoto action_47
action_35 _ = happyFail (happyExpListPerState 35)

action_36 _ = happyReduce_6

action_37 (41) = happyShift action_46
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (41) = happyReduce_20
action_38 (59) = happyShift action_39
action_38 (60) = happyShift action_40
action_38 (7) = happyGoto action_35
action_38 (8) = happyGoto action_36
action_38 (13) = happyGoto action_45
action_38 (14) = happyGoto action_38
action_38 _ = happyReduce_11

action_39 (61) = happyShift action_44
action_39 _ = happyReduce_9

action_40 (61) = happyShift action_43
action_40 _ = happyReduce_10

action_41 (43) = happyShift action_42
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (35) = happyShift action_26
action_42 (55) = happyShift action_27
action_42 (57) = happyShift action_28
action_42 (67) = happyShift action_29
action_42 (24) = happyGoto action_52
action_42 (25) = happyGoto action_53
action_42 (26) = happyGoto action_54
action_42 (27) = happyGoto action_55
action_42 _ = happyReduce_60

action_43 _ = happyReduce_8

action_44 _ = happyReduce_7

action_45 _ = happyReduce_21

action_46 _ = happyReduce_1

action_47 (35) = happyShift action_51
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (35) = happyShift action_50
action_48 _ = happyFail (happyExpListPerState 48)

action_49 _ = happyReduce_26

action_50 (43) = happyShift action_60
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (43) = happyShift action_59
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (35) = happyShift action_58
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (44) = happyShift action_57
action_53 _ = happyFail (happyExpListPerState 53)

action_54 _ = happyReduce_61

action_55 (76) = happyShift action_56
action_55 _ = happyReduce_62

action_56 (35) = happyShift action_26
action_56 (55) = happyShift action_27
action_56 (57) = happyShift action_28
action_56 (67) = happyShift action_29
action_56 (24) = happyGoto action_52
action_56 (26) = happyGoto action_64
action_56 (27) = happyGoto action_55
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (42) = happyShift action_63
action_57 _ = happyFail (happyExpListPerState 57)

action_58 _ = happyReduce_64

action_59 (35) = happyShift action_26
action_59 (55) = happyShift action_27
action_59 (57) = happyShift action_28
action_59 (67) = happyShift action_29
action_59 (24) = happyGoto action_52
action_59 (25) = happyGoto action_62
action_59 (26) = happyGoto action_54
action_59 (27) = happyGoto action_55
action_59 _ = happyReduce_60

action_60 (35) = happyShift action_26
action_60 (55) = happyShift action_27
action_60 (57) = happyShift action_28
action_60 (67) = happyShift action_29
action_60 (24) = happyGoto action_52
action_60 (25) = happyGoto action_61
action_60 (26) = happyGoto action_54
action_60 (27) = happyGoto action_55
action_60 _ = happyReduce_60

action_61 (44) = happyShift action_89
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (44) = happyShift action_88
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (35) = happyShift action_72
action_63 (36) = happyShift action_73
action_63 (37) = happyShift action_74
action_63 (40) = happyShift action_75
action_63 (42) = happyShift action_76
action_63 (47) = happyShift action_77
action_63 (48) = happyShift action_78
action_63 (54) = happyShift action_79
action_63 (55) = happyShift action_27
action_63 (56) = happyShift action_80
action_63 (57) = happyShift action_28
action_63 (58) = happyShift action_81
action_63 (64) = happyShift action_82
action_63 (65) = happyShift action_83
action_63 (67) = happyShift action_29
action_63 (68) = happyShift action_84
action_63 (74) = happyShift action_85
action_63 (75) = happyShift action_86
action_63 (77) = happyShift action_87
action_63 (19) = happyGoto action_65
action_63 (20) = happyGoto action_66
action_63 (21) = happyGoto action_67
action_63 (22) = happyGoto action_68
action_63 (23) = happyGoto action_69
action_63 (24) = happyGoto action_70
action_63 (33) = happyGoto action_71
action_63 _ = happyReduce_30

action_64 _ = happyReduce_63

action_65 (41) = happyShift action_121
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (35) = happyShift action_72
action_66 (36) = happyShift action_73
action_66 (37) = happyShift action_74
action_66 (40) = happyShift action_75
action_66 (42) = happyShift action_76
action_66 (47) = happyShift action_77
action_66 (48) = happyShift action_78
action_66 (54) = happyShift action_79
action_66 (55) = happyShift action_27
action_66 (56) = happyShift action_80
action_66 (57) = happyShift action_28
action_66 (58) = happyShift action_81
action_66 (64) = happyShift action_82
action_66 (65) = happyShift action_83
action_66 (67) = happyShift action_29
action_66 (68) = happyShift action_84
action_66 (74) = happyShift action_85
action_66 (75) = happyShift action_86
action_66 (77) = happyShift action_87
action_66 (19) = happyGoto action_120
action_66 (20) = happyGoto action_66
action_66 (21) = happyGoto action_67
action_66 (22) = happyGoto action_68
action_66 (23) = happyGoto action_69
action_66 (24) = happyGoto action_70
action_66 (33) = happyGoto action_71
action_66 _ = happyReduce_30

action_67 (66) = happyShift action_119
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (45) = happyShift action_105
action_68 (46) = happyShift action_106
action_68 (47) = happyShift action_107
action_68 (48) = happyShift action_108
action_68 (49) = happyShift action_109
action_68 (50) = happyShift action_110
action_68 (51) = happyShift action_111
action_68 (52) = happyShift action_112
action_68 (53) = happyShift action_113
action_68 (69) = happyShift action_114
action_68 (70) = happyShift action_115
action_68 (71) = happyShift action_116
action_68 (72) = happyShift action_117
action_68 (73) = happyShift action_118
action_68 (32) = happyGoto action_104
action_68 _ = happyReduce_41

action_69 (40) = happyShift action_103
action_69 _ = happyReduce_50

action_70 (35) = happyShift action_102
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (35) = happyShift action_94
action_71 (47) = happyShift action_77
action_71 (48) = happyShift action_78
action_71 (54) = happyShift action_79
action_71 (56) = happyShift action_80
action_71 (58) = happyShift action_81
action_71 (64) = happyShift action_82
action_71 (68) = happyShift action_84
action_71 (74) = happyShift action_85
action_71 (75) = happyShift action_86
action_71 (77) = happyShift action_87
action_71 (21) = happyGoto action_101
action_71 (22) = happyGoto action_68
action_71 (23) = happyGoto action_93
action_71 (33) = happyGoto action_71
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (39) = happyShift action_100
action_72 (45) = happyReduce_51
action_72 (46) = happyReduce_51
action_72 (47) = happyReduce_51
action_72 (48) = happyReduce_51
action_72 (49) = happyReduce_51
action_72 (50) = happyReduce_51
action_72 (51) = happyReduce_51
action_72 (52) = happyReduce_51
action_72 (53) = happyReduce_51
action_72 (66) = happyReduce_51
action_72 (69) = happyReduce_51
action_72 (70) = happyReduce_51
action_72 (71) = happyReduce_51
action_72 (72) = happyReduce_51
action_72 (73) = happyReduce_51
action_72 _ = happyReduce_59

action_73 (43) = happyShift action_99
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (43) = happyShift action_98
action_74 _ = happyFail (happyExpListPerState 74)

action_75 _ = happyReduce_40

action_76 (35) = happyShift action_72
action_76 (36) = happyShift action_73
action_76 (37) = happyShift action_74
action_76 (40) = happyShift action_75
action_76 (42) = happyShift action_76
action_76 (47) = happyShift action_77
action_76 (48) = happyShift action_78
action_76 (54) = happyShift action_79
action_76 (55) = happyShift action_27
action_76 (56) = happyShift action_80
action_76 (57) = happyShift action_28
action_76 (58) = happyShift action_81
action_76 (64) = happyShift action_82
action_76 (65) = happyShift action_83
action_76 (67) = happyShift action_29
action_76 (68) = happyShift action_84
action_76 (74) = happyShift action_85
action_76 (75) = happyShift action_86
action_76 (77) = happyShift action_87
action_76 (19) = happyGoto action_97
action_76 (20) = happyGoto action_66
action_76 (21) = happyGoto action_67
action_76 (22) = happyGoto action_68
action_76 (23) = happyGoto action_69
action_76 (24) = happyGoto action_70
action_76 (33) = happyGoto action_71
action_76 _ = happyReduce_30

action_77 _ = happyReduce_86

action_78 _ = happyReduce_87

action_79 _ = happyReduce_48

action_80 _ = happyReduce_45

action_81 _ = happyReduce_47

action_82 (35) = happyShift action_96
action_82 _ = happyFail (happyExpListPerState 82)

action_83 (35) = happyShift action_94
action_83 (40) = happyShift action_95
action_83 (47) = happyShift action_77
action_83 (48) = happyShift action_78
action_83 (54) = happyShift action_79
action_83 (56) = happyShift action_80
action_83 (58) = happyShift action_81
action_83 (64) = happyShift action_82
action_83 (68) = happyShift action_84
action_83 (74) = happyShift action_85
action_83 (75) = happyShift action_86
action_83 (77) = happyShift action_87
action_83 (21) = happyGoto action_92
action_83 (22) = happyGoto action_68
action_83 (23) = happyGoto action_93
action_83 (33) = happyGoto action_71
action_83 _ = happyFail (happyExpListPerState 83)

action_84 _ = happyReduce_46

action_85 _ = happyReduce_49

action_86 _ = happyReduce_85

action_87 _ = happyReduce_44

action_88 (42) = happyShift action_91
action_88 _ = happyFail (happyExpListPerState 88)

action_89 (42) = happyShift action_90
action_89 _ = happyFail (happyExpListPerState 89)

action_90 (35) = happyShift action_72
action_90 (36) = happyShift action_73
action_90 (37) = happyShift action_74
action_90 (40) = happyShift action_75
action_90 (42) = happyShift action_76
action_90 (47) = happyShift action_77
action_90 (48) = happyShift action_78
action_90 (54) = happyShift action_79
action_90 (55) = happyShift action_27
action_90 (56) = happyShift action_80
action_90 (57) = happyShift action_28
action_90 (58) = happyShift action_81
action_90 (64) = happyShift action_82
action_90 (65) = happyShift action_83
action_90 (67) = happyShift action_29
action_90 (68) = happyShift action_84
action_90 (74) = happyShift action_85
action_90 (75) = happyShift action_86
action_90 (77) = happyShift action_87
action_90 (19) = happyGoto action_133
action_90 (20) = happyGoto action_66
action_90 (21) = happyGoto action_67
action_90 (22) = happyGoto action_68
action_90 (23) = happyGoto action_69
action_90 (24) = happyGoto action_70
action_90 (33) = happyGoto action_71
action_90 _ = happyReduce_30

action_91 (35) = happyShift action_72
action_91 (36) = happyShift action_73
action_91 (37) = happyShift action_74
action_91 (40) = happyShift action_75
action_91 (42) = happyShift action_76
action_91 (47) = happyShift action_77
action_91 (48) = happyShift action_78
action_91 (54) = happyShift action_79
action_91 (55) = happyShift action_27
action_91 (56) = happyShift action_80
action_91 (57) = happyShift action_28
action_91 (58) = happyShift action_81
action_91 (64) = happyShift action_82
action_91 (65) = happyShift action_83
action_91 (67) = happyShift action_29
action_91 (68) = happyShift action_84
action_91 (74) = happyShift action_85
action_91 (75) = happyShift action_86
action_91 (77) = happyShift action_87
action_91 (19) = happyGoto action_132
action_91 (20) = happyGoto action_66
action_91 (21) = happyGoto action_67
action_91 (22) = happyGoto action_68
action_91 (23) = happyGoto action_69
action_91 (24) = happyGoto action_70
action_91 (33) = happyGoto action_71
action_91 _ = happyReduce_30

action_92 (40) = happyShift action_131
action_92 (66) = happyShift action_119
action_92 _ = happyFail (happyExpListPerState 92)

action_93 _ = happyReduce_50

action_94 (39) = happyShift action_100
action_94 _ = happyReduce_51

action_95 _ = happyReduce_33

action_96 (43) = happyShift action_130
action_96 _ = happyFail (happyExpListPerState 96)

action_97 (41) = happyShift action_129
action_97 _ = happyFail (happyExpListPerState 97)

action_98 (35) = happyShift action_94
action_98 (47) = happyShift action_77
action_98 (48) = happyShift action_78
action_98 (54) = happyShift action_79
action_98 (56) = happyShift action_80
action_98 (58) = happyShift action_81
action_98 (64) = happyShift action_82
action_98 (68) = happyShift action_84
action_98 (74) = happyShift action_85
action_98 (75) = happyShift action_86
action_98 (77) = happyShift action_87
action_98 (21) = happyGoto action_128
action_98 (22) = happyGoto action_68
action_98 (23) = happyGoto action_93
action_98 (33) = happyGoto action_71
action_98 _ = happyFail (happyExpListPerState 98)

action_99 (35) = happyShift action_94
action_99 (47) = happyShift action_77
action_99 (48) = happyShift action_78
action_99 (54) = happyShift action_79
action_99 (56) = happyShift action_80
action_99 (58) = happyShift action_81
action_99 (64) = happyShift action_82
action_99 (68) = happyShift action_84
action_99 (74) = happyShift action_85
action_99 (75) = happyShift action_86
action_99 (77) = happyShift action_87
action_99 (21) = happyGoto action_127
action_99 (22) = happyGoto action_68
action_99 (23) = happyGoto action_93
action_99 (33) = happyGoto action_71
action_99 _ = happyFail (happyExpListPerState 99)

action_100 (35) = happyShift action_94
action_100 (47) = happyShift action_77
action_100 (48) = happyShift action_78
action_100 (54) = happyShift action_79
action_100 (56) = happyShift action_80
action_100 (58) = happyShift action_81
action_100 (64) = happyShift action_82
action_100 (68) = happyShift action_84
action_100 (74) = happyShift action_85
action_100 (75) = happyShift action_86
action_100 (77) = happyShift action_87
action_100 (21) = happyGoto action_125
action_100 (22) = happyGoto action_68
action_100 (23) = happyGoto action_93
action_100 (28) = happyGoto action_126
action_100 (33) = happyGoto action_71
action_100 _ = happyFail (happyExpListPerState 100)

action_101 (66) = happyShift action_119
action_101 _ = happyReduce_43

action_102 (40) = happyShift action_124
action_102 _ = happyFail (happyExpListPerState 102)

action_103 _ = happyReduce_39

action_104 (35) = happyShift action_94
action_104 (47) = happyShift action_77
action_104 (48) = happyShift action_78
action_104 (54) = happyShift action_79
action_104 (56) = happyShift action_80
action_104 (58) = happyShift action_81
action_104 (64) = happyShift action_82
action_104 (68) = happyShift action_84
action_104 (74) = happyShift action_85
action_104 (75) = happyShift action_86
action_104 (77) = happyShift action_87
action_104 (21) = happyGoto action_123
action_104 (22) = happyGoto action_68
action_104 (23) = happyGoto action_93
action_104 (33) = happyGoto action_71
action_104 _ = happyFail (happyExpListPerState 104)

action_105 _ = happyReduce_77

action_106 _ = happyReduce_76

action_107 _ = happyReduce_83

action_108 _ = happyReduce_84

action_109 _ = happyReduce_78

action_110 _ = happyReduce_79

action_111 _ = happyReduce_80

action_112 _ = happyReduce_81

action_113 _ = happyReduce_82

action_114 _ = happyReduce_71

action_115 _ = happyReduce_73

action_116 _ = happyReduce_72

action_117 _ = happyReduce_74

action_118 _ = happyReduce_75

action_119 (35) = happyShift action_122
action_119 _ = happyFail (happyExpListPerState 119)

action_120 _ = happyReduce_31

action_121 _ = happyReduce_29

action_122 (43) = happyShift action_142
action_122 _ = happyReduce_52

action_123 (66) = happyShift action_119
action_123 _ = happyReduce_42

action_124 _ = happyReduce_36

action_125 (66) = happyShift action_119
action_125 _ = happyReduce_65

action_126 _ = happyReduce_53

action_127 (44) = happyShift action_141
action_127 (66) = happyShift action_119
action_127 _ = happyFail (happyExpListPerState 127)

action_128 (44) = happyShift action_140
action_128 (66) = happyShift action_119
action_128 _ = happyFail (happyExpListPerState 128)

action_129 _ = happyReduce_32

action_130 (35) = happyShift action_94
action_130 (47) = happyShift action_77
action_130 (48) = happyShift action_78
action_130 (54) = happyShift action_79
action_130 (56) = happyShift action_80
action_130 (58) = happyShift action_81
action_130 (64) = happyShift action_82
action_130 (68) = happyShift action_84
action_130 (74) = happyShift action_85
action_130 (75) = happyShift action_86
action_130 (77) = happyShift action_87
action_130 (21) = happyGoto action_136
action_130 (22) = happyGoto action_68
action_130 (23) = happyGoto action_93
action_130 (29) = happyGoto action_137
action_130 (30) = happyGoto action_138
action_130 (31) = happyGoto action_139
action_130 (33) = happyGoto action_71
action_130 _ = happyReduce_66

action_131 _ = happyReduce_34

action_132 (41) = happyShift action_135
action_132 _ = happyFail (happyExpListPerState 132)

action_133 (41) = happyShift action_134
action_133 _ = happyFail (happyExpListPerState 133)

action_134 _ = happyReduce_23

action_135 _ = happyReduce_22

action_136 (66) = happyShift action_119
action_136 _ = happyReduce_70

action_137 (44) = happyShift action_147
action_137 _ = happyFail (happyExpListPerState 137)

action_138 _ = happyReduce_67

action_139 (76) = happyShift action_146
action_139 _ = happyReduce_68

action_140 (42) = happyShift action_145
action_140 _ = happyFail (happyExpListPerState 140)

action_141 (42) = happyShift action_144
action_141 _ = happyFail (happyExpListPerState 141)

action_142 (35) = happyShift action_94
action_142 (47) = happyShift action_77
action_142 (48) = happyShift action_78
action_142 (54) = happyShift action_79
action_142 (56) = happyShift action_80
action_142 (58) = happyShift action_81
action_142 (64) = happyShift action_82
action_142 (68) = happyShift action_84
action_142 (74) = happyShift action_85
action_142 (75) = happyShift action_86
action_142 (77) = happyShift action_87
action_142 (21) = happyGoto action_136
action_142 (22) = happyGoto action_68
action_142 (23) = happyGoto action_93
action_142 (29) = happyGoto action_143
action_142 (30) = happyGoto action_138
action_142 (31) = happyGoto action_139
action_142 (33) = happyGoto action_71
action_142 _ = happyReduce_66

action_143 (44) = happyShift action_151
action_143 _ = happyFail (happyExpListPerState 143)

action_144 (35) = happyShift action_72
action_144 (36) = happyShift action_73
action_144 (37) = happyShift action_74
action_144 (40) = happyShift action_75
action_144 (42) = happyShift action_76
action_144 (47) = happyShift action_77
action_144 (48) = happyShift action_78
action_144 (54) = happyShift action_79
action_144 (55) = happyShift action_27
action_144 (56) = happyShift action_80
action_144 (57) = happyShift action_28
action_144 (58) = happyShift action_81
action_144 (64) = happyShift action_82
action_144 (65) = happyShift action_83
action_144 (67) = happyShift action_29
action_144 (68) = happyShift action_84
action_144 (74) = happyShift action_85
action_144 (75) = happyShift action_86
action_144 (77) = happyShift action_87
action_144 (19) = happyGoto action_150
action_144 (20) = happyGoto action_66
action_144 (21) = happyGoto action_67
action_144 (22) = happyGoto action_68
action_144 (23) = happyGoto action_69
action_144 (24) = happyGoto action_70
action_144 (33) = happyGoto action_71
action_144 _ = happyReduce_30

action_145 (35) = happyShift action_72
action_145 (36) = happyShift action_73
action_145 (37) = happyShift action_74
action_145 (40) = happyShift action_75
action_145 (42) = happyShift action_76
action_145 (47) = happyShift action_77
action_145 (48) = happyShift action_78
action_145 (54) = happyShift action_79
action_145 (55) = happyShift action_27
action_145 (56) = happyShift action_80
action_145 (57) = happyShift action_28
action_145 (58) = happyShift action_81
action_145 (64) = happyShift action_82
action_145 (65) = happyShift action_83
action_145 (67) = happyShift action_29
action_145 (68) = happyShift action_84
action_145 (74) = happyShift action_85
action_145 (75) = happyShift action_86
action_145 (77) = happyShift action_87
action_145 (19) = happyGoto action_149
action_145 (20) = happyGoto action_66
action_145 (21) = happyGoto action_67
action_145 (22) = happyGoto action_68
action_145 (23) = happyGoto action_69
action_145 (24) = happyGoto action_70
action_145 (33) = happyGoto action_71
action_145 _ = happyReduce_30

action_146 (35) = happyShift action_94
action_146 (47) = happyShift action_77
action_146 (48) = happyShift action_78
action_146 (54) = happyShift action_79
action_146 (56) = happyShift action_80
action_146 (58) = happyShift action_81
action_146 (64) = happyShift action_82
action_146 (68) = happyShift action_84
action_146 (74) = happyShift action_85
action_146 (75) = happyShift action_86
action_146 (77) = happyShift action_87
action_146 (21) = happyGoto action_136
action_146 (22) = happyGoto action_68
action_146 (23) = happyGoto action_93
action_146 (30) = happyGoto action_148
action_146 (31) = happyGoto action_139
action_146 (33) = happyGoto action_71
action_146 _ = happyFail (happyExpListPerState 146)

action_147 _ = happyReduce_54

action_148 _ = happyReduce_69

action_149 (41) = happyShift action_153
action_149 _ = happyFail (happyExpListPerState 149)

action_150 (41) = happyShift action_152
action_150 _ = happyFail (happyExpListPerState 150)

action_151 _ = happyReduce_55

action_152 _ = happyReduce_35

action_153 (38) = happyShift action_154
action_153 _ = happyReduce_37

action_154 (42) = happyShift action_155
action_154 _ = happyFail (happyExpListPerState 154)

action_155 (35) = happyShift action_72
action_155 (36) = happyShift action_73
action_155 (37) = happyShift action_74
action_155 (40) = happyShift action_75
action_155 (42) = happyShift action_76
action_155 (47) = happyShift action_77
action_155 (48) = happyShift action_78
action_155 (54) = happyShift action_79
action_155 (55) = happyShift action_27
action_155 (56) = happyShift action_80
action_155 (57) = happyShift action_28
action_155 (58) = happyShift action_81
action_155 (64) = happyShift action_82
action_155 (65) = happyShift action_83
action_155 (67) = happyShift action_29
action_155 (68) = happyShift action_84
action_155 (74) = happyShift action_85
action_155 (75) = happyShift action_86
action_155 (77) = happyShift action_87
action_155 (19) = happyGoto action_156
action_155 (20) = happyGoto action_66
action_155 (21) = happyGoto action_67
action_155 (22) = happyGoto action_68
action_155 (23) = happyGoto action_69
action_155 (24) = happyGoto action_70
action_155 (33) = happyGoto action_71
action_155 _ = happyReduce_30

action_156 (41) = happyShift action_157
action_156 _ = happyFail (happyExpListPerState 156)

action_157 _ = happyReduce_38

happyReduce_1 = happyReduce 8 4 happyReduction_1
happyReduction_1 (_ `HappyStk`
	(HappyAbsSyn13  happy_var_7) `HappyStk`
	(HappyAbsSyn17  happy_var_6) `HappyStk`
	(HappyAbsSyn15  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Class(happy_var_1, happy_var_3, happy_var_5, happy_var_6, happy_var_7)
	) `HappyStk` happyRest

happyReduce_2 = happySpecReduce_2  5 happyReduction_2
happyReduction_2 _
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn5
		 (Public:happy_var_1
	)
happyReduction_2 _ _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_0  6 happyReduction_3
happyReduction_3  =  HappyAbsSyn6
		 ([]
	)

happyReduce_4 = happySpecReduce_3  6 happyReduction_4
happyReduction_4 (HappyAbsSyn10  happy_var_3)
	(HappyAbsSyn9  happy_var_2)
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1:happy_var_2:happy_var_3
	)
happyReduction_4 _ _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_3  6 happyReduction_5
happyReduction_5 (HappyAbsSyn10  happy_var_3)
	(HappyAbsSyn9  happy_var_2)
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1:happy_var_2:happy_var_3
	)
happyReduction_5 _ _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_1  7 happyReduction_6
happyReduction_6 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_2  7 happyReduction_7
happyReduction_7 _
	_
	 =  HappyAbsSyn7
		 (Public:Static:[]
	)

happyReduce_8 = happySpecReduce_2  7 happyReduction_8
happyReduction_8 _
	_
	 =  HappyAbsSyn7
		 (Private:Static:[]
	)

happyReduce_9 = happySpecReduce_1  8 happyReduction_9
happyReduction_9 _
	 =  HappyAbsSyn8
		 (Public:[]
	)

happyReduce_10 = happySpecReduce_1  8 happyReduction_10
happyReduction_10 _
	 =  HappyAbsSyn8
		 (Private:[]
	)

happyReduce_11 = happySpecReduce_0  8 happyReduction_11
happyReduction_11  =  HappyAbsSyn8
		 ([]
	)

happyReduce_12 = happySpecReduce_0  9 happyReduction_12
happyReduction_12  =  HappyAbsSyn9
		 ([]
	)

happyReduce_13 = happySpecReduce_1  9 happyReduction_13
happyReduction_13 _
	 =  HappyAbsSyn9
		 (Final:[]
	)

happyReduce_14 = happySpecReduce_0  10 happyReduction_14
happyReduction_14  =  HappyAbsSyn10
		 ([]
	)

happyReduce_15 = happySpecReduce_1  10 happyReduction_15
happyReduction_15 _
	 =  HappyAbsSyn10
		 (Static:[]
	)

happyReduce_16 = happySpecReduce_0  11 happyReduction_16
happyReduction_16  =  HappyAbsSyn11
		 ([]
	)

happyReduce_17 = happySpecReduce_1  11 happyReduction_17
happyReduction_17 _
	 =  HappyAbsSyn11
		 (Public:[]
	)

happyReduce_18 = happySpecReduce_0  12 happyReduction_18
happyReduction_18  =  HappyAbsSyn12
		 ([]
	)

happyReduce_19 = happySpecReduce_1  12 happyReduction_19
happyReduction_19 _
	 =  HappyAbsSyn12
		 (Private:[]
	)

happyReduce_20 = happySpecReduce_0  13 happyReduction_20
happyReduction_20  =  HappyAbsSyn13
		 ([]
	)

happyReduce_21 = happySpecReduce_2  13 happyReduction_21
happyReduction_21 (HappyAbsSyn13  happy_var_2)
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn13
		 (happy_var_1:happy_var_2
	)
happyReduction_21 _ _  = notHappyAtAll 

happyReduce_22 = happyReduce 9 14 happyReduction_22
happyReduction_22 (_ `HappyStk`
	(HappyAbsSyn19  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn25  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_3)) `HappyStk`
	(HappyAbsSyn24  happy_var_2) `HappyStk`
	(HappyAbsSyn7  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (Method(happy_var_1, happy_var_2, happy_var_3, happy_var_5, Block happy_var_8)
	) `HappyStk` happyRest

happyReduce_23 = happyReduce 9 14 happyReduction_23
happyReduction_23 (_ `HappyStk`
	(HappyAbsSyn19  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn25  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (Method(happy_var_1, "void", happy_var_3, happy_var_5, Block happy_var_8)
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

happyReduce_26 = happyReduce 4 16 happyReduction_26
happyReduction_26 (_ `HappyStk`
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_3)) `HappyStk`
	(HappyAbsSyn24  happy_var_2) `HappyStk`
	(HappyAbsSyn6  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (FieldDecl (happy_var_1, happy_var_2, happy_var_3)
	) `HappyStk` happyRest

happyReduce_27 = happySpecReduce_0  17 happyReduction_27
happyReduction_27  =  HappyAbsSyn17
		 ([]
	)

happyReduce_28 = happySpecReduce_2  17 happyReduction_28
happyReduction_28 (HappyAbsSyn17  happy_var_2)
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1:happy_var_2
	)
happyReduction_28 _ _  = notHappyAtAll 

happyReduce_29 = happyReduce 8 18 happyReduction_29
happyReduction_29 (_ `HappyStk`
	(HappyAbsSyn19  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn25  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_2)) `HappyStk`
	(HappyAbsSyn8  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn18
		 (Method(happy_var_1, "", happy_var_2, happy_var_4, Block happy_var_7)
	) `HappyStk` happyRest

happyReduce_30 = happySpecReduce_0  19 happyReduction_30
happyReduction_30  =  HappyAbsSyn19
		 ([]
	)

happyReduce_31 = happySpecReduce_2  19 happyReduction_31
happyReduction_31 (HappyAbsSyn19  happy_var_2)
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn19
		 (happy_var_1:happy_var_2
	)
happyReduction_31 _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  20 happyReduction_32
happyReduction_32 _
	(HappyAbsSyn19  happy_var_2)
	_
	 =  HappyAbsSyn20
		 (Block happy_var_2
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_2  20 happyReduction_33
happyReduction_33 _
	_
	 =  HappyAbsSyn20
		 (Return Nothing
	)

happyReduce_34 = happySpecReduce_3  20 happyReduction_34
happyReduction_34 _
	(HappyAbsSyn21  happy_var_2)
	_
	 =  HappyAbsSyn20
		 (Return (Just (happy_var_2))
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happyReduce 7 20 happyReduction_35
happyReduction_35 (_ `HappyStk`
	(HappyAbsSyn19  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn21  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn20
		 (While (happy_var_3, Block happy_var_6)
	) `HappyStk` happyRest

happyReduce_36 = happySpecReduce_3  20 happyReduction_36
happyReduction_36 _
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_2))
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn20
		 (LocalVarDecl (happy_var_1,happy_var_2)
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happyReduce 7 20 happyReduction_37
happyReduction_37 (_ `HappyStk`
	(HappyAbsSyn19  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn21  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn20
		 (If (happy_var_3, Block happy_var_6, Nothing)
	) `HappyStk` happyRest

happyReduce_38 = happyReduce 11 20 happyReduction_38
happyReduction_38 (_ `HappyStk`
	(HappyAbsSyn19  happy_var_10) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn19  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn21  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn20
		 (If (happy_var_3, Block happy_var_6, Just (Block happy_var_10))
	) `HappyStk` happyRest

happyReduce_39 = happySpecReduce_2  20 happyReduction_39
happyReduction_39 _
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn20
		 (StmtExprStmt happy_var_1
	)
happyReduction_39 _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_1  20 happyReduction_40
happyReduction_40 _
	 =  HappyAbsSyn20
		 (Empty
	)

happyReduce_41 = happySpecReduce_1  21 happyReduction_41
happyReduction_41 (HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn21
		 (happy_var_1
	)
happyReduction_41 _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_3  21 happyReduction_42
happyReduction_42 (HappyAbsSyn21  happy_var_3)
	(HappyAbsSyn32  happy_var_2)
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn21
		 (Binary (happy_var_2, happy_var_1, happy_var_3)
	)
happyReduction_42 _ _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_2  21 happyReduction_43
happyReduction_43 (HappyAbsSyn21  happy_var_2)
	(HappyAbsSyn33  happy_var_1)
	 =  HappyAbsSyn21
		 (Unary (happy_var_1, happy_var_2)
	)
happyReduction_43 _ _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_1  22 happyReduction_44
happyReduction_44 _
	 =  HappyAbsSyn22
		 (This
	)

happyReduce_45 = happySpecReduce_1  22 happyReduction_45
happyReduction_45 (HappyTerminal (TOKEN_INTEGER_LITERAL happy_var_1))
	 =  HappyAbsSyn22
		 (Integer happy_var_1
	)
happyReduction_45 _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_1  22 happyReduction_46
happyReduction_46 (HappyTerminal (TOKEN_BOOL_LITERAL happy_var_1))
	 =  HappyAbsSyn22
		 (Bool happy_var_1
	)
happyReduction_46 _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_1  22 happyReduction_47
happyReduction_47 (HappyTerminal (TOKEN_CHAR_LITERAL happy_var_1))
	 =  HappyAbsSyn22
		 (Char happy_var_1
	)
happyReduction_47 _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_1  22 happyReduction_48
happyReduction_48 (HappyTerminal (TOKEN_STRING_LITERAL happy_var_1))
	 =  HappyAbsSyn22
		 (String happy_var_1
	)
happyReduction_48 _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_1  22 happyReduction_49
happyReduction_49 _
	 =  HappyAbsSyn22
		 (Jnull
	)

happyReduce_50 = happySpecReduce_1  22 happyReduction_50
happyReduction_50 (HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn22
		 (StmtExprExpr happy_var_1
	)
happyReduction_50 _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_1  22 happyReduction_51
happyReduction_51 (HappyTerminal (TOKEN_BEZEICHNER happy_var_1))
	 =  HappyAbsSyn22
		 (LocalOrFieldVar happy_var_1
	)
happyReduction_51 _  = notHappyAtAll 

happyReduce_52 = happySpecReduce_3  22 happyReduction_52
happyReduction_52 (HappyTerminal (TOKEN_BEZEICHNER happy_var_3))
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn22
		 (InstVar (happy_var_1, happy_var_3)
	)
happyReduction_52 _ _ _  = notHappyAtAll 

happyReduce_53 = happySpecReduce_3  23 happyReduction_53
happyReduction_53 (HappyAbsSyn28  happy_var_3)
	_
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_1))
	 =  HappyAbsSyn23
		 (Assign(LocalOrFieldVar happy_var_1,happy_var_3)
	)
happyReduction_53 _ _ _  = notHappyAtAll 

happyReduce_54 = happyReduce 5 23 happyReduction_54
happyReduction_54 (_ `HappyStk`
	(HappyAbsSyn29  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn23
		 (New (happy_var_2, happy_var_4)
	) `HappyStk` happyRest

happyReduce_55 = happyReduce 6 23 happyReduction_55
happyReduction_55 (_ `HappyStk`
	(HappyAbsSyn29  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn21  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn23
		 (MethodCall (happy_var_1, happy_var_3, happy_var_5)
	) `HappyStk` happyRest

happyReduce_56 = happySpecReduce_1  24 happyReduction_56
happyReduction_56 _
	 =  HappyAbsSyn24
		 ("int"
	)

happyReduce_57 = happySpecReduce_1  24 happyReduction_57
happyReduction_57 _
	 =  HappyAbsSyn24
		 ("char"
	)

happyReduce_58 = happySpecReduce_1  24 happyReduction_58
happyReduction_58 _
	 =  HappyAbsSyn24
		 ("boolean"
	)

happyReduce_59 = happySpecReduce_1  24 happyReduction_59
happyReduction_59 (HappyTerminal (TOKEN_BEZEICHNER happy_var_1))
	 =  HappyAbsSyn24
		 (happy_var_1
	)
happyReduction_59 _  = notHappyAtAll 

happyReduce_60 = happySpecReduce_0  25 happyReduction_60
happyReduction_60  =  HappyAbsSyn25
		 ([]
	)

happyReduce_61 = happySpecReduce_1  25 happyReduction_61
happyReduction_61 (HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn25
		 (happy_var_1
	)
happyReduction_61 _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_1  26 happyReduction_62
happyReduction_62 (HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn26
		 (happy_var_1:[]
	)
happyReduction_62 _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_3  26 happyReduction_63
happyReduction_63 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn26
		 (happy_var_1:happy_var_3
	)
happyReduction_63 _ _ _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_2  27 happyReduction_64
happyReduction_64 (HappyTerminal (TOKEN_BEZEICHNER happy_var_2))
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn27
		 (happy_var_1, happy_var_2
	)
happyReduction_64 _ _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_1  28 happyReduction_65
happyReduction_65 (HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn28
		 (happy_var_1
	)
happyReduction_65 _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_0  29 happyReduction_66
happyReduction_66  =  HappyAbsSyn29
		 ([]
	)

happyReduce_67 = happySpecReduce_1  29 happyReduction_67
happyReduction_67 (HappyAbsSyn30  happy_var_1)
	 =  HappyAbsSyn29
		 (happy_var_1
	)
happyReduction_67 _  = notHappyAtAll 

happyReduce_68 = happySpecReduce_1  30 happyReduction_68
happyReduction_68 (HappyAbsSyn31  happy_var_1)
	 =  HappyAbsSyn30
		 (happy_var_1:[]
	)
happyReduction_68 _  = notHappyAtAll 

happyReduce_69 = happySpecReduce_3  30 happyReduction_69
happyReduction_69 (HappyAbsSyn30  happy_var_3)
	_
	(HappyAbsSyn31  happy_var_1)
	 =  HappyAbsSyn30
		 (happy_var_1:happy_var_3
	)
happyReduction_69 _ _ _  = notHappyAtAll 

happyReduce_70 = happySpecReduce_1  31 happyReduction_70
happyReduction_70 (HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn31
		 (happy_var_1
	)
happyReduction_70 _  = notHappyAtAll 

happyReduce_71 = happySpecReduce_1  32 happyReduction_71
happyReduction_71 _
	 =  HappyAbsSyn32
		 (Equals
	)

happyReduce_72 = happySpecReduce_1  32 happyReduction_72
happyReduction_72 _
	 =  HappyAbsSyn32
		 (LessT
	)

happyReduce_73 = happySpecReduce_1  32 happyReduction_73
happyReduction_73 _
	 =  HappyAbsSyn32
		 (GreaterT
	)

happyReduce_74 = happySpecReduce_1  32 happyReduction_74
happyReduction_74 _
	 =  HappyAbsSyn32
		 (GE
	)

happyReduce_75 = happySpecReduce_1  32 happyReduction_75
happyReduction_75 _
	 =  HappyAbsSyn32
		 (LE
	)

happyReduce_76 = happySpecReduce_1  32 happyReduction_76
happyReduction_76 _
	 =  HappyAbsSyn32
		 (Mult
	)

happyReduce_77 = happySpecReduce_1  32 happyReduction_77
happyReduction_77 _
	 =  HappyAbsSyn32
		 (Div
	)

happyReduce_78 = happySpecReduce_1  32 happyReduction_78
happyReduction_78 _
	 =  HappyAbsSyn32
		 (Modulo
	)

happyReduce_79 = happySpecReduce_1  32 happyReduction_79
happyReduction_79 _
	 =  HappyAbsSyn32
		 (AND
	)

happyReduce_80 = happySpecReduce_1  32 happyReduction_80
happyReduction_80 _
	 =  HappyAbsSyn32
		 (OR
	)

happyReduce_81 = happySpecReduce_1  32 happyReduction_81
happyReduction_81 _
	 =  HappyAbsSyn32
		 (BitwiseOR
	)

happyReduce_82 = happySpecReduce_1  32 happyReduction_82
happyReduction_82 _
	 =  HappyAbsSyn32
		 (BitwiseAND
	)

happyReduce_83 = happySpecReduce_1  32 happyReduction_83
happyReduction_83 _
	 =  HappyAbsSyn32
		 (Plus
	)

happyReduce_84 = happySpecReduce_1  32 happyReduction_84
happyReduction_84 _
	 =  HappyAbsSyn32
		 (Minus
	)

happyReduce_85 = happySpecReduce_1  33 happyReduction_85
happyReduction_85 _
	 =  HappyAbsSyn33
		 (Negation
	)

happyReduce_86 = happySpecReduce_1  33 happyReduction_86
happyReduction_86 _
	 =  HappyAbsSyn33
		 (Positiv
	)

happyReduce_87 = happySpecReduce_1  33 happyReduction_87
happyReduction_87 _
	 =  HappyAbsSyn33
		 (Negativ
	)

happyNewToken action sts stk [] =
	action 78 78 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TOKEN_KLASSE -> cont 34;
	TOKEN_BEZEICHNER happy_dollar_dollar -> cont 35;
	TOKEN_WHILE -> cont 36;
	TOKEN_IF -> cont 37;
	TOKEN_ELSE -> cont 38;
	TOKEN_ZUWEISUNG -> cont 39;
	TOKEN_SEMIKOLON -> cont 40;
	TOKEN_KLAZU_GESCH -> cont 41;
	TOKEN_KLAAUF_GESCH -> cont 42;
	TOKEN_KLAAUF_RUND -> cont 43;
	TOKEN_KLAZU_RUND -> cont 44;
	TOKEN_GETEILT -> cont 45;
	TOKEN_MAL -> cont 46;
	TOKEN_PLUS -> cont 47;
	TOKEN_MINUS -> cont 48;
	TOKEN_MODULO -> cont 49;
	TOKEN_AND -> cont 50;
	TOKEN_OR -> cont 51;
	TOKEN_BITOR -> cont 52;
	TOKEN_BITAND -> cont 53;
	TOKEN_STRING_LITERAL happy_dollar_dollar -> cont 54;
	TOKEN_INTEGER -> cont 55;
	TOKEN_INTEGER_LITERAL happy_dollar_dollar -> cont 56;
	TOKEN_CHAR -> cont 57;
	TOKEN_CHAR_LITERAL happy_dollar_dollar -> cont 58;
	TOKEN_PUBLIC -> cont 59;
	TOKEN_PRIVATE -> cont 60;
	TOKEN_STATIC -> cont 61;
	TOKEN_FINAL -> cont 62;
	TOKEN_VOID -> cont 63;
	TOKEN_NEW -> cont 64;
	TOKEN_RETURN -> cont 65;
	TOKEN_AKZESSOR -> cont 66;
	TOKEN_BOOL -> cont 67;
	TOKEN_BOOL_LITERAL happy_dollar_dollar -> cont 68;
	TOKEN_VERGLEICH -> cont 69;
	TOKEN_GROESSER -> cont 70;
	TOKEN_KLEINER -> cont 71;
	TOKEN_GROESSER_GLEICH -> cont 72;
	TOKEN_KLEINER_GLEICH -> cont 73;
	TOKEN_NULL -> cont 74;
	TOKEN_NOT -> cont 75;
	TOKEN_KOMMA -> cont 76;
	TOKEN_THIS -> cont 77;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 78 tk tks = happyError' (tks, explist)
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
