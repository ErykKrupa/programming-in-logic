scan(Str, Acc, Input) :- 
    get_char(Str, Char),
    char(Str, Acc, Char, Input).

char(_, Acc, end_of_file, Input) :- !, reverse(Acc, Input).
char(Str, Acc, '\n' , Input) :- !, scan(Str, Acc, Input).
char(Str, Acc, '\t' , Input) :- !, scan(Str, Acc, Input).
char(Str, Acc, ' ' , Input) :- !, scan(Str, Acc, Input).
char(Str, Acc, C, Input) :- scan(Str, [C|Acc], Input).

integer(In, Ret, Rem) :-
    integer(In, [], Ret, Rem).
integer([], Acc, Ret, []) :-
    reverse(Acc, ChList),
    atom_chars(AtomNum, ChList),
    atom_number(AtomNum, Ret).
integer([H|T], Acc, Ret, Rem) :-
    char_type(H, digit),
    integer(T, [H|Acc], Ret, Rem).
integer(In, Acc, Ret, In) :-
    In = [H|_],
    \+ char_type(H, upper), 
    Acc \= [],
    reverse(Acc, ChList),
    atom_chars(AtomNum, ChList),
    atom_number(AtomNum, Ret).

identifier(In, Ret, Rem) :-
    identifier(In, [], Ret, Rem).
identifier([], Acc, Ret, []) :-
    reverse(Acc, ChList),
    atom_chars(Ret, ChList).
identifier([H|T], Acc, Ret, Rem) :-
    char_type(H, upper),
    identifier(T, [H|Acc], Ret, Rem).
identifier(In, Acc, Ret, In) :-
    In = [H|_],
    \+ char_type(H, upper), 
    Acc \= [],
    reverse(Acc, ChList),
    atom_chars(Ret, ChList).

token([], []).
token(In, [sep(Sep)|Tokens]) :-
    sep(Sep),
    atom_chars(Sep, SepChr),
    append(SepChr, In1, In),
    token(In1, Tokens).
token(In, [key(Key)|Tokens]) :-
    keyword(Key),
    atom_chars(Key, KeyChr),
    append(KeyChr, In1, In),
    token(In1, Tokens).
token(In, [id(Id)|Tokens]) :-
    identifier(In, Id, Rem),
    token(Rem, Tokens).
token(In, [int(Int)|Tokens]) :-
    integer(In, Int, Rem),
    token(Rem, Tokens).
token([H|Xs], Tokens) :-
    write('Unexpected char: "'), write(H), write('"'), nl,
    token(Xs, Tokens).

scanner(Str, Tokens) :-
    scan(Str, [], Input),
    token(Input, Tokens).

sep(';').
sep('+').
sep('-').
sep('*').
sep('/').
sep('(').
sep(')').
sep('<').
sep('>').
sep('=<').
sep('>=').
sep(':=').
sep('=').
sep('/=').
keyword('read').
keyword('write').
keyword('if').
keyword('then').
keyword('else').
keyword('fi').
keyword('while').
keyword('do').
keyword('od').
keyword('and').
keyword('or').
keyword('mod').
