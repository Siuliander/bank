create database if not exists db_bank;

use db_bank;

create table if not exists tb_tipo_pessoa
(
	id_tipo_pessoa int auto_increment not null primary key,
	tipo_pessoa enum('singular','coletiva') not null unique
);

create table if not exists tb_pessoa
(
	id_pessoa int auto_increment not null primary key,
	nome_pessoa varchar(255) not null,
	identidade_pessoa varchar(14) not null unique,
	endereco_pessoa varchar(150) not null default('-'),
	id_tipo_pessoa int not null,
	foreign key(id_tipo_pessoa) references tb_tipo_pessoa(id_tipo_pessoa)
);

create table if not exists tb_contacto
(
	id_contacto int auto_increment not null primary key,
	contacto int not null unique
);

create table if not exists tb_contacto_pessoa
(
	id_contacto_pessoa int auto_increment not null primary key,
	id_contacto int not null,
	foreign key(id_contacto) references tb_contacto(id_contacto),
	id_pessoa int not null,
	foreign key(id_pessoa) references tb_pessoa(id_pessoa),
	estado_contato_pessoa tinyint(1) not null default 0 
);

create table if not exists tb_usuario
(
	id_usuario int auto_increment not null primary key,
	id_pessoa int not null unique,
	foreign key(id_pessoa) references tb_pessoa(id_pessoa)
);

create table if not exists tb_senha
(
	id_senha int auto_increment not null primary key,
	senha text not null unique
);

create table if not exists tb_senha_usuario
(
	id_senha_usuario int auto_increment not null primary key,
	id_usuario int not null,
	foreign key(id_usuario) references tb_usuario(id_usuario),
	id_senha int not null,
	foreign key(id_senha) references tb_senha(id_senha),
	estado_senha_usuario tinyint(1) default(0)
);

create table if not exists tb_cliente
(
	id_cliente int auto_increment not null primary key,
	id_pessoa int not null unique,
	foreign key(id_pessoa) references tb_pessoa(id_pessoa)
);

create table if not exists tb_tipo_movimento
(
	id_tipo_movimento int auto_increment not null primary key,
	tipo_movimento varchar(255) not null unique,
	data_tipo_movimento datetime not null default now()
);

create table if not exists tb_moeda
(
	id_moeda int auto_increment not null primary key,
	moeda varchar(50) not null unique,
	simbolo_moeda varchar(5) not null unique,
	data_moeda datetime not null default now()
);

create table if not exists tb_movimento
(
	id_movimento int auto_increment not null primary key,
	montante decimal(11,2) not null,
	descricao text not null default('-'),
	data_movimento datetime not null default now(),
	id_tipo_movimento int not null,
	foreign key(id_tipo_movimento) references tb_tipo_movimento(id_tipo_movimento),
	id_moeda int not null,
	foreign key(id_moeda) references tb_moeda(id_moeda),
	id_usuario int not null,
	foreign key(id_usuario) references tb_usuario(id_usuario),
	estado_movimento tinyint(1) not null default(1)
);


/*«««««««««««««««««««««««« 0 »»»»»»»»»»»»»»»»»»»»»»»»*/
/*««««««« 1ª OPÇÕES PARA DÍVIDAS E PAGAMENTOS »»»»»»»*/
/*«««««««««««««««««««««««« 0 »»»»»»»»»»»»»»»»»»»»»»»»*/
create table if not exists tb_divida
(
	id_divida int auto_increment not null primary key,
	id_movimento int not null unique,
	foreign key(id_movimento) references tb_movimento(id_movimento),
	id_cliente int not null,
	foreign key(id_cliente) references tb_cliente(id_cliente),
	estado_divida tinyint(1) not null default(1)
);

create table if not exists tb_pagamento
(
	id_pagamento int auto_increment not null primary key,
	data_pagamento datetime not null default now(),
	estado_pagamento tinyint(1) not null default(1),
	montante_pagamento decimal(11,2) not null,
	id_divida int not null, 
	foreign key(id_divida) references tb_divida(id_divida)
);

/*«««««««««««««««««««««««« 0 »»»»»»»»»»»»»»»»»»»»»»»»*/
/*««««««« 2ª OPÇÕES PARA DÍVIDAS E PAGAMENTOS »»»»»»»*/
/*«««««««««««««««««««««««« 0 »»»»»»»»»»»»»»»»»»»»»»»»*/
-- #create table if not exists tb_