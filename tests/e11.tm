; Edge 11: Special ASCII chars in input and rules — !, ~, @, #
; Spec allows 33-126 in rules. Test the boundaries.
go done
go ! go ~ R
go ~ go ! R
go @ go # R
go # go @ R
go _ done _ N
---
!~@#