use classicmodels;

-- Tạo Mysql Stored Procedure đầu tiên
DELIMITER //
create procedure findAllCustomers1()
begin
  select * from customers;
end //
DELIMITER ;

-- Cách gọi procedure
call findAllCustomers1();

-- Sửa procedure
DELIMITER //
drop procedure if exists  `findAllCustomers`//
create procedure findAllCustomers()
begin
select * from customers where customerNumber = 175;
end //

call findAllCustomers2();