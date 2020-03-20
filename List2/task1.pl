middle(L, X) :-
    append(L1, [X|L2], L),
    same_length(L1, L2).