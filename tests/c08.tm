; Compresses strings like "11110011010" -> "101010"
s0 done

; Read the first character to know what we are tracking
s0 1 s1_mark 1 R
s0 0 s0_mark 0 R
s0 _ done _ N

; Tracking '1's
; Duplicate -> Mark as X
s1_mark 1 s1_mark X R
; Changed to 0, switch state
s1_mark 0 s0_mark 0 R
; Hit the end, start rewind
s1_mark _ rew _ L

; Tracking '0's
; Duplicate -> Mark as X
s0_mark 0 s0_mark X R
; Changed to 1, switch state
s0_mark 1 s1_mark 1 R
; Hit the end, start rewind
s0_mark _ rew _ L

rew 1 rew 1 L
rew 0 rew 0 L
rew X rew X L
rew _ shift_start _ R

; Find the first 'X' and mark it as 'T' (Target)
shift_start 1 shift_start 1 R
shift_start 0 shift_start 0 R
shift_start X find_char T R
shift_start _ done _ N

; Scan right to find the next valid character (1 or 0)
find_char X find_char X R
; Found 1, leave X in its place, bring 1 back
find_char 1 move_1 X L
; Found 0, leave X in its place, bring 0 back
find_char 0 move_0 X L
; Hit the end, only X's are left
find_char _ clean_tail _ L

; Bring '1' back to the target 'T'
move_1 X move_1 X L
move_1 T shift_start 1 R

; Bring '0' back to the target 'T'
move_0 X move_0 X L
move_0 T shift_start 0 R

; Erase all trailing markers
clean_tail X clean_tail _ L
clean_tail T clean_tail _ L
clean_tail 1 done 1 R
clean_tail 0 done 0 R
clean_tail _ done _ R
---
11110011010