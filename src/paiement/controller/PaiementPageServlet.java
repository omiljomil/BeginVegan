package paiement.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import User.model.vo.User;
import cart.model.vo.Order;
import paiement.model.service.PaiementService;
import paiement.model.vo.OrderPay;
import paiement.model.vo.Paiement;
import product.model.service.ProductService;
import product.model.vo.Photo;
import product.model.vo.Product;
import product.model.vo.ProductList;

/**
 * Servlet implementation class PaiementPageServlet
 */
@WebServlet("/paie.ne")
public class PaiementPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaiementPageServlet() {
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
		
		int pNo = Integer.parseInt(request.getParameter("prodNo")); // 상품번호
		int amount = Integer.parseInt(request.getParameter("amount")); // 상품 자체 수량
		String[] sub = request.getParameterValues("sub");
		String[] count = request.getParameterValues("count");
		int total = Integer.parseInt(request.getParameter("total"));
		String prodName = request.getParameter("prodName");
		
		System.out.println(userId);
		System.out.println(pNo);
		System.out.println(amount);
		System.out.println(sub);
		System.out.println(count);
		System.out.println(prodName);
		
		for(int i = 0; i < sub.length; i++) {
			System.out.println(sub[i]);
			System.out.println(count[i]);
		}
		System.out.println(total);
		
		OrderPay op = new OrderPay();
		op.setAmount(amount);
		op.setUserId(userId);
		op.setProdNo(pNo);
		op.setProdName(prodName);
		op.setTotal(total);
		
		
		ArrayList<OrderPay> list = new ArrayList<OrderPay>();
		list.add(op);
		
//		list = new PaiementService().selectPaiement(op);
		
		JSONObject opObj = null;
		
		if(op != null) {
			opObj.put("amount", op.getAmount());
			opObj.put("userId", op.getUserId());
			opObj.put("pNo", op.getProdNo());
			opObj.put("prodName", op.getProdName());
			opObj.put("total", op.getTotal());
			opObj.put("sub", sub);
			opObj.put("count", count);
		}

		
		//int result = new PaiementService().selectPaiement(list);
		
		response.setContentType("apllication/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
        out.println(opObj);
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
