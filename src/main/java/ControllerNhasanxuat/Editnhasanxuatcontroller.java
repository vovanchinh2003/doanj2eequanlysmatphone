package ControllerNhasanxuat;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ModelNhasanxuat.NhaSanXuatModel;

@WebServlet("/editnhasanxuatcontroller")
public class Editnhasanxuatcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void init() throws ServletException {
		// You can initialize any resources here if needed.
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Editnhasanxuatcontroller() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Handling GET requests (if needed)
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		String maNhaSanXuatStr = request.getParameter("MaNhaSanXuat");
		int maNhaSanXuat = Integer.parseInt(maNhaSanXuatStr);
		String tenNhaSanXuat = request.getParameter("ten_nhasx_" + maNhaSanXuat);
		String diaChi = request.getParameter("dia_chi" + maNhaSanXuat);
		String soDienThoai = request.getParameter("so_dien_thoai" + maNhaSanXuat);
		String email = request.getParameter("email" + maNhaSanXuat);

		// Assuming you have a valid JDBC connection
		try {
			NhaSanXuatModel model = new NhaSanXuatModel();
			model.updateNhaSanXuat(maNhaSanXuat, tenNhaSanXuat, diaChi, soDienThoai, email);
			response.sendRedirect(request.getContextPath() + "/NhaSanXuatController");
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "/error.jsp"); // Redirect to error page
		}
	}

	// Helper method to update data in the database

}
