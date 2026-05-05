; Edge 07: Internal blanks in output — blanks between non-blanks become spaces
; Write X at pos 0, skip 2, write Y at pos 3
; Output: "X  Y" (X, space, space, Y)
s0 done
s0 a s1 X R
s1 a s2 _ R
s2 a s3 _ R
s3 a done Y N
---
aaaa