<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer List</title>
</head>
<body>
<h1>Customers</h1>
<p>
    <a href="/products?action=create">Create New Product</a>
</p>
<p>
    <a href="/products?action=search">Search Product</a>
</p>

<table border="1">
    <tr>
        <td>Name Product</td>
        <td>Price Product</td>
        <td>Description Product</td>
        <td>Producer</td>
    </tr>
    <c:forEach items='${requestScope["products"]}' var="product">
        <tr>
            <td><a href="/products?action=view&id=${product.getId()}">${product.getNameProduct()}</a></td>
            <td>${product.getPriceProduct()}</td>
            <td>${product.getDescriptionProduct()}</td>
            <td>${product.getProducer()}</td>
            <td><a href="/products?action=view&id=${product.getId()}"><span>VIEW</span></a></td>
            <td><a href="/products?action=edit&id=${product.getId()}"><span>EDIT</span></a></td>
            <td><a href="/products?action=delete&id=${product.getId()}"><span>DELETE</span></a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>