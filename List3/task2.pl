max_sum([Head|Tail], X) :-
    max_sum(Tail, Head, Head, X).

max_sum([], _, Max, Max).
max_sum([Head|Tail], LocalMax, Max, X) :-
    NewLocalMax is max(Head, LocalMax + Head),
    NewMax is max(Max, NewLocalMax),
    max_sum(Tail, NewLocalMax, NewMax, X).
