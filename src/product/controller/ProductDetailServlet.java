package product.controller;

import java.io.IOException;
import java.util.ArrayList;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.model.service.ProductService;
import product.model.vo.Photo;
import product.model.vo.Product;

/**
 * Servlet implementation class ProductDetailServlet
 */
@WebServlet("/proDetail.bo")
public class ProductDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//상품, 사진 갖고 와야하니까 2번 서버에 가야함
		int pNo = Integer.parseInt(request.getParameter("pNo"));
		
		ProductService service = new ProductService();
		Product product = service.selectProduct(pNo);
		
//		HashMap<String,String> productDetail = new HashMap<String,String>();// hashmap 으로 가져오기
//		
//		productDetail = service.selectProductDetail(pNo);
		
		ArrayList<Photo> fileList = service.selectPhoto(pNo);
				
		String page = null;
		if(fileList != null) {
					
			request.setAttribute("product",product);
			request.setAttribute("fileList", fileList);
//			request.setAttribute("mapProductDetail", productDetail);
			page = "WEB-INF/views/product/productDetail.jsp";
			
		}else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "상품 상세보기 실패");
					
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
