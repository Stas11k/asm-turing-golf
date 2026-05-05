; Binary positive number divided by (-2) (Two's complement + shift right) (anser will be negative number without sign bit)

q0 end

q0 1 q0 1 R
q0 0 q0 0 R
q0 _ q1 _ L
q1 1 q1 0 L
q1 0 q1 1 L
q1 _ q2 _ R
q2 0 q2 0 R
q2 1 q2 1 R
q2 _ q3 _ L
q3 0 q4 1 L
q3 1 q3 0 L
q3 _ q4 1 L
q4 0 q4 0 L
q4 1 q4 1 L
q4 _ q5 _ R
q5 0 q5 0 R
q5 1 q5 1 R
q5 _ q6 _ L
q6 0 end _ N
q6 1 end _ N
---
10110