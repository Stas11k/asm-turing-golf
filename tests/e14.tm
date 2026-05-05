; Edge 14: Writing _ (blank) creates actual gap in output
; Rule writes _ which means blank (0), not ASCII 95.
; Output should have space where blank was written between non-blanks.
s0 done
s0 a s1 X R
s1 b s2 _ R
s2 c done Y N
---
abc