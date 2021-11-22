package question.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import question.model.service.QuestionService;
import question.model.vo.Question;

/**
 * Servlet implementation class InsertQuestion
 */
@WebServlet("/insertQuestion.qs")
public class InsertQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertQuestion() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String title = request.getParameter("brackets")+ request.getParameter("title");
		String userId = request.getParameter("userId");
		String content = request.getParameter("questionContent");
		System.out.println(title);
		System.out.println(userId);
		System.out.println(content);
		Question q = new Question(0, title, content, userId, null, null, null);
		
		int result = new QuestionService().insertQuestion(q);
		if(result > 0) {
			response.sendRedirect("questionList.bo");
		}else {
			request.setAttribute("msg", "문의 사항 조회  조회 실패");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
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
