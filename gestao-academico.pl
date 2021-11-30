%% Andre Caetano Vidal 201665010AC
%% Bernardo Souza Cruz 201635019

cursa('Andre', 'Ciencia da Computacao').
cursa('Bernardo', 'Sistema de Informacao').

historico('Andre', 'DCC160').
historico('Andre', 'DCC120').

matriz_curricular('Ciencia da Computacao', 'DCC160').
matriz_curricular('Ciencia da Computacao', 'MAT155').
matriz_curricular('Ciencia da Computacao', 'MAT154').
matriz_curricular('Ciencia da Computacao', 'DCC179').
matriz_curricular('Ciencia da Computacao', 'DCC119').
matriz_curricular('Ciencia da Computacao', 'DCC120').
matriz_curricular('Ciencia da Computacao', 'DCC175').

ja_cursaram(Disciplina, Aluno) :- historico(Aluno, Disciplina).

falta_cursar(Aluno, Disciplina) :- 
    cursa(Aluno, Curso), 
    matriz_curricular(Curso, Disciplina), 
    not(historico(Aluno, Disciplina)).

estudantes_curso(Curso, Aluno) :- cursa(Aluno, Curso).

cursos_disciplina(Discplina, Curso) :- matriz_curricular(Curso, Disciplina).
