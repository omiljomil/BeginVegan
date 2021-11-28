package cart.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import User.model.vo.User;
import cart.model.service.CartService;
import cart.model.vo.Cart;
import product.model.service.ProductService;
import product.model.vo.Photo;

/**
 * Servlet implementation class CartAllOrderServlet
 */
@WebServlet("/cartAllOrder.me")
public class CartAllOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartAllOrderServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String userId = ((User)session.getAttribute("loginUser")).getUserId();
		
		ArrayList<Cart> list = new CartService().cartAllOrder(userId);
		ArrayList<Photo> fList = new ProductService().selectFList();
		
		String page = "";
		
		System.out.println(userId);
		System.out.println(list);
		
		if(list != null) {
			request.setAttribute("list", list);
			request.setAttribute("fList", fList);
			page = "WEB-INF/views/cart/cartOrderPage.jsp";
		} else {
			request.setAttribute("msg", "주문페이지 이동 실패");
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
