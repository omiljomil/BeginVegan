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
import material.model.service.MaterialService;
import material.model.vo.Material;
import product.model.service.ProductService;
import product.model.vo.Photo;
import product.model.vo.Product;

/**
 * Servlet implementation class ProductWriteServlet
 */
@WebServlet("/insertProduct.pr")
public class InsertProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		//enctype이 multipart/form-data로 전송되었는지 확인(전송되었으면 if문 실행)
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
			String productName = multiRequest.getParameter("productName");
			int productPrice = Integer.parseInt(multiRequest.getParameter("productPrice"));
			String ctgryName = multiRequest.getParameter("detailCategory");
			String[] mtrlName = multiRequest.getParameterValues("addOption");//옵션재료명
			String[] optionPrice = multiRequest.getParameterValues("addPrice");//옵션가격
 			
			String productInfo = multiRequest.getParameter("productInfo");
			String hashtag = multiRequest.getParameter("hashtag");
			String shortInfo = multiRequest.getParameter("shortInfo");
			
			// 옵션재료명 배열을 String으로 바꾸기
			String strMtrlName = "";
			if(mtrlName != null) {
				for(int i = 0; i < mtrlName.length; i++) {
					if(i == 0) {
						strMtrlName += mtrlName[i];
					}else {
						strMtrlName += ", " + mtrlName[i];
					}
				}
			}
			System.out.println("재료:"+strMtrlName);
			
			String stroptionPrice = "";
			if(optionPrice != null) {
				for(int i = 0; i < optionPrice.length; i++) {
					if(i == 0) {
						stroptionPrice += optionPrice[i];
					}else {
						stroptionPrice += ", " + optionPrice[i];
					}
				}
			}
			System.out.println("가격:"+stroptionPrice);
			
			//productWriterForm에서 받은 데이터들을 p객체로 만들어서 한 번에 데이터 전달하기
			Product p = new Product(0, productName, productPrice, ctgryName, strMtrlName, null, shortInfo, productInfo, hashtag, null);
			Material m = new Material(0, 0, strMtrlName,stroptionPrice ,null, null);
			
			ArrayList<Photo> fileList = new ArrayList<Photo>();
			
			for(int i = originFiles.size()-1; i>=0; i--) {
				Photo ph = new Photo();
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
			int result = new ProductService().insertProduct(p, fileList, m);
			
			if(result >= 1+fileList.size()) {
				
				response.sendRedirect("ManagerProductList.pr");

			}else {
				request.setAttribute("msg", "상품 등록 실패");
				request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
				//실패하면 안에 있는 사진 삭제
				//아 진짜 바보.. else문 밖에 있어서 계속 사진이 삭제되서 조회가 안되었음
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
