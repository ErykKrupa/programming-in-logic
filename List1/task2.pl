on(aa, bb).
on(bb, cc).
on(cc, dd).
on(dd, ee).

above(X, Y) :- on(X, Y).
above(X, Y) :- on(X, Z), above(Z, Y).
