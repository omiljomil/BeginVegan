package notice.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import User.model.vo.User;
import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeUpdateServlet
 */
@WebServlet("/noticeUdpateServlet.me")
public class NoticeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		 String noticeTitle= request.getParameter("title");
		 String noticeContent= request.getParameter("content");
		 int noticeNo= Integer.parseInt(request.getParameter("no"));
		 String noticeWriter=((User)request.getSession().getAttribute("loginUser")).getUserId();
		 String date=request.getParameter("date");
		 Date noticeDate=null;
		  if(date.equals("")) {
			  noticeDate=new Date(new GregorianCalendar().getTimeInMillis());
		  }else {
			  String[]splitDate=date.split("-");
			  int year=Integer.parseInt(splitDate[0]);
			  int month=Integer.parseInt(splitDate[1])-1;
			  int day=Integer.parseInt(splitDate[2]);
			  noticeDate=new Date(new GregorianCalendar(year,month,day).getTimeInMillis());
		  }
		  Notice n=new Notice(noticeNo,noticeTitle,noticeContent,noticeWriter,noticeDate,null,null);
	      int result=new NoticeService().updateNotice(n);
	      if(result>0) {
				response.sendRedirect("noticeDetail.me?me="+noticeNo);
			}else {
				request.setAttribute("msg", "공지사항 수정 실패");
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
