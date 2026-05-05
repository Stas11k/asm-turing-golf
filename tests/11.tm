; Test 11: Unary addition — 111+11 -> 11111
; Strategy: replace + with 1, erase the last 1
goR done

goR 1 goR 1 R
goR + toEnd 1 R

toEnd 1 toEnd 1 R
toEnd _ eraseL _ L

eraseL 1 done _ N
---
111+11