package product.controller;

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

import common.MyFileRenamePolicy;
import product.model.service.ProductService;
import product.model.vo.Photo;
import product.model.vo.Product;

/**
 * Servlet implementation class ProductUpdateServlet
 */
@WebServlet("/productUpdate.pr")
public class ProductUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//해당 상품클릭시 그 번호를 찾아 데이터 가져옴
		
		
		if(ServletFileUpload.isMultipartContent(request)) {
					
			int maxSize = 1024*1024*10;
			String root = request.getSession().getServletContext().getRealPath("/");
			String savePath = root + "thumbnail_uploadFiles/";
					
			File f = new File(savePath);
				if(!f.exists()) {
						f.mkdirs();
				}

		MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
				
			ArrayList<String> saveFiles = new ArrayList<String>();//파일의 바뀐 이름을 저장할 ArrayList
			ArrayList<String> originFiles = new ArrayList<String>(); //파일의 원래 이름을 저장할 ArrayList
						
			Enumeration<String> files = multiRequest.getFileNames();
					
				while(files.hasMoreElements()) {//데이터가 존재하면 true반환
					String name = files.nextElement();//데이터를 얻음
						
						if(multiRequest.getFilesystemName(name) != null) {//rename된 파일 명을 가져옴(null이면 사진이 없다는 뜻)
							saveFiles.add(multiRequest.getFilesystemName(name));
							originFiles.add(multiRequest.getOriginalFileName(name));
						}
					}
					
			//productWriterForm에서 입력받은 데이터 가져오기
			int pNo = Integer.parseInt(multiRequest.getParameter("pNo"));	
			String productName = multiRequest.getParameter("productName");
			int productPrice = Integer.parseInt(multiRequest.getParameter("productPrice"));
			String ctgryName = multiRequest.getParameter("detailCategory");
			String mtrlName = multiRequest.getParameter("mainMtrl");
			String productInfo = multiRequest.getParameter("productInfo");
			String hashtag = multiRequest.getParameter("hashtag");
			String shortInfo = multiRequest.getParameter("shortInfo");
			String thumbnailImg1 = multiRequest.getParameter("thumbnailImg1");
			String thumbnailImg2 = multiRequest.getParameter("thumbnailImg2");
			String thumbnailImg3 = multiRequest.getParameter("thumbnailImg3");
			String thumbnailImg4 = multiRequest.getParameter("thumbnailImg4");
			
			ArrayList<String> thumb = new ArrayList<String>();
			
			thumb.add(thumbnailImg1);
			thumb.add(thumbnailImg2);
			thumb.add(thumbnailImg3);
			thumb.add(thumbnailImg4);
			
			System.out.println("ArrayList사진:"+ thumb);
			//productWriterForm에서 받은 데이터들을 p객체로 만들어서 한 번에 데이터 전달하기
			Product p = new Product(pNo, productName, productPrice, ctgryName, mtrlName, null, shortInfo, productInfo, hashtag, null);
			System.out.println("p:" + p );		
			ArrayList<Photo> fileList = new ArrayList<Photo>();
				//사진을 전부 수정해야지 됌.. 안그러면 사진 도배됌..	
				for(int i = originFiles.size()-1; i>=0; i--) {
					Photo ph = new Photo();
					ph.setProdNo(pNo);
					ph.setFileLevel(i);
					ph.setPath(savePath);
					ph.setImgName(originFiles.get(i));
					ph.setImgChangeName(saveFiles.get(i));
						
						if(i == originFiles.size() - 1) {
							ph.setFileLevel(0);//썸네일인지 아닌지 구분
						}else {
							ph.setFileLevel(1);
						}
						
						fileList.add(ph);
					}	
				System.out.println("fileList:" + fileList);
				int result = new ProductService().updateProduct(p, fileList);
					
				if(result >= 1+fileList.size()) {
					//기존의 파일은 삭제
					for(int i = 0; i < thumb.size(); i++) {
						
						File fail = new File(savePath + thumb.get(i));
						fail.delete();
					}	
					response.sendRedirect("ManagerProductList.pr");

				}else {
					request.setAttribute("msg", "상품 수정 실패");
					request.getRequestDispatcher("WEB-INF/Views/common/errorPage.jsp").forward(request, response);
						//실패하면 안에 있는 사진 삭제
						for(int i = 0; i < saveFiles.size(); i++) {
							File fail = new File(savePath + saveFiles.get(i));
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
