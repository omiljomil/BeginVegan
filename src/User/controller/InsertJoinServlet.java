package User.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import User.model.service.UserService;
import User.model.vo.User;

/**
 * Servlet implementation class InsertJoinServlet
 */
@WebServlet("/insertJoinServlet.me")
public class InsertJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertJoinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("userId");
		String userName = request.getParameter("username");
		String userPwd = request.getParameter("userPwd");
		String email = request.getParameter("email1")+"@" + request.getParameter("email2");
		String phone = request.getParameter("phone");
		
		User user = new User(userId, userPwd, userName, phone, email, "N", null, null, null);
		
		int result = new UserService().insertUser(user);
		
		if(result > 0) {
			request.setAttribute("userName", userName);
			request.getRequestDispatcher("WEB-INF/views/User/joinResultForm.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "회원가입에 실패하였습니다");
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
