
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Create customer</title>
</head>
<body>
<h1>Create customer</h1>
<form action="" method="post">
    <p>ID:</p>
    <input type="text" name="id" >
    <p>Tên:</p>
    <input type="text" name="ten" >
    <p>Ngày sinh: </p>
    <input type="text" name="ngaysinh">
    <p>Địa chỉ: </p>
    <input type="text" name="diachi">
    <p>Ảnh: </p>
    <input type="text" name="anh"/>
    <button type="submit">Create</button>
</form>
</body>
</html>
