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
import material.model.vo.Material;
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
			
			String[] mtrlName = multiRequest.getParameterValues("addOption");//옵션재료명
			String[] optionPrice = multiRequest.getParameterValues("addPrice");//옵션가격
			
			String productInfo = multiRequest.getParameter("productInfo");
			String hashtag = multiRequest.getParameter("hashtag");
			String shortInfo = multiRequest.getParameter("shortInfo");
			//이미지번호
			int imgNo1 = Integer.parseInt(multiRequest.getParameter("imgNo1"));
			int imgNo2 = Integer.parseInt(multiRequest.getParameter("imgNo2"));
			int imgNo3 = Integer.parseInt(multiRequest.getParameter("imgNo3"));
			int imgNo4 = Integer.parseInt(multiRequest.getParameter("imgNo4"));

			
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
						
			//productWriterForm에서 받은 데이터들을 p객체로 만들어서 한 번에 데이터 전달하기
			Product p = new Product(pNo, productName, productPrice, ctgryName, strMtrlName, null, shortInfo, productInfo, hashtag, null);
			Material m = new Material(0, pNo, strMtrlName,stroptionPrice ,null, null);
	
			ArrayList<Photo> fileList = new ArrayList<Photo>();

				for(int j = originFiles.size()-1; j>=0; j--) {				
					Photo ph = new Photo();

					ph.setPath(savePath);
					ph.setImgName(originFiles.get(j));
					ph.setImgChangeName(saveFiles.get(j));
					
					switch(j) {
					case 0:
						ph.setImgNo(imgNo4);
						break;
					case 1:
						ph.setImgNo(imgNo3);
						break;
					case 2:
						ph.setImgNo(imgNo2);
						break;
					case 3:
						ph.setImgNo(imgNo1);
						break;
					}

					if(j < originFiles.size()-1) {
					
						ph.setFileLevel(1);//썸네일인지 아닌지 구분
				
					}else if(j+1 == 3) {
						ph.setFileLevel(0);						
					}						
					fileList.add(ph);
					System.out.println("fileList(i):"+fileList);
				}	

			int result2 = new ProductService().updateProduct(p, fileList, m);					
			if(result2 >= 1+fileList.size()) {

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
