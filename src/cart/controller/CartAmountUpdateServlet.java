package cart.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import User.model.vo.User;
import cart.model.service.CartService;
import cart.model.vo.Cart;

/**
 * Servlet implementation class CartAmountChangeServlet
 */
@WebServlet("/amountUpdate.me")
public class CartAmountUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartAmountUpdateServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String userId = ((User)session.getAttribute("loginUser")).getUserId();
		
		int cartNo = Integer.parseInt(request.getParameter("cartNo"));
		int prodNo = Integer.parseInt(request.getParameter("prodNo"));
		int amount = Integer.parseInt(request.getParameter("amount"));
		int total = Integer.parseInt(request.getParameter("total"));
		
		System.out.println(total);
		
		Cart c = new Cart();
		c.setUserId(userId);
		c.setCartNo(cartNo);
		c.setProdNo(prodNo);
		c.setAmount(amount);
		c.setTotal(total);
		
		int result = new CartService().amountUpdate(c);
		
		if(result > 0) {
			response.sendRedirect("cartList.me");
		} else {
			request.setAttribute("msg", "상품 수량 변경 실패");
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
