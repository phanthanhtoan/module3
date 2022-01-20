<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>List Customer</title>
    <link rel="stylesheet" href="assert/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assert/bootstrap413/css/bootstrap.min.css">
    <link rel="stylesheet" href="assert/datatables/css/dataTables.bootstrap4.min.css">
</head>
<body>
<h2>List of Customer</h2>
<p>
    <c:if test='${message != null}'>
        <span class="message" style="color: green">${message}</span>
    </c:if>
</p>
<div class="container-fluid">
    <div class="col-lg-12">
        <form action="/searchCustomer" method="post">
            <input class="border border-warning rounded-pill" type="text" placeholder="Search" name="search">
            <input type="submit" value="Search">
        </form>
        <button class="btn btn-info">
            <a href="/customers?action=create" style="color:black;">Create Customer</a>
        </button>
        <table class="table table-striped table-bordered" id="tableCustomer">
            <thead>
            <tr>
                <th scope="col">Mã KH</th>
                <th scope="col">Mã loại KH</th>
                <th scope="col">Tên KH</th>
                <th scope="col">Ngày sinh</th>
                <th scope="col">Giới tính</th>
                <th scope="col">CCCD</th>
                <th scope="col">SĐT</th>
                <th scope="col">Email</th>
                <th scope="col">Địa chỉ</th>
                <th scope="col">Công cụ</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="customer" items="${customerList}">
                <tr>
                    <td>${customer.customer_id}</td>
                    <td>${customer.customer_type_id}</td>
                    <td>${customer.customer_name}</td>
                    <td>${customer.customer_birthday}</td>
                    <td>${customer.customer_gender}</td>
                    <td>${customer.customer_id_card}</td>
                    <td>${customer.customer_phone}</td>
                    <td>${customer.customer_email}</td>
                    <td>${customer.customer_address}</td>
                    <td>
                        <button class="btn btn-info">
                            <a style="color: black"
                               href="/customers?action=edit&customer_id=${customer.customer_id}">Edit</a>
                        </button>
                        <button class="btn btn-danger">
                            <a style="color: black" href="/customers?action=delete&id=${customer.customer_id}">Delete</a>
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
        $('#tableCustomer').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 4
        });
    });
</script>
</body>
</html>
