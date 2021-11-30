package myPage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import User.model.vo.User;
import myPage.model.service.OrderListService;
import myPage.model.vo.PageInfo;
import paiement.model.vo.Paiement;
import product.model.service.ProductService;
import product.model.vo.Photo;

/**
 * Servlet implementation class ChangeOrderListServlet
 */
@WebServlet("/deleteOrderList.pe")
public class ChangeOrderListServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeOrderListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            // 페이징 처리에 필요한 변수
            int listCount;
            int currentPage;
            int pageLimit;
            int boardLimit;
            int maxPage;
            int startPage;
            int endPage;
            
            OrderListService oService = new OrderListService();
            // 페이징 처리 1단계
            listCount = oService.getChangeListCount();
            
            currentPage = 1;
            if(request.getParameter("currentPage") != null) {
               // cuurentPage가 null이 아니다-> 파라미터로 currentPage가 들어왔다 -> 페이징 처리가 된 버튼을 눌렀다
               // currentPage가 null이다-> 처음 페이지에 들어왔다 -> currentPage = 1
               currentPage = Integer.parseInt(request.getParameter("currentPage"));
               // 숫자로 만들어서 넘겨 준다
            }
            
            // 페이징 처리 3단계 : boardLimit와 pageLimit 설정
            pageLimit = 10;
            boardLimit = 3; 
            
            // 페이징 처리 4단계 : 각 변수에 알맞은 계산식 작성
            // 올림 처리를 했기 때문에 0 반환되어 int값으로 넣어도 됨 그래서 다시 형변환 해 줌
            maxPage = (int)Math.ceil((double)listCount / boardLimit);
            startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
            endPage = startPage + pageLimit - 1;
            if(maxPage < endPage) {
               endPage = maxPage;
            }
            
            PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
      
            HttpSession session = request.getSession();
            String userId = ((User)session.getAttribute("loginUser")).getUserId();
            
            ArrayList<Paiement> list = new OrderListService().deleteListSelect(pi, userId);
            ArrayList<Photo> fList = new ProductService().selectFList();
            
            String page = null;
            if(list != null) {
               request.setAttribute("list", list);
               request.setAttribute("pi", pi);
               request.setAttribute("fList", fList);
               page = "WEB-INF/views/myPage/changeOrderList.jsp";
            } else {
               request.setAttribute("msg", "주문 내역 조회 실패");
               page = "WEB-INF/views/common/errorPage.jsp";
            }
            
            request.getRequestDispatcher(page).forward(request, response);
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}