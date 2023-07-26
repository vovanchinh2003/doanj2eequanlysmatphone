package ModelNhanvien;

public class Nhanvien {
	private int MaNhanVien;
	private String TenNhanVien;
	private String DiaChi, SoDienThoai, Email, TenDangNhap, MatKhau, VaiTro;
	private byte[] anh;
	private String anhSanPhamBase64;
	public Nhanvien() {
		super();
	}
	public Nhanvien(int maNhanVien, String tenNhanVien, String diaChi, String soDienThoai, String email,
			String tenDangNhap, String matKhau, String vaiTro, byte[] anh, String anhSanPhamBase64) {
		super();
		MaNhanVien = maNhanVien;
		TenNhanVien = tenNhanVien;
		DiaChi = diaChi;
		SoDienThoai = soDienThoai;
		Email = email;
		TenDangNhap = tenDangNhap;
		MatKhau = matKhau;
		VaiTro = vaiTro;
		this.anh = anh;
		this.anhSanPhamBase64 = anhSanPhamBase64;
	}
	public int getMaNhanVien() {
		return MaNhanVien;
	}
	public void setMaNhanVien(int maNhanVien) {
		MaNhanVien = maNhanVien;
	}
	public String getTenNhanVien() {
		return TenNhanVien;
	}
	public void setTenNhanVien(String tenNhanVien) {
		TenNhanVien = tenNhanVien;
	}
	public String getDiaChi() {
		return DiaChi;
	}
	public void setDiaChi(String diaChi) {
		DiaChi = diaChi;
	}
	public String getSoDienThoai() {
		return SoDienThoai;
	}
	public void setSoDienThoai(String soDienThoai) {
		SoDienThoai = soDienThoai;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getTenDangNhap() {
		return TenDangNhap;
	}
	public void setTenDangNhap(String tenDangNhap) {
		TenDangNhap = tenDangNhap;
	}
	public String getMatKhau() {
		return MatKhau;
	}
	public void setMatKhau(String matKhau) {
		MatKhau = matKhau;
	}
	public String getVaiTro() {
		return VaiTro;
	}
	public void setVaiTro(String vaiTro) {
		VaiTro = vaiTro;
	}
	public byte[] getAnh() {
		return anh;
	}
	public void setAnh(byte[] anh) {
		this.anh = anh;
	}
	public String getAnhSanPhamBase64() {
		return anhSanPhamBase64;
	}
	public void setAnhSanPhamBase64(String anhSanPhamBase64) {
		this.anhSanPhamBase64 = anhSanPhamBase64;
	}
	
	
}
