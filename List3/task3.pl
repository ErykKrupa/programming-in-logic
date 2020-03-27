even_permutation(List, Permutation) :-
    permutation(List, Permutation),
    count_inversions(List, Permutation, Counter),
    Counter mod 2 =:= 0.

odd_permutation(List, Permutation) :-
    permutation(List, Permutation),
    count_inversions(List, Permutation, Counter),
    Counter mod 2 =:= 1.

count_inversions([], [], 0).
count_inversions([X], [X], 0).
count_inversions(List, Permutation, Counter) :-
    count_inversions(List, List, Permutation, 0, Counter).
count_inversions([], _, _, Acc, Acc).
count_inversions([Head|Tail], List, Permutation, Acc, Counter) :-
    count1(List, Permutation, Head, Acc1),
    NextAcc is Acc + Acc1,
    count_inversions(Tail, List, Permutation, NextAcc, Counter).

count1(List, Permutation, X, Acc) :-
    count2(List, List, Permutation, X, 0, Acc).

count2([], _, _, _, Acc, Acc).
count2([Head|Tail], List, Permutation, X, Acc, Counter) :-
    (is_before(X, Head, List), is_before(Head, X, Permutation)
        -> NextAcc is Acc + 1; NextAcc is Acc),
    count2(Tail, List, Permutation, X, NextAcc, Counter).

is_before(_, Y, [Y| _]) :- !, fail.
is_before(X, _, [X| _]) :- !.
is_before(X, Y, [_|Tail]) :-
    is_before(X, Y, Tail).
