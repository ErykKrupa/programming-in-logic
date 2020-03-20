reachable(X, Y) :- path(X, Y, [X]).
path(X, Y, _) :- X = Y.
path(X, Y, Visited) :-
    arc(X, Z),
    \+ member(Z, Visited),
    path(Z, Y, [Z|Visited]).
    
    
    
    