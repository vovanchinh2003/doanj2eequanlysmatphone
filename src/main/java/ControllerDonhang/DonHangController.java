package ControllerDonhang;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ModelDonhang.Chitiethoadon;
import ModelDonhang.Donhang;
import ModelDonhang.Donhangmodel;

@WebServlet("/donHangController")
public class DonHangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Donhangmodel mDonhangmodel;

	public DonHangController() {
		super();
	}

	@Override
	public void init() throws ServletException {
		mDonhangmodel = new Donhangmodel();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			List<Donhang> donhanglList = mDonhangmodel.getAllDonhang();
			request.setAttribute("donhanglListt", donhanglList);
			request.getRequestDispatcher("crategory/dashboard_donhang.jsp").forward(request, response);
		} catch (NumberFormatException | SQLException e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "/error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
