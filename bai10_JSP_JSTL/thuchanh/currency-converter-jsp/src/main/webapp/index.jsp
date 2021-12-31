
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <h1>Currency Converter</h1>
  <form action="converter.jsp" method="post">
    <lable>Rate:</lable><br/>
    <input type="text" name="rate" placeholder="RATE" value="22000"/><br/>
    <lable>USD: </lable><br/>
    <input type="text" name="usd" placeholder="USD" value="0"/><br/>
    <input type="submit" id="submit" value="Converter"/>
  </form>
  </body>
</html>
