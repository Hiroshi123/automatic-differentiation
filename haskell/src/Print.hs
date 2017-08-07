

module Print
  (
    out,
  ) where


import BasicData
import Ad

-- out provides print function for a tree

out :: S -> [Char]
out (V (Var a)) = blk [a]
out (N (Nun a)) = blk (show a)
out (M (Lp lp) (Op op) l r (Rp rp) ) = ret
  where lr = blk $ out l
        rr = out r
        ope= blk [op]
        ret= blk $ [lp] ++ ope ++ lr ++ rr ++ (blk [rp])
        
        
blk :: [Char] -> [Char]
blk a = [' '] ++ a


