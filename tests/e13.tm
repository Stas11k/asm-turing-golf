; Edge 13: 8-character state names (maximum allowed length)
strt1234 halt5678

strt1234 a middle56 b R
strt1234 b middle56 a R
strt1234 _ halt5678 _ N
middle56 a strt1234 a R
middle56 b strt1234 b R
middle56 _ halt5678 _ N
---
abab