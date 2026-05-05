; The machine receives a word x1...xn of characters a and b as input and returns word x1...xnx1...xn
@a0 @a9

; rules
@a0 _ @a1 _ L
@a0 a @a0 a R
@a0 b @a0 b R
@a1 _ @a9 _ N
@a1 a @a2 # L
@a1 b @a2 $ L
@a2 _ @a3 _ R
@a2 a @a2 a L
@a2 b @a2 b L
@a2 ! @a3 ! R
@a2 ? @a3 ? R
@a2 # @a2 # L
@a2 $ @a2 $ L
@a3 a @a4 ! R
@a3 b @a5 ? R
@a3 # @a6 a R
@a3 $ @a7 b R
@a4 _ @a2 a N
@a4 a @a4 a R
@a4 b @a4 b R
@a4 # @a4 # R
@a4 $ @a4 $ R
@a5 _ @a2 b N
@a5 a @a5 a R
@a5 b @a5 b R
@a5 # @a5 # R
@a5 $ @a5 $ R
@a6 _ @a8 a N
@a6 a @a6 a R
@a6 b @a6 b R
@a7 _ @a8 b N
@a7 a @a7 a R
@a7 b @a7 b R
@a8 _ @a9 _ R
@a8 a @a8 a L
@a8 b @a8 b L
@a8 ! @a8 a L
@a8 ? @a8 b L

---
aaaaaaaabbbbbbbb