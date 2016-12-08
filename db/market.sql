create database 'market';

use database 'market';


create table mk_list(
	list_id int auto_increment not null,
	created timestamp not null default current_timestamp,
	updated timestamp null,
	searchkey varchar(40) not null,
	name varchar(60) not null,
	list_type char(1) not null default 'L',
	isactive char(1) not null default 'Y',
	constraint pk_list_id primary key (list_id)
)engine = InnoDB;

create table mk_value(
	value_id int auto_increment not null,
	list_id int not null,
	value_parent_id int not null default 1,
	created timestamp not null default current_timestamp,
	updated timestamp null,
	value text,
	optional_value1 text,
	optional_value2 text,
	optional_value3 text,
	optional_value4 text,
	optional_value5 text,
	isactive char(1) not null default 'Y',
	constraint pk_value_id primary key (value_id),
	constraint fk_list_id0 foreign key (list_id) references mk_list (list_id) on update cascade on delete restrict,
	constraint fk_value_id foreign key (value_parent_id) references mk_value (value_id) on update cascade on delete restict
)engine = InnoDB;

create table mk_module(
	module_id int auto_increment not null,
	list_id int not null,
	created timestamp not null default current_timestamp,
	updated timestamp null,
	name varchar(40) not null,
	position int not null default 1,
	icon_class varchar(30) null,
	isactive char(1) not null default 'Y',
	constraint pk_module_id primary key (module_id),
	constraint fk_list_id foreign key (list_id) references mk_list (list_id) on update cascade on delete restrict
)engine = InnoDB;

create table mk_service(
	service_id int auto_increment not null,
	module_id int not null,
	created timestamp not null default current_timestamp,
	updated timestamp null,
	name varchar(40) not null,
	url varchar(150) not null,
	position int not null default 1,
	icon_class varchar(30) null,
	isactive char(1) not null default 'Y',
	constraint pk_service_id primary key (service_id),
	constraint fk_module_id foreign key (module_id) references mk_module (module_id) on update cascade on delete restrict 
)engine = InnoDB;

create table mk_user(
	user_id int auto_increment not null,
	role_id int not null,
	created timestamp not null default current_timestamp,
	updated timestamp null,
	first_name varchar(30) not null,
	last_name varchar(30) not null,
	sex char(1) not null,
	birthday date not null,
	email varchar(200) not null,
	phone varchar(20) null,
	username varchar(30) not null,
	password varchar(100) not null,
	avatar varchar(100) not null default 'profile_blank.jpg',
	isactive char(1) not null default 'Y',
	constraint pk_user_id primary key (user_id),
	constraint fk_role_id foreign key (role_id) references mk_value (value_id) on update cascade on delete restrict
)engine = InnoDB;

create table mk_access(
	access_id int auto_increment not null,
	service_id int not null,
	role_id int not null,
	created timestamp not null default current_timestamp,
	updated timestamp null,
	isactive char(1) not null default 'Y',
	constraint pk_access_id primary key (access_id),
	constraint fk_service_id foreign key (service_id) references mk_service (service_id) on update cascade on delete restrict,
	constraint fk_role_id01 foreign key (role_id) references mk_value (value_id) on update cascade on delete restirct
)engine = InnoDB;



