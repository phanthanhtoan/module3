create database jsp_furama;
use jsp_furama;

create table `position`(
	position_id int auto_increment not null,
    position_name varchar(45) not null,
    primary key(position_id)
);

create table `education_degree`(
	education_degree_id int auto_increment not null,
    education_degree_name varchar(45) not null,
    primary key(education_degree_id)
);

create table `division`(
	division_id int auto_increment not null,
    division_name varchar(45) not null,
    primary key(division_id)
);

create table `role`(
	role_id int auto_increment not null,
    role_name varchar(45) not null,
    primary key(role_id)
);

create table `user`(
	username varchar(255) not null,
    `password` varchar(255) not null,
    primary key(username)
);

create table user_role(
	role_id int not null,
    username varchar(45) not null,
    primary key(role_id,username),
    foreign key(role_id) references `role`(role_id) on update cascade on delete cascade,
    foreign key(username) references `user`(username) on update cascade on delete cascade
);

create table `employee`(
	employee_id int auto_increment not null,
    employee_name varchar(45) not null,
    employee_birthday date not null,
    employee_id_card varchar(45) not null,
    employee_salary double not null,
    employee_phone varchar(45) not null,
    employee_email varchar(45) not null,
    employee_address varchar(45),
    position_id int,
    education_degree_id int,
    division_id int,
    username varchar(45),
    primary key(employee_id),
    foreign key(position_id) references `position`(position_id) on update cascade on delete cascade,
    foreign key(education_degree_id) references education_degree(education_degree_id) on update cascade on delete cascade,
    foreign key(division_id) references division(division_id) on update cascade on delete cascade,
    foreign key(username) references `user`(username) on update cascade on delete cascade
);

create table `customer_type`(
	customer_type_id int auto_increment not null,
    customer_type_name varchar(45) not null,
    primary key(customer_type_id)
);

create table `customer`(
	customer_id int auto_increment not null,
    customer_type_id int,
    customer_name varchar(45) not null,
    customer_birthday date not null,
    customer_gender bit(1) not null,
    customer_id_card varchar(45) not null,
    customer_phone varchar(45),
    customer_email varchar(45),
    customer_address varchar(45),
    primary key(customer_id),
    foreign key(customer_type_id) references customer_type(customer_type_id) on update cascade on delete cascade
);

create table `service_type`(
	service_type_id int auto_increment not null,
    service_type_name varchar(45) not null,
    primary key(service_type_id)
);

create table `rent_type`(
	rent_type_id int auto_increment not null,
    rent_type_name varchar(45) not null,
    rent_type_cost double not null,
    primary key(rent_type_id)
);

create table `service`(
	service_id int auto_increment not null,
    service_name varchar(45) not null,
    service_area int not null,
    service_cost double not null,
    service_max_people int not null,
    rent_type_id int not null,
    service_type_id int not null,
    standard_room varchar(45),
    description_other_convenience varchar(45),
    pool_area double,
    number_of_floors int,
	primary key(service_id),
    foreign key(service_type_id) references service_type(service_type_id) on update cascade on delete cascade,
    foreign key(rent_type_id) references rent_type(rent_type_id) on update cascade on delete cascade
);

create table `contract`(
	contract_id int auto_increment not null,
    contract_start_date datetime not null,
    contract_end_date datetime not null,
    contract_deposit double not null,
    contract_total_money double not null,
    employee_id int,
    customer_id int,
    service_id int,
    primary key(contract_id),
    foreign key(employee_id) references employee(employee_id) on update cascade on delete cascade,
    foreign key(customer_id) references customer(customer_id) on update cascade on delete cascade,
    foreign key(service_id) references service(service_id) on update cascade on delete cascade
);

create table `attach_service`(
	attach_service_id int auto_increment not null,
    attach_service_name varchar(45) not null,
    attach_service_cost double not null,
    attach_service_unit int not null,
    attach_service_status varchar(45) not null,
    primary key(attach_service_id)
);

create table `contract_detail` (
	contract_detail_id int auto_increment not null,
    contract_id int,
    attach_service_id int,
    quantity int,
    primary key(contract_detail_id),
    foreign key(contract_id) references contract(contract_id) on update cascade on delete cascade,
    foreign key(attach_service_id) references attach_service(attach_service_id) on update cascade on delete cascade
);


insert into `position`(position_name) values
('le tan'),
('phuc vu'),
('chuyen vien'),
('giam sat'),
('quan ly'),
('giam doc');

insert into `education_degree`(education_degree_name) values
('trung cap'),
('cao dang'),
('dai hoc'),
('sau dai hoc');

insert into `division`(division_name) values
('sale – marketing'),
('hanh chinh'),
('phuc vu'),
('quan ly');

insert into `role`(role_name) values
('ROLE_ADMIN'),
('ROLE_USER'),
('ROLE_SHOP');

insert into `user`(username,`password`) values
('khoa','12345'),
('khoa06','12345'),
('minh','12345'),
('tran','12345');

insert into `user_role`(role_id,username) values
(1,'khoa'),
(2,'khoa06'),
(3,'minh');

insert into `employee`
(employee_name,employee_birthday,employee_id_card,employee_salary,employee_phone,employee_email,
employee_address,position_id,education_degree_id,division_id,username) 
values
('Hoa Vo Khuyet1','2000-12-06','123123123456',10000000,'0357740063','khoa45@gmail.com','Da Nang',1,1,1,'khoa'),
('Hoa Vo Khuyet2','2000-12-06','123123123456',10000000,'0357740063','khoa45@gmail.com','Da Nang',2,2,2,'khoa06'),
('Hoa Vo Khuyet3','2000-12-06','123123123456',10000000,'0357740063','khoa45@gmail.com','Da Nang',3,3,3,'minh');

insert into `customer_type`(customer_type_name) values
('Diamond'),
('Platinium'),
('Gold'),
('Silver'),
('Member');

insert into `customer`
(customer_type_id,customer_name,customer_birthday,customer_gender,customer_id_card,customer_phone,customer_email,customer_address) 
values
(1,'Truong Tan Hai','1998-02-02',1,'123123123477','0957740069','hai@gmail.com','Da Nang'),
(2,'Truong Tan Beo','1998-02-02',1,'923123123479','0997740069','hai1@gmail.com','Quang Ngai'),
(2,'Truong Tan Beo','1998-02-02',1,'923123123470','0997740060','hai0@gmail.com','Quang Ngai'),
(1,'Truong Tan Vui','1998-02-02',0,'723123123437','0657740059','hai2@gmail.com','Da Nang');

insert into `service_type`(service_type_name) values 
('Villa'), 
('House'), 
('Room');

insert into `rent_type`(rent_type_name, rent_type_cost) values
('Year', 105000), 
('Month', 35000), 
('Day', 25000),
('Hour', 7984);

insert into `service`(service_name,service_area,service_cost,service_max_people,rent_type_id,service_type_id,
standard_room,description_other_convenience,pool_area,number_of_floors) 
values 
('Villa',50,100000,5,1,1,null,null,null,null),
('House',50,100000,5,2,2,null,null,null,null),
('House',50,100000,5,3,2,null,null,null,null),
('Room',50,100000,5,4,3,null,null,null,null);

insert into `contract`(contract_start_date,contract_end_date,contract_deposit,contract_total_money,employee_id, customer_id,service_id) 
values
('2021-02-06', '2021-02-24', 5000000,10000000,1, 2, 1),
('2021-02-06', '2021-02-24', 5000000,10000000,2, 1, 2),
('2020-02-06', '2020-02-24', 5000000,10000000,3, 3, 3);



insert into `attach_service`(attach_service_name, attach_service_cost, attach_service_unit, attach_service_status) values
('massage', 500000, 1000, 'full'),
('karaoke', 500000, 1000, 'full'),
('thuc an', 500000, 1000, 'full'),
('nuoc uong', 500000, 1000, 'full'),
('thue xe', 500000, 1000, 'still');

insert into `contract_detail`(contract_id,attach_service_id,quantity) values
(1,3,2),
(2,3,3);