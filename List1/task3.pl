left_of(pencil, hourglass).
left_of(hourglass, buterfly).
left_of(buterfly, fish).

above(bicycle, pencil).
above(camera, buterfly).

right_of(X, Y) :- left_of(Y, X).

below(X, Y) :- above(Y, X).

left_rec(X, Y) :- left_of(X, Y).
left_rec(X, Y) :- 
    left_of(X, Z), 
    left_rec(Z, Y).

above_rec(X, Y) :- above(X, Y).
above_rec(X, Y) :- 
    above(X, Z), 
    above_rec(Z, Y).

right_rec(X, Y) :- left_rec(Y, X).
below_rec(X, Y) :- above_rec(Y, X).

higher(X, Y) :- above_rec(X, Y).
higher(X, Y) :-
    above_rec(X, Z),
    (left_rec(Z, Y); right_rec(Z, Y)).
higher(X, Y) :-
    above(X, Z1),
    above(Y, Z2),
    higher(Z1, Z2).
