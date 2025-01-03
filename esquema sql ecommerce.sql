-- criação de um banco e para um cenário de um e-commerce
create database ecommerce;
use ecommerce;
-- criar tabela cliente
create table clients(
	idcliente int auto_increment primary key,
    Fname varchar (10),
    Minit char(3),
    Lname varchar (20),
    CPF char (11) not null,
    address varchar(30),
    constraint unique_cpf_client unique (CPF)
);
-- criar tabela produto
-- size = dimensão do produto
create table product(
	idproduct int auto_increment primary key,
    Pname varchar(10) not null,
    classifiction_kids bool default false,
    category enum('Eletronico','vestimenta','brinquedos','alimentos','moveis') not null,
    avaliação float default 0,
    size vaRCHAR(10),
    CONSTRAINT unique_cpf_client unique (CPF)
);
-- tabela pagamento 
create table payments(
	idclient int,
    idpayment int,
    typepayment enum('Boleto', 'Pix','c.debito','c.credito'),
    limitAvailable float,
    primary key (idcliente,idOrdes,id_payment)
    
);


-- criar tabela pedido
create table orders(
		idOrder int auto_increment primary key,
        idOrderclients int,
        orderstatus enum ('Cancelado', 'Confirmado',' em processamento') default 'em processamento',
        orderdescription varchar(255),
        SendValue float default 10,
        paymentcah bool default false,
		constraint fk_ordes_client foreign key (idorderCliente) references clients(idClient)
);
-- criar tabela de estoque 
create table productStorge(
	idproductStorge int auto_increment primary key,
    storgelocation varchar(255),
    quantify int default 0
     );
-- criar tabela fornecedor 
create table supplier(
	idSupplier int auto_increment primary key,
    socialName varchar (255) not null,
    CNPJ char (15) not null,
    constraint unique_supplier unique (cnpj)
);

-- criar tabela vendendor
create table seller(
	idseller int auto_increment primary key,
    SocialName varchar (255) not null,
    AbsName varchar (255),
    CNPJ char (15),
    CPF char (9),
    location varchar(255),
    contact char(11) not null,
    constraint unique_cnpj_seller unique (cnpj),
    constraint unique_cpf_seller unique(CPF)
    
);
create table productSeller(
	idSeller int,
    idProduct int,
    prodQuantity int default 1,
    primary key (idPseller,idProduct),
    constraint fk_product_seller foreign key (idPseller) references seller(idseller),
	constraint fk_product_product foreign key (idproduct) references product(idproduct)
);
create table productOrder(
	idPOproduct int,
    idPOorder int,
    poQuality int default 1,
    poStatus enum('disponivel','sem estoque') default 'disponivel',
    primary key (idPOproduct,idPOorder),
    constraint fk_product_seller foreign key (idPOproduct)references product(idproduct),
    constraint fk_product_product foreign key (idLstorge)references orders (idOrde)
);

create table storgelocation (
	idLproduct int,
    idLstorge int,
    location varchar (255) not null,
    primary key (idLproduct,idLstorge),
    constraint fk_product_seller foreign key (idLproduct) references product (idproduct),
    constraint fk_product_product foreign key (idLstorge) references orders (productSeller)
    );

