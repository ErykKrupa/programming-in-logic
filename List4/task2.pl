fish(Who) :-
    Norwegian = 1, % R1
    Milk = 3, % R8
    Blue = 2, % neighboor(Norwegian, Blue), % R12
    English = Red, % R2
    Danish = Tea, % R4
    Yellow = Cigar, % R6
    German = Pipe, % R7
    WithoutFilter = Birds, % R10
    Swede = Dog, % R11
    Menthol = Beer, % R14
    Green = Coffee, % R15.
    person(Norwegian, English, Danish, German, Swede),
    color(Red, Green, Yellow, Blue, White),
    cigarettes(Light, Cigar, Pipe, WithoutFilter, Menthol),
    drink(Tea, Milk, Beer, Water, Coffee),
    pet(Cat, Dog, Horse, Fish, Birds),
    left(Green, White), % R3
    neighboor(Light, Water), % R9
    neighboor(Light, Cat), % R5
    neighboor(Horse, Yellow), % R13
    solution(Norwegian, English, Danish, German, Swede, Fish, Who).

person(A, B, C, D, E) :- pairwise_diff(A, B, C, D, E).
color(A, B, C, D, E) :- pairwise_diff(A, B, C, D, E).
cigarettes(A, B, C, D, E) :- pairwise_diff(A, B, C, D, E).
pet(A, B, C, D, E) :- pairwise_diff(A, B, C, D, E).
drink(A, B, C, D, E) :- pairwise_diff(A, B, C, D, E).

pairwise_diff(A, B, C, D, E) :-
    nr(A), nr(B), nr(C), nr(D), nr(E),
    A \= B, A \= C, A \= D, A \= E,
    B \= C, B \= D, B \= E,
    C \= D, C \= E,
    D \= E.

nr(1).
nr(2).
nr(3).
nr(4).
nr(5).

left(X, Y) :- X =:= Y - 1.
right(X, Y) :- X =:= Y + 1.

neighboor(A, B) :- right(A, B).
neighboor(A, B) :- left(A, B).

solution(Fish, _, _, _, _, Fish, norwegian).
solution(_, Fish, _, _, _, Fish, english).
solution(_, _, Fish, _, _, Fish, danish).
solution(_, _, _, Fish, _, Fish, german).
solution(_, _, _, _, Fish, Fish, swede).
