; Test 02a: Single-pass replacement — replace x with y and y with x
go stop
go x go y R
go y go x R
go _ stop _ N
---
xyyxxy