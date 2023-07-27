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
			<%@ page errorPage="/list/list_sanpham.jsp"%>

			<h1>Thông tin sản phẩm</h1>
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
							<th>TenSanPham</th>
							<th>GiaBan</th>
							<th>MoTaSanPham</th>
							<th>AnhSanPham</th>
							<th>Update</th>
							<th>Delete</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="sp" items="${sanphamlList}" varStatus="status">
							<tr>
								<td><c:out value="${status.index + 1}" /></td>
								<td><c:out value="${sp.tenSanPham}" /></td>
								<td><c:out value="${sp.giaBan}" /></td>
								<td><c:out value="${sp.moTaSanPham}" /></td>
								<td><img style="width: 100px; height: 100px;"
									src="data:image/jpeg;base64,${sp.anhSanPhamBase64}"
									alt="${sp.tenSanPham}"></td>
								<td>
									<button class="edit-btn" data-bs-toggle="modal"
										data-bs-target="#editModal${sp.maSanPham}"
										data-ma-san-pham="${sp.maSanPham}"
										data-ten-san-pham="${sp.tenSanPham}"
										data-gia-ban="${sp.giaBan}"
										data-so-luong-trong-kho="${sp.soLuongTrongKho}">Cập
										nhật</button>
								</td>
								<td>
									<button class="delete-btn">
										<a style="text-decoration: none; color: #000;" href="">Xóa</a>
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
				<div class="modal-dialog modal-xl">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="addModalLabel">Thêm sản phẩm mới</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form action="addsanPhamController" method="POST"
								enctype="multipart/form-data">
								<div class="row">
									<div class="col-md-6">
										<div class="mb-3">
											<label for="ten_sanpham" class="form-label">Tên sản
												phẩm:</label> <input type="text" class="form-control"
												id="ten_sanpham" name="ten_sanpham">
										</div>
										<div class="mb-3">
											<label for="gia" class="form-label">Đơn giá:</label> <input
												type="number" class="form-control" id="gia" name="gia">
										</div>
										<div class="mb-3">
											<label for="so_luong" class="form-label">Số lượng
												trong kho:</label> <input type="number" class="form-control"
												id="so_luong" name="so_luong">
										</div>
										<div class="mb-3">
											<label for="mo_ta" class="form-label">Mô tả:</label>
											<textarea class="form-control" id="mo_ta" name="mo_ta"></textarea>
										</div>
										<div class="mb-3">
											<label for="anh_sanpham" class="form-label">Ảnh sản
												phẩm:</label> <input type="file" class="form-control"
												id="anh_sanpham" name="anh_sanpham">
										</div>
										<div class="mb-3">
											<label for="kich_thuoc" class="form-label">Kích
												thước:</label> <input type="text" class="form-control"
												id="kich_thuoc" name="kich_thuoc">
										</div>
									</div>
									<div class="col-md-6">
										<div class="mb-3">
											<label for="trong_luong_san_pham" class="form-label">Trọng
												lượng sản phẩm:</label> <input type="text" class="form-control"
												id="trong_luong_san_pham" name="trong_luong_san_pham">
										</div>
										<div class="mb-3">
											<label for="dien_tich_man_hinh" class="form-label">Diện
												tích màn hình:</label> <input type="text" class="form-control"
												id="dien_tich_man_hinh" name="dien_tich_man_hinh">
										</div>
										<div class="mb-3">
											<label for="ram" class="form-label">RAM:</label> <input
												type="text" class="form-control" id="ram" name="ram">
										</div>
										<div class="mb-3">
											<label for="dung_luong_pin" class="form-label">Dung
												lượng pin:</label> <input type="text" class="form-control"
												id="dung_luong_pin" name="dung_luong_pin">
										</div>
										<div class="mb-3">
											<label for="thoi_gian_bao_hanh" class="form-label">Thời
												gian bảo hành:</label> <input type="text" class="form-control"
												id="thoi_gian_bao_hanh" name="thoi_gian_bao_hanh">
										</div>
										<div class="mb-3">
											<label for="ma_nha_sx_" class="form-label">Mã nhà sản
												xuất:</label> <select class="form-select" id="ma_nha_sx_"
												name="ma_nha_sx_">
												<option selected disabled>Chọn nhà sản xuất</option>
												<%
												try {
													Class.forName("com.mysql.jdbc.Driver");
													Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ql_ban_smatphon", "root", "chinh2003");
													Statement stmt = conn.createStatement();
													String querya = "SELECT * FROM NhaSanXuat";
													ResultSet rs = stmt.executeQuery(querya);
													while (rs.next()) {
														String maNhaSanXuat = rs.getString("MaNhaSanXuat");
												%>
												<option value="<%=maNhaSanXuat%>"><%=maNhaSanXuat%></option>
												<%
												}
												rs.close();
												stmt.close();
												conn.close();
												} catch (Exception e) {
												e.printStackTrace();
												}
												%>
											</select>
										</div>
										<!-- Other input fields here -->
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">Đóng</button>
									<input type="submit" class="btn btn-primary" name="submit"
										value="Thêm">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- edit Modal -->
			<c:forEach var="sp" items="${sanphamlList}">
				<div class="modal fade" id="editModal${sp.maSanPham}" tabindex="-1"
					aria-labelledby="editModalLabel${sp.maSanPham}" aria-hidden="true">
					<div class="modal-dialog modal-xl">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="editModalLabel${sp.maSanPham}">
									Chỉnh sửa thông tin sản phẩm</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<form action="" method="POST" enctype="multipart/form-data">
									<input type="hidden" name="maSanPham" value="${sp.maSanPham}">
									<div class="row">
										<div class="col-6">
											<div class="mb-3">
												<label for="ten_sanpham_${sp.maSanPham}" class="form-label">Tên
													sản phẩm:</label> <input type="text" class="form-control"
													id="ten_sanpham_${sp.maSanPham}" name="ten_sanpham"
													value="${sp.tenSanPham}">
											</div>
											<div class="mb-3">
												<label for="gia_ban_${sp.maSanPham}" class="form-label">Giá
													bán:</label> <input type="number" class="form-control"
													id="gia_ban_${sp.maSanPham}" name="gia_ban"
													value="${sp.giaBan}">
											</div>
											<div class="mb-3">
												<label for="so_luong_trong_kho_${sp.maSanPham}"
													class="form-label">Số lượng trong kho:</label> <input
													type="number" class="form-control"
													id="so_luong_trong_kho_${sp.maSanPham}"
													name="so_luong_trong_kho" value="${sp.soLuongTrongKho}">
											</div>
											<div class="mb-3">
												<label for="mo_ta_san_pham_${sp.maSanPham}"
													class="form-label">Mô tả sản phẩm:</label>
												<textarea class="form-control"
													id="mo_ta_san_pham_${sp.maSanPham}" name="mo_ta_san_pham">${sp.moTaSanPham}</textarea>
											</div>
											<div class="mb-3">
												<label for="anh_sanpham_${sp.maSanPham}" class="form-label">Ảnh
													sản phẩm:</label> <input type="file" class="form-control"
													id="anh_sanpham_${sp.maSanPham}" name="anh_sanpham">
											</div>
										</div>
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
