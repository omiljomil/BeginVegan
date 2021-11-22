package review.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import User.model.vo.User;
import common.MyFileRenamePolicy;
import review.model.service.ReviewService;
import review.model.vo.Photo;
import review.model.vo.Review;

/**
 * Servlet implementation class ReviewUpdateForm
 */
@WebServlet("/reviewUpdate.bo")
public class ReviewUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize=1021*1024*10;
			String root=request.getSession().getServletContext().getRealPath("/");
			String savePath=root+"thumbnail_uploadFiles/";
			
			File f=new File(savePath);
			if(!f.exists()) {//f라는 폴더가 존재하면  경로를 거기다 지정
				f.mkdirs();
			}
			MultipartRequest multiRequest=new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			ArrayList<String >saveFiles=new ArrayList<String>();//파일의 바뀐 이름을 저장할 ArrayList
			ArrayList<String >originFiles=new ArrayList<String>();//파일의 원래 이름을 저장할 ArrayList
			Enumeration<String>files=multiRequest.getFileNames();
			while(files.hasMoreElements()) {
				String name=files.nextElement();
				if(multiRequest.getFilesystemName(name)!=null) {
					saveFiles.add(multiRequest.getFilesystemName(name));
					originFiles.add(multiRequest.getOriginalFileName(name));
				};
			}	
			String imgName=multiRequest.getParameter("file");//기존에 있던 이미지 이름
			
			 int reviewNo=Integer.parseInt(multiRequest.getParameter("reviewNo"));  
			String reviewTitle=multiRequest.getParameter("title");
			String reviewCon=multiRequest.getParameter("content");	
			String date=multiRequest.getParameter("date");
			String userId= ((User)request.getSession().getAttribute("loginUser")).getUserId();
			String userName=((User)request.getSession().getAttribute("loginUser")).getUserName();
			
			 Date enRollDate=null;
				 if(date.equals("")) {
					  enRollDate=new Date(new GregorianCalendar().getTimeInMillis());
				  }else {
					  String[]splitDate=date.split("-");
					  int year=Integer.parseInt(splitDate[0]);
					  int month=Integer.parseInt(splitDate[1])-1;
					  int day=Integer.parseInt(splitDate[2]);
					  enRollDate=new Date(new GregorianCalendar(year,month,day).getTimeInMillis());
				  }
				 Review r=new Review(reviewNo, reviewTitle, reviewCon, userId, userName, enRollDate, null, null);	
				
					    Photo p=new Photo();
						p.setFilePath(savePath);
						p.setImgName(originFiles.get(0));
						p.setImgChangeName(saveFiles.get(0));
						p.setReviewNo(reviewNo);
						p.setFileLevel(0);
						
			  System.out.println(r);
			  System.out.println(p);
			 int result=new ReviewService().updateReview(r,p);
			 	if(result>=2) {
					File delete=new File(savePath+imgName);
					delete.delete();
					response.sendRedirect("reviewDetail.bo?bId="+reviewNo);
					
					}else {
							request.setAttribute("msg", "사진 게시판 수정 실패");
				            request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);	
						  for(int i=0; i<saveFiles.size();i++) {
							  File fail=new File(savePath+saveFiles.get(i));
							  fail.delete();
					 }
				} 
			}
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
