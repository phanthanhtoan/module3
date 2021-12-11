use classicmodels;

-- tham số in

DELIMITER //
create procedure getCusById
(in cusNum int(11))
begin 
	select *from customers where customerNumber = cusNum;
end //
DELIMITER //

call getCusById(175);

-- tham số out 
DELIMITER //
create procedure GetCustomersCountByCity
(in in_city varchar(45), out total int)
begin
	select count(customerNumber)
    into total
    from customers
    where city = in_city;
end //
DELIMITER ;

call GetCustomersCountByCity('Lyon',@total);
select @total;

-- tham số inout
DELIMITER //
create procedure setCounter(
	inout counter int,
    in inc int
)
begin
    set counter = counter + inc;
end//
DELIMITER ;

set @counter = 1;
call setCounter(@counter,1); -- 2
call setCounter(@counter,1); -- 3
call setCounter(@counter,5); -- 8
select @counter; -- 8

