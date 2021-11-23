package review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import page.PageInfo;
import review.model.service.ReviewService;
import review.model.vo.Photo;
import review.model.vo.Review;

/**
 * Servlet implementation class ReviewListForm
 */
@WebServlet("/reviewList.bo")
public class ReviewListForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewListForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReviewService rService=new ReviewService();
		int listCount; //	총 게시글 개수 556개의 게시글이있다면 그만큼의 페이지
		int currentPage; //현재 페이지  현재페이지의 있을때 페이지가 굵게 표시되는 ?
		int pageLimit;  //한 페이지에서 보일 페이지 수 밑에 페이지의 개수 
		int boardLimit; //한 페이지에서 보일 게시글 수  
		int maxPage;  //가장 마지막 페이지   10 20 30  40..56 556개의 게시글이있으므로 10개씩 한페이지의 게시글을 볼수있다고한다면
		int startPage;//페이징이 된 페이지 중 시작페이지 //01 11 21 31 41 51  페이징에서 볼수있는 처음페이지들
		int endPage; //페이징이 된 페이지 중 마지막페이지   //10 ,20,30,40,56 페이징에서 볼수있는 마지막페이지들
		
		listCount=new ReviewService().getFListCount();
		currentPage=1;
		if(request.getParameter("currentPage")!=null) {
			currentPage=Integer.parseInt(request.getParameter("currentPage"));
		}
		
		pageLimit=10;
		boardLimit=8;
		
		 maxPage=(int)Math.ceil((double)listCount / boardLimit);
		  startPage=(currentPage-1)/pageLimit*pageLimit+1; 
		  endPage= startPage+pageLimit-1; if(maxPage<endPage) { endPage=maxPage; }
		 
		   
	  PageInfo pi=new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Review> rList=rService.selectRList(pi);
		ArrayList<Photo> fList=rService.selectLFList();
		String page=null;
		if(rList!=null&&fList!=null) {
			request.setAttribute("rList", rList);
			request.setAttribute("fList", fList);
			request.setAttribute("pi", pi);
			page="WEB-INF/views/review/reviewList.jsp";
		}else {
			request.setAttribute("msg", "상품후기  조회 실패");
			page="WEB-INF/views/common/errorPage.jsp";
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
