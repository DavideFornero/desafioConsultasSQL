EXERCICIO 1

SELECT nome AS curso,numero AS turma,CONCAT(EXTRACT(DAY FROM inicio),'/',EXTRACT(MONTH FROM inicio),'/',EXTRACT(YEAR FROM inicio)) AS inicio
from tb_curso,tb_turma


EXERCICIO 2

SELECT DISTINCT tb_curso.nome AS curso,tb_turma.numero AS turma,tb_aluno.nome AS aluno,tb_aluno.cpf
FROM tb_aluno,tb_curso,tb_matricula,tb_turma
WHERE tb_aluno.cpf = tb_matricula.aluno_id AND tb_curso.id = tb_turma.curso_id AND tb_turma.id = tb_matricula.turma_id
ORDER BY tb_curso.nome,tb_turma.numero,tb_aluno.nome;

EXERCICIO 3

SELECT DISTINCT concat(EXTRACT(DAY FROM data), '/', EXTRACT(MONTH FROM data), '/', EXTRACT(YEAR FROM data)) AS data, nota,tb_aluno.nome as nome,nota_obtida, round(nota_obtida/nota*100,2) as porcentagem
FROM tb_avaliacao,tb_resultado,tb_aluno
WHERE tb_aluno.cpf = tb_resultado.aluno_id AND tb_avaliacao.id = tb_resultado.avaliacao_id 
ORDER BY nome;


EXERCICIO 4

SELECT tb_aluno.nome, SUM(tb_resultado.nota_obtida) AS nota_total
FROM tb_aluno,tb_avaliacao,tb_curso,tb_matricula,tb_resultado,tb_turma  
WHERE tb_aluno.cpf = tb_resultado.aluno_id AND tb_resultado.avaliacao_id = tb_avaliacao.id AND tb_avaliacao.turma_id = tb_matricula.turma_id AND tb_matricula.aluno_id = tb_aluno.cpf AND tb_turma.numero= 10 AND tb_matricula.turma_id >=2
GROUP BY tb_aluno.nome;