package cart.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cart.model.service.CartService;
import cart.model.vo.Cart;

/**
 * Servlet implementation class CartOptionChangeServlet
 */
@WebServlet("/cartOptionChange.me")
public class CartOptionChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartOptionChangeServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
//		HttpSession session = request.getSession();
//		String userId = ((User)session.getAttribute("loginUser")).getUserId();
		
		String userId = request.getParameter("userId");
		int cartNo = Integer.parseInt(request.getParameter("cartNo"));
		int option1 = Integer.parseInt(request.getParameter("amount1"));
		int option2 = Integer.parseInt(request.getParameter("amount2"));
		int option3 = Integer.parseInt(request.getParameter("amount3"));
		
		Cart c = new Cart();
		c.setUserId(userId);
		c.setCartNo(cartNo);
		c.setOption1(option1);
		c.setOption2(option2);
		c.setOption3(option3);
		
		int result = new CartService().cartOptionUpdate(c);
		
		if(result > 0) {
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out = response.getWriter();
			
			String str = "";
			str = "<script language='javascript'>";
			str += "opener.window.location.reload();";
			str += "self.close();";
			str += "</script>";
			
			out.print(str);
			out.flush();
			out.close();
		} else {
			request.setAttribute("msg", "카트 옵션 변경 실패");
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
