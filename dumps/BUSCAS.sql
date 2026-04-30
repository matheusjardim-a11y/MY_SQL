-- Buscar por produto dentro da venda
-- Query - select - LEITURA
-- * == TODAS AS COLUNAS
-- SELECT "NOMES DAS TABELAS" == FILTRO
SELECT id_produto,preco_unitario
from ITEM_VENDA
where id_venda = 1 and id_produto = 1;
-- pesquisando por nome
select iv.preco_unitario,p.nome_produto
from ITEM_VENDA as iv -- AS == apelido
join PRODUTO as p on iv.id_produto = p.id_produto -- JUNTAR 
where iv.id_venda = 1 and p.nome_produto like'%Cafe%';

-- buscando todas as vendas de um cliente
select *
from VENDA
where id_cliente = 1;

-- buscar produto mais vendido
select p.nome_produto, sum(iv.quantidade_item) as total_vendido
from ITEM_VENDA as iv
join PRODUTO as p on p.id_produto = iv.id_produto
group by p.nome_produto;