package cart.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cart.model.service.CartService;
import cart.model.vo.Cart;
import User.model.vo.User;

/**
 * Servlet implementation class InsertCartServlet
 */
@WebServlet("/insertCart.me")
public class InsertCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertCartServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String userId = ((User)session.getAttribute("loginUser")).getUserId();
		
		int pNo = Integer.parseInt(request.getParameter("pNo"));
		int count1 = (request.getParameter("numBox1") == null ? 0 : Integer.parseInt(request.getParameter("numBox1")));
		int count2 = (request.getParameter("numBox2") == null ? 0 : Integer.parseInt(request.getParameter("numBox2")));
		int count3 = (request.getParameter("numBox3") == null ? 0 : Integer.parseInt(request.getParameter("numBox3")));
		int amount = Integer.parseInt(request.getParameter("numBox"));
		int count = new CartService().countCart(userId, pNo);
		String[] option = request.getParameterValues("optionName");
		
		int result = 0;
		
		Cart cart = new Cart();
		cart.setAmount(amount);
		cart.setUserId(userId);
		cart.setProdNo(pNo);
		
		if(count == 0) {
			result = new CartService().insertCart(cart, option, count1, count2, count3);
			
		} else {
			result = new CartService().updateCart(cart);
		}
		
		if(result > 0) {
			response.sendRedirect("cartList.me");
		} else {
			request.setAttribute("msg", "장바구니 등록 실패");
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
