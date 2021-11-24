package User.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import User.model.service.UserService;
import User.model.vo.User;

/**
 * Servlet implementation class UpdateUserServlet
 */
@WebServlet("/update.me")
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		User loginUser = (User)session.getAttribute("loginUser");
//		String userId = loginUser.getUserId();
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String userPwd = request.getParameter("userPwd");
		String email = request.getParameter("email1") + "@" + request.getParameter("email2");
//		String phone = request.getParameter("phone") + "-" +
//					   request.getParameter("phone2") + "-" +
//					   request.getParameter("phone3");
		String phone = request.getParameter("phone");
		
		System.out.println(loginUser);
		System.out.println(userId);
		System.out.println(userName);
		System.out.println(userPwd);
		System.out.println(email);
		System.out.println(phone);
		
		User m = new User(userId, userPwd, userName, phone, email, null, null, null, null);
		int result = new UserService().updateUser(m);
		
		if(result > 0) {
			User user = new UserService().selectUser(userId);
			request.getSession().setAttribute("user", user);
			response.sendRedirect(request.getContextPath());
		} else {
			request.setAttribute("msg", "정보 수정에 실패하였습니다.");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
