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
 * Servlet implementation class ProductUpdateFormServlet
 */
@WebServlet("/prouctUpdateForm.pr")
public class ProductUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//데이터 가지고 와야함

		int pNo = Integer.parseInt(request.getParameter("pNo"));
		
		ProductService service = new ProductService();
		Product product = service.selectProduct(pNo);
		ArrayList<Photo> fileList = service.selectPhoto(pNo);
				
		String page = null;
		if(fileList != null) {
					
			request.setAttribute("product",product);
			request.setAttribute("fileList", fileList);
			page = "WEB-INF/views/product/productUpdateForm.jsp";
			
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
