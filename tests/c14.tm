;machine that computes 2^x
start finish
;init and zero pow
start 1 start 1 R
start _ zero-pow # R
zero-pow _ back 1 L
;goes to first position
back _ next-x _ R
back 1 back 1 L
back # back # L
back a back a L
;from 1 to hashtag
next-x 1 hash a R
next-x # cleanup _ L
next-x a next-x a R
;to result
hash 1 hash 1 R
hash a hash a R
hash # dbl-fnd # R
;double after hash
dbl-fnd _ restore _ L
dbl-fnd a dbl-fnd a R
dbl-fnd b dbl-fnd b R
dbl-fnd 1 dbl-app b R

dbl-app _ dbl-ret a L
dbl-app 1 dbl-app 1 R
dbl-app a dbl-app a R

dbl-ret 1 dbl-ret 1 L
dbl-ret a dbl-ret a L
dbl-ret b dbl-fnd b R

restore 1 restore 1 L
restore a restore 1 L
restore b restore 1 L
restore # back # L

cleanup _ cleanup _ R
cleanup a cleanup _ L
cleanup 1 finish 1 N
---
111111111111
