<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thông tin nhà sản xuất</title>
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
		<h1>Thông tin đơn hàng</h1>
		</br>
		<div class="text">
			<c:if test="${not empty donhanglListt}">
				<table id="productTable"
					class="table table-responsive table-bordered" cellpadding="0"
					width="100%">
					<thead>
						<tr>
							<th>ID</th>
							<th>Tên khách hàng</th>
							<th>Tổng giá trị</th>
							<th>Số điện thoại</th>
							<th>Trạng thái</th>
							<th>Thao tác</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="donhang" items="${donhanglListt}"
							varStatus="status">
							<tr>
								<td>${status.index + 1}</td>
								<td>${donhang.tenKhachHang}</td>
								<td>${donhang.tongGiaTri}</td>
								<td>${donhang.soDienThoai}</td>
								<td>${donhang.trangThai}</td>
								<td><c:choose>
										<c:when test="${donhang.trangThai eq 'Đang giao hàng'}">
											<button class="edit-btn success"
												data-id="${donhang.maHoaDon}"
												onclick="confirmPayment(${donhang.maHoaDon})">Xác
												nhận thanh toán</button>
										</c:when>
										<c:when test="${donhang.trangThai eq 'Đang chờ duyệt'}">
											<button class="edit-btn successs"
												data-id="${donhang.maHoaDon}"
												onclick="approveOrder(${donhang.maHoaDon})">Duyệt
												đơn hàng</button>
										</c:when>
									</c:choose> <c:if test="${donhang.trangThai eq 'Đang giao hàng'}">
										<button class="delete-btn" data-id="${donhang.maHoaDon}"
											onclick="cancelOrder(${donhang.maHoaDon})">Hủy đơn</button>
									</c:if>
									<button class="btn btn-primary" data-bs-toggle="modal"
										data-bs-target="#viewInvoiceModal${donhang.maHoaDon}">Xem
										chi tiết hóa đơn</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
		</div>
	</div>

	<c:forEach var="donhang" items="${donhanglListt}">
		<div class="modal fade" id="viewInvoiceModal${donhang.maHoaDon}"
			tabindex="-1" aria-labelledby="viewModalLabel${donhang.maHoaDon}"
			aria-hidden="true">
			<div class="modal-dialog modal-xl">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="viewModalLabel${donhang.maHoaDon}">Chi
							tiết đơn hàng</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<table class="table">
							<thead>
								<tr>
									<th>STT</th>
									<th>Tên sản phẩm</th>
									<th>Số lượng bán</th>
									<th>Giá bán</th>
									<th>Thành tiền</th>
								</tr>
							</thead>
							<tbody>
								<c:set var="orderDetailId" value="${donhang.maHoaDon}" />
								<c:forEach var="chitiet" items="${chitietlListt}">
									<c:if test="${chitiet.maHoaDon eq donhang.maHoaDon}">
										<tr>
											<td>${status.index + 1}</td>
											<td>${chitiet.tenSanPham}</td>
											<td>${chitiet.soLuongBan}</td>
											<td>${chitiet.giaBan}</td>
											<td>${chitiet.thanhTien}</td>
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<h3>Tổng tiền: ${donhang.formattedPrice}</h3>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Đóng</button>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>

	<style>
/* Styles for table and buttons */
</style>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>
	<script>
		$(document).ready(function() {
			$('#productTable').DataTable();
		});

		/* JavaScript functions for button actions */
		function confirmPayment(maHoaDon) {
			// Implement the action for confirming payment here
			console.log("Confirm Payment for maHoaDon: " + maHoaDon);
		}

		function approveOrder(maHoaDon) {
			// Implement the action for approving the order here
			console.log("Approve Order for maHoaDon: " + maHoaDon);
		}

		function cancelOrder(maHoaDon) {
			// Implement the action for canceling the order here
			console.log("Cancel Order for maHoaDon: " + maHoaDon);
		}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>
</html>
