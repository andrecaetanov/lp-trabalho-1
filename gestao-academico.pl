% Duvidas
% Ao adicionar um relacionamento, os predicados devem existir individualmente?
% Ao excluir uma entidade (estudante, curso e disciplinas), suas relações devem ser excluídas?
% Ao editar uma entidade, todos os seus relacionamentos devem ser editados?
% Como deve funcionar a edição de relacionamentos?

% TODO
% Tratar relacionamentos ao editar graduações e disciplinas
% Melhorar nomes de predicados e variáveis
% Popular banco de dados com todas as disciplinas dos cursos
% Popular banco de dados com 10 alunos em cada curso
% Popular banco de dados com relacionamentos
% Documentar código
% Testar todos os predicados
% Escrever relatório
% Acrescentar peso das disciplinas no cálculo do IRA (?)

%% Andre Caetano Vidal 201665010AC
%% Bernardo Souza Cruz 201635019

:- dynamic(student/1).
student('Andre').
student('Bernardo').

:- dynamic(graduation/1).
graduation('Ciencia da Computacao').
graduation('Sistema de Informacao').

:- dynamic(course/1).
course('DCC160').
course('MAT155').
course('MAT154').
course('DCC179').
course('DCC119').
course('DCC120').
course('DCC175').

:- dynamic(student_graduation/2).
student_graduation('Andre', 'Ciencia da Computacao').
student_graduation('Bernardo', 'Ciencia da Computacao').

:- dynamic(student_course/3).
student_course('Andre', 'DCC160', 49.0).
student_course('Andre', 'DCC160', 70.0).
student_course('Andre', 'DCC120', 65.5).
student_course('Bernardo', 'DCC160', 78.0).

:- dynamic(graduation_course/2).
graduation_course('Ciencia da Computacao', 'DCC160').
graduation_course('Ciencia da Computacao', 'MAT155').
graduation_course('Ciencia da Computacao', 'MAT154').
graduation_course('Ciencia da Computacao', 'DCC179').
graduation_course('Ciencia da Computacao', 'DCC119').
graduation_course('Ciencia da Computacao', 'DCC120').
graduation_course('Ciencia da Computacao', 'DCC175').

% Records from a student
student_records(Student) :- 
    student(Student), 
    query(Course, student_course(Student, Course, _)).

% Course catalog of a graduation
course_catalog(Graduation) :- 
    graduation(Graduation), 
    query(Course, graduation_course(Graduation, Course)).

% Students that have taken a course
have_taken(Course) :- 
    course(Course),
    query(Student, student_course(Student, Course, _)).

% Students that has taken a course with a minimum grade
have_taken(Course, MinimumGrade) :-
    course(Course),
    query(Student, (student_course(Student, Course, Grade), Grade >= MinimumGrade)).

% Courses that one student is yet to take
need_to_take(Student) :- 
    student(Student),
    query(Course, need_to_take(Student, Course)).

% Check if a student still needs to take a course 
need_to_take(Student, Course) :- 
    student(Student),
    course(Course),
    student_graduation(Student, Graduation), 
    graduation_course(Graduation, Course), 
    not((student_course(Student, Course, Grade), Grade >= 60)).

% Students from a graduation
graduation_students(Graduation) :- 
    graduation(Graduation),
    query(Student, student_graduation(Student, Graduation)).

% Students from a graduation with a minimum IRA
graduation_students(Graduation, MinimumIra) :- 
    graduation(Graduation),
    query(Student, (student_graduation(Student, Graduation), ira(Student, Ira), Ira >= MinimumIra)).

% Students from a graduation with a minimum grade in a course
graduation_students(Graduation, Course, MinimumGrade) :-
    graduation(Graduation),
    course(Course),
    query(Student, (student_graduation(Student, Graduation), student_course(Student, Course, Grade), Grade >= MinimumGrade)).

% Graduations with a course
course_graduations(Course) :- 
    course(Course),
    query(Graduation, graduation_course(Graduation, Course)).

% Add entities
add_student(Student) :- assertz(student(Student)).
add_graduation(Graduation) :- assertz(graduation(Graduation)).
add_course(Course) :- assertz(course(Course)).

% Remove entities
remove_student(Student) :- 
    retract(student(Student)),
    retractall(student_graduation(Student, _)),
    retractall(student_course(Student, _, _)).

remove_graduation(Graduation) :- 
    retract(graduation(Graduation)),
    retractall(student_graduation(_, Graduation)),
    retractall(graduation_course(Graduation, _)).

remove_course(Course) :- 
    retract(course(Course)),
    retractall(student_course(_, Course, _)),
    retractall(graduation_course(_, Course)).

% Edit entities
edit_student(OldName, NewName) :- 
    retract(student(OldName)), 
    assertz(student(NewName)),
    findall(Graduation, student_graduation(OldName, Graduation), Graduations),
    edit_student_graduation(OldName, NewName, Graduations),
    findall(Course, student_course(OldName, Course, _), Courses),
    edit_student_course(OldName, NewName, Courses).

edit_student_course(_, _, []).
edit_student_course(StudentOldName, StudentNewName, [H | T]) :-
    student_course(StudentOldName, H, Grade),
    retract(student_course(StudentOldName, H, Grade)),
    assertz(student_course(StudentNewName, H, Grade)),
    edit_student_course(StudentOldName, StudentNewName, T).

edit_student_graduation(_, _, []).
edit_student_graduation(StudentOldName, StudentNewName, [H | T]) :-
    retract(student_graduation(StudentOldName, H)),
    assertz(student_graduation(StudentNewName, H)),
    edit_student_graduation(StudentOldName, StudentNewName, T).

edit_graduation(OldName, NewName) :- retract(graduation(OldName)), assertz(graduation(NewName)).
edit_course(OldName, NewName) :- retract(course(OldName)), assertz(course(NewName)).

% Add relationships
add_student_graduation(Student, Graduation) :- 
    student(Student), 
    graduation(Graduation),
    assertz(student_graduation(Student, Graduation)).

add_student_course(Student, Course, Grade) :- 
    student(Student),
    course(Course),
    assertz(student_course(Student, Course, Grade)).

add_graduation_course(Graduation, Course) :- 
    graduation(Graduation),
    course(Course),
    assertz(graduation_course(Graduation, Course)).

% Remove relationships
remove_student_graduation(Student, Graduation) :- retract(student_graduation(Student, Graduation)).
remove_student_course(Student, Course, Grade) :- retract(student_course(Student, Course, Grade)).
remove_graduation_course(Graduation, Course) :- retract(graduation_course(Graduation, Course)).

% Edit relationships
edit_student_course_grade(Student, Course, OldGrade, NewGrade) :-
    retract(student_course(Student, Course, OldGrade)),
    assertz(student_course(Student, Course, NewGrade)).

% Auxiliary predicate for executing queries and printing results
query(Template, Goal) :- 
    findall(Template, Goal, Bag), 
    write_list(Bag).

% Write the terms of a list
write_list([]).
write_list([X]) :- write(X).
write_list([H | T]) :- write(H), nl, write_list(T).

% Calculates the IRA from a Student
ira(Student, Ira) :- 
    findall(Grade, student_course(Student, _, Grade), Grades), 
    sum_list(Grades, Sum), 
    length(Grades, Length),
    Ira is Sum / Length.

% Sum all elements of a list
sum_list([], 0).
sum_list([H | T], Sum) :-  sum_list(T, Rest), Sum is H + Rest.