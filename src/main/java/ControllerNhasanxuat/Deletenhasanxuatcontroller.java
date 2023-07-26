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

@WebServlet("/deletenhasanxuatcontroller")
public class Deletenhasanxuatcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void init() throws ServletException {
		// You can initialize any resources here if needed.
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Deletenhasanxuatcontroller() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Handling GET requests (if needed)
		String maNhaSanXuatStr = request.getParameter("MaNhaSanXuat");
		int maNhaSanXuat = Integer.parseInt(maNhaSanXuatStr);
		// Assuming you have a valid JDBC connection
		try {
			NhaSanXuatModel model = new NhaSanXuatModel();
			model.deleteNhaSanXuat(maNhaSanXuat);
			response.sendRedirect(request.getContextPath() + "/NhaSanXuatController");
		} catch (SQLException e) {
			e.printStackTrace();
			response.getWriter().write("Lỗi xóa sản phẩm: " + e.getMessage());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
