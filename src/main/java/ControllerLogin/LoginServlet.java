package ControllerLogin;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String url = "jdbc:mysql://localhost:3306/ql_ban_smatphon";
	private final String username = "root";
	private final String password = "chinh2003";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	private String md5Hash(String input) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(input.getBytes());
			byte[] digest = md.digest();
			StringBuilder sb = new StringBuilder();
			for (byte b : digest) {
				sb.append(String.format("%02x", b & 0xff));
			}
			return sb.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection(url, username, password);
			String user = request.getParameter("username");
			String hashedPassword = request.getParameter("password");
			String pass = md5Hash(hashedPassword);

			PreparedStatement empStmt = conn
					.prepareStatement("SELECT VaiTro,TenNhanVien,anh  FROM NhanVien WHERE TenDangNhap=? AND MatKhau=?");
			empStmt.setString(1, user);
			empStmt.setString(2, pass);
			ResultSet empRs = empStmt.executeQuery();

			PreparedStatement custStmt = conn.prepareStatement(
					"SELECT MaKhachHang,VaiTro,TenKhachHang,DiaChi,SoDienThoai,Email,anh FROM khachhang WHERE TenDangNhap=? AND MatKhau=?");
			custStmt.setString(1, user);
			custStmt.setString(2, pass);
			ResultSet custRs = custStmt.executeQuery();
			// Check the results and perform appropriate actions
			if (empRs.next()) {
				if (empRs.getString("VaiTro").equals("Quản Lý")) {
					// Forward the manager to the homepage
					byte[] anh = empRs.getBytes("anh");
					HttpSession session = request.getSession();
					session.setAttribute("username", user);
					session.setAttribute("userRole", "Quản Lý");
					session.setAttribute("TenNhanVien", empRs.getString("TenNhanVien"));
					session.setAttribute("anh", anh);
					request.setAttribute("userRole", "Quản Lý");
					// Redirect to the NhaSanXuatController servlet
					response.sendRedirect(request.getContextPath() + "/sanphamCoontroller");
					return;
				}
			} else if (custRs.next()) {
				if (custRs.getString("VaiTro").equals("Khách Hàng")) {
					// Display login failed message for customers
					byte[] anh = custRs.getBytes("anh");
					HttpSession session = request.getSession();
					session.setAttribute("username", user);
					session.setAttribute("MaKhachHang", custRs.getInt("MaKhachHang"));
					session.setAttribute("userRole", "Khách Hàng");
					session.setAttribute("TenKhachHang", custRs.getString("TenKhachHang"));
					session.setAttribute("DiaChi", custRs.getString("DiaChi"));
					session.setAttribute("SoDienThoai", custRs.getString("SoDienThoai"));
					session.setAttribute("Email", custRs.getString("Email"));
					session.setAttribute("anh", anh);

					response.sendRedirect(request.getContextPath() + "/hOME");

				}
			} else {
				// If the user does not exist in the database, show an error message and link
				// back to the login page
				response.sendRedirect(request.getContextPath() + "/login.jsp?error=1");
				return;

			}
			if (empRs != null) {
				empRs.close();
			}
			if (empStmt != null) {
				empStmt.close();
			}
			if (custRs != null) {
				custRs.close();
			}
			if (custStmt != null) {
				custStmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
