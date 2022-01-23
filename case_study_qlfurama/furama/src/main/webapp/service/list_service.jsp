<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>List Service</title>
    <link rel="stylesheet" href="assert/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assert/bootstrap413/css/bootstrap.min.css">
    <link rel="stylesheet" href="assert/datatables/css/dataTables.bootstrap4.min.css">
</head>
<body>
<h2>List of Service</h2>
<p>
    <c:if test='${msg != null}'>
        <span class="msg" style="color: green">${msg}</span>
    </c:if>
</p>
<div class="container-fluid">
    <div class="col-lg-12">
        <form action="/searchService" method="post">
            <input class="border border-warning rounded-pill" type="text" placeholder="Search" name="search">
            <input type="submit" value="Search">
        </form>
        <button class="btn btn-info">
            <a style="color: black" href="/services?action=create">Create Service</a>
        </button>
        <table class="table table-striped table-bordered" id="tableService">
            <thead>
            <th>STT</th>
            <th scope="col">Mã DV</th>
            <th scope="col">Tên DV</th>
            <th scope="col">Khu vực</th>
            <th scope="col">Chi phí</th>
            <th scope="col">Sức chứa</th>
            <th scope="col">Mã thuê</th>
            <th scope="col">Mã loại DV</th>
            <th scope="col">Tiêu chuẩn phòng</th>
            <th scope="col">Các DV khác</th>
            <th scope="col">Diện tích HB</th>
            <th scope="col">Tầng số: </th>
            <th>
            <th scope="col"></th>
            </th>
            </thead>
            <tbody>
            <c:forEach varStatus="loop" var="service" items="${serviceList}">
                <tr>
                    <td>${loop.count}</td>
                    <td>${service.service_id}</td>
                    <td>${service.service_name}</td>
                    <td>${service.service_area}</td>
                    <td>${service.service_cost}</td>
                    <td>${service.service_max_people}</td>
                    <td>${service.rent_type_id}</td>
<%--                    <td>${service.service_type_id}</td>--%>
                    <td>
                        <c:if test="${service.service_type_id==0}">
                            <span>null</span>
                        </c:if>
                        <c:forEach items="${serviceTypeList}" var="serviceType">
                            <c:if test="${service.service_type_id==serviceType.service_type_id}">
                                <span>${serviceType.service_type_name}</span>
                            </c:if>
                        </c:forEach>
                    </td>
                    <td>${service.standard_room}</td>
                    <td>${service.description_other_convenience}</td>
                    <td>${service.pool_area}</td>
                    <td>${service.number_of_floors}</td>
                    <td>
                        <button class="btn btn-info">
                            <a style="color:black;"
                                    href="/services?action=edit&service_id=${service.service_id}">Edit</a>
                        </button>
                    </td>
                    <td>
                        <button class="btn btn-danger">
                            <a style="color: black"
                                    href="/services?action=delete&id=${service.service_id}">Delete</a>
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
        $('#tableService').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 4
        });
    });
</script>
</body>
</html>
