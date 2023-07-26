package ModelKhachhang;

import java.util.Arrays;

public class Khachhang {
    private int MaKhachHang;
    private String TenKhachHang;
    private String DiaChi;
    private String SoDienThoai;
    private String Email;
    private String VaiTro;
    private String tendangnhap;
    private String matkhau;
    private byte[] anh;
    private String anhSanPhamBase64;

    
    
    
	public String getAnhSanPhamBase64() {
		return anhSanPhamBase64;
	}
	public void setAnhSanPhamBase64(String anhSanPhamBase64) {
		this.anhSanPhamBase64 = anhSanPhamBase64;
	}
	public Khachhang() {
		super();
	}
	public Khachhang(int maKhachHang, String tenKhachHang, String diaChi, String soDienThoai, String email,
			String vaiTro, String tendangnhap, String matkhau, byte[] anh) {
		super();
		MaKhachHang = maKhachHang;
		TenKhachHang = tenKhachHang;
		DiaChi = diaChi;
		SoDienThoai = soDienThoai;
		Email = email;
		VaiTro = vaiTro;
		this.tendangnhap = tendangnhap;
		this.matkhau = matkhau;
		this.anh = anh;
	}
	public int getMaKhachHang() {
		return MaKhachHang;
	}
	public void setMaKhachHang(int maKhachHang) {
		MaKhachHang = maKhachHang;
	}
	public String getTenKhachHang() {
		return TenKhachHang;
	}
	public void setTenKhachHang(String tenKhachHang) {
		TenKhachHang = tenKhachHang;
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
	public String getVaiTro() {
		return VaiTro;
	}
	public void setVaiTro(String vaiTro) {
		VaiTro = vaiTro;
	}
	public String getTendangnhap() {
		return tendangnhap;
	}
	public void setTendangnhap(String tendangnhap) {
		this.tendangnhap = tendangnhap;
	}
	public String getMatkhau() {
		return matkhau;
	}
	public void setMatkhau(String matkhau) {
		this.matkhau = matkhau;
	}
	public byte[] getAnh() {
		return anh;
	}
	public void setAnh(byte[] anh) {
		this.anh = anh;
	}
	@Override
	public String toString() {
		return "Khachhang [MaKhachHang=" + MaKhachHang + ", TenKhachHang=" + TenKhachHang + ", DiaChi=" + DiaChi
				+ ", SoDienThoai=" + SoDienThoai + ", Email=" + Email + ", VaiTro=" + VaiTro + ", tendangnhap="
				+ tendangnhap + ", matkhau=" + matkhau + ", anh=" + Arrays.toString(anh) + "]";
	}

    
    
}
