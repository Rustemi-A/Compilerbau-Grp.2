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
happyExpList = Happy_Data_Array.listArray (0,310) ([0,0,0,4,0,0,0,256,0,0,32,0,0,0,0,0,128,0,0,0,0,0,0,0,0,0,0,16384,0,0,0,0,2048,0,0,0,0,0,60,0,0,1,80,1,0,64,5120,68,0,0,0,0,0,0,256,0,0,0,0,0,15,0,0,0,768,0,0,0,49152,0,0,0,0,32,0,0,0,1024,0,0,0,0,0,0,0,0,0,0,0,0,8192,0,0,0,0,4,0,0,0,512,0,0,0,16384,0,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16384,0,0,0,0,0,0,0,0,1024,0,0,0,0,32,0,0,0,16384,0,0,0,0,18,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,80,1,0,64,5120,64,0,0,0,0,0,0,4,0,0,0,0,2,0,0,0,0,0,0,0,0,0,8192,0,0,8,0,0,0,128,0,0,0,64,5120,64,0,0,8,0,0,0,0,0,0,0,42752,63536,33632,5,0,0,0,0,0,2672,3971,22582,0,0,1,0,0,0,12455,24824,1411,0,0,0,32,0,0,0,0,0,0,128,0,0,0,256,0,0,0,16384,3072,34858,352,0,256,0,0,0,0,4,0,0,0,256,0,0,0,0,0,0,0,28672,33546,13839,88,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,2112,10764,24712,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1024,0,0,0,0,0,0,0,0,32,32768,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,16,0,0,0,16,2691,22562,0,1024,41152,2178,22,0,12289,8360,1410,0,0,0,0,0,0,2,0,0,0,0,0,0,0,256,43056,33312,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,4096,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2048,0,2,0,0,2,128,0,0,0,0,0,0,16,2691,22562,0,0,0,0,0,0,0,32768,0,0,32768,0,0,0,0,0,0,0,0,0,0,2048,0,32768,0,0,0,0,32,0,0,0,16,2691,22562,0,0,8,0,0,0,12455,24824,1411,0,10688,15884,24792,1,4096,33536,8714,88,0,0,0,0,0,0,0,0,0,0,16,0,0,0,1024,0,0,0,0,0,0,0,0,0,0,0,0,512,0,0,0,0,8,0,0,0,49820,33760,5645,0,16384,0,0,0,0,0,0,0,0
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

action_8 (33) = happyReduce_20
action_8 (51) = happyShift action_14
action_8 (52) = happyShift action_15
action_8 (53) = happyShift action_16
action_8 (54) = happyShift action_17
action_8 (6) = happyGoto action_9
action_8 (7) = happyGoto action_10
action_8 (8) = happyGoto action_11
action_8 (9) = happyGoto action_12
action_8 (10) = happyGoto action_13
action_8 _ = happyReduce_19

action_9 (27) = happyShift action_27
action_9 (47) = happyShift action_28
action_9 (49) = happyShift action_29
action_9 (59) = happyShift action_31
action_9 (16) = happyGoto action_32
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (27) = happyShift action_27
action_10 (47) = happyShift action_28
action_10 (49) = happyShift action_29
action_10 (55) = happyShift action_30
action_10 (59) = happyShift action_31
action_10 (16) = happyGoto action_26
action_10 _ = happyFail (happyExpListPerState 10)

action_11 _ = happyReduce_13

action_12 (33) = happyShift action_25
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (33) = happyReduce_20
action_13 (51) = happyShift action_14
action_13 (52) = happyShift action_15
action_13 (53) = happyShift action_16
action_13 (54) = happyShift action_17
action_13 (6) = happyGoto action_9
action_13 (7) = happyGoto action_10
action_13 (8) = happyGoto action_11
action_13 (9) = happyGoto action_24
action_13 (10) = happyGoto action_13
action_13 _ = happyReduce_19

action_14 (53) = happyShift action_22
action_14 (54) = happyShift action_23
action_14 _ = happyReduce_17

action_15 (53) = happyShift action_20
action_15 (54) = happyShift action_21
action_15 _ = happyReduce_18

action_16 (54) = happyShift action_19
action_16 _ = happyReduce_16

action_17 (53) = happyShift action_18
action_17 _ = happyReduce_10

action_18 _ = happyReduce_11

action_19 _ = happyReduce_12

action_20 (54) = happyShift action_39
action_20 _ = happyReduce_15

action_21 (53) = happyShift action_38
action_21 _ = happyReduce_7

action_22 (54) = happyShift action_37
action_22 _ = happyReduce_14

action_23 (53) = happyShift action_36
action_23 _ = happyReduce_4

action_24 _ = happyReduce_21

action_25 _ = happyReduce_1

action_26 (27) = happyShift action_35
action_26 _ = happyFail (happyExpListPerState 26)

action_27 _ = happyReduce_55

action_28 _ = happyReduce_52

action_29 _ = happyReduce_53

action_30 (27) = happyShift action_34
action_30 _ = happyFail (happyExpListPerState 30)

action_31 _ = happyReduce_54

action_32 (27) = happyShift action_33
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (32) = happyShift action_43
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (35) = happyShift action_42
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (32) = happyShift action_40
action_35 (35) = happyShift action_41
action_35 _ = happyFail (happyExpListPerState 35)

action_36 _ = happyReduce_5

action_37 _ = happyReduce_6

action_38 _ = happyReduce_8

action_39 _ = happyReduce_9

action_40 _ = happyReduce_23

action_41 (27) = happyShift action_27
action_41 (47) = happyShift action_28
action_41 (49) = happyShift action_29
action_41 (59) = happyShift action_31
action_41 (16) = happyGoto action_44
action_41 (17) = happyGoto action_48
action_41 (18) = happyGoto action_46
action_41 (19) = happyGoto action_47
action_41 _ = happyReduce_56

action_42 (27) = happyShift action_27
action_42 (47) = happyShift action_28
action_42 (49) = happyShift action_29
action_42 (59) = happyShift action_31
action_42 (16) = happyGoto action_44
action_42 (17) = happyGoto action_45
action_42 (18) = happyGoto action_46
action_42 (19) = happyGoto action_47
action_42 _ = happyReduce_56

action_43 _ = happyReduce_22

action_44 (27) = happyShift action_52
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (36) = happyShift action_51
action_45 _ = happyFail (happyExpListPerState 45)

action_46 _ = happyReduce_57

action_47 (68) = happyShift action_50
action_47 _ = happyReduce_58

action_48 (36) = happyShift action_49
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (34) = happyShift action_55
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (27) = happyShift action_27
action_50 (47) = happyShift action_28
action_50 (49) = happyShift action_29
action_50 (59) = happyShift action_31
action_50 (16) = happyGoto action_44
action_50 (18) = happyGoto action_54
action_50 (19) = happyGoto action_47
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (34) = happyShift action_53
action_51 _ = happyFail (happyExpListPerState 51)

action_52 _ = happyReduce_60

action_53 (27) = happyShift action_63
action_53 (28) = happyShift action_64
action_53 (29) = happyShift action_65
action_53 (32) = happyShift action_66
action_53 (34) = happyShift action_67
action_53 (39) = happyShift action_68
action_53 (40) = happyShift action_69
action_53 (46) = happyShift action_70
action_53 (47) = happyShift action_28
action_53 (48) = happyShift action_71
action_53 (49) = happyShift action_29
action_53 (50) = happyShift action_72
action_53 (56) = happyShift action_73
action_53 (57) = happyShift action_74
action_53 (59) = happyShift action_31
action_53 (60) = happyShift action_75
action_53 (66) = happyShift action_76
action_53 (67) = happyShift action_77
action_53 (69) = happyShift action_78
action_53 (11) = happyGoto action_79
action_53 (12) = happyGoto action_57
action_53 (13) = happyGoto action_58
action_53 (14) = happyGoto action_59
action_53 (15) = happyGoto action_60
action_53 (16) = happyGoto action_61
action_53 (25) = happyGoto action_62
action_53 _ = happyReduce_26

action_54 _ = happyReduce_59

action_55 (27) = happyShift action_63
action_55 (28) = happyShift action_64
action_55 (29) = happyShift action_65
action_55 (32) = happyShift action_66
action_55 (34) = happyShift action_67
action_55 (39) = happyShift action_68
action_55 (40) = happyShift action_69
action_55 (46) = happyShift action_70
action_55 (47) = happyShift action_28
action_55 (48) = happyShift action_71
action_55 (49) = happyShift action_29
action_55 (50) = happyShift action_72
action_55 (56) = happyShift action_73
action_55 (57) = happyShift action_74
action_55 (59) = happyShift action_31
action_55 (60) = happyShift action_75
action_55 (66) = happyShift action_76
action_55 (67) = happyShift action_77
action_55 (69) = happyShift action_78
action_55 (11) = happyGoto action_56
action_55 (12) = happyGoto action_57
action_55 (13) = happyGoto action_58
action_55 (14) = happyGoto action_59
action_55 (15) = happyGoto action_60
action_55 (16) = happyGoto action_61
action_55 (25) = happyGoto action_62
action_55 _ = happyReduce_26

action_56 (33) = happyShift action_110
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (27) = happyShift action_63
action_57 (28) = happyShift action_64
action_57 (29) = happyShift action_65
action_57 (32) = happyShift action_66
action_57 (34) = happyShift action_67
action_57 (39) = happyShift action_68
action_57 (40) = happyShift action_69
action_57 (46) = happyShift action_70
action_57 (47) = happyShift action_28
action_57 (48) = happyShift action_71
action_57 (49) = happyShift action_29
action_57 (50) = happyShift action_72
action_57 (56) = happyShift action_73
action_57 (57) = happyShift action_74
action_57 (59) = happyShift action_31
action_57 (60) = happyShift action_75
action_57 (66) = happyShift action_76
action_57 (67) = happyShift action_77
action_57 (69) = happyShift action_78
action_57 (11) = happyGoto action_109
action_57 (12) = happyGoto action_57
action_57 (13) = happyGoto action_58
action_57 (14) = happyGoto action_59
action_57 (15) = happyGoto action_60
action_57 (16) = happyGoto action_61
action_57 (25) = happyGoto action_62
action_57 _ = happyReduce_26

action_58 (58) = happyShift action_108
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (37) = happyShift action_94
action_59 (38) = happyShift action_95
action_59 (39) = happyShift action_96
action_59 (40) = happyShift action_97
action_59 (41) = happyShift action_98
action_59 (42) = happyShift action_99
action_59 (43) = happyShift action_100
action_59 (44) = happyShift action_101
action_59 (45) = happyShift action_102
action_59 (61) = happyShift action_103
action_59 (62) = happyShift action_104
action_59 (63) = happyShift action_105
action_59 (64) = happyShift action_106
action_59 (65) = happyShift action_107
action_59 (24) = happyGoto action_93
action_59 _ = happyReduce_37

action_60 (32) = happyShift action_92
action_60 _ = happyReduce_46

action_61 (27) = happyShift action_91
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (27) = happyShift action_83
action_62 (39) = happyShift action_68
action_62 (40) = happyShift action_69
action_62 (46) = happyShift action_70
action_62 (48) = happyShift action_71
action_62 (50) = happyShift action_72
action_62 (56) = happyShift action_73
action_62 (60) = happyShift action_75
action_62 (66) = happyShift action_76
action_62 (67) = happyShift action_77
action_62 (69) = happyShift action_78
action_62 (13) = happyGoto action_90
action_62 (14) = happyGoto action_59
action_62 (15) = happyGoto action_82
action_62 (25) = happyGoto action_62
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (31) = happyShift action_89
action_63 (37) = happyReduce_47
action_63 (38) = happyReduce_47
action_63 (39) = happyReduce_47
action_63 (40) = happyReduce_47
action_63 (41) = happyReduce_47
action_63 (42) = happyReduce_47
action_63 (43) = happyReduce_47
action_63 (44) = happyReduce_47
action_63 (45) = happyReduce_47
action_63 (58) = happyReduce_47
action_63 (61) = happyReduce_47
action_63 (62) = happyReduce_47
action_63 (63) = happyReduce_47
action_63 (64) = happyReduce_47
action_63 (65) = happyReduce_47
action_63 _ = happyReduce_55

action_64 (35) = happyShift action_88
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (35) = happyShift action_87
action_65 _ = happyFail (happyExpListPerState 65)

action_66 _ = happyReduce_36

action_67 (27) = happyShift action_63
action_67 (28) = happyShift action_64
action_67 (29) = happyShift action_65
action_67 (32) = happyShift action_66
action_67 (34) = happyShift action_67
action_67 (39) = happyShift action_68
action_67 (40) = happyShift action_69
action_67 (46) = happyShift action_70
action_67 (47) = happyShift action_28
action_67 (48) = happyShift action_71
action_67 (49) = happyShift action_29
action_67 (50) = happyShift action_72
action_67 (56) = happyShift action_73
action_67 (57) = happyShift action_74
action_67 (59) = happyShift action_31
action_67 (60) = happyShift action_75
action_67 (66) = happyShift action_76
action_67 (67) = happyShift action_77
action_67 (69) = happyShift action_78
action_67 (11) = happyGoto action_86
action_67 (12) = happyGoto action_57
action_67 (13) = happyGoto action_58
action_67 (14) = happyGoto action_59
action_67 (15) = happyGoto action_60
action_67 (16) = happyGoto action_61
action_67 (25) = happyGoto action_62
action_67 _ = happyReduce_26

action_68 _ = happyReduce_82

action_69 _ = happyReduce_83

action_70 _ = happyReduce_44

action_71 _ = happyReduce_41

action_72 _ = happyReduce_43

action_73 (27) = happyShift action_85
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (27) = happyShift action_83
action_74 (32) = happyShift action_84
action_74 (39) = happyShift action_68
action_74 (40) = happyShift action_69
action_74 (46) = happyShift action_70
action_74 (48) = happyShift action_71
action_74 (50) = happyShift action_72
action_74 (56) = happyShift action_73
action_74 (60) = happyShift action_75
action_74 (66) = happyShift action_76
action_74 (67) = happyShift action_77
action_74 (69) = happyShift action_78
action_74 (13) = happyGoto action_81
action_74 (14) = happyGoto action_59
action_74 (15) = happyGoto action_82
action_74 (25) = happyGoto action_62
action_74 _ = happyFail (happyExpListPerState 74)

action_75 _ = happyReduce_42

action_76 _ = happyReduce_45

action_77 _ = happyReduce_81

action_78 _ = happyReduce_40

action_79 (33) = happyShift action_80
action_79 _ = happyFail (happyExpListPerState 79)

action_80 _ = happyReduce_25

action_81 (32) = happyShift action_120
action_81 (58) = happyShift action_108
action_81 _ = happyFail (happyExpListPerState 81)

action_82 _ = happyReduce_46

action_83 (31) = happyShift action_89
action_83 _ = happyReduce_47

action_84 _ = happyReduce_29

action_85 (35) = happyShift action_119
action_85 _ = happyFail (happyExpListPerState 85)

action_86 (33) = happyShift action_118
action_86 _ = happyFail (happyExpListPerState 86)

action_87 (27) = happyShift action_83
action_87 (39) = happyShift action_68
action_87 (40) = happyShift action_69
action_87 (46) = happyShift action_70
action_87 (48) = happyShift action_71
action_87 (50) = happyShift action_72
action_87 (56) = happyShift action_73
action_87 (60) = happyShift action_75
action_87 (66) = happyShift action_76
action_87 (67) = happyShift action_77
action_87 (69) = happyShift action_78
action_87 (13) = happyGoto action_117
action_87 (14) = happyGoto action_59
action_87 (15) = happyGoto action_82
action_87 (25) = happyGoto action_62
action_87 _ = happyFail (happyExpListPerState 87)

action_88 (27) = happyShift action_83
action_88 (39) = happyShift action_68
action_88 (40) = happyShift action_69
action_88 (46) = happyShift action_70
action_88 (48) = happyShift action_71
action_88 (50) = happyShift action_72
action_88 (56) = happyShift action_73
action_88 (60) = happyShift action_75
action_88 (66) = happyShift action_76
action_88 (67) = happyShift action_77
action_88 (69) = happyShift action_78
action_88 (13) = happyGoto action_116
action_88 (14) = happyGoto action_59
action_88 (15) = happyGoto action_82
action_88 (25) = happyGoto action_62
action_88 _ = happyFail (happyExpListPerState 88)

action_89 (27) = happyShift action_83
action_89 (39) = happyShift action_68
action_89 (40) = happyShift action_69
action_89 (46) = happyShift action_70
action_89 (48) = happyShift action_71
action_89 (50) = happyShift action_72
action_89 (56) = happyShift action_73
action_89 (60) = happyShift action_75
action_89 (66) = happyShift action_76
action_89 (67) = happyShift action_77
action_89 (69) = happyShift action_78
action_89 (13) = happyGoto action_114
action_89 (14) = happyGoto action_59
action_89 (15) = happyGoto action_82
action_89 (20) = happyGoto action_115
action_89 (25) = happyGoto action_62
action_89 _ = happyFail (happyExpListPerState 89)

action_90 (58) = happyShift action_108
action_90 _ = happyReduce_39

action_91 (32) = happyShift action_113
action_91 _ = happyFail (happyExpListPerState 91)

action_92 _ = happyReduce_35

action_93 (27) = happyShift action_83
action_93 (39) = happyShift action_68
action_93 (40) = happyShift action_69
action_93 (46) = happyShift action_70
action_93 (48) = happyShift action_71
action_93 (50) = happyShift action_72
action_93 (56) = happyShift action_73
action_93 (60) = happyShift action_75
action_93 (66) = happyShift action_76
action_93 (67) = happyShift action_77
action_93 (69) = happyShift action_78
action_93 (13) = happyGoto action_112
action_93 (14) = happyGoto action_59
action_93 (15) = happyGoto action_82
action_93 (25) = happyGoto action_62
action_93 _ = happyFail (happyExpListPerState 93)

action_94 _ = happyReduce_73

action_95 _ = happyReduce_72

action_96 _ = happyReduce_79

action_97 _ = happyReduce_80

action_98 _ = happyReduce_74

action_99 _ = happyReduce_75

action_100 _ = happyReduce_76

action_101 _ = happyReduce_77

action_102 _ = happyReduce_78

action_103 _ = happyReduce_67

action_104 _ = happyReduce_69

action_105 _ = happyReduce_68

action_106 _ = happyReduce_70

action_107 _ = happyReduce_71

action_108 (27) = happyShift action_111
action_108 _ = happyFail (happyExpListPerState 108)

action_109 _ = happyReduce_27

action_110 _ = happyReduce_24

action_111 (35) = happyShift action_127
action_111 _ = happyReduce_48

action_112 (58) = happyShift action_108
action_112 _ = happyReduce_38

action_113 _ = happyReduce_32

action_114 (58) = happyShift action_108
action_114 _ = happyReduce_61

action_115 _ = happyReduce_49

action_116 (36) = happyShift action_126
action_116 (58) = happyShift action_108
action_116 _ = happyFail (happyExpListPerState 116)

action_117 (36) = happyShift action_125
action_117 (58) = happyShift action_108
action_117 _ = happyFail (happyExpListPerState 117)

action_118 _ = happyReduce_28

action_119 (27) = happyShift action_83
action_119 (39) = happyShift action_68
action_119 (40) = happyShift action_69
action_119 (46) = happyShift action_70
action_119 (48) = happyShift action_71
action_119 (50) = happyShift action_72
action_119 (56) = happyShift action_73
action_119 (60) = happyShift action_75
action_119 (66) = happyShift action_76
action_119 (67) = happyShift action_77
action_119 (69) = happyShift action_78
action_119 (13) = happyGoto action_121
action_119 (14) = happyGoto action_59
action_119 (15) = happyGoto action_82
action_119 (21) = happyGoto action_122
action_119 (22) = happyGoto action_123
action_119 (23) = happyGoto action_124
action_119 (25) = happyGoto action_62
action_119 _ = happyReduce_62

action_120 _ = happyReduce_30

action_121 (58) = happyShift action_108
action_121 _ = happyReduce_66

action_122 (36) = happyShift action_132
action_122 _ = happyFail (happyExpListPerState 122)

action_123 _ = happyReduce_63

action_124 (68) = happyShift action_131
action_124 _ = happyReduce_64

action_125 (34) = happyShift action_130
action_125 _ = happyFail (happyExpListPerState 125)

action_126 (34) = happyShift action_129
action_126 _ = happyFail (happyExpListPerState 126)

action_127 (27) = happyShift action_83
action_127 (39) = happyShift action_68
action_127 (40) = happyShift action_69
action_127 (46) = happyShift action_70
action_127 (48) = happyShift action_71
action_127 (50) = happyShift action_72
action_127 (56) = happyShift action_73
action_127 (60) = happyShift action_75
action_127 (66) = happyShift action_76
action_127 (67) = happyShift action_77
action_127 (69) = happyShift action_78
action_127 (13) = happyGoto action_121
action_127 (14) = happyGoto action_59
action_127 (15) = happyGoto action_82
action_127 (21) = happyGoto action_128
action_127 (22) = happyGoto action_123
action_127 (23) = happyGoto action_124
action_127 (25) = happyGoto action_62
action_127 _ = happyReduce_62

action_128 (36) = happyShift action_136
action_128 _ = happyFail (happyExpListPerState 128)

action_129 (27) = happyShift action_63
action_129 (28) = happyShift action_64
action_129 (29) = happyShift action_65
action_129 (32) = happyShift action_66
action_129 (34) = happyShift action_67
action_129 (39) = happyShift action_68
action_129 (40) = happyShift action_69
action_129 (46) = happyShift action_70
action_129 (47) = happyShift action_28
action_129 (48) = happyShift action_71
action_129 (49) = happyShift action_29
action_129 (50) = happyShift action_72
action_129 (56) = happyShift action_73
action_129 (57) = happyShift action_74
action_129 (59) = happyShift action_31
action_129 (60) = happyShift action_75
action_129 (66) = happyShift action_76
action_129 (67) = happyShift action_77
action_129 (69) = happyShift action_78
action_129 (11) = happyGoto action_135
action_129 (12) = happyGoto action_57
action_129 (13) = happyGoto action_58
action_129 (14) = happyGoto action_59
action_129 (15) = happyGoto action_60
action_129 (16) = happyGoto action_61
action_129 (25) = happyGoto action_62
action_129 _ = happyReduce_26

action_130 (27) = happyShift action_63
action_130 (28) = happyShift action_64
action_130 (29) = happyShift action_65
action_130 (32) = happyShift action_66
action_130 (34) = happyShift action_67
action_130 (39) = happyShift action_68
action_130 (40) = happyShift action_69
action_130 (46) = happyShift action_70
action_130 (47) = happyShift action_28
action_130 (48) = happyShift action_71
action_130 (49) = happyShift action_29
action_130 (50) = happyShift action_72
action_130 (56) = happyShift action_73
action_130 (57) = happyShift action_74
action_130 (59) = happyShift action_31
action_130 (60) = happyShift action_75
action_130 (66) = happyShift action_76
action_130 (67) = happyShift action_77
action_130 (69) = happyShift action_78
action_130 (11) = happyGoto action_134
action_130 (12) = happyGoto action_57
action_130 (13) = happyGoto action_58
action_130 (14) = happyGoto action_59
action_130 (15) = happyGoto action_60
action_130 (16) = happyGoto action_61
action_130 (25) = happyGoto action_62
action_130 _ = happyReduce_26

action_131 (27) = happyShift action_83
action_131 (39) = happyShift action_68
action_131 (40) = happyShift action_69
action_131 (46) = happyShift action_70
action_131 (48) = happyShift action_71
action_131 (50) = happyShift action_72
action_131 (56) = happyShift action_73
action_131 (60) = happyShift action_75
action_131 (66) = happyShift action_76
action_131 (67) = happyShift action_77
action_131 (69) = happyShift action_78
action_131 (13) = happyGoto action_121
action_131 (14) = happyGoto action_59
action_131 (15) = happyGoto action_82
action_131 (22) = happyGoto action_133
action_131 (23) = happyGoto action_124
action_131 (25) = happyGoto action_62
action_131 _ = happyFail (happyExpListPerState 131)

action_132 _ = happyReduce_50

action_133 _ = happyReduce_65

action_134 (33) = happyShift action_138
action_134 _ = happyFail (happyExpListPerState 134)

action_135 (33) = happyShift action_137
action_135 _ = happyFail (happyExpListPerState 135)

action_136 _ = happyReduce_51

action_137 _ = happyReduce_31

action_138 (30) = happyShift action_139
action_138 _ = happyReduce_33

action_139 (34) = happyShift action_140
action_139 _ = happyFail (happyExpListPerState 139)

action_140 (27) = happyShift action_63
action_140 (28) = happyShift action_64
action_140 (29) = happyShift action_65
action_140 (32) = happyShift action_66
action_140 (34) = happyShift action_67
action_140 (39) = happyShift action_68
action_140 (40) = happyShift action_69
action_140 (46) = happyShift action_70
action_140 (47) = happyShift action_28
action_140 (48) = happyShift action_71
action_140 (49) = happyShift action_29
action_140 (50) = happyShift action_72
action_140 (56) = happyShift action_73
action_140 (57) = happyShift action_74
action_140 (59) = happyShift action_31
action_140 (60) = happyShift action_75
action_140 (66) = happyShift action_76
action_140 (67) = happyShift action_77
action_140 (69) = happyShift action_78
action_140 (11) = happyGoto action_141
action_140 (12) = happyGoto action_57
action_140 (13) = happyGoto action_58
action_140 (14) = happyGoto action_59
action_140 (15) = happyGoto action_60
action_140 (16) = happyGoto action_61
action_140 (25) = happyGoto action_62
action_140 _ = happyReduce_26

action_141 (33) = happyShift action_142
action_141 _ = happyFail (happyExpListPerState 141)

action_142 _ = happyReduce_34

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

happyReduce_13 = happySpecReduce_1  7 happyReduction_13
happyReduction_13 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1
	)
happyReduction_13 _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_2  7 happyReduction_14
happyReduction_14 _
	_
	 =  HappyAbsSyn7
		 ([Public,Static]
	)

happyReduce_15 = happySpecReduce_2  7 happyReduction_15
happyReduction_15 _
	_
	 =  HappyAbsSyn7
		 ([Private,Static]
	)

happyReduce_16 = happySpecReduce_1  7 happyReduction_16
happyReduction_16 _
	 =  HappyAbsSyn7
		 ([Public,Static]
	)

happyReduce_17 = happySpecReduce_1  8 happyReduction_17
happyReduction_17 _
	 =  HappyAbsSyn8
		 ([Public]
	)

happyReduce_18 = happySpecReduce_1  8 happyReduction_18
happyReduction_18 _
	 =  HappyAbsSyn8
		 ([Private]
	)

happyReduce_19 = happySpecReduce_0  8 happyReduction_19
happyReduction_19  =  HappyAbsSyn8
		 ([Public]
	)

happyReduce_20 = happySpecReduce_0  9 happyReduction_20
happyReduction_20  =  HappyAbsSyn9
		 ([]
	)

happyReduce_21 = happySpecReduce_2  9 happyReduction_21
happyReduction_21 (HappyAbsSyn9  happy_var_2)
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1:happy_var_2
	)
happyReduction_21 _ _  = notHappyAtAll 

happyReduce_22 = happyReduce 4 10 happyReduction_22
happyReduction_22 (_ `HappyStk`
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_3)) `HappyStk`
	(HappyAbsSyn16  happy_var_2) `HappyStk`
	(HappyAbsSyn6  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (F(FieldDecl (happy_var_1, happy_var_2, happy_var_3))
	) `HappyStk` happyRest

happyReduce_23 = happyReduce 4 10 happyReduction_23
happyReduction_23 (_ `HappyStk`
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_3)) `HappyStk`
	(HappyAbsSyn16  happy_var_2) `HappyStk`
	(HappyAbsSyn7  happy_var_1) `HappyStk`
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

happyReduce_26 = happySpecReduce_0  11 happyReduction_26
happyReduction_26  =  HappyAbsSyn11
		 ([]
	)

happyReduce_27 = happySpecReduce_2  11 happyReduction_27
happyReduction_27 (HappyAbsSyn11  happy_var_2)
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1:happy_var_2
	)
happyReduction_27 _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  12 happyReduction_28
happyReduction_28 _
	(HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn12
		 (Block happy_var_2
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_2  12 happyReduction_29
happyReduction_29 _
	_
	 =  HappyAbsSyn12
		 (Return Nothing
	)

happyReduce_30 = happySpecReduce_3  12 happyReduction_30
happyReduction_30 _
	(HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn12
		 (Return (Just (happy_var_2))
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happyReduce 7 12 happyReduction_31
happyReduction_31 (_ `HappyStk`
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

happyReduce_32 = happySpecReduce_3  12 happyReduction_32
happyReduction_32 _
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_2))
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn12
		 (LocalVarDecl (happy_var_1,happy_var_2)
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happyReduce 7 12 happyReduction_33
happyReduction_33 (_ `HappyStk`
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

happyReduce_34 = happyReduce 11 12 happyReduction_34
happyReduction_34 (_ `HappyStk`
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

happyReduce_35 = happySpecReduce_2  12 happyReduction_35
happyReduction_35 _
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn12
		 (StmtExprStmt happy_var_1
	)
happyReduction_35 _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_1  12 happyReduction_36
happyReduction_36 _
	 =  HappyAbsSyn12
		 (Empty
	)

happyReduce_37 = happySpecReduce_1  13 happyReduction_37
happyReduction_37 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn13
		 (happy_var_1
	)
happyReduction_37 _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_3  13 happyReduction_38
happyReduction_38 (HappyAbsSyn13  happy_var_3)
	(HappyAbsSyn24  happy_var_2)
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn13
		 (Binary (happy_var_2, happy_var_1, happy_var_3)
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_2  13 happyReduction_39
happyReduction_39 (HappyAbsSyn13  happy_var_2)
	(HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn13
		 (Unary (happy_var_1, happy_var_2)
	)
happyReduction_39 _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_1  14 happyReduction_40
happyReduction_40 _
	 =  HappyAbsSyn14
		 (This
	)

happyReduce_41 = happySpecReduce_1  14 happyReduction_41
happyReduction_41 (HappyTerminal (TOKEN_INTEGER_LITERAL happy_var_1))
	 =  HappyAbsSyn14
		 (Integer happy_var_1
	)
happyReduction_41 _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_1  14 happyReduction_42
happyReduction_42 (HappyTerminal (TOKEN_BOOL_LITERAL happy_var_1))
	 =  HappyAbsSyn14
		 (Bool happy_var_1
	)
happyReduction_42 _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_1  14 happyReduction_43
happyReduction_43 (HappyTerminal (TOKEN_CHAR_LITERAL happy_var_1))
	 =  HappyAbsSyn14
		 (Char happy_var_1
	)
happyReduction_43 _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_1  14 happyReduction_44
happyReduction_44 (HappyTerminal (TOKEN_STRING_LITERAL happy_var_1))
	 =  HappyAbsSyn14
		 (String happy_var_1
	)
happyReduction_44 _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_1  14 happyReduction_45
happyReduction_45 _
	 =  HappyAbsSyn14
		 (Jnull
	)

happyReduce_46 = happySpecReduce_1  14 happyReduction_46
happyReduction_46 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn14
		 (StmtExprExpr happy_var_1
	)
happyReduction_46 _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_1  14 happyReduction_47
happyReduction_47 (HappyTerminal (TOKEN_BEZEICHNER happy_var_1))
	 =  HappyAbsSyn14
		 (LocalOrFieldVar happy_var_1
	)
happyReduction_47 _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_3  14 happyReduction_48
happyReduction_48 (HappyTerminal (TOKEN_BEZEICHNER happy_var_3))
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn14
		 (InstVar (happy_var_1, happy_var_3)
	)
happyReduction_48 _ _ _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_3  15 happyReduction_49
happyReduction_49 (HappyAbsSyn20  happy_var_3)
	_
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_1))
	 =  HappyAbsSyn15
		 (Assign(LocalOrFieldVar happy_var_1,happy_var_3)
	)
happyReduction_49 _ _ _  = notHappyAtAll 

happyReduce_50 = happyReduce 5 15 happyReduction_50
happyReduction_50 (_ `HappyStk`
	(HappyAbsSyn21  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (New (happy_var_2, happy_var_4)
	) `HappyStk` happyRest

happyReduce_51 = happyReduce 6 15 happyReduction_51
happyReduction_51 (_ `HappyStk`
	(HappyAbsSyn21  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (MethodCall (happy_var_1, happy_var_3, happy_var_5)
	) `HappyStk` happyRest

happyReduce_52 = happySpecReduce_1  16 happyReduction_52
happyReduction_52 _
	 =  HappyAbsSyn16
		 ("int"
	)

happyReduce_53 = happySpecReduce_1  16 happyReduction_53
happyReduction_53 _
	 =  HappyAbsSyn16
		 ("char"
	)

happyReduce_54 = happySpecReduce_1  16 happyReduction_54
happyReduction_54 _
	 =  HappyAbsSyn16
		 ("boolean"
	)

happyReduce_55 = happySpecReduce_1  16 happyReduction_55
happyReduction_55 (HappyTerminal (TOKEN_BEZEICHNER happy_var_1))
	 =  HappyAbsSyn16
		 (happy_var_1
	)
happyReduction_55 _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_0  17 happyReduction_56
happyReduction_56  =  HappyAbsSyn17
		 ([]
	)

happyReduce_57 = happySpecReduce_1  17 happyReduction_57
happyReduction_57 (HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1
	)
happyReduction_57 _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_1  18 happyReduction_58
happyReduction_58 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn18
		 (happy_var_1:[]
	)
happyReduction_58 _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_3  18 happyReduction_59
happyReduction_59 (HappyAbsSyn18  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn18
		 (happy_var_1:happy_var_3
	)
happyReduction_59 _ _ _  = notHappyAtAll 

happyReduce_60 = happySpecReduce_2  19 happyReduction_60
happyReduction_60 (HappyTerminal (TOKEN_BEZEICHNER happy_var_2))
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn19
		 (happy_var_1, happy_var_2
	)
happyReduction_60 _ _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_1  20 happyReduction_61
happyReduction_61 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn20
		 (happy_var_1
	)
happyReduction_61 _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_0  21 happyReduction_62
happyReduction_62  =  HappyAbsSyn21
		 ([]
	)

happyReduce_63 = happySpecReduce_1  21 happyReduction_63
happyReduction_63 (HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn21
		 (happy_var_1
	)
happyReduction_63 _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_1  22 happyReduction_64
happyReduction_64 (HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn22
		 (happy_var_1:[]
	)
happyReduction_64 _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_3  22 happyReduction_65
happyReduction_65 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn22
		 (happy_var_1:happy_var_3
	)
happyReduction_65 _ _ _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_1  23 happyReduction_66
happyReduction_66 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn23
		 (happy_var_1
	)
happyReduction_66 _  = notHappyAtAll 

happyReduce_67 = happySpecReduce_1  24 happyReduction_67
happyReduction_67 _
	 =  HappyAbsSyn24
		 (Equals
	)

happyReduce_68 = happySpecReduce_1  24 happyReduction_68
happyReduction_68 _
	 =  HappyAbsSyn24
		 (LessT
	)

happyReduce_69 = happySpecReduce_1  24 happyReduction_69
happyReduction_69 _
	 =  HappyAbsSyn24
		 (GreaterT
	)

happyReduce_70 = happySpecReduce_1  24 happyReduction_70
happyReduction_70 _
	 =  HappyAbsSyn24
		 (GE
	)

happyReduce_71 = happySpecReduce_1  24 happyReduction_71
happyReduction_71 _
	 =  HappyAbsSyn24
		 (LE
	)

happyReduce_72 = happySpecReduce_1  24 happyReduction_72
happyReduction_72 _
	 =  HappyAbsSyn24
		 (Mult
	)

happyReduce_73 = happySpecReduce_1  24 happyReduction_73
happyReduction_73 _
	 =  HappyAbsSyn24
		 (Div
	)

happyReduce_74 = happySpecReduce_1  24 happyReduction_74
happyReduction_74 _
	 =  HappyAbsSyn24
		 (Modulo
	)

happyReduce_75 = happySpecReduce_1  24 happyReduction_75
happyReduction_75 _
	 =  HappyAbsSyn24
		 (AND
	)

happyReduce_76 = happySpecReduce_1  24 happyReduction_76
happyReduction_76 _
	 =  HappyAbsSyn24
		 (OR
	)

happyReduce_77 = happySpecReduce_1  24 happyReduction_77
happyReduction_77 _
	 =  HappyAbsSyn24
		 (BitwiseOR
	)

happyReduce_78 = happySpecReduce_1  24 happyReduction_78
happyReduction_78 _
	 =  HappyAbsSyn24
		 (BitwiseAND
	)

happyReduce_79 = happySpecReduce_1  24 happyReduction_79
happyReduction_79 _
	 =  HappyAbsSyn24
		 (Plus
	)

happyReduce_80 = happySpecReduce_1  24 happyReduction_80
happyReduction_80 _
	 =  HappyAbsSyn24
		 (Minus
	)

happyReduce_81 = happySpecReduce_1  25 happyReduction_81
happyReduction_81 _
	 =  HappyAbsSyn25
		 (Negation
	)

happyReduce_82 = happySpecReduce_1  25 happyReduction_82
happyReduction_82 _
	 =  HappyAbsSyn25
		 (Positiv
	)

happyReduce_83 = happySpecReduce_1  25 happyReduction_83
happyReduction_83 _
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
