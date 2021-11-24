package manager.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manager.model.service.OrderManagerService;
import manager.model.vo.OrderManager;

/**
 * Servlet implementation class OrderSearchServlet
 */
@WebServlet("/searchOrderManagement.no")
public class SearchOrderManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchOrderManageServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String cond = request.getParameter("cond");
		String search = request.getParameter("order_search");
		
		ArrayList<OrderManager> list = new OrderManagerService().orderSearch(cond, search);
				
		String page = null;
		
		if(list != null) {
			request.setAttribute("list", list);
			page = "WEB-INF/views/admin/orderManagement.jsp";
		} else {
			request.setAttribute("msg", "주문 검색 실패");
			page = "WEB-INF/views/common/errorPage.jsp";
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
