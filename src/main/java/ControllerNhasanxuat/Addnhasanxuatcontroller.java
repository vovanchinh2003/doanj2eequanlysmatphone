package ControllerNhasanxuat;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ModelNhasanxuat.NhaSanXuat;
import ModelNhasanxuat.NhaSanXuatModel;

@WebServlet("/addnhasanxuatcontroller")
public class Addnhasanxuatcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void init() throws ServletException {
		// You can initialize any resources here if needed.
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Addnhasanxuatcontroller() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Handling GET requests (if needed)
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		try {
			NhaSanXuatModel model = new NhaSanXuatModel();
			List<NhaSanXuat> nhaSanXuatList = model.getAllNhaSanXuat();
			request.setAttribute("nhaSanXuatList", nhaSanXuatList);
			request.getRequestDispatcher("view/nhasanxuatview.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "/error.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		String name = request.getParameter("ten_nhasx");
		String address = request.getParameter("dia_chi");
		String phone = request.getParameter("so_dt");
		String email = request.getParameter("Email");

		// Assuming you have a valid JDBC connection
		try {
			NhaSanXuatModel model = new NhaSanXuatModel();
			model.insertNhaSanXuat(name, address, phone, email);
//            insertNhaSanXuat(name, address, phone, email);
			response.sendRedirect(request.getContextPath() + "/NhaSanXuatController");
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "/error.jsp"); // Redirect to error page
		}
	}

}
