variance(List, D) :-
    avg(List, Avg),
    get_variations(List, VariationsList, Avg),
    avg(VariationsList, D).

avg(List, Avg) :-
    get_sum_and_lenght(List, Sum, Lenght),
    Avg is Sum / Lenght.

get_sum_and_lenght(List, Sum, Lenght) :-
    get_sum_and_lenght(List, 0, 0, Sum, Lenght).
get_sum_and_lenght([], TmpSum, TmpLenght, TmpSum, TmpLenght).
get_sum_and_lenght([Head|Tail], TmpSum, TmpLenght, Sum, Lenght) :-
    X is Head + TmpSum,
    Y is TmpLenght + 1,
    get_sum_and_lenght(Tail, X, Y, Sum, Lenght).

get_variations([], [], _).
get_variations([Head|TailHead], [V|TailV], Avg) :-
    V0 is Head - Avg,
    V is V0 * V0,
    get_variations(TailHead, TailV, Avg).
