

module Input where

import BasicData

samp1 :: S
samp1 = M (Lp '(') (Op '+') (N (Nun 3.0)) (N (Nun 1.0)) (Rp ')')

samp2 :: S
samp2 = M (Lp '(') (Op '*') (N (Nun 3.0)) (N (Nun 1.0)) (Rp ')')

samp3 :: S
samp3 = M (Lp '(') (Op '*') (V (Var 'x')) (N (Nun 6.0)) (Rp ')')

samp4 :: S
samp4 = M (Lp '(') (Op '*') (V (Var 'x')) (V (Var 'x')) (Rp ')')

samp5 :: S
samp5 = M (Lp '(') (Op '+') (V (Var 'x')) samp4 (Rp ')')

samp6 :: S
samp6 = M (Lp '(') (Op '*') samp3 samp4 (Rp ')')

samp7 :: S
samp7 = M (Lp '(') (Op '*') samp1 (V (Var 'x')) (Rp ')')

samp8 :: S
samp8 = M (Lp '(') (Op '*') samp3 samp6 (Rp ')')

samp9 :: S
samp9 = M (Lp '(') (Op '+') samp7 samp8 (Rp ')')

---- which will not work out

samp10 :: S
samp10 = M (Lp '(') (Op '*') (V (Var 'x')) (V (Var 'y')) (Rp ')')


