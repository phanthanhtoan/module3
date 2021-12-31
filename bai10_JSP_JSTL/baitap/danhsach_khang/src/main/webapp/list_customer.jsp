
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List Student</title>
</head>
<body>
<h2>List Student</h2>
<table style="width: 700px" , border="1">
    <tr>
        <th>ID:</th>
        <th>Tên:</th>
        <th>Ngày sinh:</th>
        <th>Địa chỉ:</th>
        <th>Ảnh:</th>
    </tr>
    <c:forEach var="customer" items="${customerList}">
        <tr>
            <th><c:out value="${customer.id}"></c:out></th>
            <th><c:out value="${customer.ten}"></c:out></th>
            <th><c:out value="${customer.ngaysinh}"></c:out></th>
            <th><c:out value="${customer.diachi}"></c:out></th>
            <th><c:out value="${customer.anh}"></c:out></th>
            <th><a href="/customer?action=update&id=${customer.id}">Update</a></th>
        </tr>
    </c:forEach>
</table>
</body>
</html>

