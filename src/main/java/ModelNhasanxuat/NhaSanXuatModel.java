package ModelNhasanxuat;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class NhaSanXuatModel {
	private Connection con;

	public NhaSanXuatModel() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost/ql_ban_smatphon", "root", "chinh2003");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void insertNhaSanXuat(String name, String address, String phone, String email) throws SQLException {
		// Replace the following with your actual database connection parameters
		String jdbcURL = "jdbc:mysql://localhost:3306/ql_ban_smatphon";
		String dbUsername = "root";
		String dbPassword = "chinh2003";

		try (Connection con = DriverManager.getConnection(jdbcURL, dbUsername, dbPassword)) {
			String sql = "INSERT INTO NhaSanXuat (TenNhaSanXuat, DiaChi, SoDienThoai, Email) VALUES (?, ?, ?, ?)";
			try (PreparedStatement pst = con.prepareStatement(sql)) {
				pst.setString(1, name);
				pst.setString(2, address);
				pst.setString(3, phone);
				pst.setString(4, email);
				pst.executeUpdate();
			}
		}
	}

	public void updateNhaSanXuat(int maNhaSanXuat, String tenNhaSanXuat, String diaChi, String soDienThoai,
			String email) throws SQLException {
		// Replace the following with your actual database connection parameters
		String jdbcURL = "jdbc:mysql://localhost:3306/ql_ban_smatphon";
		String dbUsername = "root";
		String dbPassword = "chinh2003";

		try (Connection con = DriverManager.getConnection(jdbcURL, dbUsername, dbPassword)) {
			String sql = "UPDATE NhaSanXuat SET TenNhaSanXuat = ?, DiaChi = ?, SoDienThoai = ?, Email = ? WHERE MaNhaSanXuat = ?";
			try (PreparedStatement pst = con.prepareStatement(sql)) {
				pst.setString(1, tenNhaSanXuat);
				pst.setString(2, diaChi);
				pst.setString(3, soDienThoai);
				pst.setString(4, email);
				pst.setInt(5, maNhaSanXuat);
				pst.executeUpdate();
			}
		}
	}
	 // Helper method to delete data from the database
    public void deleteNhaSanXuat(int maNhaSanXuat) throws SQLException {
        // Replace the following with your actual database connection parameters
    	String jdbcURL = "jdbc:mysql://localhost:3306/ql_ban_smatphon";
		String dbUsername = "root";
		String dbPassword = "chinh2003";

        try (Connection con = DriverManager.getConnection(jdbcURL, dbUsername, dbPassword)) {
            String sql = "DELETE FROM NhaSanXuat WHERE MaNhaSanXuat = ?";
            try (PreparedStatement pst = con.prepareStatement(sql)) {
                pst.setInt(1, maNhaSanXuat);
                pst.executeUpdate();
            }
        }
    }

	public List<NhaSanXuat> getAllNhaSanXuat() throws SQLException {
		List<NhaSanXuat> nhaSanXuatList = new ArrayList<>();
		PreparedStatement pst = con.prepareStatement("select * from NhaSanXuat");
		ResultSet rs = pst.executeQuery();
		while (rs.next()) {
			NhaSanXuat nsx = new NhaSanXuat();
			nsx.setMaNhaSanXuat(rs.getInt("MaNhaSanXuat"));
			nsx.setTenNhaSanXuat(rs.getString("TenNhaSanXuat"));
			nsx.setDiaChi(rs.getString("DiaChi"));
			nsx.setSoDienThoai(rs.getString("SoDienThoai"));
			nsx.setEmail(rs.getString("Email"));
			nhaSanXuatList.add(nsx);
		}
		rs.close();
		pst.close();
		return nhaSanXuatList;
	}

	// Add other methods for updating and deleting data as needed
}
