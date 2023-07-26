package ModelSanphamm;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SanphamModel {
	private Connection con;
	public SanphamModel() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost/ql_ban_smatphon", "root", "chinh2003");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<Sanpham> getAllSanpham() throws SQLException {
		List<Sanpham> sanphamList = new ArrayList<>();
		PreparedStatement pst = con.prepareStatement("select * from SanPham");
		ResultSet rs = pst.executeQuery();
		while (rs.next()) {
			Sanpham sanpham = new Sanpham();
			sanpham.setMaSanPham(rs.getInt("MaSanPham"));
			sanpham.setTenSanPham(rs.getString("TenSanPham"));
			sanpham.setGiaBan(rs.getDouble("GiaBan"));
			sanpham.setSoLuongTrongKho(rs.getInt("SoLuongTrongKho"));
			sanpham.setMoTaSanPham(rs.getString("MoTaSanPham"));
			sanpham.setAnhSanPham(rs.getBytes("AnhSanPham"));
			sanpham.setKichThuoc(rs.getString("Kichthuoc"));
			sanpham.setTrongLuongSanPham(rs.getString("Trongluongsanpham"));
			sanpham.setDienTichManHinh(rs.getString("Dientichmanhinh"));
			sanpham.setRam(rs.getString("Ram"));
			sanpham.setDungLuongPin(rs.getString("Dungluongpin"));
			sanpham.setThoiGianBaoHanh(rs.getString("Thoigianbaohang"));
			sanpham.setMaNhaSanXuat(rs.getInt("MaNhaSanXuat"));
			sanphamList.add(sanpham);
		}
		rs.close();
		pst.close();
		return sanphamList;
	}
}
