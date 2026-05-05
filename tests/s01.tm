; Stress 01: Bubble sort — ~300K steps, tests long execution
s0 done

; Start of pass
s0 a sa a R
s0 b sb b R
s0 _ done _ N

; Carrying 'a', no swap yet
sa a sa a R
sa b sb b R
sa _ done _ N

; Carrying 'b', no swap yet
sb b sb b R
sb a sw b L
sb _ done _ N

; Swap: write 'a' where 'b' was
sw b Sa a R

; Carrying 'a', swap happened
Sa a Sa a R
Sa b Sb b R
Sa _ rew _ L

; Carrying 'b', swap happened
Sb b Sb b R
Sb a Sw b L
Sb _ rew _ L

; Swap (flag already set)
Sw b Sa a R

; Rewind to start
rew a rew a L
rew b rew b L
rew _ s0 _ R
---
babababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababa