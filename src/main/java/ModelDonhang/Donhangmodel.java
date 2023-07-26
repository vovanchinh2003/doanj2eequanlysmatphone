package ModelDonhang;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Donhangmodel {
	private Connection con;

	public Donhangmodel() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost/ql_ban_smatphon", "root", "chinh2003");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<Donhang> getAllDonhang() throws SQLException {
		List<Donhang> donhanglList = new ArrayList<>();
		PreparedStatement pst = con.prepareStatement(
				"SELECT hoadon.MaHoaDon, khachhang.TenKhachHang, khachhang.SoDienThoai, hoadon.TongGiaTri, hoadon.NgayBan, hoadon.trangthai "
						+ "FROM hoadon " + "LEFT JOIN khachhang ON hoadon.MaKhachHang = khachhang.MaKhachHang "
						+ "WHERE hoadon.trangthai NOT IN ('Đã huỷ', 'Đã giao hàng') " + "ORDER BY MaHoaDon DESC");
		ResultSet rs = pst.executeQuery();
		while (rs.next()) {
			Donhang donhang = new Donhang();
			donhang.setMaHoaDon(rs.getInt("MaHoaDon"));
			donhang.setNgayBan(rs.getDate("NgayBan"));
			donhang.setTenKhachHang(rs.getString("TenKhachHang"));
			donhang.setTongGiaTri(rs.getFloat("TongGiaTri"));
			donhang.setTrangThai(rs.getString("trangthai")); // Corrected column name to "trangthai"
			donhang.setSoDienThoai(rs.getString("SoDienThoai"));
			donhanglList.add(donhang);
		}
		rs.close();
		pst.close();
		return donhanglList;
	}

	public List<Chitiethoadon> getAllCTDonhang(int maHoaDon) throws SQLException {
		List<Chitiethoadon> chitietdonhanglList = new ArrayList<>();
		PreparedStatement pst = con.prepareStatement(
				"SELECT chitiethoadon.MaHoaDon, chitiethoadon.MaChiTietHoaDon, sanpham.TenSanPham, SoLuongBan, sanpham.GiaBan, chitiethoadon.GiaBan, chitiethoadon.thanhtien "
						+ "FROM chitiethoadon " + "LEFT JOIN sanpham ON chitiethoadon.MaSanPham = sanpham.MaSanPham "
						+ "WHERE MaHoaDon = ?");
		pst.setInt(1, maHoaDon); // Set the value of the MaHoaDon parameter
		ResultSet rs = pst.executeQuery();
		while (rs.next()) {
			Chitiethoadon chitietdonhang = new Chitiethoadon();
			chitietdonhang.setMaChiTietHoaDon(rs.getInt("MaChiTietHoaDon"));
			chitietdonhang.setTenSanPham(rs.getString("TenSanPham"));
			chitietdonhang.setSoLuongBan(rs.getInt("SoLuongBan"));
			chitietdonhang.setGiaBan(rs.getFloat("GiaBan"));
			chitietdonhang.setThanhtien(rs.getFloat("thanhtien"));
			chitietdonhanglList.add(chitietdonhang);
		}
		rs.close();
		pst.close();
		return chitietdonhanglList;
	}
	
	public static void main(String[] args ) throws SQLException {
		Donhangmodel dao = new Donhangmodel();
		List<Chitiethoadon> li = dao.getAllCTDonhang(37);
		for(Chitiethoadon o : li) {
			System.out.println(o);
		}
	}
}
