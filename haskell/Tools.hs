

module Tools
  (
    
    flow,
    
  ) where


import BasicData
import Ad

----------------------------------------------------------------
----look at the below flow function, it has
----------------------------------------------------------------

-- 1. ad'    (automatic differentiation)
-- 2. cons   (connection of tree having plus operator in between)
-- 3. col    (sort all of nodes with a degree of a given variable)
-- 4. integ  (integration of same degree)
-- 5. toStr  (let argument string)

----------------------------------------------------------------


flow :: Char -> S -> [Char]
flow c s = toStr c $ integ $ col c $ foldr cons (N (Nun 0)) $ ad' c s

flow' :: Char -> S -> S
flow' c s = foldr cons (N (Nun 0)) $ ad' c s

----------------------------------------------------------------

-- 1 ad' (in Ad.hs file)---
--   this function had been seperated as this is the core of my last talk.

----------------------------------------------------------------

-- 2.cons is a connection of two trees ---------

cons :: S -> S -> S
cons a b = M (Lp '(') (Op '+') a b (Rp ')')


----------------------------------------------------------------

-- 3. col is a function to collect all of the same degree of a given variable
--    return [degree,coefficient] ---------


col :: Char -> S -> [(Int,Float)]

----------------------------------------------------------------

col c (M (Lp '(') (Op '*') (V (Var a)) (V (Var b)) (Rp ')') )
  | (c == a) && (c == b) = [(2,1)]
  
                           
col c (M (Lp '(') (Op '*') (V (Var a)) b (Rp ')') )
  | (c == a) = r
  where r1 = col c b
        r  = map (\x -> ( (fst x) + 1, snd x ) ) r1
        
        
col c (M (Lp '(') (Op '*') a (V (Var b)) (Rp ')') )
  | (c == b) = r
  where r1 = col c a
        r  = map (\x -> ( (fst x) + 1, snd x ) ) r1
        
        
col c (M (Lp '(') (Op '*') (N (Nun a)) (N (Nun b)) (Rp ')') )
  =  [( 0 , a * b )]
  
     
col c (M (Lp '(') (Op '*') a b (Rp ')') )
  = r
  where ln = col c a
        rn = col c b
        r  = kv ln rn
        
        
----------------------------------------------------------------

col c (M (Lp '(') (Op '+') (V (Var a)) (V (Var b)) (Rp ')') )
  | (c == a) && (c == b) = [(1,2)]
  
col c (M (Lp '(') (Op '+') (V (Var a)) b (Rp ')') )
  | (c == a) = e ++ [(1,1)]
  where e = col c b  
  
col c (M (Lp '(') (Op '+') a (V (Var b)) (Rp ')') )
  | (c == b) = e ++ [(1,1)]
  where e = col c a
  
col c (M (Lp '(') (Op '+') (N (Nun a)) (N (Nun b)) (Rp ')') )
  =  [( 0 , a + b )]
     
col c (M (Lp '(') (Op '+') a b (Rp ')') )
  = (col c a) ++ (col c b)

col _ (N (Nun a)) = [(0,a)]
col _ _ = []
  
----------------------------------------------------------------
----------------------------------------------------------------

kv :: [(Int,Float)] -> [(Int,Float)] -> [(Int,Float)]
kv a b = filter (\s -> (snd s) /= 0 ) $ concatMap (\x -> map (f x) b ) a
         where f (a,b) (c,d) = (a+c,b*d)

----------------------------------------------------------------
-- 4. integ is a function which will integrate same degrees of a given variable
----------------------------------------------------------------

integ :: [(Int,Float)] -> [(Int,Float)]
integ a = filter (\x -> (snd x) /= 0 ) $ map (\x -> integ' x a) [0..10]

integ' :: Int -> [(Int,Float)] -> (Int,Float)
integ' i a = r
  where s = filter (\x -> (fst x) == i ) a
        r = foldr (\ x y -> (i,(snd x) + (snd y)) ) (0,0) s
        
----------------------------------------------------------------
-- 5. toStr is a function which would let sorted pairs : coefficient & degree ; String 
----------------------------------------------------------------

toStr :: Char -> [(Int,Float)] -> [Char]
toStr _ [] = []
toStr c (h:t) = " +" ++ (show (snd h)) ++ x ++ r
  where r = toStr c t
        x = take (fst h) $ repeat c

----------------------------------------------------------------
----------------------------------------------------------------


