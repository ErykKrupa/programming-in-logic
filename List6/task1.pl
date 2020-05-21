:- use_module(lexer).
:- use_module(parser).

analize(FileName) :-
    open(FileName, read, X),
    scanner(X, Y),
    !, close(X),
    program(AST, Y, []),
    write(AST).
