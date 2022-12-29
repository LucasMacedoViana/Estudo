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

* Comando Select
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

* Comando Order By
    - SELECT <COLUNA> FROM <TABELA> ORDER BY <COLUNA> ASC; - ordem crescente.
    - SELECT <COLUNA> FROM <TABELA> ORDER BY <COLUNA> DESC; - ordem decrescente.
    - SELECT <COLUNA> FROM <TABELA> ORDER BY <NUMERO DA COLUNA SELECIONADO> DESC; - ordem decrescente.
    - SELECT <COLUNA> FROM <TABELA> ORDER BY <COLUNA>; - ordem crescente pela coluna.

* Junções  de tabelas.
    - SELECT <COLUNA> FROM <TABELA>  WHERE <COLUNA> = <CONDIÇÃO> UNION ALL  FROM <TABELA> UNION ALL  SELECT <COLUNA> FROM <TABELA>; - unindo duas tabelas em uma unica tabela “virtual”
    - SELECT <COLUNA> FROM <TABELA> UNION SELECT <COLUNA> FROM <TABELA>; - elimina as duplicatas
    - SELECT f.NOME, a.CIDADE FROM FUN f, AREA  a WHERE f.DEPTNUM = a.DEPNUM AND f.DEPTTNUM =10 - para selecionar duas colunas de mesmo nome. Em tabelas diferentes podemos colocar um alias e assim identificar de qual tabela estamos puxando cada informação

* Multiplas tabelas.
    - SELECT <COLUNA> FROM <TABELA> WHERE <COLUNA> NOT IN (SELECT <COLUNA> FROM  <TABELA>) ;- usando o not in vamos poder consultar o que tem em uma tabela e não tem na outra
    - SELECT  DISTINCT <COLUNA> FROM <TABELA> WHERE <COLUNA> NOT IN (SELECT <COLUNA> FROM  <TABELA>) ;- usando o not in vamos poder consultar o que tem em uma tabela e não tem na outra
    - SELECT <COLUNA> FROM <TABELA> WHERE COALESCE(<COLUNA>,<VALOR>) < (SELECT <COLUNA> FROM <TABELA> WHERE <CONDIÇÃO>) - transforma o valor null em um valor selecionado e compara com um valor de outra tabela.

* Trabalhando com string
    - SELECT substr(e.<coluna>, inter.POSICAO, <VALOR>) AS C FROM (SELECT <COLUNA FROM <TABELA> WHERE <COLUNA> = <CONDIÇÃO>) e, (SELECT ID AS POSICAO FROM <TABELA) inter WHERE inter.POSICAO <= LENGTH(E.<COLUNA>); pega uma string e divide letra por letra e coloca em linhas diferentes
    - SELECT (length(‘TESTE1,TESTE2,TESTE3’)-length(REPLACE(‘TESTE1,TESTE2,TESTE3’ , ‘,’ ,’’)))/LENGTH(‘,’) AS Virgula from tabela1; continuo quantas virgulas tem na string.
    - SELECT <COLUNA>, REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(‘<COLUNA>’,’<VALOR1>’), ‘<VALOR2>’),‘<VALOR3>’),‘<VALOR4>’),‘<VALOR5>’)AS RESULTDO1     ; remoção de um caracter indesejado da string
