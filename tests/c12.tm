; Logical NAND
; Accepts strings of the form b|b, where b - some binary string
start end 

start 0 setWall 0 R
start 1 setWall 1 R

setWall 0 setWall 0 R
setWall 1 setWall 1 R
setWall | setWall | R

setWall _ goBack # L

goBack 0 goBack 0 L
goBack 1 goBack 1 L
goBack # goBack # L
goBack | goBack | L

goBack _ rStart _ R

rStart # rStart # R
rStart 0 zeroL # R
zeroL 0 zeroL 0 R 
zeroL 1 zeroL 1 R
zeroL | zCheckR | R 

zCheckR 0 One # R
zCheckR 1 One # R
zCheckR # zCheckR # R

rStart 1 oneL # R
oneL | oCheckR | R 
oneL 0 oneL 0 R 
oneL 1 oneL 1 R

oCheckR 0 One # R
oCheckR 1 Zero # R
oCheckR # oCheckR # R

rStart | pErase # R
pErase 0 pErase 0 R
pErase 1 pErase 1 R
pErase # pErase # R
pErase _ erase _ L 

erase 0 erase 0 L 
erase 1 erase 1 L
erase # erase _ L 
erase _ end _ N

Zero 0 Zero 0 R 
Zero 1 Zero 1 R 
Zero | Zero | R 
Zero # Zero # R 
Zero _ goBack 0 L 

One 0 One 0 R 
One 1 One 1 R 
One | One | R 
One # One # R 
One _ goBack 1 L 
---
0101|0111