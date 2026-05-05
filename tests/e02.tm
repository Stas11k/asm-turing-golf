; Edge 02: Comments and blank lines interspersed between rules
; This tests that the parser correctly skips ; lines and empty lines mid-rules

go done

; First rule — replace a with x
go a go x R

; Second rule — replace b with y

go b go y R

; Halt on blank
go _ done _ N
---
abba