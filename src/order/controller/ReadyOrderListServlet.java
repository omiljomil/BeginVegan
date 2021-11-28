package order.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import User.model.vo.User;
import order.model.service.OrderService;
import order.model.vo.Order;
import product.model.service.ProductService;
import product.model.vo.Photo;

/**
 * Servlet implementation class ReadyOrderListServlet
 */
@WebServlet("/paiie.me")
public class ReadyOrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReadyOrderListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String userId = ((User)session.getAttribute("loginUser")).getUserId();
		
		ArrayList<Order> list = new OrderService().orderList(userId);
		ArrayList<Photo> fList = new ProductService().selectFList();
		
		String page = null;
		
		if(list != null) {
			page = "WEB-INF/views/paiement/paiementPage.jsp";
			request.setAttribute("list", list);
			request.setAttribute("fList", fList);
		} else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "결제 페이지 이동 실패");
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
