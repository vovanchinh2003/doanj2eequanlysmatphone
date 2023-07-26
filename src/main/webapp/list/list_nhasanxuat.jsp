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
			<%@ page errorPage="/list/list_nhasanxuat.jsp"%>

			<h1>Thông tin nhà sản xuất</h1>
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
							<th>TenNhaSanXuat</th>
							<th>DiaChi</th>
							<th>SoDienThoai</th>
							<th>Email</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="nsx" items="${nhaSanXuatList}" varStatus="status">
							<tr>
								<td><c:out value="${status.index + 1}" /></td>
								<td><c:out value="${nsx.tenNhaSanXuat}" /></td>
								<td><c:out value="${nsx.diaChi}" /></td>
								<td><c:out value="${nsx.soDienThoai}" /></td>
								<td><c:out value="${nsx.email}" /></td>
								<td>
									<button class="edit-btn" data-bs-toggle="modal"
										data-bs-target="#editModal${nsx.maNhaSanXuat}"
										data-ma-nha-san-xuat="${nsx.maNhaSanXuat}"
										data-ten-nha-san-xuat="${nsx.tenNhaSanXuat}"
										data-dia-chi="${nsx.diaChi}"
										data-so-dien-thoai="${nsx.soDienThoai}"
										data-email="${nsx.email}">Cập nhật</button>
								</td>
								<td>
									<button class="delete-btn">
										<a style="text-decoration: none; color: #000;"
											href="deletenhasanxuatcontroller?MaNhaSanXuat=${nsx.maNhaSanXuat}"
											data-ma-nha-san-xuat="${nsx.maNhaSanXuat}">Xóa </a>
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
							<h5 class="modal-title" id="addModalLabel">Thêm nhà sản xuất</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form action="addnhasanxuatcontroller" method="POST">
								<div class="mb-3">
									<label for="ten_nhasx" class="form-label">Tên nhà sản
										xuất:</label> <input type="text" class="form-control" id="ten_nhasx"
										name="ten_nhasx">
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
									<label for="Email" class="form-label">Email:</label>
									<textarea class="form-control" id="Email" name="Email"></textarea>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">Đóng</button>
									<button type="submit" class="btn btn-primary">Thêm sản
										phẩm</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>

			<!-- Modal -->
			<c:forEach var="nsx" items="${nhaSanXuatList}">
				<div class="modal fade" id="editModal${nsx.maNhaSanXuat}"
					tabindex="-1" aria-labelledby="editModalLabel${nsx.maNhaSanXuat}"
					aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="editModalLabel${nsx.maNhaSanXuat}">
									Chỉnh sửa thông tin nhà sản xuất</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<form action="editnhasanxuatcontroller" method="POST">
									<input type="hidden" name="MaNhaSanXuat"
										value="${nsx.maNhaSanXuat}">
									<div class="mb-3">
										<label for="ten_nhasx_${nsx.maNhaSanXuat}" class="form-label">Tên
											nhà sản xuất:</label> <input type="text" class="form-control"
											id="ten_nhasx_${nsx.maNhaSanXuat}"
											name="ten_nhasx_${nsx.maNhaSanXuat}"
											value="${nsx.tenNhaSanXuat}">
									</div>
									<div class="mb-3">
										<label for="dia_chi${nsx.maNhaSanXuat}" class="form-label">Địa
											chỉ:</label> <input type="text" class="form-control"
											id="dia_chi${nsx.maNhaSanXuat}"
											name="dia_chi${nsx.maNhaSanXuat}" value="${nsx.diaChi}">
									</div>
									<div class="mb-3">
										<label for="so_đt${nsx.maNhaSanXuat}" class="form-label">Số
											điện thoại:</label> <input type="text" class="form-control"
											id="so_đt${nsx.maNhaSanXuat}"
											name="so_dien_thoai${nsx.maNhaSanXuat}"
											value="${nsx.soDienThoai}">
									</div>
									<div class="mb-3">
										<label for="email${nsx.maNhaSanXuat}" class="form-label">Email:</label>
										<input type="text" class="form-control"
											id="email${nsx.maNhaSanXuat}" name="email${nsx.maNhaSanXuat}"
											value="${nsx.email}">
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
