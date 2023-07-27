<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="org.apache.commons.codec.binary.Base64"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/doanj2eequanlysmatphone/assetss/css/index.css">
<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/doanj2eequanlysmatphone/assetss/css/admin.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/view/navbar.jsp"></jsp:include>

	<style>
header {
	background: #0dcaf06e;
	font-weight: bold;
}
</style>
	<center>
		<div class="container row sanpham " style="">
			<div class="row row-cols-1 row-cols-md-5 g-4">
				<c:forEach var="sp" items="${sanphamlList}" varStatus="status">
					<div class="col">
						<div class="card " style="margin: 15px">
							<img class="card-img-top" style="width: 200px; height: 220px"
								src="data:image/jpeg;base64,${sp.anhSanPhamBase64}"
								alt="${sp.tenSanPham}">
							<div class="card-body">
								<a href="detail.html" style="text-decoration: none">
									<h5 class="card-title text-dark">
										<c:out value="${sp.tenSanPham}" />
									</h5>
								</a>
								<p class="card-text">
									<c:out value="${sp.giaBan}" />
									<sup>₫</sup>
								</p>


								<input type="hidden" name="quantity" value="1"
									class="form-control" /> <input type="hidden"
									name="hidden_image" value="${sp.anhSanPhamBase64}"> <input
									type="hidden" name="hidden_name" value="${sp.tenSanPham}" /> <input
									type="hidden" name="hidden_price" value="${sp.giaBan}" /> <input
									type="hidden" name="hidden_id" value="${sp.maSanPham}" />


								<button class="text-white"
									style="background: #f0532b; border: 0px; border-radius: 7px; padding: 10px;"
									type="button" data-bs-toggle="modal"
									data-bs-target="#exampleModal${sp.maSanPham}">Xem ngay</button>
								<div class="modal fade" id="exampleModal${sp.maSanPham}"
									tabindex="-1"
									aria-labelledby="exampleModalLabel${sp.maSanPham}"
									aria-hidden="true">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">
											<div class="modal-header">
												<h4 class="modal-title" id="exampleModalLabel">THÔNG
													TIN SẢN PHẨM</h4>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">
												<div class="row">
													<div class="col-md-6">

														<div class="mt-2 home-product ">
															<div id="nxt" class="carousel slide" data-bs-ride="true">
																<div id="thumbnail" class="carousel-indicators ">
																	<button type="button" data-bs-target="#nxt"
																		data-bs-slide-to="0" class="col-3 active tren"
																		aria-current="true" aria-label="Slide 1">
																		<img class="d-block  w-100"
																			src="data:image/jpeg;base64,${sp.anhSanPhamBase64}"
																			alt="${sp.tenSanPham}">
																	</button>
																</div>
																<div class="carousel-inner">
																	<div class="carousel-item active">
																		<div class="overflow-hidden">
																			<img class="d-block  w-100"
																				src="data:image/jpeg;base64,${sp.anhSanPhamBase64}"
																				alt="${sp.tenSanPham}">
																		</div>
																	</div>
																	<div class="carousel-item">
																		<div class="overflow-hidden">
																			<img src="images/size.png" class="d-block w-100"
																				alt="...">
																		</div>
																	</div>
																</div>
																<button class="carousel-control-prev" type="button"
																	data-bs-target="#nxt" data-bs-slide="prev">
																	<span class="carousel-control-prev-icon"
																		aria-hidden="true"></span> <span
																		class="visually-hidden">Previous</span>
																</button>
																<button class="carousel-control-next" type="button"
																	data-bs-target="#nxt" data-bs-slide="next">
																	<span class="carousel-control-next-icon"
																		aria-hidden="true"></span> <span
																		class="visually-hidden">Next</span>
																</button>
															</div>
														</div>

													</div>
													<div class="col-md-6">
														<div class="row text-start ">
															<p class="fs-4 tit_modal_p_3" style="padding-top: 30px;">
																<strong> <c:out value="${sp.tenSanPham}" />
																</strong>
															</p>
															<p class="fs-4" style="color: red;">
																<c:out value="${sp.giaBan}" />


																<sup>₫</sup> <span class="text-muted "
																	style="font-size: 15px">| Đã bán: <?php echo $slban['SoLuongDaBan'] ?>
																</span>


															</p>
														</div>
														<div class="row text-start " style="color: red;">
															<p class="fs-4 fw-bold icon_modal_p_3">
																<i class="fas fa-star"></i><i class="fas fa-star"></i><i
																	class="fas fa-star"></i><i class="fas fa-star"></i><i
																	class="fas fa-star"></i> <span class="text-muted"
																	style="font-size: 15px"> | <span
																	style="text-decoration-line: underline;">78</span> Đánh
																	giá
																</span>
															</p>
														</div>
														<div class="row text-start ">
															<p>
																<c:out value="${sp.moTaSanPham}" />
															</p>
														</div>
														<div class="row text-start mssp">
															<div class="row">
																<div class="col-sm-4">
																	<p>Kích thước:</p>
																</div>
																<div class="col-sm-6 size">
																	<div class="btn-group" role="group"
																		aria-label="Third group">
																		<button type="button" class="btn btn-danger"
																			style="width: 200px">
																			<c:out value="${sp.kichThuoc}" />
																		</button>
																	</div>
																</div>
															</div>
															<br>
															<div class="row"
																style="padding-top: 7px; margin-left: -12px;">
																<div class="col-sm-4">
																	<p>Số lượng:</p>
																</div>
																<div class="col-sm-3" style="margin-top: -5px;">
																	<input type="number" class="form-control"
																		id="inputnumber" value="1">
																	</p>
																</div>
															</div>
														</div>
														<div class="row text-start submit1">

															<div class="col-md-9">
																<div class="row">
																	<div class="col-6">
																		<div
																			onclick="displayInvoice(<?php echo $productId; ?>)"
																			class="table">
																			<button type="submit" name="btn-submit"
																				style="margin-top: 5px; padding: 7px; border-radius: 5px; border: 0"
																				class="btn-danger btn-submit">Xem chi tiết</button>
																		</div>
																	</div>
																	<div class="col-6">
																		<input type="submit" name="add_to_cart"
																			style="margin-top: 5px;" class="btn btn-success"
																			value="Thêm vào giỏ hàng"
																			onclick="addProductToCart('${sp.maSanPham}');" />
																	</div>
																</div>

																<div class="offcanvas offcanvas-end" tabindex="-1"
																	id="offcanvasRight"
																	aria-labelledby="offcanvasRightLabel">
																	<div class="offcanvas-header ">
																		<img src="images/logo.png" width="399" height="200"
																			class="offcanvas-title text-center"
																			id="offcanvasRightLabel">
																		<button type="button" class="btn-close"
																			data-bs-dismiss="offcanvas" aria-label="Close"></button>
																	</div>
																	<div class="offcanvas-body">
																		<div class="row text-center"></div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<jsp:include page="/view/footer.jsp"></jsp:include>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script
			src="http://localhost:8080/doanj2eequanlysmatphone/assetss/js/cart.js"></script>
</body>
</html>