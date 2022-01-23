<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <h3 class="text-center">Sửa thông tin khách hàng</h3>
                <form method="post">
                    <div>
                        <lable for="customer_id">Mã khách hàng: </lable>
                        <input type="text" class="form-control" name="customer_id" value="${customer.customer_id}" readonly>
                    </div>
                    <div>
                        <lable for="customer_type_id">Mã loại khách hàng: </lable>
                        <input type="text" class="form-control" name="customer_type_id" value="${customer.customer_type_id}">
                    </div>
                    <div>
                        <lable for="customer_name">Tên khách hàng: </lable>
                        <input type="text" class="form-control" name="customer_name" value="${customer.customer_name}">
                    </div>
                    <div>
                        <lable for="customer_birthday">Ngày sinh: </lable>
                        <input type="date" class="form-control" name="customer_birthday" value="${customer.customer_birthday}">
                    </div>
                    <div>
                        <lable for="customer_gender">Giới tính: </lable>
                        <input type="text" class="form-control" name="customer_gender" value="${customer.customer_gender}">
                    </div>
                    <div>
                        <lable for="customer_id_card">Căn cước công dân: </lable>
                        <input type="text" class="form-control" name="customer_id_card" value="${customer.customer_id_card}" >
                    </div>
                    <div>
                        <lable for="customer_phone">Số điện thoại: </lable>
                        <input type="text" class="form-control" name="customer_phone" value="${customer.customer_phone}">
                    </div>
                    <div>
                        <lable for="customer_email">Email: </lable>
                        <input type="text" class="form-control" name="customer_email" value="${customer.customer_email}">
                    </div>
                    <div>
                        <lable for="customer_address">Địa chỉ: </lable>
                        <input type="text" class="form-control" name="customer_address" value="${customer.customer_address}" >
                    </div>
                    <div>
                        <button type="submit" class="btn btn-primary">Lưu</button>
                        <button type="button" class="btn btn-success">
                            <a href="/customers" class="text-white">Quay Lại</a>
                        </button>
                    </div>

                </form>
            </div>
        </div>
    </div>
</form>
</form>
</div>
</body>
</html>
