package review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import review.model.service.ReviewService;
import review.model.vo.Comment;

/**
 * Servlet implementation class CommentInsertServlet
 */
@WebServlet("/insertComment.bo")
public class CommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   request.setCharacterEncoding("UTF-8");
	   
	   String writer=request.getParameter("writer");
	   String content=request.getParameter("content");
	   int bId=Integer.parseInt(request.getParameter("bId"));
	   
	   Comment c=new Comment();
	   c.setReviewNo(bId);
	   c.setCommentCont(content);
	   c.setUserId(writer);
	   
	   ArrayList<Comment>list=new ReviewService().insertComment(c);
	   response.setContentType("application/json; charset=UTF-8");
		GsonBuilder gb=new GsonBuilder();
		GsonBuilder gb2=gb.setDateFormat("yyyy-MM-dd");
	   Gson gson=gb2.create();
	   gson.toJson(list,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
