# Questão 1
select nome, de_ferias, bairro from tabela_de_vendedores
where nome = 'Cláudia Morais' and bairro = 'Jardins'; 

# Questão 2
select * from tabela_de_vendedores 
where percentual_comissao > 0.10 AND de_ferias = 1;

# Questão 3
select * from notas_fiscais;
select * from notas_fiscais 
where matricula = '00237' or data_venda = '2015-01-12';

# Questão 4 
select codigo_do_produto, quantidade, preco from itens_notas_fiscais 
where quantidade >= 99 and preco > 40;
select * from tabela_de_produtos where codigo_do_produto = '1022450';

# Questão 5 - Gerar diagrama EER
select * from itens_notas_fiscais 
where numero = 102 and codigo_do_produto = '1101035';
select * from notas_fiscais where numero = 102;
select * from tabela_de_clientes where cpf = '8502682733';
select * from tabela_de_produtos where codigo_do_produto = '1101035';
select nome from tabela_de_vendedores where matricula = '00236';