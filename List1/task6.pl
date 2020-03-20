prime(Lo, Hi, X) :-
    between(Lo, Hi, X),
    check_prime(X).

check_prime(X) :- 
    SqrtX is floor(sqrt(X)),
    Rest is X mod 2,
    \+ (Rest = 0, X \= 2),
    check_prime(X, SqrtX, 3).

check_prime(A, B, C) :-
    C =< B,
    Rest is A mod C,
	\+ Rest = 0,
    D is C +2,
    check_prime(A, B, D).
	
check_prime(_, B, C) :- C > B.