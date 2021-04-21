module AbstrakteSyntax where

data Klasse_ = Class_ (String, String, [JavaAusdruck_])
              deriving (Eq, Show)

data JavaAusdruck_ = Attri_ (String, AttributType_, String, Literal_)
	           | Meth_ (String, AttributType_, String, [Statement_])
                deriving (Eq, Show)

data Statement_ = If_ (BExpression_, [Statement_], Maybe [Statement_])
               | While_ (BExpression_, [Statement_]) --while
               | For_ (String, Int, BExpression_, DecInc_, [Statement_])
               | Block_ ([Statement_])
               | Semikolon_
               | Return_ (Maybe Literal_)
               deriving (Eq, Show)

data Literal_  = ILit_ (Int)
            --   | SLit_ (String)
               | CLit_ (Char)
               | BLit_ (Bool)
               deriving (Eq, Show)

data BExpression_ = Bexp_ (String, BinaryOp_, Int)
                  | Boolean_ (Bool)
           deriving (Eq, Show)

data DecInc_ = Dec_
             | Inc_ 
           deriving (Eq, Show)

data BinaryOp_  = EQ_ 
                | LT_
                | GT_
                | GE_
                | LE_
           deriving (Eq, Show)
           
data AttributType_ = Int_
                 --  | String_
                   | Bool_
                   | Char_
                   | Void_                              -- inkonsistenz in Logik aber nur so funktioniert es 
           deriving (Eq, Show)