insert into CLIENTE (nome_cliente,email_cliente)
values
('Joao Matosso', 'Joao@Matosso'),
('Jorge Matosso', 'Jorge@Matosso');
-- produtos
insert into PRODUTO(nome_produto,preco_produto)
values
('Cafe',233.00),
('Pao',16.76);
-- vendas
insert into VENDA(data_venda,id_cliente)
value
('2025-01-01',1),
('2024-05-05',2);
-- item_venda
insert into ITEM_VENDA(id_venda,id_produto,quantidade_item,preco_unitario)
value
(1,1,2,255.00),
(2,2,1,16.76);