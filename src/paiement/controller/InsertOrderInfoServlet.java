package paiement.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import paiement.model.service.PaiementService;
import paiement.model.vo.Paiement;

/**
 * Servlet implementation class InsertOrderInfoServlet
 */
@WebServlet("/insertOrderInfo.me")
public class InsertOrderInfoServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertOrderInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String userId = request.getParameter("userId"); 
      String orderNo = request.getParameter("orderNo");
      String prodName = request.getParameter("prodName");
      int price = Integer.parseInt(request.getParameter("price"));
      String receiver = request.getParameter("receiver");
      int postal = Integer.parseInt(request.getParameter("postal"));
      String address = request.getParameter("address");
      String phone = request.getParameter("phone");
      int amount = Integer.parseInt(request.getParameter("amount"));
      
      
      String normalPhone = request.getParameter("normalPhone");
      String message = request.getParameter("message");
      String deAddress = request.getParameter("deAddress");
      
      /*
       * if(normalPhone == null) { normalPhone = "null"; } else if(message == null) {
       * message = "null"; } else if(deAddress == null) { deAddress = "null"; }
       */
      
      
      Paiement p = new Paiement(userId, 0, orderNo, prodName, price, receiver, postal, 
                           address, deAddress, normalPhone, phone, message, null, amount);
      
      int result = new PaiementService().insertPaiement(p);
      
      System.out.println(result);
      
      
      response.setContentType("application/json; charset=UTF-8");
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