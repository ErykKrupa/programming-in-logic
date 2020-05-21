:- module(parser, [
    parse/2,
    program/3
]).

parse(Tokens, AST) :- program(AST, Tokens, []).

program([]) --> [].
program([Instruction|Program]) -->
    instruction(Instruction),
    [sep(';')],
    program(Program).

instruction(assign(Identifier, Expression)) --> 
    [id(Identifier)],
    [sep(':=')],
    expression(Expression).
instruction(read(Identifier)) -->
    [key(read)],
    [id(Identifier)].
instruction(write(Expression)) -->
    [key(write)],
    expression(Expression).
instruction(if(Condition, Program)) -->
    [key(if)],
    condition(Condition),
    [key(then)],
    program(Program),
    [key(fi)].
instruction(if(Condition, Program1, Program2)) -->
    [key(if)],
    condition(Condition),
    [key(then)],
    program(Program1),
    [key(else)],
    program(Program2),
    [key(fi)].
instruction(while(Condition, Program)) -->
    [key(while)],
    condition(Condition),
    [key(do)],
    program(Program),
    [key(od)].

expression(Element + Expression) -->
    element(Element),
    [sep('+')],
    expression(Expression).
expression(Element - Expression) -->
    element(Element),
    [sep('-')],
    expression(Expression).
expression(Element) -->
    element(Element).

element(Factor * Element) -->
    factor(Factor),
    [sep('*')],
    element(Element).
element(Factor / Element) -->
    factor(Factor),
    [sep('/')],
    element(Element).
element(Factor mod Element) -->
    factor(Factor),
    [key('mod')],
    element(Element).
element(Factor) --> factor(Factor).

factor(id(Identifier)) --> [id(Identifier)].
factor(int(Int)) --> [int(Int)].
factor(Expression) -->
    [sep('(')], 
    expression(Expression),
    [sep(')')].

condition((Conjunction;Condition)) -->
    conjunction(Conjunction),
    [key('or')],
    condition(Condition).
condition(Conjunction) -->
    conjunction(Conjunction).
	
conjunction((Simple,Conjunction)) -->
    simple(Simple),
    [key('and')],
    conjunction(Conjunction).
conjunction(Simple) -->
    simple(Simple).

simple(Expression1 =:= Expression2) -->
    expression(Expression1),
    [sep('=')],
    expression(Expression2).
simple(Expression1 =\= Expression2) -->
    expression(Expression1),
    [sep('/=')],
    expression(Expression2).
simple(Expression1 < Expression2) -->
    expression(Expression1),
    [sep('<')],
    expression(Expression2).
simple(Expression1 > Expression2) -->
    expression(Expression1),
    [sep('>')],
    expression(Expression2).
simple(Expression1 =< Expression2) -->
    expression(Expression1),
    [sep('=<')],
    expression(Expression2).
simple(Expression1 >= Expression2) -->
    expression(Expression1),
    [sep('>=')],
    expression(Expression2).
simple(Condition) -->
    [sep('(')],
    condition(Condition),
    [sep(')')].
