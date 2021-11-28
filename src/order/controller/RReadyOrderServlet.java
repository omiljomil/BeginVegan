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
import product.model.service.ProductService;
import product.model.vo.Photo;

/**
 * Servlet implementation class RReadyOrderServlet
 */
@WebServlet("/paie.me")
public class RReadyOrderServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RReadyOrderServlet() {
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
      
      int prodNo = Integer.parseInt(request.getParameter("pNo"));
      String prodName = request.getParameter("prodName2");
      int amount = Integer.parseInt(request.getParameter("numBox"));
      int price = Integer.parseInt(request.getParameter("price"));
      String[] optionName = request.getParameterValues("optionName");
      String[] optionCount = request.getParameterValues("count2");
      
      
      
      ArrayList<Photo> fList = new ProductService().selectFList();
      
      request.setAttribute("userId", userId);
      request.setAttribute("prodNo", prodNo);
      request.setAttribute("prodName", prodName);
      request.setAttribute("amount", amount);
      request.setAttribute("price", price);
      request.setAttribute("optionName", optionName);
      request.setAttribute("optionCount", optionCount);
      request.setAttribute("fList", fList);
      
      request.getRequestDispatcher("WEB-INF/views/paiement/paiementPage.jsp").forward(request, response);
      
      
      
      
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}