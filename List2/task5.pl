list(N, X) :-
    numlist(1, N, X1),
    permutation(X2, X1),
    mix(X1, X2, X).	
mix([H1|T1],[H2|T2], [H1,H2|Tail]) :-
    mix(T1, T2, Tail).
mix([], [], []).
