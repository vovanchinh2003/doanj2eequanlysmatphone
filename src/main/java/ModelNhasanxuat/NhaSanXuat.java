package ModelNhasanxuat;

public class NhaSanXuat {
	 private int maNhaSanXuat;
	    private String tenNhaSanXuat;
	    private String diaChi;
	    private String soDienThoai;
	    private String email;
	    
	    
		public NhaSanXuat() {
			super();
		}
		public NhaSanXuat(int maNhaSanXuat, String tenNhaSanXuat, String diaChi, String soDienThoai, String email) {
			super();
			this.maNhaSanXuat = maNhaSanXuat;
			this.tenNhaSanXuat = tenNhaSanXuat;
			this.diaChi = diaChi;
			this.soDienThoai = soDienThoai;
			this.email = email;
		}
		public int getMaNhaSanXuat() {
			return maNhaSanXuat;
		}
		public void setMaNhaSanXuat(int maNhaSanXuat) {
			this.maNhaSanXuat = maNhaSanXuat;
		}
		public String getTenNhaSanXuat() {
			return tenNhaSanXuat;
		}
		public void setTenNhaSanXuat(String tenNhaSanXuat) {
			this.tenNhaSanXuat = tenNhaSanXuat;
		}
		public String getDiaChi() {
			return diaChi;
		}
		public void setDiaChi(String diaChi) {
			this.diaChi = diaChi;
		}
		public String getSoDienThoai() {
			return soDienThoai;
		}
		public void setSoDienThoai(String soDienThoai) {
			this.soDienThoai = soDienThoai;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		@Override
		public String toString() {
			return "NhaSanXuat [maNhaSanXuat=" + maNhaSanXuat + ", tenNhaSanXuat=" + tenNhaSanXuat + ", diaChi="
					+ diaChi + ", soDienThoai=" + soDienThoai + ", email=" + email + "]";
		}
	    
	    
}
