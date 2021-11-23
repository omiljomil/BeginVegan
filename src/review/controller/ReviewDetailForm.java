package review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.model.service.ReviewService;
import review.model.vo.Comment;
import review.model.vo.Photo;
import review.model.vo.Review;

/**
 * Servlet implementation class ReviewDetailForm
 */
@WebServlet("/reviewDetail.bo")
public class ReviewDetailForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewDetailForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int bId=Integer.parseInt(request.getParameter("bId"));
		  
		  ReviewService service=new ReviewService();
		  ArrayList<Comment>cList=service.selectCList(bId);
		  Review  review= service.selectReview(bId);
		  ArrayList<Photo> fileList=service.selectPhoto(bId);
		  String page=null;
		  if(fileList!=null) {
			  request.setAttribute("cList", cList);
			  request.setAttribute("review", review);
			  request.setAttribute("fileList", fileList);
			  page="WEB-INF/views/review/reviewDetail.jsp";
		  }else {
			  request.setAttribute("msg", "사진 게시판 상세보기 실패");
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
