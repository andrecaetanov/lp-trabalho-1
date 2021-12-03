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
% Separar código em diferentes arquivos
% Acrescentar peso das disciplinas no cálculo do IRA (?)

%% Andre Caetano Vidal 201665010AC
%% Bernardo Souza Abreu Cruz 201635019

:- dynamic(student/1).
student('Andre').
student('Bernardo').
student('Jose').
student('Julia').
student('Cristina').
student('Pedro').
student('Lucas').
student('Ana').
student('Catarina').
student('Joao').
student('Mariana').
student('Paulo').
student('Carlos').
student('Clara').
student('Thales').
student('Thalita').
student('Leonardo').
student('Breno').
student('Flavia').
student('Matheus'). 

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
course('MAT158').
course('MAT156').
course('FIS073').
course('FIS077').
course('DCC013').
course('DCC107').
course('MAT143').
course('MAT157').
course('DCC059').
course('DCC122').
course('DCC025').
course('EADDCC044').
course('MAT029').
course('EST028').
course('DCC070').
course('DCC012').
course('DCC117').
course('EST029').
course('DCC014').
course('DCC062').
course('DCC060').
course('DCC061').
course('DCC163').
course('DCC063').
course('DCC042').
course('DCC008').
course('DCC174').
course('DCC075').
course('DCC055').
course('DCC001').
course('DCC065').
course('DCC019').
course('DCC045').
course('DCC064').
course('DCC123').
course('DCC110').
course('DCC133').
course('DCC121').
course('CAD076').
course('EADDCC049').
course('FIN001').
course('DCC146').
course('DCC192').
course('DCC193').
course('DCC049').
course('DCC154').
course('DCC168').
course('DCC078').
course('DCC077').
course('DCC145').
course('DCC196').
course('DCC166').
course('DCC165').
course('DCC194').

:- dynamic(student_graduation/2).
student_graduation('Andre', 'Ciencia da Computacao').
student_graduation('Bernardo', 'Ciencia da Computacao').
student_graduation('Jose', 'Ciencia da Computacao').
student_graduation('Julia', 'Ciencia da Computacao').
student_graduation('Cristina', 'Ciencia da Computacao').
student_graduation('Pedro', 'Ciencia da Computacao').
student_graduation('Lucas', 'Ciencia da Computacao').
student_graduation('Ana', 'Ciencia da Computacao').
student_graduation('Catarina', 'Ciencia da Computacao').
student_graduation('Joao', 'Ciencia da Computacao').
student_graduation('Mariana', 'Sistema de Informacao').
student_graduation('Paulo', 'Sistema de Informacao').
student_graduation('Carlos', 'Sistema de Informacao').
student_graduation('Clara', 'Sistema de Informacao').
student_graduation('Thales', 'Sistema de Informacao').
student_graduation('Thalita', 'Sistema de Informacao').
student_graduation('Leonardo', 'Sistema de Informacao').
student_graduation('Breno', 'Sistema de Informacao').
student_graduation('Flavia', 'Sistema de Informacao').
student_graduation('Matheus', 'Sistema de Informacao').

:- dynamic(student_course/3).
student_course('Andre', 'DCC160', 84.0).
student_course('Andre', 'MAT155', 65.0).
student_course('Andre', 'MAT154', 70.0).
student_course('Andre', 'DCC179', 90.0).
student_course('Andre', 'DCC119', 98.0).
student_course('Andre', 'DCC120', 97.0).
student_course('Andre', 'DCC175', 92.0).

student_course('Bernardo', 'DCC160', 94.0).
student_course('Bernardo', 'MAT155', 70.0).
student_course('Bernardo', 'MAT154', 62.0).
student_course('Bernardo', 'DCC179', 91.0).
student_course('Bernardo', 'DCC119', 94.0).
student_course('Bernardo', 'DCC120', 94.0).
student_course('Bernardo', 'DCC175', 91.0).
student_course('Bernardo', 'MAT158', 60.0).
student_course('Bernardo', 'MAT156', 86.0).
student_course('Bernardo', 'FIS073', 76.0).
student_course('Bernardo', 'FIS077', 68.0).
student_course('Bernardo', 'DCC013', 61.0).
student_course('Bernardo', 'DCC107', 61.0).

student_course('Jose', 'DCC160', 84.0).
student_course('Jose', 'MAT155', 60.0).
student_course('Jose', 'MAT154', 92.0).
student_course('Jose', 'DCC179', 61.0).
student_course('Jose', 'DCC119', 64.0).
student_course('Jose', 'DCC120', 64.0).
student_course('Jose', 'DCC175', 99.0).
student_course('Jose', 'MAT158', 98.0).
student_course('Jose', 'MAT156', 84.0).
student_course('Jose', 'FIS073', 71.0).
student_course('Jose', 'FIS077', 62.0).
student_course('Jose', 'DCC013', 61.0).
student_course('Jose', 'DCC107', 61.0).
student_course('Jose', 'MAT143', 58.0).
student_course('Jose', 'MAT157', 62.0).
student_course('Jose', 'DCC059', 80.0).
student_course('Jose', 'DCC122', 75.0).
student_course('Jose', 'DCC025', 69.0).
student_course('Jose', 'EADDCC044', 100.0).

student_course('Julia', 'DCC160', 71.0).
student_course('Julia', 'MAT155', 72.0).
student_course('Julia', 'MAT154', 62.0).
student_course('Julia', 'DCC179', 97.0).
student_course('Julia', 'DCC119', 71.0).
student_course('Julia', 'DCC120', 71.0).
student_course('Julia', 'DCC175', 91.0).
student_course('Julia', 'MAT158', 65.0).
student_course('Julia', 'MAT156', 86.0).
student_course('Julia', 'FIS073', 76.0).
student_course('Julia', 'FIS077', 68.0).
student_course('Julia', 'DCC013', 81.0).
student_course('Julia', 'DCC107', 88.0).
student_course('Julia', 'MAT143', 78.0).
student_course('Julia', 'MAT157', 62.0).
student_course('Julia', 'DCC059', 80.0).
student_course('Julia', 'DCC122', 95.0).
student_course('Julia', 'DCC025', 49.0).
student_course('Julia', 'EADDCC044', 60.0).
student_course('Julia', 'MAT029', 52.0).
student_course('Julia', 'EST028', 61.0).
student_course('Julia', 'DCC070', 97.0).
student_course('Julia', 'DCC012', 83.0).
student_course('Julia', 'DCC117', 70.0).

student_course('Cristina', 'DCC160', 94.0).
student_course('Cristina', 'MAT155', 72.0).
student_course('Cristina', 'MAT154', 32.0).
student_course('Cristina', 'MAT154', 62.0).
student_course('Cristina', 'DCC179', 97.0).
student_course('Cristina', 'DCC119', 94.0).
student_course('Cristina', 'DCC120', 94.0).
student_course('Cristina', 'DCC175', 91.0).
student_course('Cristina', 'MAT158', 65.0).
student_course('Cristina', 'MAT156', 86.0).
student_course('Cristina', 'FIS073', 76.0).
student_course('Cristina', 'FIS077', 48.0).
student_course('Cristina', 'DCC013', 81.0).
student_course('Cristina', 'DCC107', 88.0).

student_course('Pedro', 'DCC160', 54.0).
student_course('Pedro', 'MAT155', 95.0).
student_course('Pedro', 'MAT154', 99.0).
student_course('Pedro', 'DCC179', 0.0).
student_course('Pedro', 'DCC119', 100.0).
student_course('Pedro', 'DCC120', 100.0).
student_course('Pedro', 'DCC175', 84.0).

student_course('Lucas', 'DCC160', 88.0).
student_course('Lucas', 'MAT155', 90.0).
student_course('Lucas', 'MAT154', 72.0).
student_course('Lucas', 'DCC179', 66.0).
student_course('Lucas', 'DCC119', 70.0).
student_course('Lucas', 'DCC120', 70.0).
student_course('Lucas', 'DCC175', 61.0).
student_course('Lucas', 'MAT158', 60.0).
student_course('Lucas', 'MAT156', 86.0).
student_course('Lucas', 'FIS073', 96.0).
student_course('Lucas', 'FIS077', 64.0).
student_course('Lucas', 'DCC013', 98.0).
student_course('Lucas', 'DCC107', 99.0).

student_course('Ana', 'DCC160', 88.0).
student_course('Ana', 'MAT155', 82.0).
student_course('Ana', 'MAT154', 92.0).
student_course('Ana', 'DCC179', 97.0).
student_course('Ana', 'DCC119', 99.0).
student_course('Ana', 'DCC120', 99.0).
student_course('Ana', 'DCC175', 93.0).
student_course('Ana', 'MAT158', 65.0).
student_course('Ana', 'MAT156', 86.0).
student_course('Ana', 'FIS073', 86.0).
student_course('Ana', 'FIS077', 84.0).
student_course('Ana', 'DCC013', 81.0).
student_course('Ana', 'DCC107', 81.0).
student_course('Ana', 'MAT143', 78.0).
student_course('Ana', 'MAT157', 62.0).
student_course('Ana', 'DCC059', 80.0).
student_course('Ana', 'DCC122', 95.0).
student_course('Ana', 'DCC025', 89.0).
student_course('Ana', 'EADDCC044', 100.0).
student_course('Ana', 'MAT029', 82.0).
student_course('Ana', 'EST028', 74.0).
student_course('Ana', 'DCC070', 97.0).
student_course('Ana', 'DCC012', 93.0).
student_course('Ana', 'DCC117', 80.0).

student_course('Catarina', 'DCC160', 71.0).
student_course('Catarina', 'MAT155', 72.0).
student_course('Catarina', 'MAT154', 62.0).
student_course('Catarina', 'DCC179', 97.0).
student_course('Catarina', 'DCC119', 71.0).
student_course('Catarina', 'DCC120', 71.0).
student_course('Catarina', 'DCC175', 91.0).
student_course('Catarina', 'MAT158', 65.0).
student_course('Catarina', 'MAT156', 86.0).
student_course('Catarina', 'FIS073', 76.0).
student_course('Catarina', 'FIS077', 68.0).
student_course('Catarina', 'DCC013', 81.0).
student_course('Catarina', 'DCC107', 88.0).
student_course('Catarina', 'MAT143', 78.0).
student_course('Catarina', 'MAT157', 62.0).
student_course('Catarina', 'DCC059', 80.0).
student_course('Catarina', 'DCC122', 95.0).
student_course('Catarina', 'DCC025', 49.0).
student_course('Catarina', 'EADDCC044', 60.0).
student_course('Catarina', 'MAT029', 52.0).
student_course('Catarina', 'EST028', 61.0).
student_course('Catarina', 'DCC070', 97.0).
student_course('Catarina', 'DCC012', 83.0).
student_course('Catarina', 'DCC117', 70.0).
student_course('Catarina', 'EST029', 80.0).
student_course('Catarina', 'DCC014', 92.0).
student_course('Catarina', 'DCC062', 66.0).
student_course('Catarina', 'DCC060', 81.0).
student_course('Catarina', 'DCC061', 99.0).
student_course('Catarina', 'DCC163', 62.0).
student_course('Catarina', 'DCC063', 87.0).
student_course('Catarina', 'DCC042', 60.0).
student_course('Catarina', 'DCC008', 90.0).
student_course('Catarina', 'DCC174', 94.0).
student_course('Catarina', 'DCC075', 61.0).
student_course('Catarina', 'DCC055', 72.0).
student_course('Catarina', 'DCC001', 81.0).
student_course('Catarina', 'DCC065', 95.0).
student_course('Catarina', 'DCC019', 87.0).
student_course('Catarina', 'DCC045', 74.0).
student_course('Catarina', 'DCC064', 62.0).

student_course('Joao', 'DCC160', 91.0).
student_course('Joao', 'MAT155', 83.0).
student_course('Joao', 'MAT154', 68.0).
student_course('Joao', 'DCC179', 100.0).
student_course('Joao', 'DCC119', 91.0).
student_course('Joao', 'DCC120', 91.0).
student_course('Joao', 'DCC175', 91.0).
student_course('Joao', 'MAT158', 0.0).
student_course('Joao', 'MAT158', 60.0).
student_course('Joao', 'MAT156', 86.0).
student_course('Joao', 'FIS073', 56.0).
student_course('Joao', 'FIS073', 24.0).
student_course('Joao', 'FIS073', 92.0).
student_course('Joao', 'FIS077', 69.0).
student_course('Joao', 'DCC013', 81.0).
student_course('Joao', 'DCC107', 88.0).
student_course('Joao', 'MAT143', 58.0).
student_course('Joao', 'MAT143', 62.0).
student_course('Joao', 'MAT157', 62.0).
student_course('Joao', 'DCC059', 80.0).
student_course('Joao', 'DCC122', 95.0).
student_course('Joao', 'DCC025', 61.0).
student_course('Joao', 'EADDCC044', 82.0).
student_course('Joao', 'MAT029', 62.0).
student_course('Joao', 'EST028', 61.0).
student_course('Joao', 'DCC070', 97.0).
student_course('Joao', 'DCC012', 83.0).
student_course('Joao', 'DCC117', 70.0).
student_course('Joao', 'EST029', 80.0).
student_course('Joao', 'DCC014', 92.0).
student_course('Joao', 'DCC062', 66.0).
student_course('Joao', 'DCC060', 81.0).
student_course('Joao', 'DCC061', 99.0).
student_course('Joao', 'DCC163', 62.0).
student_course('Joao', 'DCC063', 87.0).
student_course('Joao', 'DCC042', 70.0).
student_course('Joao', 'DCC008', 60.0).
student_course('Joao', 'DCC174', 94.0).
student_course('Joao', 'DCC075', 81.0).
student_course('Joao', 'DCC055', 92.0).
student_course('Joao', 'DCC001', 61.0).
student_course('Joao', 'DCC065', 75.0).
student_course('Joao', 'DCC019', 87.0).
student_course('Joao', 'DCC045', 74.0).
student_course('Joao', 'DCC064', 62.0).
student_course('Joao', 'DCC123', 77.0).
student_course('Joao', 'DCC110', 85.0).

student_course('Mariana', 'DCC160', 74.0).
student_course('Mariana', 'MAT155', 85.0).
student_course('Mariana', 'MAT154', 74.0).
student_course('Mariana', 'DCC179', 80.0).
student_course('Mariana', 'DCC119', 78.0).
student_course('Mariana', 'DCC120', 77.0).
student_course('Mariana', 'DCC133', 62.0).

student_course('Paulo', 'DCC160', 94.0).
student_course('Paulo', 'MAT155', 70.0).
student_course('Paulo', 'MAT154', 62.0).
student_course('Paulo', 'DCC179', 91.0).
student_course('Paulo', 'DCC119', 94.0).
student_course('Paulo', 'DCC120', 94.0).
student_course('Paulo', 'DCC133', 91.0).
student_course('Paulo', 'MAT156', 86.0).
student_course('Paulo', 'DCC013', 61.0).
student_course('Paulo', 'DCC107', 61.0).

student_course('Carlos', 'DCC160', 84.0).
student_course('Carlos', 'MAT155', 60.0).
student_course('Carlos', 'MAT154', 92.0).
student_course('Carlos', 'DCC179', 61.0).
student_course('Carlos', 'DCC119', 64.0).
student_course('Carlos', 'DCC120', 64.0).
student_course('Carlos', 'DCC133', 99.0).
student_course('Carlos', 'MAT156', 84.0).
student_course('Carlos', 'DCC013', 61.0).
student_course('Carlos', 'DCC107', 61.0).
student_course('Carlos', 'DCC059', 80.0).
student_course('Carlos', 'DCC122', 75.0).
student_course('Carlos', 'DCC025', 69.0).
student_course('Carlos', 'EADDCC044', 100.0).

student_course('Clara', 'DCC160', 71.0).
student_course('Clara', 'MAT155', 72.0).
student_course('Clara', 'MAT154', 62.0).
student_course('Clara', 'DCC179', 97.0).
student_course('Clara', 'DCC119', 71.0).
student_course('Clara', 'DCC120', 71.0).
student_course('Clara', 'DCC133', 91.0).
student_course('Clara', 'MAT156', 86.0).
student_course('Clara', 'DCC013', 81.0).
student_course('Clara', 'DCC107', 88.0).
student_course('Clara', 'DCC059', 80.0).
student_course('Clara', 'DCC122', 95.0).
student_course('Clara', 'DCC025', 49.0).
student_course('Clara', 'EADDCC044', 60.0).
student_course('Clara', 'DCC070', 97.0).
student_course('Clara', 'DCC012', 83.0).
student_course('Clara', 'DCC117', 70.0).

student_course('Thales', 'DCC160', 94.0).
student_course('Thales', 'MAT155', 72.0).
student_course('Thales', 'MAT154', 32.0).
student_course('Thales', 'MAT154', 62.0).
student_course('Thales', 'DCC179', 97.0).
student_course('Thales', 'DCC119', 94.0).
student_course('Thales', 'DCC120', 94.0).
student_course('Thales', 'DCC133', 91.0).
student_course('Thales', 'MAT156', 86.0).
student_course('Thales', 'DCC013', 81.0).
student_course('Thales', 'DCC107', 88.0).

student_course('Thalita', 'DCC160', 54.0).
student_course('Thalita', 'MAT155', 95.0).
student_course('Thalita', 'MAT154', 99.0).
student_course('Thalita', 'DCC179', 0.0).
student_course('Thalita', 'DCC119', 100.0).
student_course('Thalita', 'DCC120', 100.0).
student_course('Thalita', 'DCC133', 84.0).

student_course('Leonardo', 'DCC160', 88.0).
student_course('Leonardo', 'MAT155', 90.0).
student_course('Leonardo', 'MAT154', 72.0).
student_course('Leonardo', 'DCC179', 66.0).
student_course('Leonardo', 'DCC119', 70.0).
student_course('Leonardo', 'DCC120', 70.0).
student_course('Leonardo', 'DCC133', 61.0).
student_course('Leonardo', 'MAT156', 86.0).
student_course('Leonardo', 'DCC013', 98.0).
student_course('Leonardo', 'DCC107', 99.0).

student_course('Breno', 'DCC160', 88.0).
student_course('Breno', 'MAT155', 82.0).
student_course('Breno', 'MAT154', 92.0).
student_course('Breno', 'DCC179', 97.0).
student_course('Breno', 'DCC119', 99.0).
student_course('Breno', 'DCC120', 99.0).
student_course('Breno', 'DCC133', 93.0).
student_course('Breno', 'MAT156', 86.0).
student_course('Breno', 'DCC013', 81.0).
student_course('Breno', 'DCC107', 81.0).
student_course('Breno', 'DCC059', 80.0).
student_course('Breno', 'DCC122', 95.0).
student_course('Breno', 'DCC025', 89.0).
student_course('Breno', 'EADDCC044', 100.0).
student_course('Breno', 'DCC070', 97.0).
student_course('Breno', 'DCC012', 93.0).
student_course('Breno', 'DCC117', 80.0).

student_course('Flavia', 'DCC160', 71.0).
student_course('Flavia', 'MAT155', 72.0).
student_course('Flavia', 'MAT154', 62.0).
student_course('Flavia', 'DCC179', 97.0).
student_course('Flavia', 'DCC119', 71.0).
student_course('Flavia', 'DCC120', 71.0).
student_course('Flavia', 'DCC133', 91.0).
student_course('Flavia', 'MAT156', 86.0).
student_course('Flavia', 'DCC013', 81.0).
student_course('Flavia', 'DCC107', 88.0).
student_course('Flavia', 'DCC059', 80.0).
student_course('Flavia', 'DCC122', 95.0).
student_course('Flavia', 'DCC025', 49.0).
student_course('Flavia', 'EADDCC044', 60.0).
student_course('Flavia', 'DCC070', 97.0).
student_course('Flavia', 'DCC012', 83.0).
student_course('Flavia', 'DCC117', 70.0).
student_course('Flavia', 'DCC014', 92.0).
student_course('Flavia', 'DCC062', 66.0).
student_course('Flavia', 'DCC060', 81.0).
student_course('Flavia', 'DCC061', 99.0).
student_course('Flavia', 'DCC163', 62.0).
student_course('Flavia', 'DCC042', 60.0).
student_course('Flavia', 'DCC174', 94.0).
student_course('Flavia', 'DCC077', 61.0).

student_course('Matheus', 'DCC160', 91.0).
student_course('Matheus', 'MAT155', 83.0).
student_course('Matheus', 'MAT154', 68.0).
student_course('Matheus', 'DCC179', 100.0).
student_course('Matheus', 'DCC119', 91.0).
student_course('Matheus', 'DCC120', 91.0).
student_course('Matheus', 'DCC133', 91.0).
student_course('Matheus', 'MAT156', 86.0).
student_course('Matheus', 'DCC013', 81.0).
student_course('Matheus', 'DCC107', 88.0).
student_course('Matheus', 'DCC059', 80.0).
student_course('Matheus', 'DCC122', 95.0).
student_course('Matheus', 'DCC025', 61.0).
student_course('Matheus', 'EADDCC044', 82.0).
student_course('Matheus', 'DCC070', 97.0).
student_course('Matheus', 'DCC012', 83.0).
student_course('Matheus', 'DCC117', 70.0).
student_course('Matheus', 'DCC014', 92.0).
student_course('Matheus', 'DCC062', 66.0).
student_course('Matheus', 'DCC060', 81.0).
student_course('Matheus', 'DCC061', 99.0).
student_course('Matheus', 'DCC163', 62.0).
student_course('Matheus', 'DCC042', 70.0).
student_course('Matheus', 'DCC174', 94.0).
student_course('Matheus', 'DCC077', 81.0).
student_course('Matheus', 'DCC019', 87.0).
student_course('Matheus', 'DCC123', 77.0).
student_course('Matheus', 'DCC194', 97.0).

:- dynamic(graduation_course/2).
graduation_course('Ciencia da Computacao', 'DCC160').
graduation_course('Ciencia da Computacao', 'MAT155').
graduation_course('Ciencia da Computacao', 'MAT154').
graduation_course('Ciencia da Computacao', 'DCC179').
graduation_course('Ciencia da Computacao', 'DCC119').
graduation_course('Ciencia da Computacao', 'DCC120').
graduation_course('Ciencia da Computacao', 'DCC175').
graduation_course('Ciencia da Computacao', 'DCC158').
graduation_course('Ciencia da Computacao', 'MAT156').
graduation_course('Ciencia da Computacao', 'FIS073').
graduation_course('Ciencia da Computacao', 'FIS077').
graduation_course('Ciencia da Computacao', 'DCC013').
graduation_course('Ciencia da Computacao', 'DCC107').
graduation_course('Ciencia da Computacao', 'MAT143').
graduation_course('Ciencia da Computacao', 'MAT157').
graduation_course('Ciencia da Computacao', 'DCC059').
graduation_course('Ciencia da Computacao', 'DCC122').
graduation_course('Ciencia da Computacao', 'DCC025').
graduation_course('Ciencia da Computacao', 'EADDCC044').
graduation_course('Ciencia da Computacao', 'MAT029').
graduation_course('Ciencia da Computacao', 'EST028').
graduation_course('Ciencia da Computacao', 'DCC070').
graduation_course('Ciencia da Computacao', 'DCC012').
graduation_course('Ciencia da Computacao', 'DCC117').
graduation_course('Ciencia da Computacao', 'EST029').
graduation_course('Ciencia da Computacao', 'DCC014').
graduation_course('Ciencia da Computacao', 'DCC062').
graduation_course('Ciencia da Computacao', 'DCC060').
graduation_course('Ciencia da Computacao', 'DCC061').
graduation_course('Ciencia da Computacao', 'DCC163').
graduation_course('Ciencia da Computacao', 'DCC063').
graduation_course('Ciencia da Computacao', 'DCC042').
graduation_course('Ciencia da Computacao', 'DCC008').
graduation_course('Ciencia da Computacao', 'DCC174').
graduation_course('Ciencia da Computacao', 'DCC075').
graduation_course('Ciencia da Computacao', 'DCC055').
graduation_course('Ciencia da Computacao', 'DCC001').
graduation_course('Ciencia da Computacao', 'DCC065').
graduation_course('Ciencia da Computacao', 'DCC019').
graduation_course('Ciencia da Computacao', 'DCC045').
graduation_course('Ciencia da Computacao', 'DCC064').
graduation_course('Ciencia da Computacao', 'DCC123').
graduation_course('Ciencia da Computacao', 'DCC110').

graduation_course('Sistema de Informacao', 'MAT154').
graduation_course('Sistema de Informacao', 'MAT155').
graduation_course('Sistema de Informacao', 'DCC119').
graduation_course('Sistema de Informacao', 'DCC120').
graduation_course('Sistema de Informacao', 'DCC160').
graduation_course('Sistema de Informacao', 'DCC133').
graduation_course('Sistema de Informacao', 'MAT156').
graduation_course('Sistema de Informacao', 'DCC121').
graduation_course('Sistema de Informacao', 'DCC013').
graduation_course('Sistema de Informacao', 'DCC107').
graduation_course('Sistema de Informacao', 'CAD076').
graduation_course('Sistema de Informacao', 'EADDCC049').
graduation_course('Sistema de Informacao', 'EST029').
graduation_course('Sistema de Informacao', 'DCC025').
graduation_course('Sistema de Informacao', 'DCC059').
graduation_course('Sistema de Informacao', 'FIN001').
graduation_course('Sistema de Informacao', 'EADDCC044').
graduation_course('Sistema de Informacao', 'DCC070').
graduation_course('Sistema de Informacao', 'DCC117').
graduation_course('Sistema de Informacao', 'DCC146').
graduation_course('Sistema de Informacao', 'DCC012').
graduation_course('Sistema de Informacao', 'DCC062').
graduation_course('Sistema de Informacao', 'DCC014').
graduation_course('Sistema de Informacao', 'DCC061').
graduation_course('Sistema de Informacao', 'DCC060').
graduation_course('Sistema de Informacao', 'DCC192').
graduation_course('Sistema de Informacao', 'DCC042').
graduation_course('Sistema de Informacao', 'DCC163').
graduation_course('Sistema de Informacao', 'DCC174').
graduation_course('Sistema de Informacao', 'DCC193').
graduation_course('Sistema de Informacao', 'DCC049').
graduation_course('Sistema de Informacao', 'DCC154').
graduation_course('Sistema de Informacao', 'DCC168').
graduation_course('Sistema de Informacao', 'DCC078').
graduation_course('Sistema de Informacao', 'DCC077').
graduation_course('Sistema de Informacao', 'DCC145').
graduation_course('Sistema de Informacao', 'DCC196').
graduation_course('Sistema de Informacao', 'DCC166').
graduation_course('Sistema de Informacao', 'DCC165').
graduation_course('Sistema de Informacao', 'DCC123').
graduation_course('Sistema de Informacao', 'DCC194').

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

% Auxiliary predicate to add entities and relationships
add(Predicate) :- not(Predicate), assertz(Predicate).