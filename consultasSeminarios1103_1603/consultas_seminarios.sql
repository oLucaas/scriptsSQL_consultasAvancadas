#APRESENTAÇÃO ALUNOS

#Dupla 0 - Abner e Matheus
#JOIN - INNER-LEFT-RIGHT

SELECT nf.NUMERO ,
       c.NOME AS NomeCliente,
       nf.DATA_VENDA AS DataVenda,
       nf.IMPOSTO
FROM sucos_vendas.notas_fiscais nf
JOIN sucos_vendas.tabela_de_clientes c
ON nf.CPF = c.CPF;

SELECT v.MATRICULA,
       v.NOME AS NomeVendedor,
       nf.NUMERO AS NumeroNota,
       nf.DATA_VENDA AS DataVenda
FROM sucos_vendas.tabela_de_vendedores v
LEFT JOIN sucos_vendas.notas_fiscais nf
ON v.MATRICULA = nf.MATRICULA;

SELECT v.NOME AS NomeVendedor,
       nf.NUMERO AS NumeroNota,
       nf.DATA_VENDA AS DataVenda
FROM sucos_vendas.tabela_de_vendedores v
RIGHT JOIN sucos_vendas.notas_fiscais nf
ON v.MATRICULA = nf.MATRICULA;

SELECT nf.NUMERO AS NumeroNota,
       c.NOME AS NomeCliente,
       v.NOME AS NomeVendedor,
       p.NOME_DO_PRODUTO AS Produto,
       inf.QUANTIDADE,
       inf.PRECO
FROM sucos_vendas.notas_fiscais nf
INNER JOIN sucos_vendas.tabela_de_clientes c ON nf.CPF = c.CPF
INNER JOIN sucos_vendas.tabela_de_vendedores v ON nf.MATRICULA = v.MATRICULA
INNER JOIN sucos_vendas.itens_notas_fiscais inf ON nf.NUMERO = inf.NUMERO
INNER JOIN sucos_vendas.tabela_de_produtos p ON inf.CODIGO_DO_PRODUTO = p.CODIGO_DO_PRODUTO;


-- #ROSIMARI E PAULO
-- ORDENE TODOS OS ITENS DAS 2 TABELAS PRA FAZER UM CHECK-LIST NA  NF 103...

SELECT * FROM itens_notas_fiscais CROSS JOIN notas_fiscais
 ON itens_notas_fiscais.NUMERO = notas_fiscais.NUMERO
 where itens_notas_fiscais.NUMERO = 103 ;
 
 -- LISTE TODAS AS COLUNAS DAS 2 TABELAS PARA CONFERENCIA DAS NF's IMPRESSSAS

SELECT * FROM itens_notas_fiscais FULL OUTER JOIN notas_fiscais
 ON itens_notas_fiscais;
 
 -- group 5
 
create or replace view vw_vendedores as
select nome as Vendedor,
percentual_comissao as 'Comissao (%)'
from tabela_de_vendedores;

CREATE OR REPLACE VIEW vw_consulta_nota AS
SELECT
 p.nome_do_produto,
 MAX(i.preco) AS 'preço_máximo'
FROM itens_notas_fiscais i
INNER JOIN tabela_de_produtos p
 ON i.CODIGO_DO_PRODUTO = p.CODIGO_DO_PRODUTO
WHERE p.embalagem = 'PET'
GROUP BY p.nome_do_produto;


select * from tabela_de_produtos;



drop view if exists vw_vendedores; 

-- grupo 6 Gabriel e Gustavo

-- Uso do concat( )
select concat(nome,'|| ',idade,'',sexo) as pesquisa1 from tabela_de_clientes;
select concat_ws(' ',nome,idade,sexo) as pesquisa1 from tabela_de_clientes;

-- Uso do lenght( )
select nome, cpf, length(cpf) as digitosCPF from tabela_de_clientes;
select nome, cpf, length(cpf) as digitosCPF from tabela_de_clientes where length(cpf)< 11;

-- Uso do lower( )
select lower(nome_do_produto) from tabela_de_produtos;

-- Como utilizar os três comandos juntos
select lower(concat_ws('   |||   ',nome,cpf,endereco_1, bairro,cidade))
as resumoDadosClientes, length(cpf) as tamanhoCPF from tabela_de_clientes;

SELECT CONCAT(NOME, '( Excluir Cliente)') AS IDENTIFICACAO
from tabela_de_clientes where nome = 'César Teixeira'; 
select * from tabela_de_produtos;
SELECT CONCAT(NOME_DO_PRODUTO, '(Excluir produto)') as produto_vencido
from tabela_de_produtos where nome_do_produto = 'Sabor da Montanha - 700 ml - Uva';

#Isa e Felipe

SELECT DATA_VENDA, DAYNAME(DATA_VENDA) AS DIA_SEMANA FROM NOTAS_FISCAIS
WHERE DAYNAME(DATA_VENDA) = 'MONDAY';

SELECT DATA_DE_NASCIMENTO, NOME, MONTHNAME(DATA_DE_NASCIMENTO) AS MES FROM TABELA_DE_CLIENTES
WHERE MONTH(DATA_DE_NASCIMENTO) = 11;

SELECT NOME, DATA_ADMISSAO, YEAR(CURDATE()) - YEAR(DATA_ADMISSAO) AS TEMPO_DE_CASA
FROM TABELA_DE_VENDEDORES;
 select distinct cpf from notas_fiscais;
 select * from tabela_de_clientes where cidade in ('Rio de Janeiro','São Paulo');
 
 
 #Davi e Erick
 SELECT abs(12) FROM tabela_de_produtos;
 
 SELECT * FROM itens_notas_fiscais;
 SELECT avg(quantidade) AS media
 FROM itens_notas_fiscais;
 
 SELECT imposto FROM notas_fiscais;
 SELECT ceiling(4.12) AS 'Arredonda para cima';
 
 -- Erick H, João, Gabriel L 
 -- flOOR
SELECT FLOOR(5.9) AS resultado;   -- 5
SELECT FLOOR(5.1) AS resultado;   -- 5
SELECT FLOOR(5.0) AS resultado;   -- 5

SELECT ROUND(1.4, 0) AS resultado;   -- 1
SELECT ROUND(1.5, 0) AS resultado;   -- 2
SELECT ROUND(1.6, 0) AS resultado;   -- 2

SELECT FLOOR(RAND() * 10) + 1 AS numero_entre_1_e_10;

#Victor e Kedney
SELECT CONCAT(NOME, '(CPF INVALIDO)') AS STATUS_CLIENTE FROM tabela_de_clientes;

SELECT date_format(DATA_VENDA, '%D/%M/%Y') AS DATA_FORMATADA FROM NOTAS_FISCAIS;

SELECT CURRENT_TIMESTAMP();

SELECT CONCAT(NOME, '(CPF INVALIDO)') AS VENDEDOR, 

