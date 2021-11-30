package myPage.controller;
  

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import User.model.vo.User;
import myPage.model.service.OrderListService;

/**
 * Servlet implementation class MypageMainServlert
 */
@WebServlet("/mypagemain.me")
public class MyPageMainServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageMainServlet() {
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
      
      int result1 = new OrderListService().selectOListCount1(userId);
      int result2 = new OrderListService().selectOListCount2(userId);
      int result3 = new OrderListService().selectOListCount3(userId);
      int result4 = new OrderListService().selectOListCount4(userId);
      int result5 = new OrderListService().selectOListCount5(userId);
      
      request.setAttribute("result1", result1);
      request.setAttribute("result2", result2);
      request.setAttribute("result3", result3);
      request.setAttribute("result4", result4);
      request.setAttribute("result5", result5);
      
      request.getRequestDispatcher("WEB-INF/views/myPage/myPageMain.jsp").forward(request, response);
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}