% Auxiliary predicate for executing queries and printing results
query(Template, Goal) :- 
    findall(Template, Goal, Bag),
    list_to_set(Bag, Set),
    write_list(Set).

% Write the terms of a list
write_list([]).
write_list([X]) :- write(X).
write_list([H | T]) :- write(H), nl, write_list(T).

% Write the terms of two lists concatenated
write_lists([], []).
write_lists([X1], [X2]) :- write(X1), write(' '), write(X2).
write_lists([H1 | T1], [H2 | T2]) :- write(H1), write(' '), write(H2), nl, write_lists(T1, T2).

% Calculates the IRA from a Student
ira(Student, Ira) :- 
    findall(Grade, student_course(Student, _, Grade), Grades), 
    sum_list(Grades, Sum), 
    length(Grades, Length),
    Ira is Sum / Length.

% Sum all elements of a list
sum_list([], 0).
sum_list([H | T], Sum) :-  sum_list(T, Rest), Sum is H + Rest.

% Auxiliary predicate to add entities and relationships
add(Predicate) :- not(Predicate), assertz(Predicate).