%% Andre Caetano Vidal 201665010AC
%% Bernardo Souza Abreu Cruz 201635019

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
    findall(Course, student_course(Student, Course, _), Courses), 
    sum_grades_x_credits(Student, Courses, SumGrades),
    total_credits(Courses, TotalCredits),
    Ira is SumGrades / TotalCredits.

% Sum of (grades * credits) for a student's courses
sum_grades_x_credits(_, [], 0).
sum_grades_x_credits(Student, [H | T], Sum) :-
    sum_grades_x_credits(Student, T, Rest),
    student_course(Student, H, Grade),
    course(H, Credits),
    Sum is (Grade * Credits) + Rest.

% Total of credits for a list of courses
total_credits([], 0).
total_credits([H | T], Total) :-
    total_credits(T, Rest),
    course(H, Credits),
    Total is Credits + Rest.

% Auxiliary predicate to add entities and relationships
add(Predicate) :- not(Predicate), assertz(Predicate).