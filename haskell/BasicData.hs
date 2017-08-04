

module BasicData where


data S = M Lp Op S S Rp
       | N Nun
       | V Var
       | A Ans
       | Non
       deriving (Show)


data Op = Op Char deriving (Show)
data Lp = Lp Char deriving (Show)
data Rp = Rp Char deriving (Show)
data Nun = Nun Float deriving (Show)
data Var = Var Char deriving (Show)
data Ans = Ans Float deriving (Show)

data Nn = Int | Float | Double deriving (Show)

