oper(A, B, A + B).
oper(A, B, A - B).
oper(A, B, A * B).
oper(A, B, A / B) :- B =\= 0.

expr([], A, A).

expr([H|T], B, A) :-
    oper(B, H, C),
    expr(T, C, A).

expr([H1, H2|T], B, A) :-
    oper(H1, H2, C),
    expr([C| T], B, A).
	
expression([H|T], Value, A) :-
    expr(T, H, A),
    Value is A.
