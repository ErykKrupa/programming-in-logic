/*board(N) należy uruchomić podając liczbę liczb, zamiast listy
np. board(8).
*/
queens(N, P) :-
    numlist(1, N, L),
    permutation(L, P),
    good(P).

good(P) :-
    \+ bad(P).

bad(P) :-
    append(_, [Wi | L1], P),
    append(L2, [Wj | _], L1),
    length(L2, K),
    abs(Wi - Wj) =:= K + 1.

board(N) :-
    queens(N, Board),
    print(Board).

color(N, C) :- 0 is N mod 2 
    ->  (C = white);
        (C = black).
		
row(_, [], _) :-
    write('|'), nl, !.
row(K, [Q|T], Color) :-
    write('|'),
    content(K, Q, Color, X),
    write(X),
    change_color(Color, NextColor),
    row(K, T, NextColor).
	
print(Board) :-
    length(Board, N),
    color(N, Color),
    print(N, N, Board, Color).
	
print(N, 0, _, _) :-
    frame(N), !.

print(N, K, Queens, Color) :-
    frame(N), nl,
    row(K, Queens, Color),
    row(K, Queens, Color),
    change_color(Color, NextColor),
    K1 is K - 1,
    print(N, K1, Queens, NextColor).

change_color(white, black).
change_color(black, white).

frame(0) :-
    write('+'), !.
frame(N) :-
    write('+-----'),
    N1 is N - 1,
    frame(N1).

content(N, N, Color, X) :-
    queen(Color, X), !.
content(_, _, Color, X) :-
    field(Color, X).
    
field(black, ':::::').
field(white, '     ').
queen(black, ':###:').
queen(white, ' ### ').