create database QuanLyBanHang;

use QuanLyBanHang;

create table customer(
	c_ID int primary key,
	c_Name varchar(255),
	c_Age varchar(3)
 );
 
create table `order`(
	o_ID int primary key,
	c_ID int,
	o_Date datetime,
	o_TotalPrice double,
	foreign key(c_ID) references customer(c_ID)
 );
 
 create table product(
	p_ID int primary key,
	p_Name varchar(255),
	p_Price double
 );
 
create table oder_detail(
	o_ID int ,
	p_ID int,
	od_Quantity varchar(255),
    primary key(o_ID, p_ID),
	foreign key(o_ID) references `order`(o_ID),
	foreign key(p_ID) references product (p_ID)
);
 