package ModelDonhang;

public class Chitiethoadon {
	private int MaChiTietHoaDon,SoLuongBan,MaHoaDon;
	private String TenSanPham;
	private float GiaBan,Thanhtien;
	public Chitiethoadon() {
		super();
	}
	public Chitiethoadon(int maChiTietHoaDon, int soLuongBan, int maHoaDon, String tenSanPham, float giaBan,
			float thanhtien) {
		super();
		MaChiTietHoaDon = maChiTietHoaDon;
		SoLuongBan = soLuongBan;
		MaHoaDon = maHoaDon;
		TenSanPham = tenSanPham;
		GiaBan = giaBan;
		Thanhtien = thanhtien;
	}
	public int getMaChiTietHoaDon() {
		return MaChiTietHoaDon;
	}
	public void setMaChiTietHoaDon(int maChiTietHoaDon) {
		MaChiTietHoaDon = maChiTietHoaDon;
	}
	public int getSoLuongBan() {
		return SoLuongBan;
	}
	public void setSoLuongBan(int soLuongBan) {
		SoLuongBan = soLuongBan;
	}
	public int getMaHoaDon() {
		return MaHoaDon;
	}
	public void setMaHoaDon(int maHoaDon) {
		MaHoaDon = maHoaDon;
	}
	public String getTenSanPham() {
		return TenSanPham;
	}
	public void setTenSanPham(String tenSanPham) {
		TenSanPham = tenSanPham;
	}
	public float getGiaBan() {
		return GiaBan;
	}
	public void setGiaBan(float giaBan) {
		GiaBan = giaBan;
	}
	public float getThanhtien() {
		return Thanhtien;
	}
	public void setThanhtien(float thanhtien) {
		Thanhtien = thanhtien;
	}
	
	
}
