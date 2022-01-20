create database jsp_furama;
use jsp_furama;

create table `position`(
	position_id int  not null,
    position_name varchar(45) not null,
    primary key(position_id)
);

create table `education_degree`(
	education_degree_id int  not null,
    education_degree_name varchar(45) not null,
    primary key(education_degree_id)
);

create table `division`(
	division_id int  not null,
    division_name varchar(45) not null,
    primary key(division_id)
);

create table `role`(
	role_id int  not null,
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
	customer_type_id int  not null,
    customer_type_name varchar(45) not null,
    primary key(customer_type_id)
);

create table `customer`(
	customer_id int auto_increment  not null,
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
	service_type_id int  not null,
    service_type_name varchar(45) not null,
    primary key(service_type_id)
);

create table `rent_type`(
	rent_type_id int not null,
    rent_type_name varchar(45) not null,
    rent_type_cost double not null,
    primary key(rent_type_id)
);

create table `service`(
	service_id int not null,
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
	contract_id int  not null,
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
	attach_service_id int  not null,
    attach_service_name varchar(45) not null,
    attach_service_cost double not null,
    attach_service_unit int not null,
    attach_service_status varchar(45) not null,
    primary key(attach_service_id)
);

create table `contract_detail` (
	contract_detail_id int  not null,
    contract_id int,
    attach_service_id int,
    quantity int,
    primary key(contract_detail_id),
    foreign key(contract_id) references contract(contract_id) on update cascade on delete cascade,
    foreign key(attach_service_id) references attach_service(attach_service_id) on update cascade on delete cascade
);


insert into `position` values
(1,'le tan'),
(2, 'phuc vu'),
(3, 'chuyen vien'),
(4,'giam sat'),
(5, 'quan ly'),
(6, 'giam doc');

insert into `education_degree` values
(1,'trung cap'),
(2,'cao dang'),
(3,'dai hoc'),
(4,'sau dai hoc');

insert into `division` values
(1,'sale – marketing'),
(2,'hanh chinh'),
(3,'phuc vu'),
(4,'quan ly');

insert into `role` values
(1,'ROLE_ADMIN'),
(2,'ROLE_USER'),
(3,'ROLE_SHOP');

insert into `user`(username,`password`) values
('toan','12345'),
('toan2','12345'),
('toan3','12345'),
('toan4','12345');

insert into `user_role`values
(1,'toan'),
(2,'toan2'),
(3,'toan3');

insert into `employee`
values
(1, 'Phan Thanh Toàn','2000-12-27','123123123456',10000000,'0399885400','toan123@gmail.com','Da Nang',1,1,1,'toan'),
(2, 'Đặng Văn Hiếu','2000-12-27','123123123789',10000000,'0399885400','toan1234@gmail.com','Da Nang',1,2,3,'toan3'),
(3, 'Trương Tấn Hải','2000-12-27','123123123123',10000000,'0399885400','toan12345@gmail.com','Da Nang',2,2,2,'toan2'),
(4, 'Trương Tấn Hải','2000-12-27','123123123123',10000000,'0399885400','toan12345@gmail.com','Da Nang',2,2,2,'toan2'),
(5, 'Trương Tấn Hải','2000-12-27','123123123123',10000000,'0399885400','toan12345@gmail.com','Da Nang',2,2,2,'toan2'),
(6, 'Trương Tấn Hải','2000-12-27','123123123123',10000000,'0399885400','toan12345@gmail.com','Da Nang',2,2,2,'toan2');


insert into `customer_type` values
(1,'Diamond'),
(2,'Platinium'),
(3,'Gold'),
(4,'Silver'),
(5,'Member');

insert into `customer`values
(1,1,'Truong Tan Hai','1998-02-02',1,'123123123477','0957740069','hai@gmail.com','Da Nang'),
(2,2,'Truong Tan Beo','1998-02-02',1,'923123123479','0997740069','hai1@gmail.com','Quang Ngai'),
(3,2,'Truong Tan Beo','1998-02-02',1,'923123123470','0997740060','hai0@gmail.com','Quang Ngai'),
(4,1,'Truong Tan Vui','1998-02-02',0,'723123123437','0657740059','hai2@gmail.com','Da Nang'),
(5,1,'Truong Tan Vui','1998-02-02',0,'723123123437','0657740059','hai2@gmail.com','Da Nang'),
(6,1,'Truong Tan Vui','1998-02-02',0,'723123123437','0657740059','hai2@gmail.com','Da Nang'),
(7,1,'Truong Tan Vui','1998-02-02',0,'723123123437','0657740059','hai2@gmail.com','Da Nang');

insert into `service_type` values 
(1,'Villa'), 
(2,'House'), 
(3,'Room');

insert into `rent_type` values
(1,'Year', 105000), 
(2,'Month', 35000), 
(3,'Day', 25000),
(4,'Hour', 7984);

insert into `service`
values 
(1,'Villa',50,100000,5,1,1,null,null,null,null),
(2,'House',50,100000,5,2,2,null,null,null,null),
(3,'House',50,100000,5,3,2,null,null,null,null),
(4,'Room',50,100000,5,4,3,null,null,null,null);

insert into `contract` 
values
(1,'2021-02-06', '2021-02-24', 5000000,10000000,1, 2, 1),
(2,'2021-02-06', '2021-02-24', 5000000,10000000,2, 1, 2),
(3,'2020-02-06', '2020-02-24', 5000000,10000000,3, 3, 3);



insert into `attach_service` values
(1,'massage', 500000, 1000, 'full'),
(2,'karaoke', 500000, 1000, 'full'),
(3,'thuc an', 500000, 1000, 'full'),
(4,'nuoc uong', 500000, 1000, 'full'),
(5,'thue xe', 500000, 1000, 'still');

insert into `contract_detail` values
(1,1,3,2),
(2,2,3,3);