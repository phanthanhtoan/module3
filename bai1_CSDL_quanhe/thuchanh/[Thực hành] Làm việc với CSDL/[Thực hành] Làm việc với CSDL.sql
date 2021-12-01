use classicmodels;
select *from  classicmodels.customers;
drop table orderdetails;
-- limit lấy 30 khách hàng đầu tiên
select *from `customers` limit 0,30;

select *from `customers` where `customerName` = "Atelier Graphique" limit 0, 30;
select *from `customers` where `customerName` like '%A%' limit 0,30;
select *from `customers`where `city`in('Nantes', 'Las Vegas','NYC') limit 0,30;