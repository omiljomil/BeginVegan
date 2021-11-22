package User.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import page.PageInfo;
import User.model.service.UserService;
import User.model.vo.User;

/**
 * Servlet implementation class UserSearchServlet
 */
@WebServlet("/searchUserManagement.no")
public class SearchUserManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchUserManageServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String cond = request.getParameter("cond");
		String search = request.getParameter("user_search");
		
		// 페이징 처리에 필요한 변수
		int listCount;		// 총 게시글 개수
		int currentPage;	// 현재 페이지
		int pageLimit;		// 한 페이지에서 보일 페이지 수
		int boardLimit;		// 한 페이지에서 보일 게시글 수
		int maxPage;		// 가장 마지막 페이지
		int startPage;		// 페이징이 된 페이지 중 시작 페이지
		int endPage;		// 페이징이 된 페이지 중 마지막 페이지
		
		UserService mService = new UserService();
		
		// 페이징처리 1단계 : 몇 페이지가 나오는지 게산하기 위한 전체 게시글 개수 조회
		listCount = mService.getSearchCount(cond, search);
		
		// 페이징처리 2단계 : 현재 페이지 설정
		currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			// currentPage가 null이 아니다 -> 파라미터로 currentPage가 들어왔다 -> 페이징 처리가 된 버튼을 눌렀다
			// currentPage가 null이다 -> 처음 페이지에 들어왔다 -> currentPage = 1
			
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			
		}
		
		// 페이징처리 3단계 : boardLimit과 pageLimit 설정
		pageLimit = 10;
		boardLimit = 10;
		
		// 페이징처리 4단계 : 각 변수에 알맞는 계산식 작성
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		startPage = (int)((currentPage - 1) / pageLimit) * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<User> list = new UserService().userSearch(cond, search, pi);
		
		String page = null;
		
		if(list != null) {
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			page = "WEB-INF/views/admin/userManagement.jsp";
		} else {
			request.setAttribute("msg", "회원 검색 실패");
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
