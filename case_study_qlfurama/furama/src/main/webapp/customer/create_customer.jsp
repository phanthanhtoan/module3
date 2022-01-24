<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Create Customer</title>
    <link rel="stylesheet" href="/assert/bootstrap413/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assert/datatables/css/dataTables.bootstrap4 .min.css">
</head>
<body>
<h2>Create Customer</h2>
<p style="color: greenyellow">${msg}</p>
<form method="post">
    <div class="container-fluid">
        <button type="button" class="btn btn-success">
            <a href="/customers" style="color: black">Quay lại</a>
        </button>
        <div class="row bg-white p-lg-5">
            <div class="col-lg-12">
                <h3 class="text-center">Thêm khách hàng: </h3>
                <form method="post">
                    <div class="form-group">
                        <div>
                            <lable for="customer_id">Mã khách hàng:</lable>
                            <input type="text" class="form-control" name="customer_id" required>
                        </div>
                        <%--                        <div>--%>
                        <%--                            <lable for="customer_type_id">Mã loại khách hàng: </lable>--%>
                        <%--                            <input type="text" class="form-control" name="customer_type_id" required>--%>
                        <%--                        </div>--%>
                        <div>
                            <lable for="customer_type_id">Mã loại khách hàng:</lable>
                            <select class="form-control" id="customer_type_id" name="customer_type_id" required>
                                <c:forEach var="customerTypeList" items="${customerTypeList}">
                                    <c:choose>
                                        <c:when test="${customerTypeList.customer_type_id == customer.customer_type_id}">
                                            <option value="${customerTypeList.customer_type_name}">${customerTypeList.customer_type_name}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${customerTypeList.customer_type_id}">${customerTypeList.customer_type_name}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                        </div>
                        <div>
                            <lable for="customer_name">Tên khách hàng:</lable>
                            <input type="text" class="form-control" name="customer_name" required>
                        </div>
                        <div>
                            <lable for="customer_birthday">Ngày sinh:</lable>
                            <input type="date" class="form-control" name="customer_birthday" required>
                        </div>
                        <%--          cách 1              <div>--%>
                        <%--                            <lable for="customer_gender">Giới tính: </lable>--%>
                        <%--                            <input type="text" class="form-control" name="customer_gender" required>--%>
                        <%--                 cách 2       </div>--%>
                        <div>
                            <lable for="customer_gender">Giới tính:</lable>
<%--                            <input name="customer_gender" id="customer_gender" class="form-control" required>--%>
<%--                            <select>--%>
<%--                                <option value="1">Nam</option>--%>
<%--                                <option value="0">Nữ</option>--%>
<%--                            </select>--%>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input " type="radio" name="customer_gender" id="customer_gender1"
                                       value="1">
                                <label class="form-check-label" >Nam</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input " type="radio" name="customer_gender" id="customer_gender0"
                                       value="0">
                                <label class="form-check-label">Nữ</label>
                            </div>
                        </div>
                        <div>
                            <lable for="customer_id_card">Căn cước công dân:</lable>
                            <input type="text" class="form-control" name="customer_id_card">
                        </div>
                        <div>
                            <lable for="customer_phone">Số điện thoại:</lable>
                            <input type="text" class="form-control" name="customer_phone">
                        </div>
                        <div>
                            <lable for="customer_email">Email:</lable>
                            <input type="email" class="form-control" name="customer_email">
                        </div>
                        <div>
                            <lable for="customer_address">Địa chỉ:</lable>
                            <input type="text" class="form-control" name="customer_address">
                        </div>
                        <div>
                            <button type="submit" class="btn btn-primary">Create</button>
                        </div>

                    </div>
                </form>
            </div>
        </div>
    </div>
</form>
</body>
</html>
