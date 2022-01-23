<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <div class="row bg-white p-lg-5">
            <div class="col-lg-12">
                <h3 class="text-center">Thêm khách hàng: </h3>
                <form method="post">
                    <div class="form-group">
                        <div>
                            <lable for="customer_id">Mã khách hàng: </lable>
                            <input type="text" class="form-control" name="customer_id" required>
                        </div>
                        <div>
                            <lable for="customer_type_id">Mã loại khách hàng: </lable>
                            <input type="text" class="form-control" name="customer_type_id" required>
                        </div>
                        <div>
                            <lable for="customer_name">Tên khách hàng: </lable>
                            <input type="text" class="form-control" name="customer_name" required>
                        </div>
                        <div>
                            <lable for="customer_birthday">Ngày sinh: </lable>
                            <input type="date" class="form-control" name="customer_birthday" required>
                        </div>
                        <div>
                            <lable for="customer_gender">Giới tính: </lable>
                            <input type="text" class="form-control" name="customer_gender" required>
                        </div>
                        <div>
                            <lable for="customer_id_card">Căn cước công dân: </lable>
                            <input type="text" class="form-control" name="customer_id_card" >
                        </div>
                        <div>
                            <lable for="customer_phone">Số điện thoại: </lable>
                            <input type="text" class="form-control" name="customer_phone" >
                        </div>
                        <div>
                            <lable for="customer_email">Email: </lable>
                            <input type="text" class="form-control" name="customer_email">
                        </div>
                        <div>
                            <lable for="customer_address">Địa chỉ: </lable>
                            <input type="text" class="form-control" name="customer_address">
                        </div>
                      <div>
                          <button type="submit" class="btn btn-primary">Create</button>
                          <button type="button" class="btn btn-success">
                              <a href="/customers">Quay lại</a>
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
