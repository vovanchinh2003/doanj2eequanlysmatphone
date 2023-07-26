<%@page import="org.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="add.jsp"%>

<%
// Create a database connection
String dbUrl = "jdbc:mysql://localhost:3306/ql_ban_smatphon";
String dbUsername = "root";
String dbPassword = "chinh2003";
Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
try {
	int makh = 11;
	String dia_chi = request.getParameter("DiaChi");
	String so_dien_thoai = request.getParameter("SoDienThoai");
	String email = request.getParameter("Email");
	double productTotal = Double.parseDouble(request.getParameter("cart_total_input"));

	// Update customer information
	String sqls = "UPDATE khachhang SET  DiaChi=?, SoDienThoai=?, Email=? WHERE MaKhachHang=?";
	PreparedStatement stmtCustomer = conn.prepareStatement(sqls);
	stmtCustomer.setString(1, dia_chi);
	stmtCustomer.setString(2, so_dien_thoai);
	stmtCustomer.setString(3, email);
	stmtCustomer.setInt(4, makh);
	stmtCustomer.executeUpdate();

	// Tạo hóa đơn mới
	java.util.Date currentDate = new java.util.Date();
	Timestamp timestamp = new Timestamp(currentDate.getTime());
	String date = timestamp.toString();

	String sql = "INSERT INTO hoadon (NgayBan, MaKhachHang, TongGiaTri, TrangThai) VALUES (?, ?, ?, 'Đang giao hàng')";
	PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
	stmt.setString(1, date);
	stmt.setInt(2, makh);
	stmt.setDouble(3, productTotal);
	stmt.executeUpdate();

	// Retrieve the generated MaHoaDon
	ResultSet generatedKeys = stmt.getGeneratedKeys();
	while (generatedKeys.next()) {
		int maHoaDon = generatedKeys.getInt(1);

		// Lấy giỏ hàng từ Cookie
		String cartCookie = request.getHeader("cart");
		JSONObject cart = new JSONObject(cartCookie);

		for (Object key : cart.keySet()) {
	String productName = key.toString();
	JSONObject product = cart.getJSONObject(productName);
	double productPrice = product.getDouble("price");
	int productQuantity = product.getInt("quantity");
	double productTotals = productQuantity * productPrice;

	// Get MaSanPham from the database based on the productName
	String sqll = "SELECT MaSanPham FROM sanpham WHERE TenSanPham = ?";
	PreparedStatement stmtProduct = conn.prepareStatement(sqll);
	stmtProduct.setString(1, productName);
	ResultSet rs = stmtProduct.executeQuery();
	while (rs.next()) {
		int maSanPham = rs.getInt("MaSanPham");
		// Insert into chitiethoadon tablef
		String sqlct = "INSERT INTO ChiTietHoaDon (MaSanPham, MaHoaDon, SoLuongBan, GiaBan,Thanhtien) VALUES (?, ?, ?, ?, ?)";
		PreparedStatement stmtCT = conn.prepareStatement(sqlct);
		stmtCT.setInt(1, maSanPham);
		stmtCT.setInt(2, maHoaDon);
		stmtCT.setInt(3, productQuantity);
		stmtCT.setDouble(4, productPrice);
		stmtCT.setDouble(5, productTotals);
		stmtCT.executeUpdate();
	}
		}
	}

	// Xóa dữ liệu trong cookie khi nhấn vào nút thanh toán
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (Cookie cookie : cookies) {
	if (cookie.getName().equals("cart")) {
		cookie.setMaxAge(0);
		cookie.setPath("/");
		response.addCookie(cookie);
		break;
	}
		}
	}

	conn.close();
} catch (Exception e) {
	e.printStackTrace();
}
%>
