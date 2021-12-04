use quanlysinhvien;

-- Sử dụng câu lệnh Select * và lấy dữ liệu học viên từ bảng Student để hiển thị danh sách tất cả các học viên như sau:
select *from student;

-- Để hiển thị danh sách học viên đang theo học cần phải sử dụng câu lệnh select ... from kèm theo where 
select *from student where Status =true;

-- Sử dụng điều kiện where Credit < 10 và from Subject để lấy ra danh sách các môn học có thời gian học nhỏ hơn 10:
select *from subject where credit <10;

-- Sử dụng câu lệnh Join và where để hiển thị danh sách học viên lớp A1
select S.StudentId, S.StudentName, C.ClassName 
	from student S join Class C on S.ClassId = C.ClassId;

-- Sử dụng câu lệnh Where C.ClassName ='A1' để hiển thị danh sách học viên lớp A1
select S.StudentId,  S.StudentName, C.ClassName 
	from student S join Class C on S.ClassId = C.ClassID
		where C.ClassName = 'A1';

-- Hiển thị điểm môn CF của các học viên
select S.StudentId, S.StudentName, Sub.Subname, M.Mark
	FROM Student S join Mark M on S.StudentId = M.StudentId 
		join Subject Sub on M.SubId = Sub.SubId;
        
-- Sử dụng câu lệnh Where để hiển thị điểm môn CF của các học viên
select S.StudentId, S.StudentName, Sub.SubName, M.Mark
	from Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on M.SubId = Sub.SubId
		where Sub.SubName = 'CF';

