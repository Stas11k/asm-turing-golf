; Tests the 'N' (No movement) direction and case-sensitive state transitions on a single cell.
q0 halt

q0 1 Q0 2 N
Q0 2 q1 3 N
q1 3 Q1 4 R
Q1 _ halt X N
---
1