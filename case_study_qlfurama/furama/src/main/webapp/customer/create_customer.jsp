<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Customer</title>
</head>
<body>
<h2>Create Customer</h2>
<p style="color: greenyellow">${msg}</p>
<form method="post">
    <p>Mã  KH</p>
    <input type="text" name="customer_id">
    <p>Mã loại KH</p>
    <input type="text" name="customer_type_id">
    <p>Tên khách hàng</p>
    <input type="text" name="customer_name">
    <p>Ngày sinh</p>
    <input type="date" name="customer_birthday">
    <p>Giới tính </p>
    <input type="text" name="customer_gender">
    <p>CCCD</p>
    <input type="text" name="customer_id_card">
    <p>SĐT</p>
    <input type="text" name="customer_phone">
    <p>Email</p>
    <input type="text" name="customer_email">
    <p>Địa chỉ</p>
    <input type="text" name="customer_address">
    <button type="submit">Create</button>
</form>
</body>
</html>
