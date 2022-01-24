<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Create Service</title>
    <link rel="stylesheet" href="/assert/bootstrap413/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assert/datatables/css/dataTables.bootstrap4 .min.css">
</head>
<body>
<p style="color: greenyellow">${msg}</p>
<form method="post">
    <div class="container-fluid">
        <div class="row bg-white p-lg-5">
            <div class="col-lg-12">
                <h3>Thêm dịch vụ</h3>
                <form method="post">
                    <div class="form-group">
                        <div>
                            <lable for="service_id">Mã dịch vụ:</lable>
                            <input class="form-control" type="text" name="service_id" required >
                        </div>
                        <div>
                            <lable for="service_name">Tên dịch vụ:</lable>
                            <input class="form-control" type="text" name="service_name" required>
                        </div>
                        <div>
                            <lable for="service_area">Diện tích:</lable>
                            <input class="form-control" type="number" name="service_area" required>
                        </div>
                        <div>
                            <lable for="service_cost">Chi phí: </lable>
                            <input class="form-control" type="number" name="service_cost" required>
                        </div>
                        <div>
                            <lable for="service_max_people">Sức chứa: </lable>
                            <input class="form-control" type="number" name="service_max_people" required>
                        </div>
                        <div>
                            <lable for="rent_type_id">Mã thuê: </lable>
                            <input class="form-control" type="text" name="rent_type_id" required>
                        </div>
                        <div>
                            <lable for="service_type_id">Mã loại dịch vụ: </lable>
<%--                            <input class="form-control" type="text" name="service_type_id" required>--%>
                            <select class="form-control" id="service_type_id" name="service_type_id" required>
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
                            <input class="form-control" type="text" name="standard_room" required>
                        </div>
                        <div>
                            <lable for="description_other_convenience">Các dịch vụ khác: </lable>
                            <input class="form-control" type="text" name="description_other_convenience" required>
                        </div>
                        <div>
                            <lable for="pool_area">Diện tích hồ bơi: </lable>
                            <input class="form-control" type="number" name="pool_area" required>
                        </div>
                        <div>
                            <lable for="number_of_floors">Số tầng: </lable>
                            <input class="form-control" type="number" name="number_of_floors" required>
                        </div>
                        <div>
                            <button type="submit" class="btn btn-primary">Create</button>
                            <button type="button" class="btn btn-success">
                                <a href="/services" class="text-white">Quay lại</a>
                            </button>
                        </div>

                    </div>
                </form>
            </div>
        </div>
    </div>
</form>
</body>
</html>
