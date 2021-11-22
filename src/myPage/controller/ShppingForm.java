package myPage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import User.model.service.ShppingService;
import User.model.vo.Shpping;

/**
 * Servlet implementation class InsertShppingForm
 */
@WebServlet("/sp_AddressForm.me")
public class ShppingForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShppingForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		String userId = request.getParameter("userId");
		ArrayList<Shpping> list = new ShppingService().selectShpping(userId);
		String page = null;
		if(list != null) {
			page = "WEB-INF/views/myPage/sp_AddressForm.jsp";
			request.setAttribute("list", list);
		}
		else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "배송지 조회 실패");
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
