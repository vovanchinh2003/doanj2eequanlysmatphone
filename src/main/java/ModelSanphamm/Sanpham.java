package ModelSanphamm;

import java.util.Arrays;

public class Sanpham {
	private int maSanPham;
	private String tenSanPham;
	private double giaBan;
	private int soLuongTrongKho;
	private String moTaSanPham;
	private byte[] anhSanPham;
	private String kichThuoc;
	private String trongLuongSanPham;
	private String dienTichManHinh;
	private String ram;
	private String dungLuongPin;
	private String thoiGianBaoHanh;
	private int maNhaSanXuat;
    private String anhSanPhamBase64;
	public Sanpham(int maSanPham, String tenSanPham, double giaBan, int soLuongTrongKho, String moTaSanPham,
			byte[] anhSanPham, String kichThuoc, String trongLuongSanPham, String dienTichManHinh, String ram,
			String dungLuongPin, String thoiGianBaoHanh, int maNhaSanXuat, String anhSanPhamBase64) {
		super();
		this.maSanPham = maSanPham;
		this.tenSanPham = tenSanPham;
		this.giaBan = giaBan;
		this.soLuongTrongKho = soLuongTrongKho;
		this.moTaSanPham = moTaSanPham;
		this.anhSanPham = anhSanPham;
		this.kichThuoc = kichThuoc;
		this.trongLuongSanPham = trongLuongSanPham;
		this.dienTichManHinh = dienTichManHinh;
		this.ram = ram;
		this.dungLuongPin = dungLuongPin;
		this.thoiGianBaoHanh = thoiGianBaoHanh;
		this.maNhaSanXuat = maNhaSanXuat;
		this.anhSanPhamBase64 = anhSanPhamBase64;
	}
	public Sanpham() {
		super();
	}
	public int getMaSanPham() {
		return maSanPham;
	}
	public void setMaSanPham(int maSanPham) {
		this.maSanPham = maSanPham;
	}
	public String getTenSanPham() {
		return tenSanPham;
	}
	public void setTenSanPham(String tenSanPham) {
		this.tenSanPham = tenSanPham;
	}
	public double getGiaBan() {
		return giaBan;
	}
	public void setGiaBan(double giaBan) {
		this.giaBan = giaBan;
	}
	public int getSoLuongTrongKho() {
		return soLuongTrongKho;
	}
	public void setSoLuongTrongKho(int soLuongTrongKho) {
		this.soLuongTrongKho = soLuongTrongKho;
	}
	public String getMoTaSanPham() {
		return moTaSanPham;
	}
	public void setMoTaSanPham(String moTaSanPham) {
		this.moTaSanPham = moTaSanPham;
	}
	public byte[] getAnhSanPham() {
		return anhSanPham;
	}
	public void setAnhSanPham(byte[] anhSanPham) {
		this.anhSanPham = anhSanPham;
	}
	public String getKichThuoc() {
		return kichThuoc;
	}
	public void setKichThuoc(String kichThuoc) {
		this.kichThuoc = kichThuoc;
	}
	public String getTrongLuongSanPham() {
		return trongLuongSanPham;
	}
	public void setTrongLuongSanPham(String trongLuongSanPham) {
		this.trongLuongSanPham = trongLuongSanPham;
	}
	public String getDienTichManHinh() {
		return dienTichManHinh;
	}
	public void setDienTichManHinh(String dienTichManHinh) {
		this.dienTichManHinh = dienTichManHinh;
	}
	public String getRam() {
		return ram;
	}
	public void setRam(String ram) {
		this.ram = ram;
	}
	public String getDungLuongPin() {
		return dungLuongPin;
	}
	public void setDungLuongPin(String dungLuongPin) {
		this.dungLuongPin = dungLuongPin;
	}
	public String getThoiGianBaoHanh() {
		return thoiGianBaoHanh;
	}
	public void setThoiGianBaoHanh(String thoiGianBaoHanh) {
		this.thoiGianBaoHanh = thoiGianBaoHanh;
	}
	public int getMaNhaSanXuat() {
		return maNhaSanXuat;
	}
	public void setMaNhaSanXuat(int maNhaSanXuat) {
		this.maNhaSanXuat = maNhaSanXuat;
	}
	public String getAnhSanPhamBase64() {
		return anhSanPhamBase64;
	}
	public void setAnhSanPhamBase64(String anhSanPhamBase64) {
		this.anhSanPhamBase64 = anhSanPhamBase64;
	}
	@Override
	public String toString() {
		return "Sanpham [maSanPham=" + maSanPham + ", tenSanPham=" + tenSanPham + ", giaBan=" + giaBan
				+ ", soLuongTrongKho=" + soLuongTrongKho + ", moTaSanPham=" + moTaSanPham + ", anhSanPham="
				+ Arrays.toString(anhSanPham) + ", kichThuoc=" + kichThuoc + ", trongLuongSanPham=" + trongLuongSanPham
				+ ", dienTichManHinh=" + dienTichManHinh + ", ram=" + ram + ", dungLuongPin=" + dungLuongPin
				+ ", thoiGianBaoHanh=" + thoiGianBaoHanh + ", maNhaSanXuat=" + maNhaSanXuat + ", anhSanPhamBase64="
				+ anhSanPhamBase64 + "]";
	}

}
