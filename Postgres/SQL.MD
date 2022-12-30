Postgres
DML- Linguagem de manipulação de dados;
- INSERT, UPDATE E DELETE
DDL - LINGUAGEM DE DEFINIÇÃO DE DADOS;
- CREATE e DROP
DCL - Linguagem de controle de dados
- GRANT - autoriza ao usuario executar comandos.
- REVOKE - remove ou restringe a capacidade de um usuário de executar comandos.
DTL - Linguagem de Transação de Dados
- BEGIN WORK (ou BEGIN TRANSACTION) - COMMIT - ROLLBACK
DQL - Linguagem de consulta de dados
- SELECT - É O PRINCIPAL COMANDO USADO EM SQL


PALAVRAS-CHAVES EM SQL: são palavras reservadas na linguagem SQL	 que todos os bancos de dados usam.
* CLAUSULAS - FROM, WHERE, ORDER BY, ETC
* OPERADORES LOGICOS - AND, OR, NOT
* OPERADORES RELACIONAIS - < , >, <=, >=, = E <>
* FUNÇOES DE AGREGAÇÃO - AVG, COUNT, SUM, MAX, MIN , ECT

## Comando Select
    - SELECT * FROM <TABELA>;  - selecionar tudo de uma tabela
    - SELECT <NOME DA COLUNA> FROM <TABELA>;- personalizar o select pela coluna
    - SELECT * FROM <TABELA> WHERE <COLUNA>  = <CONDIÇÃO> - SELECIONA TUDO PELO VALOR DA COLUNA 
    - SELECT * FROM <TABELA> WHERE <COLUNA>  = <CONDIÇÃO>  OR <COLUNA> = <CONDIÇÃO> - COLOCANDO OUTRA CONDIÇÃO PARA O SELCT
    - SELECT <COLUNA> AS <NOVO NOME DA COLUNA> FROM  <TABELA> - ALTERANDO O NOME DAS COLUNAS
    - SELECT CONCAT (<COLUNA>, ‘ <TEXTO>’ , <COLUNA>) AS <TITULO DA TABELA> FOM <TABELA>  WHERE <COLUNA> = CONDIÇÃO - isso vai gerar uma tabela com uma mensagem concatenada.
    - SELECT <COLUNAS>  CASE WHEN <TABELA> <= <CONDIÇÃO> THEN <‘TEXTO’> WHEN <TABELA> <= <CONDIÇÃO> THEN <‘TEXTO’> ELSE <‘TEXTO’>  END AS <NOME DA NOVA TABELA> FROM <TABELA> - colocando uma condicional
    - SELECT * FROM <TABELA> LIMIT 5 - selecionando as 5 primeiras linhas.
    - SELECT * FROM <TABELA>  ORDER BY RAND() LIMIT 5  - selecionando 5 linhas de forma aleatório.
    - SELECT * FROM <TABELA> WHERE <COLUNA> IS NULL; - puxa as linhas que tem null
    - SELECT * FROM <TABELA> WHERE <COLUNA> IS NOT NULL; - puxa as linhas que não é null
    - SELECT COALESCE(<COLUNA>, <VALOR PARA SUBSTITUIR O NULL> FROM <TABELA>; - vai substituir o null pelo valor escolhido.

## Comando Order By
    - SELECT <COLUNA> FROM <TABELA> ORDER BY <COLUNA> ASC; - ordem crescente.
    - SELECT <COLUNA> FROM <TABELA> ORDER BY <COLUNA> DESC; - ordem decrescente.
    - SELECT <COLUNA> FROM <TABELA> ORDER BY <NUMERO DA COLUNA SELECIONADO> DESC; - ordem decrescente.
    - SELECT <COLUNA> FROM <TABELA> ORDER BY <COLUNA>; - ordem crescente pela coluna.

## Junções  de tabelas.
    - SELECT <COLUNA> FROM <TABELA>  WHERE <COLUNA> = <CONDIÇÃO> UNION ALL  FROM <TABELA> UNION ALL  SELECT <COLUNA> FROM <TABELA>; - unindo duas tabelas em uma unica tabela “virtual”
    - SELECT <COLUNA> FROM <TABELA> UNION SELECT <COLUNA> FROM <TABELA>; - elimina as duplicatas
    - SELECT f.NOME, a.CIDADE FROM FUN f, AREA  a WHERE f.DEPTNUM = a.DEPNUM AND f.DEPTTNUM =10 - para selecionar duas colunas de mesmo nome. Em tabelas diferentes podemos colocar um alias e assim identificar de qual tabela estamos puxando cada informação

## Multiplas tabelas.
    - SELECT <COLUNA> FROM <TABELA> WHERE <COLUNA> NOT IN (SELECT <COLUNA> FROM  <TABELA>) ;- usando o not in vamos poder consultar o que tem em uma tabela e não tem na outra
    - SELECT  DISTINCT <COLUNA> FROM <TABELA> WHERE <COLUNA> NOT IN (SELECT <COLUNA> FROM  <TABELA>) ;- usando o not in vamos poder consultar o que tem em uma tabela e não tem na outra
    - SELECT <COLUNA> FROM <TABELA> WHERE COALESCE(<COLUNA>,<VALOR>) < (SELECT <COLUNA> FROM <TABELA> WHERE <CONDIÇÃO>) - transforma o valor null em um valor selecionado e compara com um valor de outra tabela.

## Trabalhando com string
    - SELECT substr(e.<coluna>, inter.POSICAO, <VALOR>) AS C FROM (SELECT <COLUNA FROM <TABELA> WHERE <COLUNA> = <CONDIÇÃO>) e, (SELECT ID AS POSICAO FROM <TABELA) inter WHERE inter.POSICAO <= LENGTH(E.<COLUNA>); pega uma string e divide letra por letra e coloca em linhas diferentes
    - SELECT (length(‘TESTE1,TESTE2,TESTE3’)-length(REPLACE(‘TESTE1,TESTE2,TESTE3’ , ‘,’ ,’’)))/LENGTH(‘,’) AS Virgula from tabela1; continuo quantas virgulas tem na string.
    - SELECT <COLUNA>, REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(‘<COLUNA>’,’<VALOR1>’), ‘<VALOR2>’),‘<VALOR3>’),‘<VALOR4>’),‘<VALOR5>’)AS RESULTDO1 ; remoção de um caracter indesejado da string
    - SELECT <COLUNA>, GROUP_CONCAT(<COLUNA> ORDER BY <COLUNA> SEPARATOR ' , ') AS <NOME DA NOVA COLUNA> FROM <TABELA> GROUP BY <COLUNA>; agrupando os valores com que tem o mesmo valor em outra coluna.
   
## Trabalhando com números 
    - SELECT avg(<coluna>) AS <nome da coluna> FROM TABELA; calculando a media da tabela.
    - SELECT <coluna> avg(<coluna>) AS <nome da coluna> FROM TABELA group by <coluna>; calculando a media da tabela em relação a outra coluna.
    - SELECT min(<coluna>)AS <nome da coluna> , max(<coluna>) AS <nome da coluna> from <tabela>;achando o valor maximo e minimo de cada tabela.
    - SELECT sum(<COLUNA>) FROM <TABELA>; somando os valores de uma coluna.
    - SELECT COUNT(*) FROM <TABELA>; contar as linhas de uma tabela
    - SELECT <COLUNA>, COUNT(*) FROM <TABELA> GROUP BY <COLUNA>; contando quantas linhas de cada tipo da coluna.
    - SELECT <COLUNA>, <COLUNA>, SUM(<COLUNA>) OVER (ORDER BY <COLUNA>, <COLUNA>) AS <NOME DA NOVA COLUNA> FROM <TABELA> ORDER BY 2;somando em pilha
    - SELECT <COLUNA> FROM (SELECT <COLUNA>, DENSE_RANK()OVER(ORDER BY MODA DESC) AS RANK FROM (SELECT <COLUNA>, COUNT(8) AS MODA FROM <TABELA> WHERE <COLUNA> = <CONDIÇÃO> GROUP BY <COLUNA>) X) Y WHERE RANCK = 1 ;moda (numero que mais se repete)
    - SELECT(SUM(CASE WHEN <COLUNA> = <CONDIÇÃO> THEN <COLUNA> END)/SUM(<COLUNA>))*100 AS PORCENTAGEM FROM <TABELA> ;PORCENTAGEM DE UM TOTAL.
    
## Manipulação de Banco de dados    
    - INSERT INTO <TABELA> (<COLUNA1>, <COLUNA2>, <COLUNA3>) VALUES(<VALOR1>, <VALOR2>, <VALOR3>); colocando uma nova linha na tabela
    - CREATE TABLE <NOME DA TABELA> (id integer default 0); criando uma tabela com o valor default, caso o valor não seja especificado ele é declarado como o valor default. 
    - SELECT INTO <NOVA TABELA> (<COLUNA1>, <COLUNA2>, <COLUNA3>) SELECT <COLUNA1>, <COLUNA2>, <COLUNA3> FROM <ANTIGA TABELA>;Colando os dados de uma tabela em outra com os mesmos tipos de coluna (todas as linhas)
    - SELECT INTO <NOVA TABELA> (<COLUNA1>, <COLUNA2>, <COLUNA3>) SELECT <COLUNA1>, <COLUNA2>, <COLUNA3> FROM <ANTIGA TABELA> WHERE <COLUNA3> IN (<DADOS DA LINHA>) ;Colando os dados de uma tabela em outra com os mesmos tipos de coluna (linhas especificas)
    - UPDATE <TABELA> SET <COLUNA1> = <COLUNA1>* 1.20 WHERE <CONDIÇÃO>;alteração de registros de uma tabela (SUBINDO UM VALOR EM 20%)
    - DELETE FROM <TABELA> WHERE <CONDIÇÃO> ;apagar o registro da tabela
    - DELETE FROM <TABELA1> WHERE <COLUNA1> NOT IN (SELECT MIN(<COLUNA1>) FROM <TABELA1> GROUP BY <COLUNA2>); deletar os campos repetidos
    
## Chave Primaria
    - É o que faz a identificação de forma exclusiva de cada linha da tabela.
    - CREATE TABLE <NOME DA TABELA1> (<COLUNA1> INT PRIMARY KEY, <COLUNA2> VARCHAR(255),<COLUNA3> DATE NOT NULL, <COLUNA4> DATE NO NULL); CRIANDO UMA TABELA COM CHAVE PRIMARIA
    - CREATE TABLE <NOME DA TABELA1> (<COLUNA1> INT, <COLUNA2> VARCHAR(255),<COLUNA3> DATE NOT NULL, <COLUNA4> DATE NO NULL, CONSTRAIN pk_id primary key(<coluna1>);
    - ALTER TABLE <TABELA1> ADD CONSTRAINT PK_<NOME DA CHAVE> PRIMAREY KEY (<COLUNA1>); adicionando uma primary key depois que a tabela ja foi criada
    - ALTER TABLE <TABELA1> DROP PRIMAREY KEY (<COLUNA1>); REMOVENDO UMA CHAVE PRIMARIA

## FOREING KEY
    - é uma coluna que impoe um link entre duas tabelas.
    - exemplo:
    - CREATE TABLE projetos( id INT AUTO_INCREMENT PRIMARY_KEY, nome_projeto VARCHAR(255), começo DATE NOT NULL, termino NOT NULL);
    - CREATE TABLE marcos_projeto(marco_id INT AUTO_INCREMENT PRIMARY KEY, id INT, marco_nome VARCHAR(100),CONSTRAINT fk_projeto FOREIGN KEY(id) REFERENCES projetos(id));
    - ALTER TABLE marcos_projeto DROP CONSTRAINT fk_projeto; para remover a foreing key
    - ALTER TABLE marcos_projeto ADD CONSTRAINT fk_projeto FOREIGN KEY(id) REFERENCES projetos(is); caso a chave não tenha sido criada inicialmente
    
    
    
