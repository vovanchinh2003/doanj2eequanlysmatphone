package ModelNhanvien;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ModelKhachhang.Khachhang;

public class NhanvienModel {
	private Connection con;

	public NhanvienModel() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost/ql_ban_smatphon", "root", "chinh2003");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<Nhanvien> getAllNhanvien() throws SQLException {
		List<Nhanvien> nhanvineList = new ArrayList<>();
		PreparedStatement pst = con.prepareStatement("SELECT * FROM NhanVien");
		ResultSet rs = pst.executeQuery();
		while (rs.next()) {
			Nhanvien nhanvien = new Nhanvien();
			nhanvien.setMaNhanVien(rs.getInt("MaNhanVien"));
			nhanvien.setTenNhanVien(rs.getString("TenNhanVien"));
			nhanvien.setDiaChi(rs.getString("DiaChi"));
			nhanvien.setSoDienThoai(rs.getString("SoDienThoai"));
			nhanvien.setEmail(rs.getString("Email"));
			nhanvien.setVaiTro(rs.getString("VaiTro"));
			nhanvien.setTenDangNhap(rs.getString("TenDangNhap"));
			nhanvien.setMatKhau(rs.getString("MatKhau"));
			nhanvien.setAnh(rs.getBytes("anh")); // Assuming "anh" is stored as BLOB in the database

			nhanvineList.add(nhanvien);
		}
		rs.close();
		pst.close();
		return nhanvineList;
	}

}
