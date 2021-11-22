package User.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import User.model.service.UserService;

/**
 * Servlet implementation class IdFindResult
 */
@WebServlet("/idFindResult.me")
public class IdFindResult extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdFindResult() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String userName = request.getParameter("userName");
		String email = request.getParameter("email");
		System.out.println(userName);
		System.out.println(email);
		String id = new UserService().idFindResult(userName,email);
		System.out.println(id);
		String page=null;
		if(id !=null) {
			page="WEB-INF/views/User/idFindResult.jsp";
			request.setAttribute("userId", id);
			request.setAttribute("userName", userName);
			request.setAttribute("email", email);
			
		}else {
			page="WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "아이디 찾기 오류");
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
