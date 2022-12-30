## Crie a estrutura de uma tabela com CREATE TABLE
~~~ 
CREATE DATABASE tarefa_estudo;
CREATE TABLE pessoa(idade INT NOT NULL, cpf INT PRIMARY KEY NOT NULL, nome_completo VARCHAR(255) not null, profissao VARCHAR(255));
~~~
## Adicione dados no banco com o INSERT
~~~
INSERT INTO pessoa(idade, nome_completo,cpf,profissao) 
VALUES (32, 'Mateus Macedo', 123456788, 'Engenheiro'), 
(40, 'Mariva macedo', 123445789, 'Vendedora'),
(30, 'Rafaela Aguiar', 987654321, 'Medica'),
(30, 'Lucas Macedo', 123456789, 'Estagiario');
~~~
## Realize consultas com SELECT
~~~
SELECT * FROM pessoa;
~~~
## Atualize e apague dados com UPDATE e DELETE
~~~
UPDATE pessoa set idade = 32 where nome_completo = 'Lucas Macedo';
DELETE FROM pessoa where nome_completo = 'Lucas Macedo';
~~~
## Filtre os seus registros com WHERE
~~~
SELECT * FROM pessoa where idade = 30;
~~~
## Ordene os seus dados com o ORDER BY
~~~
SELECT * FROM pessoa where idade = 30;
~~~
## Junte registros de tabelas com JOIN
~~~
CREATE TABLE salario (cpf INT primary KEY NOT NULL, salario FLOAT)
INSERT into salario (cpf, salario) values (123456788, 1000.00), (123456789, 1500.00), (123445789, 2000.00), (987654321, 3000.00);
Select p.nome_completo, p.cpf, p.idade, p.profissao, s.salario FROM pessoa as p JOIN salario as s ON  p.cpf = s.cpf
~~~
