:- use_module(lexer).
:- use_module(parser).
:- use_module(imperator).

run(FileName) :-
    open(FileName, read, X),
    scanner(X, Y),
    !, close(X),
    program(AST, Y, []),
    interpreter(AST).
