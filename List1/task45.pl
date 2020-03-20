le(a, a).
le(b, b).
le(c, c).
le(d, d).
le(e, e).
le(a, b).
le(a, c).
le(b, d).
le(c, d).
le(a, e).
le(a, d).

in_partial_order(X) :- le(X, _).
in_partial_order(X) :- le(_, X).

lt(X, Y) :-
    le(X, Y),
    X \= Y.

maximal(X) :-
    in_partial_order(X),
    \+ lt(X, _).

greatest(X) :-
    in_partial_order(X),
    forall(in_partial_order(Y), lt(Y, X)).

minimal(X) :-
    in_partial_order(X),
    \+ lt(_, X).

least(X) :-
    in_partial_order(X),
	forall(in_partial_order(Y), le(X, Y)).



reflexive :- forall(in_partial_order(X),le(X, X)).

weak_antisymm :- forall(
    (in_partial_order(X), in_partial_order(Y), le(X, Y), le(Y, X)),
    X = Y).

transitive :- forall(
    (in_partial_order(X), in_partial_order(Y), in_partial_order(Z), 
        le(X, Y), le(Y, Z)),
    le(X, Z)).

partial_order :-
    reflexive,
    weak_antisymm,
    transitive.
