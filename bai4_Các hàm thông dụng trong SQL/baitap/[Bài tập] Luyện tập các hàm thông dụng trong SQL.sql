use quanlysinhvien;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select * from subject order by Credit desc limit 1; 

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select *from subject 
inner join Mark M on M.SubId = subject.SubId
order by M.mark desc limit 1;

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select S.StudentName, S.Address, S.ClassId, avg(M.mark) as 'ĐTB'
from student S, mark M where S.StudentId = M.StudentId
order by ĐTB desc;

