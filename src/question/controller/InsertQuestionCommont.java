package question.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import User.model.service.UserService;
import question.model.service.QuestionService;
import question.model.vo.Question_Comment;

/**
 * Servlet implementation class InsertQuestionCommont
 */
@WebServlet("/insertQuestionCommont.qs")
public class InsertQuestionCommont extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertQuestionCommont() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		int qId = Integer.parseInt(request.getParameter("qId"));
		String a = new UserService().checkManager(writer);
		if(a.equals("Y")) {
			writer = "관리자";
		}
		Question_Comment qc = new Question_Comment();
		qc.setQst_no(qId);
		qc.setUser_id(writer);
		qc.setQst_cont(content);
		
		
		ArrayList<Question_Comment> list = new QuestionService().insertQuestionCommont(qc);
		
		response.setContentType("application/json; charset=UTF-8");
		GsonBuilder gb = new GsonBuilder();
		GsonBuilder gb2 = gb.setDateFormat("yyyy-MM-dd");
		Gson gson = gb2.create();
		gson.toJson(list, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
