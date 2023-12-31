<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
</head>
<body>
<%
	if (session.getAttribute("username") == null) {
		// Redirect to the login page
		response.sendRedirect(request.getContextPath() + "/hOME");
	}
	%>
	<div style="padding: 22px 32px;">
		<div class="text">
			<%@ page errorPage="/list/list_nhanvien.jsp"%>
			<h1>Thông tin nhân viên</h1>
			</br>
			<button class="btn btn-primary" data-bs-toggle="modal"
				data-bs-target="#addModal">Thêm mới</button>
			<div class="panel-body">
				<table id="productTable"
					class="table table-responsive table-bordered" cellpadding="0"
					width="100%">
					<thead>
						<tr>
							<th>ID</th>
							<th>Tên nhân viên</th>
							<th>Địa chỉ</th>
							<th>Số điện thoại</th>
							<th>Email</th>
							<th>Vai trò</th>
							<th>Tên đăng nhập</th>
							<th>Ảnh</th>
							<th>Update</th>
							<th>Delete</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="sp" items="${nhanvienliList}" varStatus="status">
							<tr>
								<td><c:out value="${status.index + 1}" /></td>
								<td><c:out value="${sp.tenNhanVien}" /></td>
								<td><c:out value="${sp.diaChi}" /></td>
								<td><c:out value="${sp.soDienThoai}" /></td>
								<td><c:out value="${sp.email}" /></td>
								<td><c:out value="${sp.vaiTro}" /></td>
								<td><c:out value="${sp.tenDangNhap}" /></td>
								<td><img style="width: 100px; height: 100px;"
									src="data:image/jpeg;base64,${sp.anhSanPhamBase64}"
									alt="${sp.tenNhanVien}"></td>
								<td>
									<button class="edit-btn" data-bs-toggle="modal"
										data-bs-target="#editModal${sp.maNhanVien}">Cập nhật</button>
								</td>
								<td>
									<button class="delete-btn">
										<a style="text-decoration: none; color: #000;"
											href="deletenhasanxuatcontroller?maNhanVien=${sp.maNhanVien}"
											data-ma-nha-san-xuat="${sp.maNhanVien}">Xóa</a>
									</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- Add Product Modal -->
			<div class="modal fade" id="addModal" tabindex="-1"
				aria-labelledby="addModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="addModalLabel">Thêm nhân viên</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form action="core/xulyadd_khachhang.jsp" method="POST"
								enctype="multipart/form-data">
								<div class="mb-3">
									<label for="ten_khachhang" class="form-label">Tên nhân viên:</label> <input type="text" class="form-control"
										id="ten_khachhang" name="ten_khachhang">
								</div>
								<div class="mb-3">
									<label for="dia_chi" class="form-label">Địa chỉ:</label> <input
										type="text" class="form-control" id="dia_chi" name="dia_chi">
								</div>
								<div class="mb-3">
									<label for="so_dt" class="form-label">Số điện thoại:</label> <input
										type="text" class="form-control" id="so_dt" name="so_dt">
								</div>
								<div class="mb-3">
									<label for="Email" class="form-label">Email:</label> <input
										type="text" class="form-control" id="Email" name="Email">
								</div>
								<div class="mb-3">
									<label for="ten_dangnhap" class="form-label">Tên đăng
										nhập:</label> <input type="text" class="form-control"
										id="ten_dangnhap" name="ten_dangnhap">
								</div>
								<div class="mb-3">
									<label for="mat_khau" class="form-label">Mật khẩu:</label> <input
										type="password" class="form-control" id="mat_khau"
										name="mat_khau">
								</div>
								<div class="mb-3">
									<label for="anh_khachhang" class="form-label">Ảnh nhân viên:</label> <input type="file" class="form-control"
										id="anh_khachhang" name="anh_khachhang">
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">Đóng</button>
									<input type="submit" class="btn btn-primary" name="submit"
										value="Add">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>

			<c:forEach var="row" items="${nhanvienliList}" varStatus="status">
				<!-- Edit Product Modal -->
				<div class="modal fade" id="editModal${row.maNhanVien}"
					tabindex="-1" aria-labelledby="editModalLabel${sp.maNhanVien}"
					aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="editModalLabel${row.maNhanVien}">
									Chỉnh sửa thông tin nhân viên</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<form action="core/xulyedit_khachhang.jsp" method="POST">
									<input type="hidden" name="MaKhachHang"
										value="${sp.maKhachHang}">
									<div class="mb-3">
										<label for="ten_nhasx_${row.maNhanVien}" class="form-label">Tên
											khách hàng:</label> <input type="text" class="form-control"
											id="ten_nhasx_${row.maNhanVien}"
											name="ten_nhasx_${row.maNhanVien}"
											value="${row.tenNhanVien}">
									</div>
									<div class="mb-3">
										<label for="dia_chi${row.maNhanVien}" class="form-label">Địa
											chỉ:</label> <input type="text" class="form-control"
											id="dia_chi${row.maNhanVien}"
											name="dia_chi${row.maNhanVien}" value="${row.diaChi}">
									</div>
									<div class="mb-3">
										<label for="so_đt${row.maNhanVien}" class="form-label">Số
											điện thoại:</label> <input type="text" class="form-control"
											id="so_đt${row.maNhanVien}" name="so_đt${row.maNhanVien}"
											value="${row.soDienThoai}">
									</div>
									<div class="mb-3">
										<label for="email${row.maNhanVien}" class="form-label">Email:</label>
										<input type="text" class="form-control"
											id="email${row.maNhanVien}" name="email${row.maNhanVien}"
											value="${row.email}">
									</div>
									<div class="mb-3">
										<label for="ten_dangnhap${row.maNhanVien}" class="form-label">Tên
											đăng nhập:</label> <input type="text" class="form-control"
											id="ten_dangnhap${row.maNhanVien}"
											name="ten_dangnhap${row.maNhanVien}"
											value="${row.tenDangNhap}">
									</div>
									<div class="mb-3">
										<label for="mat_khau${row.maNhanVien}" class="form-label">Mật
											khẩu:</label> <input type="password" class="form-control"
											id="mat_khau${row.maNhanVien}"
											name="mat_khau${row.maNhanVien}" value="${row.matKhau}">
									</div>

									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">Đóng</button>
										<button type="submit" class="btn btn-primary">Lưu</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<style>
th {
	border-top: 1px solid #ccc;
	border-left: 1px solid #ccc;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

th:last-child {
	border-right: none;
}

td {
	border-left: 1px solid #ccc;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

.table-bordered {
	border: 1px solid #ccc;
}

.table-bordered th, .table-bordered td {
	border: 1px solid #ccc;
}

.table-bordered th:last-child, .table-bordered td:last-child {
	border-right: none;
}
</style>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>
	<script>
		$(document).ready(function() {
			$('#productTable').DataTable();
		});
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>
</html>
