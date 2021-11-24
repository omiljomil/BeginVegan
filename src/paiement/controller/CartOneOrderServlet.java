package paiement.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import User.model.vo.User;
import cart.model.vo.Cart;
import paiement.model.service.PaiementService;
import paiement.model.vo.Paiement;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/cartOneOrder.me")
public class CartOneOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartOneOrderServlet() {
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
		
		Cart c = new Cart();
		c.setCartNo(cartNo);
		c.setUserId(userId);
		c.setProdNo(prodNo);
		
		ArrayList<Paiement> list = new PaiementService().cartOneOrder(c);
		
		String page = "";
		
		if(list != null) {
			request.setAttribute("list", list);
			page = "WEB-INF/views/paiement/paiementPage.jsp";
		} else {
			request.setAttribute("msg", "주문페이지 로딩 실패");
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
