<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                        <input type="text" class="form-control" name="employee_id" value="${employee.employee_id}">
                    </div>
                    <div>
                        <lable for="employee_name">Tên nhân viên:</lable>
                        <input type="text" class="form-control" name="employee_name" value="${employee.employee_name}">
                    </div>
                    <div>
                        <lable for="employee_birthday">Ngày sinh:</lable>
                        <input type="date" class="form-control" name="employee_birthday"
                               value="${employee.employee_birthday}">
                    </div>
                    <div>
                        <lable for="employee_id_card">Căn cước công dân:</lable>
                        <input type="text" class="form-control" name="employee_id_card"
                               value="${employee.employee_id_card}">
                    </div>
                    <div>
                        <lable for="employee_salary">Lương:</lable>
                        <input type="text" class="form-control" name="employee_salary"
                               value="${employee.employee_salary}">
                    </div>
                    <div>
                        <lable for="employee_phone">Số điện thoại:</lable>
                        <input type="text" class="form-control" name="employee_phone"
                               value="${employee.employee_phone}">
                    </div>
                    <div>
                        <lable for="employee_email">Email:</lable>
                        <input type="text" class="form-control" name="employee_email"
                               value="${employee.employee_email}">
                    </div>
                    <div>
                        <lable for="employee_address">Địa chỉ:</lable>
                        <input type="text" class="form-control" name="employee_address"
                               value="${employee.employee_address}">
                    </div>
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
<%--                    <div>--%>
<%--                        <lable for="education_degree_id">Trình độ học vấn:</lable>--%>
<%--                        <input type="text" class="form-control" name="education_degree_id"--%>
<%--                               value="${employee.education_degree_id}">--%>
<%--                    </div>--%>
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
<%--                    <div>--%>
<%--                        <lable for="division_id">Phân công:</lable>--%>
<%--                        <input type="text" class="form-control" name="division_id" value="${employee.division_id}">--%>
<%--                    </div>--%>
                    <%--                    <div>--%>
                    <%--                        <lable for="username">Tài khoản: </lable>--%>
                    <%--                        <input type="text" class="form-control" name="username" value="${employee.username}" >--%>
                    <%--                    </div>--%>
                    <div>
                        <lable for="username">Tài khoản:</lable>
                        <select name="username" id="username" class="form-control">
                            <option value="toan">toan</option>
                            <option value="toan2">toan2</option>
                            <option value="toan3">toan3</option>
                            <option value="toan4">toan4</option>
                        </select>
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
