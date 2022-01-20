<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Employee</title>
    <link rel="stylesheet" href="/assert/bootstrap413/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assert/datatables/css/dataTables.bootstrap4.min.css">
</head>
<body>
<p style="color: greenyellow">${msg}</p>
<form method="post">
    <div class="container-fluid">
        <div class="row bg-white p-lg-5">
            <div class="col-lg-12">
                <h3 class="text-center">Thêm khách hành</h3>
                <form method="post">
                    <div class="form-group">
                        <lable for="employee_id">Mã nhân viên: </lable>
                        <input  class="form-control" type="text" name="employee_id" required>
                    </div>
                    <div class="form-group">
                        <lable for="employee_name">Tên nhân viên: </lable>
                        <input  class="form-control" type="text" name="employee_name" required>
                    </div>
                    <div class="form-group">
                        <lable for="employee_birthday">Ngày sinh: </lable>
                        <input  class="form-control" type="date" name="employee_birthday" required>
                    </div>
                    <div class="form-group">
                        <lable for="employee_id_card">CCCD: </lable>
                        <input  class="form-control" type="text" name="employee_id_card" required>
                    </div>
                    <div class="form-group">
                        <lable for="employee_salary">Lương: </lable>
                        <input class="form-control"  type="text" name="employee_salary" required>
                    </div>
                    <div class="form-group">
                        <lable for="employee_phone">SĐT: </lable>
                        <input  class="form-control" type="text" name="employee_phone" required>
                    </div>
                    <div class="form-group">
                        <lable for="employee_email">Email: </lable>
                        <input class="form-control" type="text" name="employee_email" required>
                    </div>
                    <div class="form-group">
                        <lable for="employee_address">Địa chỉ: </lable>
                        <input class="form-control" type="text" name="employee_address" >
                    </div>
                    <div class="form-group">
                        <lable  for="position_id"> Mã chức vụ: </lable>
                        <input class="form-control" type="text" name="position_id">
                    </div>
                    <div class="form-group">
                        <lable for="education_degree_id">Mã trình độ HV</lable>
                        <input class="form-control" type="text" name="education_degree_id">
                    </div>
                    <div class="form-group">
                        <lable  for="division_id">Phân công: </lable>
                        <input class="form-control" type="text" name="division_id">
                    </div>
                    <div class="form-group">
                        <lable for="username">Tài khoản: </lable>
                        <input class="form-control"  type="text" name="username">
                    </div>
                    <div >
                        <button type="submit"  class="btn btn-primary">Create</button>
                        <button type="button" class="btn btn-success">
                            <a href="/employees" class="text-white">Quay Lại</a>
                        </button>
                    </div>
<%--                    employee_id--%>
<%--                    employee_name--%>
<%--                    employee_birthday--%>
<%--                    employee_id_card--%>
<%--                    employee_salary--%>
<%--                    employee_phone--%>
<%--                    employee_email--%>
<%--                    employee_address--%>
<%--                    position_id--%>
<%--                    education_degree_id--%>
<%--                    division_id--%>
<%--                    username--%>
                </form>
            </div>
        </div>

    </div>
</form>
</body>
</html>
