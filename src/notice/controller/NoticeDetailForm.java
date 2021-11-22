package notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeDetailForm
 */
@WebServlet("/noticeDetail.me")
public class NoticeDetailForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDetailForm() {
        super();
      
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("UTF-8");
		int no=Integer.parseInt(request.getParameter("me"));
		;	
		  Notice notice=new NoticeService().bringNoitce(no);
		  String page=null;
			    if(notice !=null) {
			    	page="WEB-INF/views/notice/noticeDetail.jsp";
			    	 request.setAttribute("notice", notice);
			    }else {
			    	page="WEB-INF/views/common/errorPage.jsp";
			    	request.setAttribute("msg","공지사항 상세조회 실패");
			    }
				request.getRequestDispatcher(page).forward(request, response);;
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
