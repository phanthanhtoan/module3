<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>List Employee</title>
    <link rel="stylesheet" href="assert/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assert/bootstrap413/css/bootstrap.min.css">
    <link rel="stylesheet" href="assert/datatables/css/dataTables.bootstrap4.min.css">
</head>
<body>
<h2 class="text-center">List of Employee</h2>
<p>
    <c:if test='${msg != null}'>
        <span class="message" style="color: green">${msg}</span>
    </c:if>
</p>
<div class="container-fluid">
    <div class="col-lg-12">
        <form action="/searchCustomer" method="post">
            <input class="border border-warning rounded-pill" type="text" placeholder="Search" name="search">
            <input type="submit" value="Search">
        </form>
        <%--    HOME--%>
        <button class="btn btn-danger" onclick="window.location.href='/home'">
            <img src="home/img/house-door.svg" style="height: 25px; width: 25px">
        </button>
        <%--    CREATE--%>
        <button class="btn btn-info" onclick="window.location.href='/employees?action=create'">
            <img src="home/img/person_add.svg" style="height: 25px; width: 25px">
        </button>
        <%--    BACK--%>
        <button class="btn btn-success" onclick="window.location.href='/employees'">
            <img src="home/img/list.svg" style="height: 25px; width: 25px">
        </button>
        <table class="table table-striped table-bordered" id="tableEmployee">
            <thead>
            <tr>
                <th scope="col">STT</th>
                <th scope="col">Mã nhân viên</th>
                <th scope="col">Tên nhân viên</th>
                <th scope="col">Ngày sinh</th>
                <th scope="col">CCCD</th>
                <th scope="col">Lương</th>
                <th scope="col">SĐT</th>
                <th scope="col">Email</th>
                <th scope="col">Địa chỉ</th>
                <th scope="col">Mã chức vụ</th>
                <th scope="col">Trình độ HV</th>
                <th scope="col">Phân công</th>
                <th scope="col">Tài khoản</th>
                <th>
                <th scope="col">Công cụ</th>
                </th>
            </tr>
            </thead>
            <tbody>
            <c:forEach varStatus="loop" var="employee" items="${employeeList}">
                <tr>
                    <td>${loop.count}</td>
                    <td>${employee.employee_id}</td>
                    <td>${employee.employee_name}</td>
                    <td>${employee.employee_birthday}</td>
                    <td>${employee.employee_id_card}</td>
                    <td>${employee.employee_salary}</td>
                    <td>${employee.employee_phone}</td>
                    <td>${employee.employee_email}</td>
                    <td>${employee.employee_address}</td>
<%--                    <td>${employee.position_id}</td>--%>
                    <td>
                        <c:if test="${employee.position_id==0}">
                            <span>null</span>
                        </c:if>
                        <c:forEach items="${positionList}" var="positionType">
                            <c:if test="${employee.position_id==positionType.position_id}">
                                <span>${positionType.position_name}</span>
                            </c:if>
                        </c:forEach>
                    </td>
<%--                    <td>--%>
<%--                        <c:if test="${employee.education_degree_id == 1}">--%>
<%--                            Trung cấp--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${employee.education_degree_id == 2}">--%>
<%--                            Cao đẳng--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${employee.education_degree_id == 3}">--%>
<%--                            Đại học--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${employee.education_degree_id == 4}">--%>
<%--                            Sau đại học--%>
<%--                        </c:if>--%>
<%--                    </td>--%>

                    <td>
                        <c:if test="${employee.education_degree_id==0}">
                            <span>null</span>
                        </c:if>
                        <c:forEach items="${educationDegreeList}" var="educationDegreeType">
                            <c:if test="${employee.education_degree_id==educationDegreeType.education_degree_id}">
                                <span>${educationDegreeType.education_degree_name}</span>
                            </c:if>
                        </c:forEach>
                    </td>
                    <td>
                        <c:if test="${employee.division_id==0}">
                            <span>null</span>
                        </c:if>
                        <c:forEach items="${divisionList}" var="divisionType">
                            <c:if test="${employee.division_id==divisionType.division_id}">
                                <span>${divisionType.division_name}</span>
                            </c:if>
                        </c:forEach>
                    </td>
<%--                    <td>--%>
<%--                        <c:if test="${employee.division_id==0}">--%>
<%--                            <span>null</span>--%>
<%--                        </c:if>--%>
<%--                        <c:forEach items="${divisionList}" var="divisionType">--%>
<%--                            <c:if test="${employee.division_id==divisionType.division_id}">--%>
<%--                                <span>${divisionType.division_name}</span>--%>
<%--                            </c:if>--%>
<%--                        </c:forEach>--%>
<%--                    </td>--%>

<%--                    <td>--%>
<%--                        <c:if test="${employee.division_id == 1}">--%>
<%--                            Sale-mkt--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${employee.division_id == 2}">--%>
<%--                            Hành chính--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${employee.division_id == 3}">--%>
<%--                            Phục vụ--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${employee.division_id == 4}">--%>
<%--                            Quản lí--%>
<%--                        </c:if>--%>
<%--                    </td>--%>
                    <td>${employee.username}</td>
                    <td>
                        <button class="btn btn-info">
                            <a style="color:black"
                               href="/employees?action=edit&employee_id=${employee.employee_id}">Edit</a>
                        </button>
                    </td>
                    <td>
                        <button class="btn btn-danger">
                            <a style="color: black"
                               href="/employees?action=delete&id=${employee.employee_id}">Delete</a>
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<script src="assert/bootstrap/js/bootstrap.min.js"></script>
<script src="assert/jquery/jquery-3.5.1.min.js"></script>
<script src="assert/datatables/js/jquery.dataTables.min.js"></script>
<script src="assert/datatables/js/dataTables.bootstrap4.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableEmployee').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 4
        });
    });
</script>
</body>
</html>
