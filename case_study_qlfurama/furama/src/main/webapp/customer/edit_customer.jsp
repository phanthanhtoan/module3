<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/assert/bootstrap413/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assert/datatables/css/dataTables.bootstrap4.min.css">
</head>
<body>
<%--<div class="container-fluid">--%>
<%--    <div class="row bg-white p-lg-5">--%>
<%--        <div class="col-lg-12">--%>
<%--            <h3 class="text-center">Chỉnh sửa khách hành</h3>--%>
<%--            <form action="/customers?action=edit" method="post">--%>

<%--                    <input hidden="text" class="form-control" id="customer_id" name="customer_id"--%>
<%--                           value="${customerList.customer_id}" required >--%>

<%--                <input hidden="hidden" name="customer_type_id" value="${customerList.customer_type_id}">--%>
<%--&lt;%&ndash;                <div class="form-group">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <label for="customer_type_id">Loại khách hàng</label>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <select class="form-control" id="customer_type_id" name="customer_type_id" required>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <c:forEach var="loaikhachang" items="${customerTypeList}">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <c:choose>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <c:when test="${loaikhachang.customerTypeId == customerList.getCustomer_type_id()}">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <option value="${loaikhachang.getCustomer_type_id()}">${loaikhachang.getCustomer_type_name()}</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                </c:when>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <c:otherwise>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <option value="${loaikhachang.getCustomer_type_id()}">${loaikhachang.getCustomer_type_name()}</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                </c:otherwise>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </c:choose>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </c:forEach>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </select>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <input type="text" class="form-control" id="customer_type_id" name="customer_type_id"&ndash;%&gt;--%>
<%--&lt;%&ndash;                           value="${customerList.getCustomer_type_id()}" required>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </div>&ndash;%&gt;--%>
<%--                <div class="form-group">--%>
<%--                    <label for="customer_name">Tên khách hàng</label>--%>
<%--                    <input type="text" class="form-control" id="customer_name" name="customer_name"--%>
<%--                           value="${customerList.getCustomer_name()}" required>--%>
<%--                </div>--%>
<%--                <div class="form-group">--%>
<%--                    <label for="customer_birthday">Ngày sinh nhật</label>--%>
<%--                    <input type="text" class="form-control" id="customer_birthday" name="customer_birthday"--%>
<%--                           value="${customerList.getCustomer_birthday()}" required>--%>
<%--                </div>--%>
<%--                <div class="form-group">--%>
<%--                    <label for="customer_birthday">Giới tính</label>--%>
<%--                    <input type="text" class="form-control" id="customer_gender" name="customer_gender"--%>
<%--                           value="${customerList.getCustomer_gender()}" required>--%>
<%--                </div>--%>
<%--                <div class="form-group">--%>
<%--                    <label for="customer_id_card">Số CMND</label>--%>
<%--                    <input type="text" class="form-control" id="customer_id_card" name="customer_id_card"--%>
<%--                           value="${customerList.getCustomer_id_card()}" required>--%>
<%--                </div>--%>
<%--                <div class="form-group">--%>
<%--                    <label for="customer_id_card">Số điện thoại</label>--%>
<%--                    <input type="text" class="form-control" id="customer_phone" name="customer_phone"--%>
<%--                           value="${customerList.getCustomer_phone()}" required>--%>
<%--                </div>--%>
<%--                <div class="form-group">--%>
<%--                    <label for="customer_email">Email</label>--%>
<%--                    <input type="text" class="form-control" id="customer_email" name="customer_email"--%>
<%--                           value="${customerList.getCustomer_email()}" required>--%>
<%--                </div>--%>
<%--                <div class="form-group">--%>
<%--                    <label for="customer_address">Địa chỉ</label>--%>
<%--                    <input type="text" class="form-control" id="customer_address" name="customer_address"--%>
<%--                           value="${customerList.getCustomer_address()}" required>--%>
<%--                </div>--%>
<%--                <button type="submit" class="btn btn-primary">Lưu</button>--%>
<%--                <button type="button" class="btn btn-success">--%>
<%--                    <a href="/customers" class="text-white">Quay Lại</a>--%>
<%--                </button>--%>
<%--            </form>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<a href="/customers">BACK</a>
<div class="container-fluid"></div>
<form method="post" >
    <table border="1">
        <tr>
            <td>
                <p>Mã loại KH:</p>
            </td>
            <td>
                <input type="text" name="customer_type_id" value="${customer.customer_type_id}">
            </td>
        </tr>
        <tr>
            <td>
                <p>Tên KH:</p>
            </td>
            <td>
                <input type="text" name="customer_name" value="${customer.customer_name}">
            </td>
        </tr>
        <tr>
            <td>
                <p>Ngày sinh</p>
            </td>
            <td>
                <input type="text" name="customer_birthday" value="${customer.customer_birthday}">
            </td>
        </tr>
        <tr>
            <td>
                <p>Giới tính</p>
            </td>
            <td>
                <input type="text" name="customer_gender" value="${customer.customer_gender}">
            </td>
        </tr>
        <tr>
            <td>
                <p>CCCD</p>
            </td>
            <td>
                <input type="text" name="customer_id_card" value="${customer.getCustomer_id_card()}">
            </td>
        </tr>
        <tr>
            <td>
                <p>SĐT</p>
            </td>
            <td>
                <input type="text" name="customer_phone" value="${customer.customer_phone}">
            </td>
        </tr>
        <tr>
            <td>
                <p>Email</p>
            </td>
            <td>
                <input type="text" name="customer_email" value="${customer.customer_email}">
            </td>
        </tr>
        <tr>
            <td>
                <p>Địa chỉ</p>
            </td>
            <td>
                <input type="text" name="customer_address" value="${customer.customer_address}">
            </td>
        </tr>
        <tr>
            <td>
                <button type="submit">Update</button>
            </td>
        </tr>
    </table>
    <%--    <p>Name:</p>--%>
    <%--    <input type="text" name="name" value="${student.name}">--%>
    <%--    <p>Grade: </p>--%>
    <%--    <input type="text" name="grade" value="${student.grade}">--%>
    <%--    <button type="submit">Update</button>--%>
</form>
</div>
</body>
</html>
