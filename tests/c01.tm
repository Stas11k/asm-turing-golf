; Community test
; Divide
; Tape input/output format:     1 -> |
;                               2 -> ||
;                               3 -> |||
;                               .........

@a1 @ae

; ---
@a1 | @a2 | N
@a1 # @as # N

; ---
@a2 | @a2 | R
@a2 # @a3 # R

; ---
@a3 _ @a4 _ L
@a3 | @a3 | R
@a3 * @a4 * L
@a3 r @a4 r L

; ---
@a4 | @a5 * L
@a4 # @a8 # R

; ---
@a5 _ @a6 _ R
@a5 | @a5 | L
@a5 # @a5 # L

; ---
@a6 | @a7 _ R
@a6 # @as # N

; ---
@a7 | @a7 | R
@a7 # @a2 # N

; ---
@a8 _ @a9 r L
@a8 * @a8 * R
@a8 r @a8 r R

; ---
@a9 _ @a2 _ R
@a9 | @a9 | L
@a9 # @a9 # L
@a9 * @a9 | L
@a9 r @a9 r L

; -clean-
@ac _ @ae _ L
@ac | @ac _ R
@ac # @ac _ R
@ac * @ac _ R
@ac r @ac | R

; -return to start-
@as _ @ac _ R
@as | @as | L
@as # @as # L
@as * @as * L
@as r @as r L

---
||||||||||||||||||||||||#||||||