use quanlybanhang;

insert into customer values
(1,'Minh Quan',10),
(2,'Ngoc Oanh',20),
(3,'Hong Ha',50);

delete  from `order`;

insert into `order`values
(1,1,'2006/3/21 00:00:00' ,null),
(2,2,'2006/3/23 00:00:00' ,null),
(3,1,'2006/3/16 00:00:00',null);

insert into product values
(1,'May Giat',3),
(2,'Tu Lanh',5),
(3,'Dieu Hoa',7),
(4,'Quat',1),
(5,'Bep Dien',2);

insert into oder_detail values
(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);

select  o_ID, o_Date, o_TotalPrice
from `order`;

select customer.c_Name,product.p_Name 
from oder_detail
inner join `order` on `order`.o_ID=oder_detail.o_ID
join customer on customer.c_ID=oder_detail.o_ID
inner join product on product.p_ID=oder_detail.o_ID;


select customer.c_Name 
from customer
left join `order`
on `order`.c_ID=customer.c_ID
where o_ID is null;

select oder_detail.o_ID,(od_Quantity*p_Price) as total,`order`.o_Date from `order` 
inner join product on product.p_ID=`order`.o_ID
inner join oder_detail on oder_detail.p_ID=`order`.o_ID

 












