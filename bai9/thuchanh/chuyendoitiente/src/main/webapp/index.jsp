<%--
  Created by IntelliJ IDEA.
  User: toan2
  Date: 30/12/2021
  Time: 10:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<h1>Currency Converter</h1>
<form method="post" action="/convert">
    <lable>Rate:</lable>
    <br>
    <input type="text" name="rate" placeholder="rate" value="22000" readonly/>
    <br>
    <lable>USD:</lable>
    <br>
    <input type="text" name="usd" placeholder="usd" value="0"/>
    <br>
    <input type="submit" id="submit" value="Converter"/>
</form>
</body>
</html>
