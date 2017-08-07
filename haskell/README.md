
# Basic Idea

Minimum top down Automatic Differentiation 

( addition and multiplication , 1 variable with any degree )

# Feature

Less than 30 lines of code for Automatic differentiation

(indicating about the code on Ad.hs)

# Execution

install Glasgow haskell (GHC) on your computer.

`runghc Main.hs`

or go to interpreter then typing 

`ghci` & `main`

which will show you pairs of original expression & derivatives of 'x'

Note the last example which has multiple variables does not work out properly.

( Intentionally added for indication of current scope. )

# Explanation

For logic on Ad.hs, check slides on /doc/ad_slides.pdf out

For other code, please refer to the comments in between lines.

# Comments

I removed Parser ( lex & Syntax analysis ) for brevity.



