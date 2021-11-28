package myPage.controller;
 
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.model.service.ProductService;
import product.model.vo.PageInfo;
import product.model.vo.Photo;
import product.model.vo.Product;
import zzim.model.service.zzimService;
import zzim.model.vo.zzim;

/**
 * Servlet implementation class ZzimListServlet
 */
@WebServlet("/zzim.me")
public class ZzimListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ZzimListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
		
		
		
		ProductService pService = new ProductService();
		
		String uId = request.getParameter("uId");
		ArrayList<zzim> list = new zzimService().selectZzim(uId);
		ArrayList<Photo> fList = pService.selectFList();
		
		String page = "";
		System.out.println(list.size());
		if(list != null && fList != null) {
			request.setAttribute("fList", fList);
			request.setAttribute("list", list);
			page = "WEB-INF/views/myPage/zzimList.jsp";
		}else {
			request.setAttribute("msg", "찜 목록 조회에 실패하였습니다,");
			page = "WEB-INF/views/common/errorPage.jsp";
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
