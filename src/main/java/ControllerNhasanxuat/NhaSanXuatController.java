package ControllerNhasanxuat;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ModelNhasanxuat.NhaSanXuat;
import ModelNhasanxuat.NhaSanXuatModel;

/**
 * Servlet implementation class NhaSanXuatControllerr
 */
@WebServlet("/NhaSanXuatController")
public class NhaSanXuatController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NhaSanXuatModel model;

	@Override
	public void init() throws ServletException {
		model = new NhaSanXuatModel();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		if (request.getParameter("submit") != null) {
			String name = request.getParameter("ten_nhasx");
			String address = request.getParameter("dia_chi");
			String phone = request.getParameter("so_dt");
			String email = request.getParameter("Email");

			try {
				// Assuming you have a model instance named "model" that you use to perform the
				// insertion
				model.insertNhaSanXuat(name, address, phone, email);
				response.sendRedirect(request.getContextPath() + "/NhaSanXuatController");
			} catch (SQLException e) {
				e.printStackTrace();
				response.sendRedirect(request.getContextPath() + "/error.jsp");
			}
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			List<NhaSanXuat> nhaSanXuatList = model.getAllNhaSanXuat();
			request.setAttribute("nhaSanXuatList", nhaSanXuatList);
			request.getRequestDispatcher("crategory/dashboard_nhasanxuat.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "/error.jsp");
		}
	}

}
