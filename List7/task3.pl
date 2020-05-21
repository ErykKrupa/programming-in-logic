philosophers :-
    mutex_create(Philosopher1),
    mutex_create(Philosopher2),
    thread_create(thread(1, Philosopher1, Philosopher2), _),
    mutex_create(Philosopher3),
    thread_create(thread(2, Philosopher2, Philosopher3), _),
    mutex_create(Philosopher4),
    thread_create(thread(3, Philosopher3, Philosopher4), _),
	mutex_create(Philosopher5),
    thread_create(thread(4, Philosopher4, Philosopher5), _),
    thread_create(thread(5, Philosopher5, Philosopher1), _).

thread(X, LeftPhilosopher, RightPhilosopher) :-
    format('~w. philosopher is thinking\n', X),
    format('~w. philosopher is trying to lift right fork\n', X),
    mutex_lock(RightPhilosopher),
    format('~w. philosopher is holding right fork\n', X),
    format('~w. philosopher is trying to lift left fork\n', X),
    mutex_lock(LeftPhilosopher),
    format('~w. philosopher is holding left fork\n', X),
    format('~w. philosopher is eating\n', X),
    mutex_unlock(RightPhilosopher),
    format('~w. philosopher put off right fork\n', X),
    mutex_unlock(LeftPhilosopher),
    format('~w. philosopher put off left fork\n', X),   
    thread(X, LeftPhilosopher, RightPhilosopher).

% Zakleszczenie sie filozofow jest mozliwe, widac to z reguly
% juz po kilkunastu- kilkudziesieciu ruchach, kiedy program
% przestaje drukowac informacje.
