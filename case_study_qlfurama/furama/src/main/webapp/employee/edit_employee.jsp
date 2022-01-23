<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/assert/bootstrap413/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assert/datatables/css/dataTables.bootstrap4.min.css">

</head>
<body>
<form method="post">
    <div class="container-fluid">
        <div class="row bg-white p-lg-5">
            <div class="col-lg-12">
                <h3 class="text-center">Sửa thông tin nhân viên</h3>
                <form method="post">
                    <div>
                        <lable for="employee_id">Mã nhân viên:</lable>
                        <input type="text" class="form-control" name="employee_id" value="${employee.employee_id}" >
                    </div>
                    <div>
                        <lable for="employee_name">Tên nhân viên: </lable>
                        <input type="text" class="form-control" name="employee_name" value="${employee.employee_name}" >
                    </div>
                    <div>
                        <lable for="employee_birthday">Ngày sinh: </lable>
                        <input type="date" class="form-control" name="employee_birthday" value="${employee.employee_birthday}" >
                    </div>
                    <div>
                        <lable for="employee_id_card">Căn cước công dân: </lable>
                        <input type="text" class="form-control" name="employee_id_card" value="${employee.employee_id_card}" >
                    </div>
                    <div>
                        <lable for="employee_salary">Lương: </lable>
                        <input type="text" class="form-control" name="employee_salary" value="${employee.employee_salary}" >
                    </div>
                    <div>
                        <lable for="employee_phone">Số điện thoại: </lable>
                        <input type="text" class="form-control" name="employee_phone" value="${employee.employee_phone}" >
                    </div>
                    <div>
                        <lable for="employee_email">Email: </lable>
                        <input type="text" class="form-control" name="employee_email" value="${employee.employee_email}" >
                    </div>
                    <div>
                        <lable for="employee_address">Địa chỉ:</lable>
                        <input type="text" class="form-control" name="employee_address" value="${employee.employee_address}" >
                    </div>
                    <div>
                        <lable for="position_id">Mã chức vụ: </lable>
                        <input type="text" class="form-control" name="position_id" value="${employee.position_id}" >
                    </div>
                    <div>
                        <lable for="education_degree_id">Trình độ học vấn: </lable>
                        <input type="text" class="form-control" name="education_degree_id" value="${employee.education_degree_id}" >
                    </div>
                    <div>
                        <lable for="division_id">Phân công: </lable>
                        <input type="text" class="form-control" name="division_id" value="${employee.division_id}">
                    </div>
                    <div>
                        <lable for="username">Tài khoản: </lable>
                        <input type="text" class="form-control" name="username" value="${employee.username}" >
                    </div>
                    <div>
                        <button type="submit" class="btn btn-primary">Lưu</button>
                        <button type="button" class="btn btn-success">
                            <a href="/employees" class="text-white">Quay Lại</a>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</form>
</body>
</html>
