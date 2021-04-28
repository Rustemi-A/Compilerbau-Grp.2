{-# OPTIONS_GHC -w #-}
module Parser where
import Lexer
import AbstrakteSyntax
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15
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

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,122) ([0,49152,0,0,3072,0,128,0,0,0,48,0,0,3,0,0,0,0,0,0,0,16,0,0,0,0,4096,0,256,0,0,2048,0,0,0,0,0,0,0,0,192,0,16384,321,0,49152,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,256,0,0,0,0,0,0,0,4096,0,0,0,0,0,4096,0,0,272,0,0,640,2,0,2,0,8192,0,0,128,0,0,8,0,8192,0,0,0,0,0,0,0,0,0,0,0,0,0,2656,128,0,166,8,0,4,0,42496,2048,0,4096,0,0,256,0,0,0,0,42496,2048,0,33280,514,0,64,0,0,0,0,8192,0,0,0,0,0,64,0,4096,0,2,256,8192,0,0,0,0,0,0,0,32,0,0,49152,7,0,0,0,512,0,0,0,0,0,0,0,2048,0,0,2048,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,0,0,2656,128,0,0,0,24576,32778,0,16384,0,0,1024,0,0,0,0,32768,0,0,32768,0,0,2656,128,0,64,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_javaClass","javaClass","modifier","javaStatements","javaAusdruck","javaAusdrucks","javaStatement","bExpression","literal","binaryOp","methode","attribut","attributType","Klasse","Bezeichner","While","If","Else","Zuweisung","Semikolon","Klazu_Gesch","Klaauf_Gesch","Klaauf_Rund","Klazu_Rund","Integer","Integer_Literal","Char","Char_Literal","Public","Private","Static","Final","Void","Return","Bool","Bool_Literal","Vergleich","Groesser","Kleiner","Groesser_Gleich","Kleiner_Gleich","%eof"]
        bit_start = st Prelude.* 44
        bit_end = (st Prelude.+ 1) Prelude.* 44
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..43]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (31) = happyShift action_3
action_0 (32) = happyShift action_4
action_0 (4) = happyGoto action_5
action_0 (5) = happyGoto action_2
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (31) = happyShift action_3
action_1 (32) = happyShift action_4
action_1 (5) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (16) = happyShift action_10
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (33) = happyShift action_8
action_3 (34) = happyShift action_9
action_3 _ = happyReduce_2

action_4 (33) = happyShift action_6
action_4 (34) = happyShift action_7
action_4 _ = happyReduce_3

action_5 (44) = happyAccept
action_5 _ = happyFail (happyExpListPerState 5)

action_6 _ = happyReduce_8

action_7 (33) = happyShift action_13
action_7 _ = happyReduce_7

action_8 _ = happyReduce_5

action_9 (33) = happyShift action_12
action_9 _ = happyReduce_4

action_10 (17) = happyShift action_11
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (24) = happyShift action_14
action_11 _ = happyFail (happyExpListPerState 11)

action_12 _ = happyReduce_6

action_13 _ = happyReduce_9

action_14 (31) = happyShift action_3
action_14 (32) = happyShift action_4
action_14 (5) = happyGoto action_15
action_14 (7) = happyGoto action_16
action_14 (8) = happyGoto action_17
action_14 (13) = happyGoto action_18
action_14 (14) = happyGoto action_19
action_14 _ = happyReduce_14

action_15 (27) = happyShift action_23
action_15 (29) = happyShift action_24
action_15 (35) = happyShift action_25
action_15 (37) = happyShift action_26
action_15 (15) = happyGoto action_22
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (31) = happyShift action_3
action_16 (32) = happyShift action_4
action_16 (5) = happyGoto action_15
action_16 (7) = happyGoto action_16
action_16 (8) = happyGoto action_21
action_16 (13) = happyGoto action_18
action_16 (14) = happyGoto action_19
action_16 _ = happyReduce_14

action_17 (23) = happyShift action_20
action_17 _ = happyFail (happyExpListPerState 17)

action_18 _ = happyReduce_12

action_19 _ = happyReduce_13

action_20 _ = happyReduce_1

action_21 _ = happyReduce_15

action_22 (17) = happyShift action_28
action_22 _ = happyFail (happyExpListPerState 22)

action_23 _ = happyReduce_36

action_24 _ = happyReduce_37

action_25 (17) = happyShift action_27
action_25 _ = happyFail (happyExpListPerState 25)

action_26 _ = happyReduce_38

action_27 (25) = happyShift action_31
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (21) = happyShift action_29
action_28 (25) = happyShift action_30
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (28) = happyShift action_35
action_29 (30) = happyShift action_36
action_29 (38) = happyShift action_37
action_29 (11) = happyGoto action_34
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (26) = happyShift action_33
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (26) = happyShift action_32
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (24) = happyShift action_40
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (24) = happyShift action_39
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (22) = happyShift action_38
action_34 _ = happyFail (happyExpListPerState 34)

action_35 _ = happyReduce_25

action_36 _ = happyReduce_26

action_37 _ = happyReduce_27

action_38 _ = happyReduce_35

action_39 (18) = happyShift action_43
action_39 (19) = happyShift action_44
action_39 (22) = happyShift action_45
action_39 (24) = happyShift action_46
action_39 (36) = happyShift action_47
action_39 (6) = happyGoto action_48
action_39 (9) = happyGoto action_42
action_39 _ = happyReduce_10

action_40 (18) = happyShift action_43
action_40 (19) = happyShift action_44
action_40 (22) = happyShift action_45
action_40 (24) = happyShift action_46
action_40 (36) = happyShift action_47
action_40 (6) = happyGoto action_41
action_40 (9) = happyGoto action_42
action_40 _ = happyReduce_10

action_41 (23) = happyShift action_56
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (18) = happyShift action_43
action_42 (19) = happyShift action_44
action_42 (22) = happyShift action_45
action_42 (24) = happyShift action_46
action_42 (36) = happyShift action_47
action_42 (6) = happyGoto action_55
action_42 (9) = happyGoto action_42
action_42 _ = happyReduce_10

action_43 (25) = happyShift action_54
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (25) = happyShift action_53
action_44 _ = happyFail (happyExpListPerState 44)

action_45 _ = happyReduce_16

action_46 (18) = happyShift action_43
action_46 (19) = happyShift action_44
action_46 (22) = happyShift action_45
action_46 (24) = happyShift action_46
action_46 (36) = happyShift action_47
action_46 (6) = happyGoto action_52
action_46 (9) = happyGoto action_42
action_46 _ = happyReduce_10

action_47 (22) = happyShift action_51
action_47 (28) = happyShift action_35
action_47 (30) = happyShift action_36
action_47 (38) = happyShift action_37
action_47 (11) = happyGoto action_50
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (23) = happyShift action_49
action_48 _ = happyFail (happyExpListPerState 48)

action_49 _ = happyReduce_33

action_50 (22) = happyShift action_62
action_50 _ = happyFail (happyExpListPerState 50)

action_51 _ = happyReduce_22

action_52 (23) = happyShift action_61
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (17) = happyShift action_58
action_53 (38) = happyShift action_59
action_53 (10) = happyGoto action_60
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (17) = happyShift action_58
action_54 (38) = happyShift action_59
action_54 (10) = happyGoto action_57
action_54 _ = happyFail (happyExpListPerState 54)

action_55 _ = happyReduce_11

action_56 _ = happyReduce_34

action_57 (26) = happyShift action_70
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (39) = happyShift action_65
action_58 (40) = happyShift action_66
action_58 (41) = happyShift action_67
action_58 (42) = happyShift action_68
action_58 (43) = happyShift action_69
action_58 (12) = happyGoto action_64
action_58 _ = happyFail (happyExpListPerState 58)

action_59 _ = happyReduce_24

action_60 (26) = happyShift action_63
action_60 _ = happyFail (happyExpListPerState 60)

action_61 _ = happyReduce_20

action_62 _ = happyReduce_21

action_63 (24) = happyShift action_73
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (28) = happyShift action_72
action_64 _ = happyFail (happyExpListPerState 64)

action_65 _ = happyReduce_28

action_66 _ = happyReduce_29

action_67 _ = happyReduce_30

action_68 _ = happyReduce_32

action_69 _ = happyReduce_31

action_70 (24) = happyShift action_71
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (18) = happyShift action_43
action_71 (19) = happyShift action_44
action_71 (22) = happyShift action_45
action_71 (24) = happyShift action_46
action_71 (36) = happyShift action_47
action_71 (6) = happyGoto action_75
action_71 (9) = happyGoto action_42
action_71 _ = happyReduce_10

action_72 _ = happyReduce_23

action_73 (18) = happyShift action_43
action_73 (19) = happyShift action_44
action_73 (22) = happyShift action_45
action_73 (24) = happyShift action_46
action_73 (36) = happyShift action_47
action_73 (6) = happyGoto action_74
action_73 (9) = happyGoto action_42
action_73 _ = happyReduce_10

action_74 (23) = happyShift action_77
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (23) = happyShift action_76
action_75 _ = happyFail (happyExpListPerState 75)

action_76 _ = happyReduce_17

action_77 (20) = happyShift action_78
action_77 _ = happyReduce_18

action_78 (24) = happyShift action_79
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (18) = happyShift action_43
action_79 (19) = happyShift action_44
action_79 (22) = happyShift action_45
action_79 (24) = happyShift action_46
action_79 (36) = happyShift action_47
action_79 (6) = happyGoto action_80
action_79 (9) = happyGoto action_42
action_79 _ = happyReduce_10

action_80 (23) = happyShift action_81
action_80 _ = happyFail (happyExpListPerState 80)

action_81 _ = happyReduce_19

happyReduce_1 = happyReduce 6 4 happyReduction_1
happyReduction_1 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Class(happy_var_1, happy_var_3, happy_var_5)
	) `HappyStk` happyRest

happyReduce_2 = happySpecReduce_1  5 happyReduction_2
happyReduction_2 _
	 =  HappyAbsSyn5
		 (Public:[]
	)

happyReduce_3 = happySpecReduce_1  5 happyReduction_3
happyReduction_3 _
	 =  HappyAbsSyn5
		 (Private:[]
	)

happyReduce_4 = happySpecReduce_2  5 happyReduction_4
happyReduction_4 _
	_
	 =  HappyAbsSyn5
		 (Public:Final:[]
	)

happyReduce_5 = happySpecReduce_2  5 happyReduction_5
happyReduction_5 _
	_
	 =  HappyAbsSyn5
		 (Public:Static:[]
	)

happyReduce_6 = happySpecReduce_3  5 happyReduction_6
happyReduction_6 _
	_
	_
	 =  HappyAbsSyn5
		 (Public:Final:Static:[]
	)

happyReduce_7 = happySpecReduce_2  5 happyReduction_7
happyReduction_7 _
	_
	 =  HappyAbsSyn5
		 (Private:Final:[]
	)

happyReduce_8 = happySpecReduce_2  5 happyReduction_8
happyReduction_8 _
	_
	 =  HappyAbsSyn5
		 (Private:Static:[]
	)

happyReduce_9 = happySpecReduce_3  5 happyReduction_9
happyReduction_9 _
	_
	_
	 =  HappyAbsSyn5
		 (Private:Final:Static:[]
	)

happyReduce_10 = happySpecReduce_0  6 happyReduction_10
happyReduction_10  =  HappyAbsSyn6
		 ([]
	)

happyReduce_11 = happySpecReduce_2  6 happyReduction_11
happyReduction_11 (HappyAbsSyn6  happy_var_2)
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn6
		 ((happy_var_1:happy_var_2)
	)
happyReduction_11 _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_1  7 happyReduction_12
happyReduction_12 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_1  7 happyReduction_13
happyReduction_13 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1
	)
happyReduction_13 _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_0  8 happyReduction_14
happyReduction_14  =  HappyAbsSyn8
		 ([]
	)

happyReduce_15 = happySpecReduce_2  8 happyReduction_15
happyReduction_15 (HappyAbsSyn8  happy_var_2)
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn8
		 ((happy_var_1:happy_var_2)
	)
happyReduction_15 _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_1  9 happyReduction_16
happyReduction_16 _
	 =  HappyAbsSyn9
		 (Semikolon_
	)

happyReduce_17 = happyReduce 7 9 happyReduction_17
happyReduction_17 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (While_ (happy_var_3, happy_var_6)
	) `HappyStk` happyRest

happyReduce_18 = happyReduce 7 9 happyReduction_18
happyReduction_18 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (If_ (happy_var_3, happy_var_6, Nothing)
	) `HappyStk` happyRest

happyReduce_19 = happyReduce 11 9 happyReduction_19
happyReduction_19 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_10) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (If_ (happy_var_3, happy_var_6, Just happy_var_10)
	) `HappyStk` happyRest

happyReduce_20 = happySpecReduce_3  9 happyReduction_20
happyReduction_20 _
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (Block_ (happy_var_2)
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  9 happyReduction_21
happyReduction_21 _
	(HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (Return_ (Just happy_var_2)
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_2  9 happyReduction_22
happyReduction_22 _
	_
	 =  HappyAbsSyn9
		 (Return_ (Nothing)
	)

happyReduce_23 = happySpecReduce_3  10 happyReduction_23
happyReduction_23 (HappyTerminal (TOKEN_INTEGER_LITERAL happy_var_3))
	(HappyAbsSyn12  happy_var_2)
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_1))
	 =  HappyAbsSyn10
		 (Bexp_ (happy_var_1, happy_var_2, happy_var_3)
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_1  10 happyReduction_24
happyReduction_24 (HappyTerminal (TOKEN_BOOL_LITERAL happy_var_1))
	 =  HappyAbsSyn10
		 (Boolean_ (happy_var_1)
	)
happyReduction_24 _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_1  11 happyReduction_25
happyReduction_25 (HappyTerminal (TOKEN_INTEGER_LITERAL happy_var_1))
	 =  HappyAbsSyn11
		 (ILit_ (happy_var_1)
	)
happyReduction_25 _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_1  11 happyReduction_26
happyReduction_26 (HappyTerminal (TOKEN_CHAR_LITERAL happy_var_1))
	 =  HappyAbsSyn11
		 (CLit_ (happy_var_1)
	)
happyReduction_26 _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_1  11 happyReduction_27
happyReduction_27 (HappyTerminal (TOKEN_BOOL_LITERAL happy_var_1))
	 =  HappyAbsSyn11
		 (BLit_ (happy_var_1)
	)
happyReduction_27 _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_1  12 happyReduction_28
happyReduction_28 _
	 =  HappyAbsSyn12
		 (EQ_
	)

happyReduce_29 = happySpecReduce_1  12 happyReduction_29
happyReduction_29 _
	 =  HappyAbsSyn12
		 (GT_
	)

happyReduce_30 = happySpecReduce_1  12 happyReduction_30
happyReduction_30 _
	 =  HappyAbsSyn12
		 (LT_
	)

happyReduce_31 = happySpecReduce_1  12 happyReduction_31
happyReduction_31 _
	 =  HappyAbsSyn12
		 (LE_
	)

happyReduce_32 = happySpecReduce_1  12 happyReduction_32
happyReduction_32 _
	 =  HappyAbsSyn12
		 (GE_
	)

happyReduce_33 = happyReduce 8 13 happyReduction_33
happyReduction_33 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_3)) `HappyStk`
	(HappyAbsSyn15  happy_var_2) `HappyStk`
	(HappyAbsSyn5  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (Meth_(happy_var_1, happy_var_2, happy_var_3, happy_var_7)
	) `HappyStk` happyRest

happyReduce_34 = happyReduce 8 13 happyReduction_34
happyReduction_34 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (Meth_(happy_var_1, Void_, happy_var_3, happy_var_7)
	) `HappyStk` happyRest

happyReduce_35 = happyReduce 6 14 happyReduction_35
happyReduction_35 (_ `HappyStk`
	(HappyAbsSyn11  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_3)) `HappyStk`
	(HappyAbsSyn15  happy_var_2) `HappyStk`
	(HappyAbsSyn5  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (Attri_ (happy_var_1, happy_var_2, happy_var_3, happy_var_5)
	) `HappyStk` happyRest

happyReduce_36 = happySpecReduce_1  15 happyReduction_36
happyReduction_36 _
	 =  HappyAbsSyn15
		 (Int_
	)

happyReduce_37 = happySpecReduce_1  15 happyReduction_37
happyReduction_37 _
	 =  HappyAbsSyn15
		 (Char_
	)

happyReduce_38 = happySpecReduce_1  15 happyReduction_38
happyReduction_38 _
	 =  HappyAbsSyn15
		 (Bool_
	)

happyNewToken action sts stk [] =
	action 44 44 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TOKEN_KLASSE -> cont 16;
	TOKEN_BEZEICHNER happy_dollar_dollar -> cont 17;
	TOKEN_WHILE -> cont 18;
	TOKEN_IF -> cont 19;
	TOKEN_ELSE -> cont 20;
	TOKEN_ZUWEISUNG -> cont 21;
	TOKEN_SEMIKOLON -> cont 22;
	TOKEN_KLAZU_GESCH -> cont 23;
	TOKEN_KLAAUF_GESCH -> cont 24;
	TOKEN_KLAAUF_RUND -> cont 25;
	TOKEN_KLAZU_RUND -> cont 26;
	TOKEN_INTEGER -> cont 27;
	TOKEN_INTEGER_LITERAL happy_dollar_dollar -> cont 28;
	TOKEN_CHAR -> cont 29;
	TOKEN_CHAR_LITERAL happy_dollar_dollar -> cont 30;
	TOKEN_PUBLIC -> cont 31;
	TOKEN_PRIVATE -> cont 32;
	TOKEN_STATIC -> cont 33;
	TOKEN_FINAL -> cont 34;
	TOKEN_VOID -> cont 35;
	TOKEN_RETURN -> cont 36;
	TOKEN_BOOL -> cont 37;
	TOKEN_BOOL_LITERAL happy_dollar_dollar -> cont 38;
	TOKEN_VERGLEICH -> cont 39;
	TOKEN_GROESSER -> cont 40;
	TOKEN_KLEINER -> cont 41;
	TOKEN_GROESSER_GLEICH -> cont 42;
	TOKEN_KLEINER_GLEICH -> cont 43;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 44 tk tks = happyError' (tks, explist)
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
javaClass tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError _ = error "Parse error"

parser :: String -> Klasse_
parser = javaClass . lexer

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
