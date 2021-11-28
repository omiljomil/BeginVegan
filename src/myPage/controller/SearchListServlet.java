package myPage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import User.model.service.UserService;
import myPage.model.service.OrderListService;
import page.PageInfo;
import paiement.model.vo.Paiement;

/**
 * Servlet implementation class SearchListServlet
 */
@WebServlet("/searchOrderList.no")
public class SearchListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String search = request.getParameter("search");
		
		
				int listCount;		
				int currentPage;	
				int pageLimit;		
				int boardLimit;		
				int maxPage;		
				int startPage;	
				int endPage;		
				
				
				
				
				listCount = new OrderListService().getSearchCount(search);
				
				
				currentPage = 1;
				if(request.getParameter("currentPage") != null) {
					// currentPage가 null이 아니다 -> 파라미터로 currentPage가 들어왔다 -> 페이징 처리가 된 버튼을 눌렀다
					// currentPage가 null이다 -> 처음 페이지에 들어왔다 -> currentPage = 1
					
					currentPage = Integer.parseInt(request.getParameter("currentPage"));
					
				}
				
				// 페이징처리 3단계 : boardLimit과 pageLimit 설정
				pageLimit = 10;
				boardLimit = 3;
				
				// 페이징처리 4단계 : 각 변수에 알맞는 계산식 작성
				maxPage = (int)Math.ceil((double)listCount / boardLimit);
				startPage = (int)((currentPage - 1) / pageLimit) * pageLimit + 1;
				endPage = startPage + pageLimit - 1;
				
				if(maxPage < endPage) {
					endPage = maxPage;
				}
				
				PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
				
		
		ArrayList<Paiement> list = new OrderListService().orderListSearch(search, pi);
		
		String page = null;
		if(list != null) {
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			page = "WEB-INF/views/myPage/orderList.jsp";
		} else {
			request.setAttribute("msg", "주문 검색 실패");
			page = "WEB-INF/views/common/errorPage.jsp";
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
