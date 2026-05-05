; Test 10: Bubble sort binary — move all 1s left
; Input: 01010 -> 11000
; Simple approach: scan for "01" pattern and swap to "10", repeat until clean pass
start done

; Scan right looking for "01" to swap
start 0 see0 0 R
start 1 start 1 R
start _ check _ L

; We saw a 0; if next is 1, swap
see0 0 see0 0 R
see0 1 doSwap 0 L
see0 _ check _ L

; Swap: write 1 where the 0 was
doSwap 0 dirty 1 R
doSwap _ dirty 1 R

; Mark that we changed something, keep scanning
dirty 0 see0d 0 R
dirty 1 dirtR 1 R
dirty _ rewind _ L

see0d 0 see0d 0 R
see0d 1 doSwpD 0 L
see0d _ rewind _ L

doSwpD 0 dirty 1 R

dirtR 0 see0d 0 R
dirtR 1 dirtR 1 R
dirtR _ rewind _ L

; Rewind and rescan
rewind 0 rewind 0 L
rewind 1 rewind 1 L
rewind _ start _ R

; Clean pass check — go left then rescan
check 0 check 0 L
check 1 check 1 L
check _ done _ R
---
01010