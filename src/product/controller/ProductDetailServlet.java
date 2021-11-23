package product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import material.model.service.MaterialService;
import material.model.vo.Material;
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

		int pNo = Integer.parseInt(request.getParameter("pNo"));
		
		ProductService service = new ProductService();
		Product product = service.selectProduct(pNo);
		ArrayList<Photo> fileList = service.selectPhoto(pNo);
		
		MaterialService mService = new MaterialService();
		Material m = mService.selectMatrial(pNo);
		//split사용해서 mtrlName분리시키기
		
		//System.out.println(material.getMtrlName());
		//System.out.println(material.getMtrlPrice());
		
		String mtrlName = m.getMtrlName();
		String mtrlPrice = m.getMtrlPrice();
		
		//int mtrIno=Integer.parseInt(splitMaterial[0]);
		//int prodNo=Integer.parseInt(splitMaterial[1]);
		
		String page = null;
		if(fileList != null) {					
			request.setAttribute("product",product);
			request.setAttribute("fileList", fileList);
			request.setAttribute("material", m);			

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
