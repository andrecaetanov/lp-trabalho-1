% Duvidas
% Ao adicionar um relacionamento, os predicados devem existir individualmente?
% Ao excluir uma entidade (estudante, curso e disciplinas), suas relações devem ser excluídas?
% Ao editar uma entidade, todos os seus relacionamentos devem ser editados?
% Como deve funcionar a edição de relacionamentos?

% TODO
% Tratar entidade ao adicionar um relacionamento
% Tratar relacionamentos ao remove e editar uma entidade
% Adicionar critérios de nota e IRA nas consultas
% Implementar edição de relacionamentos (?)
% Popular banco de dados com todas as disciplinas dos cursos
% Popular banco de dados com 10 alunos em cada curso
% Popular banco de dados com relacionamentos
% Documentar código
% Escrever relatório

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
student_graduation('Bernardo', 'Sistema de Informacao').

:- dynamic(student_course/2).
student_course('Andre', 'DCC160').
student_course('Andre', 'DCC120').

:- dynamic(graduation_course/2).
graduation_course('Ciencia da Computacao', 'DCC160').
graduation_course('Ciencia da Computacao', 'MAT155').
graduation_course('Ciencia da Computacao', 'MAT154').
graduation_course('Ciencia da Computacao', 'DCC179').
graduation_course('Ciencia da Computacao', 'DCC119').
graduation_course('Ciencia da Computacao', 'DCC120').
graduation_course('Ciencia da Computacao', 'DCC175').

student_records(Student) :- 
    findall(Course, student_course(Student, Course), Courses), 
    write_list(Courses).

course_catalog(Graduation) :- 
    findall(Course, graduation_course(Graduation, Course), Courses), 
    write_list(Courses).

has_taken(Course) :- 
    findall(Student, student_course(Student, Course), Students), 
    write_list(Students).

need_to_take(Student) :-
    findall(Course, need_to_take(Student, Course), Courses),
    write_list(Courses).

need_to_take(Student, Course) :- 
    student_graduation(Student, Graduation), 
    graduation_course(Graduation, Course), 
    not(student_course(Student, Course)).

graduation_students(Graduation) :- 
    findall(Student, student_graduation(Student, Graduation), Students),
    write_list(Students).

course_graduations(Course) :-
    findall(Graduation, graduation_course(Graduation, Course), Graduations),
    write_list(Graduations).

add_student(Student) :- assertz(student(Student)).
add_graduation(Graduation) :- assertz(graduation(Graduation)).
add_course(Course) :- assertz(course(Course)).

add_student_graduation(Student, Graduation) :- assertz(student_graduation(Student, Graduation)).
add_student_course(Student, Course) :- assertz(student_course(Student, Course)).
add_graduation_course(Graduation, Course) :- assertz(graduation_course(Graduation, Course)).

remove_student(Student) :- retract(student(Student)).
remove_graduation(Graduation) :- retract(graduation(Graduation)).
remove_course(Course) :- retract(course(Course)).

remove_student_graduation(Student, Graduation) :- retract(student_graduation(Student, Graduation)).
remove_student_course(Student, Course) :- retract(student_course(Student, Course)).
remove_graduation_course(Graduation, Course) :- retract(graduation_course(Graduation, Course)).

edit_student(OldStudent, NewStudent) :- retract(student(OldStudent)), assertz(student(NewStudent)).
edit_graduation(Graduation) :- retract(graduation(Graduation)), assertz(graduation(Graduation)).
edit_course(Course) :- retract(course(Course)), assertz(course(Course)).

% Write the terms of a list
write_list([]).
write_list([H | T]) :- write(H), nl, write_list(T).