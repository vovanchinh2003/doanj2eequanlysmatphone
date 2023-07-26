<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="org.apache.commons.codec.binary.Base64"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/doanj2eequanlysmatphone/assetss/css/admin.css">
</head>
<body>
	<%
	if (session.getAttribute("username") == null) {
		// Redirect to the login page
		response.sendRedirect(request.getContextPath() + "/hOME");
	}
	%>
	<div class="containesr">
		<div class="navigation">
			<ul>
				<li><a href="#"> <span class="icon"><i
							class='bx bxl-android'></i></span> <span class="title">Brand Name</span>
				</a></li>
				<li><a
					href="http://localhost/DOANPHPMYSQL_2023/admin/view/category/dashboard.php">
						<span class="icon"><i class='bx bx-home'></i></span> <span
						class="title">Dashboard</span>
				</a></li>
				<li><a
					href="http://localhost/DOANPHPMYSQL_2023/admin/view/category/dashboard_nhasanxuat.php">
						<span class="icon"><i class='bx bxl-product-hunt'></i></span> <span
						class="title">Nhà sản xuất</span>
				</a></li>
				<li><a
					href="http://localhost/DOANPHPMYSQL_2023/admin/view/category/dashboard_sanpham.php">
						<span class="icon"><i class='bx bxl-product-hunt'></i></span> <span
						class="title">Sản phẩm</span>
				</a></li>
				<li><a
					href="http://localhost/DOANPHPMYSQL_2023/admin/view/category/dashboard_khachhang.php">
						<span class="icon"><i class='bx bxs-user-account'></i></span> <span
						class="title">Khách hàng</span>
				</a></li>
				<li><a
					href="http://localhost/DOANPHPMYSQL_2023/admin/view/category/dashboard_nhanvien.php">
						<span class="icon"><i class='bx bx-food-menu'></i></span> <span
						class="title">Nhân viên</span>
				</a></li>
				<li><a
					href="http://localhost/DOANPHPMYSQL_2023/admin/view/category/dashboard_donhang.php">
						<span class="icon"><i class='bx bx-captions'></i></span> <span
						class="title">Đơn hàng</span>
				</a></li>
				<li><a
					href="http://localhost/DOANPHPMYSQL_2023/admin/view/category/dashboard_phanhoi.php">
						<span class="icon"><i class='bx bx-message'></i></span> <span
						class="title">Phản hồi</span>
				</a></li>
			</ul>
		</div>



		<div class="main">
			<div class="topbar">
				<div class="toggle">
					<i class='bx bx-menu'></i>
				</div>
				<div class="search">
					<label> <input type="text" placeholder="Search...">
						<i class='bx bx-search-alt-2'></i>
					</label>
				</div>
				<div class="letters">
					<a href="#"><i class='bx bx-envelope'></i><sup>9</sup></a> <a
						href="#"><i class='bx bx-bell'></i><sup class="total-count"
						data-count='0'></sup></a>
				</div>
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
				<div class="user">

					<a class="settings-icon" onclick="settingsMenuToggle()"
						href="javascript:void(0);"> <img style="border-radius: 50px;"
						width="10%"
						src="data:image/jpeg;base64,<%=org.apache.commons.codec.binary.Base64.encodeBase64String(anh)%>"
						alt="">
					</a>
				</div>
				<%
				}
				}
				%>

				<div class="settings-menu">
					<div id="dark-btn">
						<span></span>
					</div>
					<div class="settings-menu-inner">
						<div class="user-profile">
							<%
							if (session.getAttribute("username") != null) {
							%>
							<%
							String username = (String) session.getAttribute("username");
							String userRole = (String) session.getAttribute("userRole");
							String TenNhanVien = (String) session.getAttribute("TenNhanVien");
							byte[] anh = (byte[]) session.getAttribute("anh");
							%>
							<img style="border-radius: 50px;"
								src="data:image/jpeg;base64,<%=org.apache.commons.codec.binary.Base64.encodeBase64String(anh)%>"
								alt="">
							<p style="color: #000;"><%=TenNhanVien%></p>
							<%-- Add other profile information if needed --%>
							<%
							}
							%>
						</div>
						<!-- <div class="settings-links">
                            <form action="http://localhost/DOANPHPMYSQL_2023/admin/account/logout.php" method="POST">
                                <div class="fas fa-sign-out-alt"></div>
                                <span><input type="submit" value="Logout"></span>
                            </form>
                        </div> -->
						<hr>
						<div class="settings-links">
							<a
								href="http://localhost/DOANPHPMYSQL_2023/admin/view/category/dashboard_thongtintaikhoan.php">Xem
								thông tin tài khoản<i class='bx bxs-chevron-right'></i>
							</a>
						</div>
						<hr>
						<div class="settings-links">
							<i class='bx bx-log-in icon'></i> <a
								href="http://localhost/DOANPHPMYSQL_2023/admin/account/logout.php">Logout<i
								class='bx bxs-chevron-right'></i></a>
						</div>
					</div>
				</div>

			</div>

			<div style="padding: 22px 32px;">
				<div class="text">
					<%@ include file="/list/list_sanpham.jsp"%>
				</div>
			</div>
		</div>
	</div>
</body>
<script
	src="http://localhost:8080/doanj2eequanlysmatphone/assetss/js/admin.js"></script>

<script language="Javascript" src="js/giohang.js"></script>
<script>
    /// toggle///
    let toggle = document.querySelector('.toggle');
    let navigation = document.querySelector('.navigation');
    let main = document.querySelector('.main');

    toggle.onclick = function () {
        navigation.classList.toggle('active')
        main.classList.toggle('active')
    }

    /////
    let list = document.querySelectorAll('.navigation li');

    function activeLink() {
        list.forEach((item) =>
            item.classList.remove('hovered'));
        this.classList.add('hovered');
    }
    list.forEach((item) =>
        item.addEventListener('mouseover', activeLink));
</script>

</html>