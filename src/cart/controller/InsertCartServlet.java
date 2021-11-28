package cart.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
		
		int pNo = Integer.parseInt(request.getParameter("prodNo")); // 상품번호
		int amount = Integer.parseInt(request.getParameter("amount")); // 상품 자체 수량
		String[] sub = request.getParameterValues("sub"); // 옵션명
		String[] count = request.getParameterValues("count"); // 옵션 수량
		int total = Integer.parseInt(request.getParameter("total")); // 총 합계
		
		System.out.println(userId);
		System.out.println(pNo);
		System.out.println(amount);
		System.out.println(sub);
		System.out.println(count);
		
//		for(int i = 0; i < sub.length; i++) {
//			System.out.println(sub[i]);
//			System.out.println(count[i]);
//		}
		System.out.println(total);
		
		Cart cart = new Cart();
		cart.setAmount(amount);
		cart.setUserId(userId);
		cart.setProdNo(pNo);
		cart.setTotal(total);
		
		int result = new CartService().insertCart(cart, sub, count);
		
		PrintWriter out = response.getWriter();
        out.println(result);
        out.flush();
        out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
