; Test 12: Binary palindrome checker — writes Y or N at the end
; Checks if binary string is a palindrome
checkL done

; Check leftmost bit
checkL 0 goR0 _ R
checkL 1 goR1 _ R
checkL _ done Y N

; If only one bit left or empty, it's a palindrome
goR0 0 goR0 0 R
goR0 1 goR0 1 R
goR0 _ matchR0 _ L

goR1 0 goR1 0 R
goR1 1 goR1 1 R
goR1 _ matchR1 _ L

; Match rightmost with what we picked up from left
matchR0 0 goBack _ L
matchR0 1 no _ N
matchR0 _ done Y N

matchR1 1 goBack _ L
matchR1 0 no _ N
matchR1 _ done Y N

; Go back to leftmost
goBack 0 goBack 0 L
goBack 1 goBack 1 L
goBack _ checkL _ R

; Not a palindrome
no _ done N N
---
1001001