

module Ad
  (
    
    ad'
    
  ) where


import BasicData

----------------------------------------------

-- Indeed, you do not need initial Tree, you must set something which fill the type
-- of the tree, which is in this case, the exact same tree which is going to be
-- investigated. Since that is a fake, there are another boolean arugment, which denotes
-- if the state has a fake tree. Coming down and encounter a node which has * operator,
-- the boolean value will switch to false indicating current state is proper.

----------------------------------------------

ad' :: Char -> S -> [S]
ad' c s = ad c True (s,[]) s


ad :: Char -> Bool -> (S,[S]) -> S -> [S]

-----------------------------

--folloing four functions are cases that an operator that the given node has * 

----------------------------------------------------------------
-- When a tree has pair of variable which should be differentiate,
-- put both variable with accumulated state on the returned list.
----------------------------------------------------------------


ad c bl (st,ans) (M (Lp '(') (Op '*') (V (Var a)) (V (Var b)) (Rp ')') )
  | (c == a) && (c == b) && (bl == True )  = [(V (Var a))] ++ [(V (Var b))]
  | (c == a) && (c == b) && (bl == False)  = [ret a st] ++ [ret b st]
  
  
------------------------------------------------------------------
-- When a node has a variable on its right side,
-- update your state & dive deeper with it \ö/
------------------------------------------------------------------

                                             
ad c bl (st,ans) (M (Lp '(') (Op '*') a (V (Var b)) (Rp ')') )
  | (c == b) && (bl == True) = (ad c False ((V (Var b)),ans) a) ++ [a]
  | (c == b) && (bl ==False) = (ad c bl (ret b st,ans) a) ++ [ret' a st]

------------------------------------------------------------------
-- When a node has a variable on its left side,
-- update your state & dive deeper with it \ö/
------------------------------------------------------------------

  
ad c bl (st,ans) (M (Lp '(') (Op '*') (V (Var a)) b (Rp ')') )
  | (c == a) && (bl == True)  = (ad c False ((V (Var a)),ans) b) ++ [b]
  | (c == a) && (bl == False) = (ad c bl (ret a st,ans) b) ++ [ ret' b st ]

    
------------------------------------------------------------------
-- When a node has pair of something else, 
-- go deeper and investigate what are there.
----------------------------------------------------------------

ad c bl (st,ans) (M (Lp '(') (Op '*') l r (Rp ')') )
  | bl == True  = (ad c False (r,ans) l) ++ (ad c False (l,ans) r)
  | bl == False = (ad c bl (ret' st r,ans) l) ++ (ad c bl (ret' st l,ans) r)
  
  
----------------------------------------------------------------
----------------------------------------------------------------       
----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------

--folloing four functions are cases that an operator that the given node has +

----------------------------------------------------------------
-- When a node has a pair of variable which should be differentiate,
-- put current either state or just 1 unless state has not yet been set.
----------------------------------------------------------------


ad c bl (st,ans) (M (Lp '(') (Op '+') (V (Var a)) (V (Var b)) (Rp ')') )
  | (c == a) && (c == b) && (bl == True) = [N (Nun 1)] ++ [N (Nun 1)]
  | (c == a) && (c == b) && (bl ==False) = [st] ++ [st]

    
----------------------------------------------------------------
-- When a node has a variable on its left side,
-- put current state or 1 and go deeper with no modification of current state.
----------------------------------------------------------------


ad c bl (st,ans) (M (Lp '(') (Op '+') (V (Var a)) b (Rp ')') )
  | (bl == True ) && (c == a) = [N (Nun 1)] ++ e
  | (bl == False) && (c == a) = [st] ++ e
  where e = (ad c bl (st,ans) b)

----------------------------------------------------------------
-- When a node has a variable on its right side,
-- put current state or 1 and go deeper with no modification of current state.
----------------------------------------------------------------


ad c bl (st,ans) (M (Lp '(') (Op '+') a (V (Var b)) (Rp ')') )
  | (bl == True ) && (c == b) = [N (Nun 1)] ++ e
  | (bl == False) && (c == b) = [st] ++ e
  where e = (ad c bl (st,ans) a)


----------------------------------------------------------------
-- When a tree has something else,
-- just dive deeper without updating current state
----------------------------------------------------------------


ad c bl s (M (Lp '(') (Op '+') a b (Rp ')') )
  = (ad c bl s a) ++ (ad c bl s b)

  
----------------------------------------------------------------
-- otherwise just return empty list :o---
----------------------------------------------------------------

ad _ _ _ _ = []

----------------------------------------------------------------


ret :: Char -> S -> S
ret a st = (M (Lp '(') (Op '*') st (V (Var a)) (Rp ')') )

ret' :: S -> S -> S
ret' st l = (M (Lp '(') (Op '*') st l (Rp ')') )

