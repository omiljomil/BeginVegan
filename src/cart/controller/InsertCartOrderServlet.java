package cart.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cart.model.service.CartService;
import cart.model.vo.Order;

/**
 * Servlet implementation class InsertCartOrderServlet
 */
@WebServlet("/InsertCartOrder.me")
public class InsertCartOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertCartOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		String orderNo = request.getParameter("orderNo");
		String prodName = request.getParameter("prodName");
		int price = Integer.parseInt(request.getParameter("price"));
		String receiver = request.getParameter("receiver");
		int postal = Integer.parseInt("postal");
		String address = request.getParameter("address");
		String deAddress = request.getParameter("deAddress");
		String normalPhone = request.getParameter("normalPhone");
		String phone = request.getParameter("phone");
		String message = request.getParameter("message");
		int amount = Integer.parseInt(request.getParameter("amount"));
		
		Order o = new Order(userId, 0, orderNo, prodName, price, receiver, postal, address, deAddress, normalPhone, phone, message, null, amount);
		
		int result = new CartService().insertOrder(o);
		
		PrintWriter out = response.getWriter();
        out.println(result);
        out.flush();
        out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
