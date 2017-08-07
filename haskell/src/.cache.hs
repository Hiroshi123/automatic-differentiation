



out :: S -> [Char]
out (V (Var a)) = blk [a]
out (A (Ans a)) = blk (show a)
out (N (Nun a)) = blk (show a)
out (M (Lp lp) (Op op) l r (Rp rp) ) = ret
  where lr = blk $ out l
        rr = out r
        ope= blk [op]
        ret= blk $ [lp] ++ ope ++ lr ++ rr ++ (blk [rp])
        


        

kk :: [(Int,Float)] -> [(Int,Float)] -> [(Int,Float)]
kk a b = filter (\s -> (snd s) /= 0 ) $ concatMap (\x -> map (k2 x) b ) a


  
k2 :: (Int,Float) -> (Int,Float) -> (Int,Float)
k2 (a,b) (c,d)
  | a == c = (a , b + d)
  | otherwise = (0,0)
  
k3 :: (Int,Float) -> (Int,Float) -> (Int,Float)
k3 (a,b) (c,d) = (a+c,b*d)
                 
blk :: [Char] -> [Char]
blk a = [' '] ++ a

---------------------------------------------------
---------------------------------------------------
---------------------------------------------------

        
uniq :: (Ord a) => [a] -> [a]
uniq [] = []
uniq (h:t)
  | n > 0     = uniq t
  | otherwise = h : (uniq t)
  where n = length $ filter (\x -> x == h) t
  
          
-- vis :: S -> ([Char],[Char])
-- vis a = ( (out a) , (out $ flow a) )


            

