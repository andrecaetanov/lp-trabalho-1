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
    findall(Course, student_course(Student, Course, _), Courses),
    findall(Grade, student_course(Student, _, Grade), Grades),
    write_lists(Courses, Grades).

% Course catalog of a graduation
courses_in_graduation(Graduation) :- 
    graduation(Graduation), 
    query(Course, graduation_course(Graduation, Course)).

% Students that have taken a course
have_taken(Course) :- 
    course(Course, _),
    query(Student, student_course(Student, Course, _)).

% Students that has taken a course with a minimum grade
have_taken(Course, MinimumGrade) :-
    course(Course, _),
    query(Student, (student_course(Student, Course, Grade), Grade >= MinimumGrade)).

% Courses that one student is yet to take
courses_left(Student) :- 
    student(Student),
    query(Course, took_course(Student, Course)).

% Check if a student still needs to take a course 
took_course(Student, Course) :- 
    student(Student),
    course(Course, _),
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
    course(Course, _),
    query(Student, (student_graduation(Student, Graduation), student_course(Student, Course, Grade), Grade >= MinimumGrade)).

% Graduations with a course
graduations_with_course(Course) :- 
    course(Course, _),
    query(Graduation, graduation_course(Graduation, Course)).

% Add a student if he doesn't already exist
add_student(Student) :- add(student(Student)).

% Add a graduation if it doesn't already exist
add_graduation(Graduation) :- add(graduation(Graduation)).

% Add a course if it doesn't already exist
add_course(Course, Credits) :- not(course(Course, _)), assertz(course(Course, Credits)).

% Remove a student and all their relationships
remove_student(Student) :- 
    retract(student(Student)),
    retractall(student_graduation(Student, _)),
    retractall(student_course(Student, _, _)).

% Remove a graduation and all their relationships
remove_graduation(Graduation) :- 
    retract(graduation(Graduation)),
    retractall(student_graduation(_, Graduation)),
    retractall(graduation_course(Graduation, _)).

% Remove a course and all their relationships
remove_course(Course) :- 
    course(Course, Credits),
    retract(course(Course, Credits)),
    retractall(student_course(_, Course, _)),
    retractall(graduation_course(_, Course)).

% Edit a student and all the relationships he or she is a part of
edit_student(OldName, NewName) :- 
    retract(student(OldName)), 
    assertz(student(NewName)),
    findall(Graduation, student_graduation(OldName, Graduation), Graduations),
    edit_student_graduations(OldName, NewName, Graduations),
    findall(Course, student_course(OldName, Course, _), Courses),
    edit_student_courses(OldName, NewName, Courses).

edit_student_graduations(_, _, []).
edit_student_graduations(StudentOldName, StudentNewName, [H | T]) :-
    retract(student_graduation(StudentOldName, H)),
    assertz(student_graduation(StudentNewName, H)),
    edit_student_graduations(StudentOldName, StudentNewName, T).

edit_student_courses(_, _, []).
edit_student_courses(StudentOldName, StudentNewName, [H | T]) :-
    student_course(StudentOldName, H, Grade),
    retract(student_course(StudentOldName, H, Grade)),
    assertz(student_course(StudentNewName, H, Grade)),
    edit_student_courses(StudentOldName, StudentNewName, T).

% Edit a graduation and all the relationships it is part of
edit_graduation(OldName, NewName) :- 
    retract(graduation(OldName)), 
    assertz(graduation(NewName)),
    findall(Student, student_graduation(Student, OldName), Students),
    edit_graduation_students(OldName, NewName, Students),
    findall(Course, graduation_course(OldName, Course), Courses),
    edit_graduation_courses(OldName, NewName, Courses).

edit_graduation_students(_, _, []).
edit_graduation_students(GraduationOldName, GraduationNewName, [H | T]) :-
    retract(student_graduation(H, GraduationOldName)),
    assertz(student_graduation(H, GraduationNewName)),
    edit_graduation_students(GraduationOldName, GraduationNewName, T).

edit_graduation_courses(_, _, []).
edit_graduation_courses(GraduationOldName, GraduationNewName, [H | T]) :-
    retract(graduation_course(GraduationOldName, H)),
    assertz(graduation_course(GraduationNewName, H)),
    edit_graduation_courses(GraduationOldName, GraduationNewName, T).

% Edit a course's name and all the relationships it is part of
edit_course_name(OldName, NewName) :- 
    course(OldName, Credits),
    retract(course(OldName, Credits)), 
    assertz(course(NewName, Credits)),
    findall(Student, student_course(Student, OldName, _), Students),
    edit_course_students(OldName, NewName, Students),
    findall(Graduation, graduation_course(Graduation, OldName), Graduations),
    edit_course_graduations(OldName, NewName, Graduations).

edit_course_students(_, _, []).
edit_course_students(CourseOldName, CourseNewName, [H | T]) :-
    student_course(H, CourseOldName, Grade),
    retract(student_course(H, CourseOldName, Grade)),
    assertz(student_course(H, CourseNewName, Grade)),
    edit_course_students(CourseOldName, CourseNewName, T).

edit_course_graduations(_, _, []).
edit_course_graduations(CourseOldName, CourseNewName, [H | T]) :-
    retract(graduation_course(H, CourseOldName)),
    assertz(graduation_course(H, CourseNewName)),
    edit_course_graduations(CourseOldName, CourseNewName, T).

% Edit a course's credits
edit_course_credits(Name, NewCredits) :- 
    course(Name, OldCredits),
    retract(course(Name, OldCredits)),
    assertz(course(Name, NewCredits)).

% Adds a relationship between student and graduation if they exist and if that relationship doesn't
add_student_graduation(Student, Graduation) :- 
    student(Student), 
    graduation(Graduation),
    add(student_graduation(Student, Graduation)).

% Adds a relationship between student and course if they exist and there is no relationship between them with a given grade
add_student_course(Student, Course, Grade) :- 
    student(Student),
    course(Course, _),
    add(student_course(Student, Course, Grade)).

% Adds a relationship between graduation and course if they exist and if that relationship doesn't
add_graduation_course(Graduation, Course) :- 
    graduation(Graduation),
    course(Course, _),
    add(graduation_course(Graduation, Course)).

% Remove a relationship between student and graduation
remove_student_graduation(Student, Graduation) :- retract(student_graduation(Student, Graduation)).

% Remove a relationship between student and course
remove_student_course(Student, Course, Grade) :- retract(student_course(Student, Course, Grade)).

% Remove a relationship between graduation and course
remove_graduation_course(Graduation, Course) :- retract(graduation_course(Graduation, Course)).

% Edit a student's grade in a given course
edit_grade(Student, Course, OldGrade, NewGrade) :-
    retract(student_course(Student, Course, OldGrade)),
    assertz(student_course(Student, Course, NewGrade)).