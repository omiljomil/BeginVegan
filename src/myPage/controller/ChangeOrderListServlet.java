package myPage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import myPage.model.service.OrderListService;
import paiement.model.vo.Paiement;

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
		
		
		ArrayList<Paiement> list = new OrderListService().deleteListSelect();

		
		String page = null;
		if(list != null) {
			request.setAttribute("list", list);
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
