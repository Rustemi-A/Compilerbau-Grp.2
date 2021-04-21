{-# OPTIONS_GHC -w #-}
module Parser where
import Lexer
import AbstrakteSyntax
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.11

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14
	= HappyTerminal (Token)
	| HappyErrorToken Int
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

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,107) ([0,8192,0,0,32,16384,0,0,0,0,32768,0,0,16384,0,0,8192,0,0,32,0,32,0,0,0,0,0,0,0,330,32768,0,0,0,0,0,0,0,128,0,0,0,0,0,0,0,0,0,32768,0,0,136,0,0,532,0,256,0,0,1,0,64,0,16384,0,0,16,0,0,0,0,0,0,0,0,0,0,0,21248,128,0,32851,0,8192,0,0,32851,0,32768,0,0,128,0,0,0,0,32851,0,4096,532,0,32,0,0,0,0,16,0,0,0,0,32,0,128,512,32768,0,2,0,0,0,0,0,0,1,0,0,124,0,0,0,256,0,0,0,0,0,0,16384,0,0,1024,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64,0,21248,128,0,0,0,21248,128,0,32,0,8192,0,0,0,0,1024,0,0,64,0,21248,128,0,32,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_javaClass","javaClass","javaStatements","javaAusdruck","javaAusdrucks","javaStatement","bExpression","literal","binaryOp","methode","attribut","attributType","Klasse","Bezeichner","While","If","Else","Zuweisung","Semikolon","Klazu_Gesch","Klaauf_Gesch","Klaauf_Rund","Klazu_Rund","Integer","Integer_Literal","Char","Char_Literal","Zugriffsrecht","Void","Return","Bool","Bool_Literal","Vergleich","Groesser","Kleiner","Groesser_Gleich","Kleiner_Gleich","%eof"]
        bit_start = st * 40
        bit_end = (st + 1) * 40
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..39]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (30) = happyShift action_2
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (30) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (15) = happyShift action_4
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (40) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (16) = happyShift action_5
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (23) = happyShift action_6
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (30) = happyShift action_11
action_6 (6) = happyGoto action_7
action_6 (7) = happyGoto action_8
action_6 (12) = happyGoto action_9
action_6 (13) = happyGoto action_10
action_6 _ = happyReduce_6

action_7 (30) = happyShift action_11
action_7 (6) = happyGoto action_7
action_7 (7) = happyGoto action_18
action_7 (12) = happyGoto action_9
action_7 (13) = happyGoto action_10
action_7 _ = happyReduce_6

action_8 (22) = happyShift action_17
action_8 _ = happyFail (happyExpListPerState 8)

action_9 _ = happyReduce_4

action_10 _ = happyReduce_5

action_11 (26) = happyShift action_13
action_11 (28) = happyShift action_14
action_11 (31) = happyShift action_15
action_11 (33) = happyShift action_16
action_11 (14) = happyGoto action_12
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (16) = happyShift action_20
action_12 _ = happyFail (happyExpListPerState 12)

action_13 _ = happyReduce_28

action_14 _ = happyReduce_29

action_15 (16) = happyShift action_19
action_15 _ = happyFail (happyExpListPerState 15)

action_16 _ = happyReduce_30

action_17 _ = happyReduce_1

action_18 _ = happyReduce_7

action_19 (24) = happyShift action_23
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (20) = happyShift action_21
action_20 (24) = happyShift action_22
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (27) = happyShift action_27
action_21 (29) = happyShift action_28
action_21 (34) = happyShift action_29
action_21 (10) = happyGoto action_26
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (25) = happyShift action_25
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (25) = happyShift action_24
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (23) = happyShift action_32
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (23) = happyShift action_31
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (21) = happyShift action_30
action_26 _ = happyFail (happyExpListPerState 26)

action_27 _ = happyReduce_17

action_28 _ = happyReduce_18

action_29 _ = happyReduce_19

action_30 _ = happyReduce_27

action_31 (17) = happyShift action_35
action_31 (18) = happyShift action_36
action_31 (21) = happyShift action_37
action_31 (23) = happyShift action_38
action_31 (32) = happyShift action_39
action_31 (5) = happyGoto action_40
action_31 (8) = happyGoto action_34
action_31 _ = happyReduce_2

action_32 (17) = happyShift action_35
action_32 (18) = happyShift action_36
action_32 (21) = happyShift action_37
action_32 (23) = happyShift action_38
action_32 (32) = happyShift action_39
action_32 (5) = happyGoto action_33
action_32 (8) = happyGoto action_34
action_32 _ = happyReduce_2

action_33 (22) = happyShift action_48
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (17) = happyShift action_35
action_34 (18) = happyShift action_36
action_34 (21) = happyShift action_37
action_34 (23) = happyShift action_38
action_34 (32) = happyShift action_39
action_34 (5) = happyGoto action_47
action_34 (8) = happyGoto action_34
action_34 _ = happyReduce_2

action_35 (24) = happyShift action_46
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (24) = happyShift action_45
action_36 _ = happyFail (happyExpListPerState 36)

action_37 _ = happyReduce_8

action_38 (17) = happyShift action_35
action_38 (18) = happyShift action_36
action_38 (21) = happyShift action_37
action_38 (23) = happyShift action_38
action_38 (32) = happyShift action_39
action_38 (5) = happyGoto action_44
action_38 (8) = happyGoto action_34
action_38 _ = happyReduce_2

action_39 (21) = happyShift action_43
action_39 (27) = happyShift action_27
action_39 (29) = happyShift action_28
action_39 (34) = happyShift action_29
action_39 (10) = happyGoto action_42
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (22) = happyShift action_41
action_40 _ = happyFail (happyExpListPerState 40)

action_41 _ = happyReduce_25

action_42 (21) = happyShift action_54
action_42 _ = happyFail (happyExpListPerState 42)

action_43 _ = happyReduce_14

action_44 (22) = happyShift action_53
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (16) = happyShift action_50
action_45 (34) = happyShift action_51
action_45 (9) = happyGoto action_52
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (16) = happyShift action_50
action_46 (34) = happyShift action_51
action_46 (9) = happyGoto action_49
action_46 _ = happyFail (happyExpListPerState 46)

action_47 _ = happyReduce_3

action_48 _ = happyReduce_26

action_49 (25) = happyShift action_62
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (35) = happyShift action_57
action_50 (36) = happyShift action_58
action_50 (37) = happyShift action_59
action_50 (38) = happyShift action_60
action_50 (39) = happyShift action_61
action_50 (11) = happyGoto action_56
action_50 _ = happyFail (happyExpListPerState 50)

action_51 _ = happyReduce_16

action_52 (25) = happyShift action_55
action_52 _ = happyFail (happyExpListPerState 52)

action_53 _ = happyReduce_12

action_54 _ = happyReduce_13

action_55 (23) = happyShift action_65
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (27) = happyShift action_64
action_56 _ = happyFail (happyExpListPerState 56)

action_57 _ = happyReduce_20

action_58 _ = happyReduce_21

action_59 _ = happyReduce_22

action_60 _ = happyReduce_24

action_61 _ = happyReduce_23

action_62 (23) = happyShift action_63
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (17) = happyShift action_35
action_63 (18) = happyShift action_36
action_63 (21) = happyShift action_37
action_63 (23) = happyShift action_38
action_63 (32) = happyShift action_39
action_63 (5) = happyGoto action_67
action_63 (8) = happyGoto action_34
action_63 _ = happyReduce_2

action_64 _ = happyReduce_15

action_65 (17) = happyShift action_35
action_65 (18) = happyShift action_36
action_65 (21) = happyShift action_37
action_65 (23) = happyShift action_38
action_65 (32) = happyShift action_39
action_65 (5) = happyGoto action_66
action_65 (8) = happyGoto action_34
action_65 _ = happyReduce_2

action_66 (22) = happyShift action_69
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (22) = happyShift action_68
action_67 _ = happyFail (happyExpListPerState 67)

action_68 _ = happyReduce_9

action_69 (19) = happyShift action_70
action_69 _ = happyReduce_10

action_70 (23) = happyShift action_71
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (17) = happyShift action_35
action_71 (18) = happyShift action_36
action_71 (21) = happyShift action_37
action_71 (23) = happyShift action_38
action_71 (32) = happyShift action_39
action_71 (5) = happyGoto action_72
action_71 (8) = happyGoto action_34
action_71 _ = happyReduce_2

action_72 (22) = happyShift action_73
action_72 _ = happyFail (happyExpListPerState 72)

action_73 _ = happyReduce_11

happyReduce_1 = happyReduce 6 4 happyReduction_1
happyReduction_1 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOKEN_ZUGRIFFSRECHT happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Class_ (happy_var_1, happy_var_3, happy_var_5)
	) `HappyStk` happyRest

happyReduce_2 = happySpecReduce_0  5 happyReduction_2
happyReduction_2  =  HappyAbsSyn5
		 ([]
	)

happyReduce_3 = happySpecReduce_2  5 happyReduction_3
happyReduction_3 (HappyAbsSyn5  happy_var_2)
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn5
		 ((happy_var_1:happy_var_2)
	)
happyReduction_3 _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_1  6 happyReduction_4
happyReduction_4 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_4 _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_1  6 happyReduction_5
happyReduction_5 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_5 _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_0  7 happyReduction_6
happyReduction_6  =  HappyAbsSyn7
		 ([]
	)

happyReduce_7 = happySpecReduce_2  7 happyReduction_7
happyReduction_7 (HappyAbsSyn7  happy_var_2)
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn7
		 ((happy_var_1:happy_var_2)
	)
happyReduction_7 _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_1  8 happyReduction_8
happyReduction_8 _
	 =  HappyAbsSyn8
		 (Semikolon_
	)

happyReduce_9 = happyReduce 7 8 happyReduction_9
happyReduction_9 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (While_ (happy_var_3, happy_var_6)
	) `HappyStk` happyRest

happyReduce_10 = happyReduce 7 8 happyReduction_10
happyReduction_10 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (If_ (happy_var_3, happy_var_6, Nothing)
	) `HappyStk` happyRest

happyReduce_11 = happyReduce 11 8 happyReduction_11
happyReduction_11 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_10) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (If_ (happy_var_3, happy_var_6, Just happy_var_10)
	) `HappyStk` happyRest

happyReduce_12 = happySpecReduce_3  8 happyReduction_12
happyReduction_12 _
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (Block_ (happy_var_2)
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  8 happyReduction_13
happyReduction_13 _
	(HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (Return_ (Just happy_var_2)
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_2  8 happyReduction_14
happyReduction_14 _
	_
	 =  HappyAbsSyn8
		 (Return_ (Nothing)
	)

happyReduce_15 = happySpecReduce_3  9 happyReduction_15
happyReduction_15 (HappyTerminal (TOKEN_INTEGER_LITERAL happy_var_3))
	(HappyAbsSyn11  happy_var_2)
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_1))
	 =  HappyAbsSyn9
		 (Bexp_ (happy_var_1, happy_var_2, happy_var_3)
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_1  9 happyReduction_16
happyReduction_16 (HappyTerminal (TOKEN_BOOL_LITERAL happy_var_1))
	 =  HappyAbsSyn9
		 (Boolean_ (happy_var_1)
	)
happyReduction_16 _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_1  10 happyReduction_17
happyReduction_17 (HappyTerminal (TOKEN_INTEGER_LITERAL happy_var_1))
	 =  HappyAbsSyn10
		 (ILit_ (happy_var_1)
	)
happyReduction_17 _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_1  10 happyReduction_18
happyReduction_18 (HappyTerminal (TOKEN_CHAR_LITERAL happy_var_1))
	 =  HappyAbsSyn10
		 (CLit_ (happy_var_1)
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_1  10 happyReduction_19
happyReduction_19 (HappyTerminal (TOKEN_BOOL_LITERAL happy_var_1))
	 =  HappyAbsSyn10
		 (BLit_ (happy_var_1)
	)
happyReduction_19 _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_1  11 happyReduction_20
happyReduction_20 _
	 =  HappyAbsSyn11
		 (EQ_
	)

happyReduce_21 = happySpecReduce_1  11 happyReduction_21
happyReduction_21 _
	 =  HappyAbsSyn11
		 (GT_
	)

happyReduce_22 = happySpecReduce_1  11 happyReduction_22
happyReduction_22 _
	 =  HappyAbsSyn11
		 (LT_
	)

happyReduce_23 = happySpecReduce_1  11 happyReduction_23
happyReduction_23 _
	 =  HappyAbsSyn11
		 (LE_
	)

happyReduce_24 = happySpecReduce_1  11 happyReduction_24
happyReduction_24 _
	 =  HappyAbsSyn11
		 (GE_
	)

happyReduce_25 = happyReduce 8 12 happyReduction_25
happyReduction_25 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_3)) `HappyStk`
	(HappyAbsSyn14  happy_var_2) `HappyStk`
	(HappyTerminal (TOKEN_ZUGRIFFSRECHT happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (Meth_(happy_var_1, happy_var_2, happy_var_3, happy_var_7)
	) `HappyStk` happyRest

happyReduce_26 = happyReduce 8 12 happyReduction_26
happyReduction_26 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOKEN_ZUGRIFFSRECHT happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (Meth_(happy_var_1, Void_, happy_var_3, happy_var_7)
	) `HappyStk` happyRest

happyReduce_27 = happyReduce 6 13 happyReduction_27
happyReduction_27 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOKEN_BEZEICHNER happy_var_3)) `HappyStk`
	(HappyAbsSyn14  happy_var_2) `HappyStk`
	(HappyTerminal (TOKEN_ZUGRIFFSRECHT happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (Attri_ (happy_var_1, happy_var_2, happy_var_3, happy_var_5)
	) `HappyStk` happyRest

happyReduce_28 = happySpecReduce_1  14 happyReduction_28
happyReduction_28 _
	 =  HappyAbsSyn14
		 (Int_
	)

happyReduce_29 = happySpecReduce_1  14 happyReduction_29
happyReduction_29 _
	 =  HappyAbsSyn14
		 (Char_
	)

happyReduce_30 = happySpecReduce_1  14 happyReduction_30
happyReduction_30 _
	 =  HappyAbsSyn14
		 (Bool_
	)

happyNewToken action sts stk [] =
	action 40 40 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TOKEN_KLASSE -> cont 15;
	TOKEN_BEZEICHNER happy_dollar_dollar -> cont 16;
	TOKEN_WHILE -> cont 17;
	TOKEN_IF -> cont 18;
	TOKEN_ELSE -> cont 19;
	TOKEN_ZUWEISUNG -> cont 20;
	TOKEN_SEMIKOLON -> cont 21;
	TOKEN_KLAZU_GESCH -> cont 22;
	TOKEN_KLAAUF_GESCH -> cont 23;
	TOKEN_KLAAUF_RUND -> cont 24;
	TOKEN_KLAZU_RUND -> cont 25;
	TOKEN_INTEGER -> cont 26;
	TOKEN_INTEGER_LITERAL happy_dollar_dollar -> cont 27;
	TOKEN_CHAR -> cont 28;
	TOKEN_CHAR_LITERAL happy_dollar_dollar -> cont 29;
	TOKEN_ZUGRIFFSRECHT happy_dollar_dollar -> cont 30;
	TOKEN_VOID -> cont 31;
	TOKEN_RETURN -> cont 32;
	TOKEN_BOOL -> cont 33;
	TOKEN_BOOL_LITERAL happy_dollar_dollar -> cont 34;
	TOKEN_VERGLEICH -> cont 35;
	TOKEN_GROESSER -> cont 36;
	TOKEN_KLEINER -> cont 37;
	TOKEN_GROESSER_GLEICH -> cont 38;
	TOKEN_KLEINER_GLEICH -> cont 39;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 40 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => ([(Token)], [String]) -> HappyIdentity a
happyError' = HappyIdentity . (\(tokens, _) -> parseError tokens)
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
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}







# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4











































{-# LINE 7 "<command-line>" #-}
{-# LINE 1 "/usr/lib/ghc/include/ghcversion.h" #-}















{-# LINE 7 "<command-line>" #-}
{-# LINE 1 "/tmp/ghc8336_0/ghc_2.h" #-}
































































































































































































{-# LINE 7 "<command-line>" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 









{-# LINE 43 "templates/GenericTemplate.hs" #-}

data Happy_IntList = HappyCons Int Happy_IntList







{-# LINE 65 "templates/GenericTemplate.hs" #-}

{-# LINE 75 "templates/GenericTemplate.hs" #-}

{-# LINE 84 "templates/GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is (1), it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

{-# LINE 137 "templates/GenericTemplate.hs" #-}

{-# LINE 147 "templates/GenericTemplate.hs" #-}
indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x < y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `div` 16)) (bit `mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
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
     = case happyDrop (k - ((1) :: Int)) sts of
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





             _ = nt :: Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

{-# LINE 267 "templates/GenericTemplate.hs" #-}
happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery ((1) is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  (1) tk old_st (((HappyState (action))):(sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        action (1) (1) tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ( (HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# LINE 333 "templates/GenericTemplate.hs" #-}
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