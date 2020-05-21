merge(In1, In2, Out) :-
	freeze(In1,
		freeze(In2, 
			(In1 = [Head1|Tail1]
			-> (In2 = [Head2|Tail2]
				-> (Head1 @< Head2
					-> (Out = [Head1|Out1],
						merge(Tail1, In2, Out1)
					);
					(Out = [Head2|Out2], merge(In1, Tail2, Out2))
				);
				Out = In1
			);
			Out = In2
			)
		)
	).

split(In, Out1, Out2) :-
	freeze(In, 
		(In = [Head|In1]
		-> (Out1 = [Head|Tail],
			split(In1, Out2, Tail)
        );
		(Out1 = [], Out2 = []))
	).

merge_sort(In, Out) :-
	freeze(In, 
		(In = [_|X]
		-> freeze(X, 
            ( X = [_|_]
            -> (split(In, Left1, Right1),
                merge_sort(Left1, Left2),
                merge_sort(Right1, Right2),
                merge(Left2, Right2, Out));
            Out = In)
        );
		Out = In
		)
	).
