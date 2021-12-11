use classicmodels;

-- tạo view
create view customer_views as 
s customerNumber, customerName, phone
from customers;

select * from customer_views;


-- cập nhật view
create or replace view customer_views as
select customerNumber, customerName, contactFirstName, contactLastName, phone
from customers
where city = 'Nantes';

select * from customer_views;


-- xoá view
DROP VIEW customer_views;
