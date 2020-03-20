father(a, d).
father(a, c).
father(q, a).

mother(b, d).
mother(b, c).
mother(w, b).

man(c).
man(a).
man(q).

woman(b).
woman(d).
woman(w).

parent(X, Y) :- mother(X, Y).
parent(X, Y) :- father(X, Y).


is_mother(X) :- mother(X, _).

is_father(X) :- father(X, _).

is_synem(X) :- parent(_, X), man(X).

sister(X, Y) :- 
    woman(X),
    parent(Z, X), 
    parent(Z, Y),
    X \= Y.

grandfather(X, Y) :- 
    father(X, Z), parent(Z, Y).

sibling(X, Y) :- 
    parent(Z, X), parent(Z, Y), X \= Y.
