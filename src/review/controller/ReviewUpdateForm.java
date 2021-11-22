package review.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import User.model.vo.User;
import review.model.vo.Review;

/**
 * Servlet implementation class ReviewUpdateForm
 */
@WebServlet("/reviewUpdateForm.bo")
public class ReviewUpdateForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewUpdateForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	     
		
		int reviewNo=Integer.parseInt(request.getParameter("reviewNo"));
		String reviewTitle=request.getParameter("title");
		String userId=((User)request.getSession().getAttribute("loginUser")).getUserId();
		String userName=((User)request.getSession().getAttribute("loginUser")).getUserName();
		String reviewCon=request.getParameter("content");
		 String enrollDate=request.getParameter("date"); 
		String fileName=request.getParameter("file");//이름이 바뀐 이미지 파일 이름
		
		Review r=new Review(reviewNo, reviewTitle, reviewCon, userId, userName, null,null,null);
		request.setAttribute("review", r);
		/*
		 * request.setAttribute("reviewNo", reviewNo); request.setAttribute("title",
		 * reviewTitle); request.setAttribute("content",reviewCon);
		 */
		request.setAttribute("reviewNo", reviewNo);
		 request.setAttribute("date", enrollDate);  
	    request.setAttribute("file", fileName);
	    
	    request.getRequestDispatcher("WEB-INF/views/review/reviewUpdate.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
