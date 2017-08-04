
module Syntax where

data S = S Struct
       | F Func
       | D Decl
       deriving (Show)

---------------------------------------------------
------------ non-terminal item definition --------------

data Struct = Struct Lb S Rb Sem  deriving (Show)
data Func   = Func Static Const Ty FName Args Lb S Rb Sem  deriving (Show)
data Decl   = Decl Static Const VName Sem  deriving (Show)

data FName = FName [Char] deriving (Show)
data Args  = Args Lp Arg Rp  deriving (Show)
data VName = VName [Char] deriving (Show)
  
---------------------------------------------------

data Ty  = Int | Float | Double | Void  deriving (Show)

----------- letter for distinction  --------------

data Lb   = Lb Char  deriving (Show)
data Rb   = Rb Char  deriving (Show)

data Lp   = Lp Char  deriving (Show)
data Rp   = Rp Char  deriving (Show)

data Sem = Sem Char  deriving (Show)

---------------------------------------------------
------------ terminal item definition -----------

type Arg = [(Ty,[Char])]

data Static = Static Bool deriving (Show)
data Const  = Const  Bool deriving (Show)


--type Ty = Int
-- Struct = Struct (Lb 'x') (Rb 'x')
-- "Struct { int a = 3;};"

