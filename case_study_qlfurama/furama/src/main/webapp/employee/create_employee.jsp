<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <h3 class="text-center">Thêm nhân viên</h3>
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
<%--                    <div class="form-group">--%>
<%--                        <lable  for="position_id"> Mã chức vụ: </lable>--%>
<%--                        <input class="form-control" type="text" name="position_id">--%>
<%--                    </div>--%>
                    <div>
                        <label for="position_id">Chức vụ: </label>
                        <select class="form-control" id="position_id" name="position_id" required>
                            <c:forEach var="positionList" items="${positionList}">
                                <c:choose>
                                    <c:when test="${positionList.position_id == employeeList.position_id}">
                                        <option value="${positionList.position_name}">${positionList.position_name}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${positionList.position_id}">${positionList.position_name}</option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>
                    </div>
                    <div>
                        <label for="education_degree_id">Chức vụ: </label>
                        <select class="form-control" id="education_degree_id" name="education_degree_id" required>
                            <c:forEach var="educationDegreeList" items="${educationDegreeList}">
                                <c:choose>
                                    <c:when test="${educationDegreeList.education_degree_id == employeeList.education_degree_id}">
                                        <option value="${educationDegreeList.education_degree_name}">${educationDegreeList.education_degree_name}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${educationDegreeList.education_degree_id}">${educationDegreeList.education_degree_name}</option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>
                    </div>
<%--                    <div class="form-group">--%>
<%--                        <lable for="education_degree_id">Mã trình độ HV</lable>--%>
<%--                        <input class="form-control" type="text" name="education_degree_id">--%>
<%--                    </div>--%>
<%--                    <div class="form-group">--%>
<%--                        <lable  for="division_id">Phân công: </lable>--%>
<%--                        <input class="form-control" type="text" name="division_id">--%>
<%--                    </div>--%>
                    <div>
                        <label for="division_id">Chức vụ: </label>
                        <select class="form-control" id="division_id" name="division_id" required>
                            <c:forEach var="divisionList" items="${divisionList}">
                                <c:choose>
                                    <c:when test="${divisionList.division_id == employeeList.division_id}">
                                        <option value="${divisionList.division_name}">${divisionList.division_name}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${divisionList.division_id}">${divisionList.division_name}</option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>
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
