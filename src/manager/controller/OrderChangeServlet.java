package manager.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manager.model.service.OrderManagerService;

/**
 * Servlet implementation class ChangeOrderListServlet
 */
@WebServlet("/orderChangeManagement.no")
public class OrderChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderChangeServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String[] orderNo = request.getParameterValues("order");
		String status = request.getParameter("orderStatus");
		
		for(int i = 0; i < orderNo.length; i++) {
			System.out.print("주문번호 : " + orderNo[i] + " ");
			
		}
		int result = new OrderManagerService().changeOrder(orderNo, status);
		
		if(result > 0) {
			response.sendRedirect("orderManagement.no");
		} else {
			request.setAttribute("msg", "주문 변경 실패");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
