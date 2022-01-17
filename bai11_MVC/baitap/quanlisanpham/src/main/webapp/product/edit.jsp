<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Edit Product</title>
</head>
<body>
<h1>Edit Product</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="/products">Back to Product list</a>
</p>
<form method="post">
    <fieldset>
        <legend>Product Information</legend>
        <table>
            <tr>
                <td>Name product:</td>
                <td><input type="text" name="nameProduct" id="nameProduct"
                           value="${requestScope["product"].getNameProduct()}"></td>
            </tr>
            <tr>
                <td>Price product:</td>
                <td><input type="text" name="priceProduct" id="priceProduct"
                           value="${requestScope["product"].getPriceProduct()}"></td>
            </tr>
            <tr>
                <td>Description:</td>
                <td><input type="text" name="descriptionProduct" id="descriptionProduct"
                           value="${requestScope["product"].getDescriptionProduct()}">
                </td>
            </tr>
            <tr>
                <td>Producer:</td>
                <td><input type="text" name="producer" id="producer" value="${requestScope["product"].getProducer()}">
                </td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Update Product"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>