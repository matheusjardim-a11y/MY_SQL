create database SISTEMA;
use SISTEMA;

CREATE TABLE CLIENTE (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR(100) NOT NULL,
    email_cliente VARCHAR(30) NOT NULL UNIQUE
);
CREATE TABLE PRODUTO (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    preco_produto DECIMAL(5 , 2 ) NOT NULL
);

CREATE TABLE VENDA (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    data_venda DATE NOT NULL,
    id_cliente INT,
    FOREIGN KEY (id_cliente)
        REFERENCES CLIENTE (id_cliente)
);

CREATE TABLE ITEM_VENDA (
    id_venda INT,
    id_produto INT,
    quantidade_item INT NOT NULL,
    preco_unitario DECIMAL(5 , 2 ) NOT NULL,
    PRIMARY KEY (id_venda , id_produto),
    FOREIGN KEY (id_venda)
        REFERENCES VENDA (id_venda),
    FOREIGN KEY (id_produto)
        REFERENCES PRODUTO (id_produto)
);

