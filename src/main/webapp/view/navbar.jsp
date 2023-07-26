<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<header>
	<div class="header">
		<div class="row text-center" style="padding-top: 5px;">
			<div class="col-4 text-start" style="padding-left: 60px">
				<a href="">Kênh người bán</a>| <a href="">Tải ứng dụng</a>| <a
					href="">Kết nối</a> <a href=""><i class="fab fa-facebook"></i></a>
				<a href=""><i class="fab fa-instagram"></i></a>
			</div>
			<div class="col-4"></div>
			<div class="col-4 text-end" style="padding-right: 60px">
				<div class="row">
					<div class="col-12">
						<a href=""><i class="far fa-bell"></i> Thông báo</a>| <a href=""><i
							class="far fa-question-circle"></i> Hỗ trợ</a>|
						<%-- Check if the user is logged in and show the appropriate content --%>
						<%
						if (session.getAttribute("username") != null) {
						%>
						<%
						String username = (String) session.getAttribute("username");
						String userRole = (String) session.getAttribute("userRole");
						String TenNhanVien = (String) session.getAttribute("TenNhanVien");
						byte[] anh = (byte[]) session.getAttribute("anh");
						if (anh != null && anh.length > 0) {
						%>
						<a class="settings-icon" onclick="settingsMenuToggle()"
							href="javascript:void(0);"> <img style="border-radius: 50px;"
							width="6%"
							src="data:image/jpeg;base64,<%=org.apache.commons.codec.binary.Base64.encodeBase64String(anh)%>"
							alt="">
						</a>
						<%
						}
						%>
						<%
						} else {
						%>
						<a data-bs-toggle="offcanvas" href="#offcanvasExample1"
							role="button" aria-controls="offcanvasExample"><i
							class="far fa-user"></i> Đăng nhập </a>
						<%
						}
						%>
					</div>
				</div>
				<%-- Rest of the body content --%>
				<div class="settings-menu">
					<div id="dark-btn">
						<span></span>
					</div>
					<div class="settings-menu-inner">
						<%-- Add your settings menu content here --%>
						<%-- For example: --%>
						<div class="user-profile">
							<%-- Check if the user is logged in and display their profile info --%>
							<%
							if (session.getAttribute("username") != null) {
							%>
							<%
							String username = (String) session.getAttribute("username");
							String userRole = (String) session.getAttribute("userRole");
							String TenKhachHang = (String) session.getAttribute("TenKhachHang");
							byte[] anh = (byte[]) session.getAttribute("anh");
							%>
							<img style="border-radius: 50px;"
								src="data:image/jpeg;base64,<%=org.apache.commons.codec.binary.Base64.encodeBase64String(anh)%>"
								alt="">
							<p style="color: #000;"><%=TenKhachHang%></p>
							<%-- Add other profile information if needed --%>
							<%
							}
							%>
						</div>
						<hr>
						<div class="settings-links">
							<%-- Add your settings links here --%>
							<%-- For example: --%>
							<a
								href="http://localhost/DOANPHPMYSQL_2023/admin/category/donhangcuakhachh.php">Xem
								đơn hàng của mình<i class='bx bxs-chevron-right'></i>
							</a>
						</div>
						<hr>
						<div class="settings-links">
							<%-- Add logout link here --%>
							<%-- For example: --%>
							<form
								action="http://localhost:8080/doanj2eequanlysmatphone/logoutServlet"
								method="post">
								<input type="submit" value="Đăng xuất">
							</form>
						</div>
					</div>
				</div>


				<form
					action="http://localhost:8080/doanj2eequanlysmatphone/loginServlet"
					method="post" class="offcanvas  offcanvas-end needs-validation"
					tabindex="-1" id="offcanvasExample1"
					aria-labelledby="offcanvasExampleLabel" novalidate>
					<div class="offcanvas-header" style="background-color: #ee4d2d;">
						<h5 class="offcanvas-title" id="offcanvasExampleLabel">
							<div style="margin-bottom: -30px;" class="title">
								<p
									style="font-size: 25px; margin-left: 110px; margin-bottom: 10px;"
									class="text-center">Đăng nhập</p>
								<hr style="margin-left: 110px;">
							</div>
						</h5>
						<button type="button" class="btn-close"
							data-bs-dismiss="offcanvas" aria-label="Close"></button>
					</div>
					<div class="offcanvas-body">
						<div class="row">
							<div class="logo" style="padding-bottom: 20px">
								<a href=""><img style="width: 370px; height: 170px"
									src="images/logo.png"></a>
							</div>
						</div>
						<!----login --->
						<div class="form-group">
							<i class="far fa-user"></i> <input type="text"
								Username="username" name="username" class="form-input"
								placeholder="Tên đăng nhập">
						</div>
						<div class="form-group">
							<i class="fas fa-lock"></i> <input type="password"
								password="password" name="password" class="form-input"
								placeholder="Mật khẩu">
							<div id="eye">
								<i class="far fa-eye"></i>
							</div>
						</div>
						<input type="submit" value="Đăng nhập" class="form-submit">
						<br> <br>
						<div class="singnup-link">
							Bạn chưa có tài khoản ? <a style="color: blue;"
								href="http://localhost/DOANPHPMYSQL_2023/admin/account/singup.php">Đăng
								ký</a>
						</div>
						<style>
.hidden-data {
	display: none;
}
</style>
						<style>
#wrapper {
	min-height: 60vh;
	display: flex;
	justify-content: center;
	align-items: center;
}

#form-login {
	max-width: 400px;
	background: rgba(0, 0, 0, 0.8);
	flex-grow: 1;
	padding: 30px 30px 40px;
	box-shadow: 0px 0px 17px 2px rgba(255, 255, 255, 0.8);
}

.form-heading {
	font-size: 25px;
	color: #f5f5f5;
	text-align: center;
	margin-bottom: 30px;
}

.form-group {
	border-bottom: 1px solid red;
	margin-top: 15px;
	margin-bottom: 40px;
	display: flex;
}

.form-group i {
	color: red;
	font-size: 14px;
	padding-top: 5px;
	padding-right: 10px;
}

.form-input {
	background: transparent;
	border: 0;
	outline: 0;
	color: red;
	flex-grow: 1;
}

.form-input::placeholder {
	color: red;
}

#eye i {
	padding-right: 0;
	cursor: pointer;
}

.form-submit {
	background: transparent;
	border: 1px solid #f5f5f5;
	color: red;
	width: 100%;
	text-transform: uppercase;
	padding: 6px 10px;
	transition: 0.25s ease-in-out;
	/* margin-top: 30px; */
}

.form-submit:hover {
	border: 1px solid #54a0ff;
}
</style>
					</div>
				</form>
			</div>
		</div>
	</div>
	<hr>
	</div>
	<div class="row">
		<div class="col-2 logo_1">
			<a href="http://localhost:8080/quanlysmatphonee/hOME"><img
				src="../../../images/logo/logo.svg" width="300px"></a>
		</div>
		<div class="col-8">
			<nav class="navbar">
				<form class="container-fluid" method="post">
					<div class="input-group">
						<input class="form-control" type="text" name="searchTerm"
							placeholder="Nhập từ khóa tìm kiếm">
						<button type="submit" name="search" class="btn btn-primary"
							id="search-button">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                    <path
									d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                                </svg>
						</button>
					</div>
				</form>
			</nav>
			<h6>Chính !!</h6>
		</div>
		<div class="col-2 buy">
			<a href="http://localhost:8080/doanj2eequanlysmatphone/cart"
				align="left"><i class="fas fa-shopping-cart"></i></a>

		</div>
	</div>
	</div>
	<div class="header2">
		<div class="row">
			<div class=" col-md-2">
				<div class="btn_menu_cate">
					<div class="btn-group">
						<button class="btn" type="button" id="dropdownMenuButton"
							data-bs-toggle="dropdown" aria-expanded="false">
							<span style="font-weight: bolder;"><i class="fa fa-bars"></i>
								NHÀ SẢN XUẤT</span>
						</button>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
							<div class="danhmuc">
								<div class="btn-group-vertical" role="group"
									aria-label="Vertical button group">
									<button type="button" class="btn text-start">TẤT CẢ
										NHÀ SẢN XUẤT</button>
									<button type="button" class="btn text-start">
										Hot Deal <img src="images/Flame-rev.gif" width="20px">
									</button>
									<?php
                                        include "../connect/config_oop.php";
                                        $sql = "SELECT * FROM NhaSanXuat ";
                                        $result = mysqli_query($conn, $sql);
                                        if (mysqli_num_rows($result) > 0) {
                                            while ($row = mysqli_fetch_assoc($result)) {
                                                $TenNhaSanXuat = $row["TenNhaSanXuat"];
                                                ?>
									<button type="button" class="btn text-start">
										<?php echo $TenNhaSanXuat ?>
									</button>
									<?php }
                                        }
                                        ?>
								</div>
							</div>
						</ul>
					</div>
				</div>
			</div>
			<div class=" col-md-10">
				<a href="http://localhost:8080/doanj2eequanlysmatphone/hOME">Trang
					Chủ</a> <a href="">Giới Thiệu</a> <a href="">Sản Phẩm</a> <a href="">Kinh
					Nghiệm</a> <a href="">Khuyến Mãi</a> <a href="">Liên Hệ</a>
			</div>
		</div>
	</div>
</header>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script
	src="http://localhost:8080/doanj2eequanlysmatphone/assetss/js/admin.js"></script>
<script>
	$(document).ready(function() {
		$('#eye').click(function() {
			$(this).toggleClass('open');
			$(this).children('i').toggleClass('fa-eye-slash fa-eye');
			if ($(this).hasClass('open')) {
				$(this).prev().attr('type', 'text');
			} else {
				$(this).prev().attr('type', 'password');
			}
		});
	});
</script>

