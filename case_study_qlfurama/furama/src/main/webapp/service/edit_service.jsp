<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Edit Service</title>
    <link rel="stylesheet" href="/assert/bootstrap413/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assert/datatables/css/dataTables.bootstrap4.min.css">
</head>
<body>
<form method="post">
    <div class="container-fluid">
        <div class="row bg-white p-lg-5">
            <div class="col-lg-12">
                <h3 class="text-center">Sửa thông tin dịch vụ</h3>
                <form method="post">
                    <div>
                        <lable for="service_id">Mã dịch vụ: </lable>
                        <input type="text" class="form-control" name="service_id" value="${service.service_id}" readonly>
                    </div>
                    <div>
                        <lable for="service_name">Tên dịch vụ: </lable>
                        <input type="text" class="form-control" name="service_name" value="${service.service_name}">
                    </div>
                    <div>
                        <lable for="service_area">Khu vực: </lable>
                        <input type="text" class="form-control" name="service_area" value="${service.service_area}">
                    </div>
                    <div>
                        <lable for="service_cost">Chi phí: </lable>
                        <input type="number" class="form-control" name="service_cost" value="${service.service_cost}">
                    </div>
                    <div>
                        <lable for="service_max_people">Số người tối đa: </lable>
                        <input type="number" class="form-control" name="service_max_people" value="${service.service_max_people}">
                    </div>
                    <div>
                        <lable for="rent_type_id">Mã thuê: </lable>
                        <input type="text" class="form-control" name="rent_type_id" value="${service.rent_type_id}">
                    </div>
<%--                    <div>--%>
<%--                        <lable for="service_type_id">Mã loại dịch vụ: </lable>--%>
<%--                        <input type="text" class="form-control" name="service_type_id" value="${service.service_type_id}">--%>
<%--                    </div>--%>
                    <div>
                        <label for="service_type_id">Mã loại dịch vụ: </label>
                        <select class="form-control" id="service_type_id" name="service_type_id" >
                            <c:forEach var="serviceTypeList" items="${serviceTypeList}">
                                <c:choose>
                                    <c:when test="${serviceTypeList.service_type_id == service.service_type_id}">
                                        <option value="${serviceTypeList.service_type_name}">${serviceTypeList.service_type_name}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${serviceTypeList.service_type_id}">${serviceTypeList.service_type_name}</option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>
                    </div>
                    <div>
                        <lable for="standard_room">Tiêu chuẩn phòng: </lable>
                        <input type="text" class="form-control" name="standard_room" value="${service.standard_room}">
                    </div>
                    <div>
                        <lable for="description_other_convenience">Các loại dịch vụ khác: </lable>
                        <input type="text" class="form-control" name="description_other_convenience" value="${service.description_other_convenience}">
                    </div>
                    <div>
                        <lable for="pool_area">Diện tích hồ bơi: </lable>
                        <input type="number" class="form-control" name="pool_area" value="${service.pool_area}">
                    </div>
                    <div>
                        <lable for="number_of_floors">Tầng số: </lable>
                        <input type="number" class="form-control" name="number_of_floors" value="${service.number_of_floors}">
                    </div>
                    <div>
                        <button type="submit" class="btn btn-primary">Lưu</button>
                        <button type="button" class="btn btn-success">
                            <a href="/services">Quay lại</a>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</form>
</body>
</html>
