package ControllerKhachhang;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Base64;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ModelKhachhang.Khachhang;
import ModelKhachhang.KhachhangModel;

/**
 * Servlet implementation class KhachHangController
 */
@WebServlet("/khachHangController")
public class KhachHangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private KhachhangModel
	mKhachhangModel;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public KhachHangController() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public void init() throws ServletException {
		mKhachhangModel = new KhachhangModel();
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			List<Khachhang> khachhanglList = mKhachhangModel.getAllKhachhang();
			// Convert the anhSanPham attribute to base64
			for (Khachhang khachhang : khachhanglList) {
				byte[] imageBytes = khachhang.getAnh();
				if (imageBytes != null) {
					String base64Image = Base64.getEncoder().encodeToString(imageBytes);
					khachhang.setAnhSanPhamBase64(base64Image);
				}
			}
			request.setAttribute("khachhanglList", khachhanglList);
			request.getRequestDispatcher("crategory/dashboard_khachhang.jsp").forward(request, response);
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
