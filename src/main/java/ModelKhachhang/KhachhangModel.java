package ModelKhachhang;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class KhachhangModel {
	private Connection con;

	public KhachhangModel() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost/ql_ban_smatphon", "root", "chinh2003");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<Khachhang> getAllKhachhang() throws SQLException {
		List<Khachhang> khachhangList = new ArrayList<>();
		PreparedStatement pst = con.prepareStatement("SELECT * FROM KhachHang");
		ResultSet rs = pst.executeQuery();
		while (rs.next()) {
			Khachhang khachhang = new Khachhang();
			khachhang.setMaKhachHang(rs.getInt("MaKhachHang"));
			khachhang.setTenKhachHang(rs.getString("TenKhachHang"));
			khachhang.setDiaChi(rs.getString("DiaChi"));
			khachhang.setSoDienThoai(rs.getString("SoDienThoai"));
			khachhang.setEmail(rs.getString("Email"));
			khachhang.setVaiTro(rs.getString("VaiTro"));
			khachhang.setTendangnhap(rs.getString("tendangnhap"));
			khachhang.setMatkhau(rs.getString("matkhau"));
			khachhang.setAnh(rs.getBytes("anh")); // Assuming "anh" is stored as BLOB in the database

			khachhangList.add(khachhang);
		}
		rs.close();
		pst.close();
		return khachhangList;
	}

}
