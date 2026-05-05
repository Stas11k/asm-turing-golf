; Test 13: Busy beaver style — many steps from small program (3-state)
; Not a real busy beaver, but exercises many transitions
a halt

a 0 b 1 R
a 1 c 1 L
a _ b 1 R
b 0 a 1 L
b 1 b 1 R
b _ c 1 L
c 0 b 1 L
c 1 halt 1 R
c _ a 1 R
---
0