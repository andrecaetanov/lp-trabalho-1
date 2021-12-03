% Duvidas
% Ao adicionar um relacionamento, os predicados devem existir individualmente?
% Ao excluir uma entidade (estudante, curso e disciplinas), suas relações devem ser excluídas?
% Ao editar uma entidade, todos os seus relacionamentos devem ser editados?
% Como deve funcionar a edição de relacionamentos?

% TODO
% Tratar relacionamentos ao editar graduações e disciplinas
% Melhorar nomes de predicados e variáveis
% Documentar código
% Testar todos os predicados
% Escrever relatório
% Acrescentar peso das disciplinas no cálculo do IRA (?)

%% Andre Caetano Vidal 201665010AC
%% Bernardo Souza Abreu Cruz 201635019

% Includes entities
:- [entities/student].
:- [entities/graduation].
:- [entities/course].

% Includes relationships
:- [relationships/student_graduation].
:- [relationships/student_course].
:- [relationships/graduation_course].

% Includes useful predicates used in main queries and actions
:- [util].

% Records from a student
student_records(Student) :- 
    student(Student), 
    query(Course, student_course(Student, Course, _)).

% Course catalog of a graduation
courses_in_graduation(Graduation) :- 
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
courses_left(Student) :- 
    student(Student),
    query(Course, took_course(Student, Course)).

% Check if a student still needs to take a course 
took_course(Student, Course) :- 
    student(Student),
    course(Course),
    student_graduation(Student, Graduation), 
    graduation_course(Graduation, Course), 
    not((student_course(Student, Course, Grade), Grade >= 60)).

% Students from a graduation
students_in_graduation(Graduation) :- 
    graduation(Graduation),
    query(Student, student_graduation(Student, Graduation)).

% Students from a graduation with a minimum IRA
students_in_graduation(Graduation, MinimumIra) :- 
    graduation(Graduation),
    query(Student, (student_graduation(Student, Graduation), ira(Student, Ira), Ira >= MinimumIra)).

% Students from a graduation with a minimum grade in a course
students_in_graduation(Graduation, Course, MinimumGrade) :-
    graduation(Graduation),
    course(Course),
    query(Student, (student_graduation(Student, Graduation), student_course(Student, Course, Grade), Grade >= MinimumGrade)).

% Graduations with a course
graduations_with_course(Course) :- 
    course(Course),
    query(Graduation, graduation_course(Graduation, Course)).

% Add entities
add_student(Student) :- add(student(Student)).
add_graduation(Graduation) :- add(graduation(Graduation)).
add_course(Course) :- add(course(Course)).

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

edit_graduation(OldName, NewName) :- 
    retract(graduation(OldName)), 
    assertz(graduation(NewName)).

edit_course(OldName, NewName) :- 
    retract(course(OldName)), 
    assertz(course(NewName)).

% Add relationships
add_student_graduation(Student, Graduation) :- 
    student(Student), 
    graduation(Graduation),
    add(student_graduation(Student, Graduation)).

add_student_course(Student, Course, Grade) :- 
    student(Student),
    course(Course),
    add(student_course(Student, Course, Grade)).

add_graduation_course(Graduation, Course) :- 
    graduation(Graduation),
    course(Course),
    add(graduation_course(Graduation, Course)).

% Remove relationships
remove_student_graduation(Student, Graduation) :- retract(student_graduation(Student, Graduation)).
remove_student_course(Student, Course, Grade) :- retract(student_course(Student, Course, Grade)).
remove_graduation_course(Graduation, Course) :- retract(graduation_course(Graduation, Course)).

% Edit relationships
edit_grade(Student, Course, OldGrade, NewGrade) :-
    retract(student_course(Student, Course, OldGrade)),
    assertz(student_course(Student, Course, NewGrade)).