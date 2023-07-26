package ModelDonhang;

import java.sql.Date;

public class Donhang {
	private int MaHoaDon;
	private Date NgayBan;
	private String TenKhachHang;
	private float TongGiaTri;
	private String trangThai;
	private String SoDienThoai;

	public Donhang() {
		super();
	}

	public Donhang(int maHoaDon, Date ngayBan, String tenKhachHang, float tongGiaTri, String trangThai,
			String soDienThoai) {
		super();
		MaHoaDon = maHoaDon;
		NgayBan = ngayBan;
		TenKhachHang = tenKhachHang;
		TongGiaTri = tongGiaTri;
		this.trangThai = trangThai;
		SoDienThoai = soDienThoai;
	}

	public int getMaHoaDon() {
		return MaHoaDon;
	}

	public void setMaHoaDon(int maHoaDon) {
		MaHoaDon = maHoaDon;
	}

	public Date getNgayBan() {
		return NgayBan;
	}

	public void setNgayBan(Date ngayBan) {
		NgayBan = ngayBan;
	}

	public String getTenKhachHang() {
		return TenKhachHang;
	}

	public void setTenKhachHang(String tenKhachHang) {
		TenKhachHang = tenKhachHang;
	}

	public float getTongGiaTri() {
		return TongGiaTri;
	}

	public void setTongGiaTri(float tongGiaTri) {
		TongGiaTri = tongGiaTri;
	}

	public String getTrangThai() {
		return trangThai;
	}

	public void setTrangThai(String trangThai) {
		this.trangThai = trangThai;
	}

	public String getSoDienThoai() {
		return SoDienThoai;
	}

	public void setSoDienThoai(String soDienThoai) {
		SoDienThoai = soDienThoai;
	}

	@Override
	public String toString() {
		return "Donhang [MaHoaDon=" + MaHoaDon + ", NgayBan=" + NgayBan + ", TenKhachHang=" + TenKhachHang
				+ ", TongGiaTri=" + TongGiaTri + ", trangThai=" + trangThai + ", SoDienThoai=" + SoDienThoai + "]";
	}

}
