

import Tools
import Print
import Input
import BasicData

main :: IO()
main = mapM_ print a

sampleData :: [S]
sampleData =
  
  [
    
    samp1,
    samp2,
    samp3,
    samp4,
    samp5,
    samp6,
    samp7,
    samp8,
    samp9,
    samp10
    
  ]
  
a :: [([Char],[Char])]
a = map ff sampleData
  
ff :: S -> ([Char],[Char])
ff s = ( out s, flow 'x' s )
     

