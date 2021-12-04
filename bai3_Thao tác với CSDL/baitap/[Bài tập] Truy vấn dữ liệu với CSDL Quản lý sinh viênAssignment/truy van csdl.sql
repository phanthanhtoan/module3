use quanlysinhvien;

select *from student
where  studentName like 'h%';

select * from class 
where month(StartDate)>=12 ;

select * from `subject`
where Credit>=3 and Credit<=5;

update student set ClassId=2
where StudentName='Hung' ;

select StudentName, SubName, Mark
from student ,`subject`,mark
order by  mark desc,StudentName asc 
;

