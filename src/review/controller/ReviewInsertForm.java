package review.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

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
 * Servlet implementation class ReviewInsertForm
 */
@WebServlet("/reviewInsert.bo")
public class ReviewInsertForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewInsertForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); 

		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize=1021*1024*10;//10Mbyte 10메가바이트정도된다?
			String root=request.getSession().getServletContext().getRealPath("/");//웹 서버에 컨테이너 경로 추출!:WebContent 에 저장하고있으므로 
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
			
			String reviewTitle=multiRequest.getParameter("title");
			String reviewCon=multiRequest.getParameter("content");
			String userId= ((User)request.getSession().getAttribute("loginUser")).getUserId();
			String userName=((User)request.getSession().getAttribute("loginUser")).getUserName(); //이부분 바꿔줘야함 로그인 한 유저 아이디를가져오도록 유저네임을 가져오도록
			Review r=new Review(0, reviewTitle, reviewCon, userId,userName, null, null, null);
			ArrayList<Photo>fileList=new ArrayList<Photo>();
			for(int i=originFiles.size()-1; i>=0; i--) {
			    Photo p=new Photo();
				p.setFilePath(savePath);
				p.setImgName(originFiles.get(i));
				p.setImgChangeName(saveFiles.get(i));
				
				if(i==originFiles.size()-1) {
					p.setFileLevel(0);
				}else {
					p.setFileLevel(1);
				}
				fileList.add(p);
			}
			int result=new ReviewService().insertReview(r,fileList);
			
			if(result>=1+fileList.size()) {
				response.sendRedirect("reviewList.bo");
			}else {
				request.setAttribute("msg", "사진 게시판 등록 실패");
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
