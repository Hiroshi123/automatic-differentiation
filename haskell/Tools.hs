


module Tools
  (
    
    eval,
    out
    
  ) where



import BasicData
import Ad
import Input

eval :: Char -> S -> [(Int,Float)]

----------------------------------------------------------------

eval c (M (Lp '(') (Op '*') (V (Var a)) (V (Var b)) (Rp ')') )
  | (c == a) && (c == b) = [(2,1)]
  
                           
eval c (M (Lp '(') (Op '*') (V (Var a)) b (Rp ')') )
  | (c == a) = r
  where r1 = eval c b
        r  = map fd r1
        
        
eval c (M (Lp '(') (Op '*') a (V (Var b)) (Rp ')') )
  | (c == b) = r
  where r1 = eval c a
        r  = map fd r1
        
        
eval c (M (Lp '(') (Op '*') (N (Nun a)) (N (Nun b)) (Rp ')') )
  =  [( 0 , a * b )]
  
     
eval c (M (Lp '(') (Op '*') a b (Rp ')') )
  = r
  where ln = eval c a
        rn = eval c b
        r  = kv ln rn
        
        
----------------------------------------------------------------

eval c (M (Lp '(') (Op '+') (V (Var a)) (V (Var b)) (Rp ')') )
  | (c == a) && (c == b) = [(1,2)]
  
eval c (M (Lp '(') (Op '+') (V (Var a)) b (Rp ')') )
  | (c == a) = e ++ [(1,1)]
  where e = eval c b  
  
eval c (M (Lp '(') (Op '+') a (V (Var b)) (Rp ')') )
  | (c == b) = e ++ [(1,1)]
  where e = eval c a
  
eval c (M (Lp '(') (Op '+') (N (Nun a)) (N (Nun b)) (Rp ')') )
  =  [( 0 , a + b )]
     
eval c (M (Lp '(') (Op '+') a b (Rp ')') )
  = (eval c a) ++ (eval c b)
  
----------------------------------------------------------------

eval _ (N (Nun a)) = [(0,a)]
eval _ _ = []


out :: S -> [Char]
out (V (Var a)) = blk [a]
out (A (Ans a)) = blk (show a)
out (N (Nun a)) = blk (show a)
out (M (Lp lp) (Op op) l r (Rp rp) ) = ret
  where lr = blk $ out l
        rr = out r
        ope= blk [op]
        ret= blk $ [lp] ++ ope ++ lr ++ rr ++ (blk [rp])
        
             
calc :: S -> S

calc (M (Lp '(') (Op '+') (N (Nun a)) (N (Nun b)) (Rp ')') )
  =  N (Nun (a + b))
  
calc (M (Lp '(') (Op '*') (N (Nun a)) (N (Nun b)) (Rp ')') )
  =  N (Nun (a * b))
  
calc (M (Lp '(') (Op '+') a b (Rp ')') )
  =  (M (Lp '(') (Op '+') (calc a) (calc b) (Rp ')') )
  
calc a = a

         
fd ::  (Int,Float) -> (Int,Float)
fd (a,b) = (a+1,b)

-- kk :: [(Int,Float)] -> [(Int,Float)] -> [Int]
-- kk a b = concatMap (\x -> map (\y -> ( (fst x) + (fst y) ) ) b ) a

kk :: [(Int,Float)] -> [(Int,Float)] -> [(Int,Float)]
kk a b = filter (\s -> (snd s) /= 0 ) $ concatMap (\x -> map (k2 x) b ) a

kv :: [(Int,Float)] -> [(Int,Float)] -> [(Int,Float)]
kv a b = filter (\s -> (snd s) /= 0 ) $ concatMap (\x -> map (k3 x) b ) a

--kv a b = concatMap (\x -> map (k3 x) b ) a
  
k2 :: (Int,Float) -> (Int,Float) -> (Int,Float)
k2 (a,b) (c,d)
  | a == c = (a , b + d)
  | otherwise = (0,0)
  
k3 :: (Int,Float) -> (Int,Float) -> (Int,Float)
k3 (a,b) (c,d) = (a+c,b*d)
                 
blk :: [Char] -> [Char]
blk a = [' '] ++ a

---------------------------------------------------

--flow :: S -> [Char] -- [(Int,Float)]
--flow s = toStr 'x' $ integ $ eval 'x' $ foldr ret'' (N (Nun 0)) $ map calc $ ad' 'x' s
--flow s = eval 'x' $ foldr ret'' (N (Nun 0)) $ map calc $ ad' 'x' s

flow :: Char -> S -> [Char]
flow c s = toStr c $ integ $ eval c $ foldr ret'' (N (Nun 0)) $ map calc $ ad' c s

flow' :: Char -> S -> S
flow' c s = foldr ret'' (N (Nun 0)) $ map calc $ ad' c s

toStr :: Char -> [(Int,Float)] -> [Char]
toStr _ [] = []
toStr c (h:t) = " +" ++ (show (snd h)) ++ x ++ r
  where r = toStr c t
        x = take (fst h) $ repeat c
        
            
integ :: [(Int,Float)] -> [(Int,Float)]
integ a = filter (\x -> (snd x) /= 0 ) $ map (\x -> integ' x a) [0..10]

  
integ' :: Int -> [(Int,Float)] -> (Int,Float)
integ' i a = r
  where s = filter (\x -> (fst x) == i ) a
        r = foldr (\ x y -> (i,(snd x) + (snd y)) ) (0,0) s
        
        
uniq :: (Ord a) => [a] -> [a]
uniq [] = []
uniq (h:t)
  | n > 0     = uniq t
  | otherwise = h : (uniq t)
  where n = length $ filter (\x -> x == h) t
  
          
-- vis :: S -> ([Char],[Char])
-- vis a = ( (out a) , (out $ flow a) )

ret'' :: S -> S -> S
ret'' a b = M (Lp '(') (Op '+') a b (Rp ')')

            
