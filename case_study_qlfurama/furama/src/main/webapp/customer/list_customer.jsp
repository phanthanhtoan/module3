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
                <th scope="col">STT</th>
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
            <c:forEach varStatus="loop" var="customer" items="${customerList}">
                <tr>
                    <td>${loop.count}</td>
                    <td>${customer.customer_id}</td>
                        <%--                <td>${customer.customer_type_id}</td>--%>
                    <td>
                        <c:if test="${customer.customer_type_id==0}">
                            <span>null</span>
                        </c:if>
                        <c:forEach items="${customerTypeList}" var="customerType">
                            <c:if test="${customer.customer_type_id==customerType.customer_type_id}">
                                <span>${customerType.customer_type_name}</span>
                            </c:if>
                        </c:forEach>
                    </td>
                    <td>${customer.customer_name}</td>
                    <td>${customer.customer_birthday}</td>
                    <td>
                        <c:if test="${customer.customer_gender == 1}">Nam</c:if>
                        <c:if test="${customer.customer_gender == 0}">Nữ</c:if>
                    </td>
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
                                                        <a style="color: black"
                                                           href="/customers?action=delete&id=${customer.customer_id}">Delete</a>
                                                    </button>
<%--                        <button type="button" class="btn btn-danger" onclick="setValueForm('${customer.customer_id}')"--%>
<%--                                data-toggle="modal" data-target="#modalDelete">--%>
<%--                            Xoá--%>
<%--                        </button>--%>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <%--        modal delete--%>
<%--        <div class="modal fade" id="modalDelete" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">--%>
<%--            <div class="modal-dialog">--%>
<%--                <div class="modal-content">--%>
<%--                    <form method="get" action="/customers?action=delete">--%>
<%--                        <div class="modal-header">--%>
<%--                            <h5 class="modal-title" id="exampleModalLabel">Thông Báo</h5>--%>
<%--                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
<%--                                <span aria-hidden="true">&times;</span>--%>
<%--                            </button>--%>
<%--                        </div>--%>
<%--                        <div class="modal-body">--%>
<%--                            <input name="idDelete" id="idDelete" hidden>--%>
<%--                            Bạn có chắc muốn xoá ?--%>
<%--                        </div>--%>
<%--                        <div class="modal-footer">--%>
<%--                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>--%>
<%--                            <button type="submit" class="btn btn-danger">Xoá</button>--%>
<%--                        </div>--%>
<%--                    </form>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
    </div>
</div>
<script src="/assert/jquery/jquery-3.5.1.min.js"></script>
<script src="/assert/bootstrap413/js/popper.min.js"></script>
<script src="/assert/datatables/js/jquery.dataTables.min.js"></script>
<script src="/assert/datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.bundle.js"></script>
<script>
    $(document).ready(function () {
        $('#tableCustomer').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 4
        });
    });
</script>
<%--<script>--%>
<%--    function setValueForm(idDelete) {--%>
<%--        document.getElementById("idDelete").value = idDelete;--%>
<%--    }--%>
<%--</script>--%>
</body>
</html>
