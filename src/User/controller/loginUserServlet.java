package User.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import User.model.service.UserService;
import User.model.vo.User;

/**
 * Servlet implementation class loginUserServlet
 */
@WebServlet("/loginUserServlet.me")
public class loginUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		User loginUser = new UserService().login(userId,userPwd);
		
		
		if(loginUser != null) {
			HttpSession session = request.getSession();
			session.setMaxInactiveInterval(60*30); //30분 뒤 세션 종료
			session.setAttribute("loginUser", loginUser);
			response.sendRedirect(request.getContextPath());
			}else {
				request.setAttribute("msg", "로그인 실패");
				RequestDispatcher view = request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp");
				view.forward(request, response);
				
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
