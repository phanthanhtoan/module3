use quanlysinhvien;

-- Sử dụng hàm count để hiển thị số lượng sinh viên ở từng nơi
SELECT Address, COUNT(StudentId) AS 'Số lượng học viên'
FROM Student
GROUP BY Address;

-- Tính điểm trung bình các môn học của mỗi học viên bằng cách sử dụng hàm AVG
select S.StudentId, S.StudentName, avg(Mark)
from Student S join Mark M on S.StudentId = M.StudentId
group by S.StudentId, S.StudentName;

-- Sử dụng having để xét điều kiện điểm trung bình các môn học phải lớn hơn 15
select S.StudentId, S.StudentName, avg(Mark)
from Student S join Mark M on S.StudentId = M.StudentId
group by S.StudentId, S.StudentName
having avg(mark) >15;

-- Hiển thị thông tin các học viên có điểm trung bình lớn nhất.
select S.StudentId, S.StudentName, avg(Mark)
from student S join Mark M on S.StudentId = M.StudentId
group by S.StudentId, S.StudentName;

-- Sử dụng Having và All để tìm học viên có điểm trung bình lớn nhất
select S.StudentId, S.StudentName, avg(mark)
from Student S join Mark M on S.StudentId = M.StudentId
group by S.StudentId, S.StudentName
having avg(Mark) >=ALL (select avg(Mark) from Mark group by Mark.StudentId);  