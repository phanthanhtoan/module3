
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post">
    <p>ID:</p>
    <input type="text" name="id" value="${customer.id}">
    <p>Tên:</p>
    <input type="text" name="ten" value="${customer.ten}">
    <p>Ngày sinh: </p>
    <input type="text" name="ngaysinh" value="${customer.ngaysinh}">
    <p>Địa chỉ: </p>
    <input type="text" name="diachi" value="${customer.diachi}">
    <button type="submit">Update</button>
</form>
</body>
</html>
