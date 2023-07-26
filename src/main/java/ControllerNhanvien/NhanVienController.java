package ControllerNhanvien;

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
import ModelNhanvien.Nhanvien;
import ModelNhanvien.NhanvienModel;

/**
 * Servlet implementation class NhanVienController
 */
@WebServlet("/nhanVienController")
public class NhanVienController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NhanvienModel nhanvienModel;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NhanVienController() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public void init() throws ServletException {
		nhanvienModel = new NhanvienModel();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			List<Nhanvien> nhanvienliList = nhanvienModel.getAllNhanvien();
			// Convert the anhSanPham attribute to base64
			for (Nhanvien nhanvien : nhanvienliList) {
				byte[] imageBytes = nhanvien.getAnh();
				if (imageBytes != null) {
					String base64Image = Base64.getEncoder().encodeToString(imageBytes);
					nhanvien.setAnhSanPhamBase64(base64Image);
				}
			}
			request.setAttribute("nhanvienliList", nhanvienliList);
			request.getRequestDispatcher("crategory/dashboard_nhanvien.jsp").forward(request, response);
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
