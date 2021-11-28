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
import myPage.model.vo.PageInfo;
import myPage.model.service.OrderListService;
import paiement.model.vo.Paiement;
import product.model.service.ProductService;
import product.model.vo.Photo;

/**
 * Servlet implementation class OrderListServlet
 */
@WebServlet("/orderList.me")
public class OrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			// 페이징 처리에 필요한 변수
			int listCount; 		// 총 게시글 개수
			int currentPage;	// 현재 페이지
			int pageLimit;		// 한 페이지에서 보일 페이지 수
			int boardLimit; 	// 한 페이지에서 보일 게시글 수
			int maxPage; 		// 가장 마지막 페이지 
			int startPage;		// 페이징이 된 페이지 중 시작 페이지
			int endPage;		// 페이징이 된 페이지 중 마지막 페이지
			
			OrderListService oService = new OrderListService();

			listCount = oService.getListCount();

			currentPage = 1;
			if(request.getParameter("currentPage") != null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			
			pageLimit = 10;
			boardLimit = 3; 
			

			maxPage = (int)Math.ceil((double)listCount / boardLimit);
			startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
			endPage = startPage + pageLimit - 1;
			if(maxPage < endPage) {
				endPage = maxPage;
			}
			
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		HttpSession session = request.getSession();
		String userId = ((User)session.getAttribute("loginUser")).getUserId();
		
		ArrayList<Paiement> list = oService.selectList(pi, userId);
		ArrayList<Photo> fList = new ProductService().selectFList();

		String page = null;
		if(list != null) {
			page = "WEB-INF/views/myPage/orderList.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			request.setAttribute("fList", fList);

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
