<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>List Contract</title>
    <link rel="stylesheet" href="assert/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assert/bootstrap413/css/bootstrap.min.css">
    <link rel="stylesheet" href="assert/datatables/css/dataTables.bootstrap4.min.css">
</head>
<body>
<h2>List of Contract</h2>
<p>
    <c:if test='${message != null}'>
        <span class="message" style="color: green">${message}</span>
    </c:if>
</p>
<div class="container">
    <div class="col-lg-12">
        <form action="/searchService" method="post">
            <input class="border border-warning rounded-pill" type="text" placeholder="Search" name="search">
            <input type="submit" value="Search">
        </form>
        <button class="btn btn-info">
            <a style="color: black" href="/services?action=create">Create Services</a>
        </button>
        <table class="tab table-striped table-bordered" id="tableContract">
            <thead>
            <tr>
                <th scope="col">STT</th>
                <th scope="col">Mã hợp đồng</th>
                <th scope="col">Ngày kí</th>
                <th scope="col">Ngày hết</th>
                <th scope="col">Cọc</th>
                <th scope="col">Tổng tiền</th>
                <th scope="col">Nhân viên</th>
                <th scope="col">Khách hàng</th>
                <th scope="col">Dịch vụ</th>
                <th scope="col">Công cụ</th>
                <th scope="col">Công cụ</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach varStatus="loop" var="contract" items="${contractList}">
                <tr>
                    <td>${loop.count}</td>
                    <td>${contract.contract_id}</td>
                    <td>${contract.contract_start_date}</td>
                    <td>${contract.contract_end_date}</td>
                    <td>${contract.contract_deposit}</td>
                    <td>${contract.contract_total_money}</td>
                    <td>${contract.employee_id}</td>
                    <td>${contract.customer_id}</td>
                    <td>${contract.service_id}</td>
                    <td>
                        <button class="btn btn-info">
                            <a style="color:black"
                               href="/contracts?action=edit&contract_id=${contract.contract_id}">Edit</a>
                        </button>
                    </td>
                    <td>
                        <button class="btn btn-info">
                            <a style="color: black"
                               href="/contracts?action=delete&id=${contract.contract_id}">Delete</a>
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
        $('#tableContract').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 4
        });
    });
</script>
</body>
</html>
