

package product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.model.service.ProductService;
import product.model.vo.Product;
import product.model.vo.PageInfo;
import product.model.vo.Photo;


/**
 * Servlet implementation class ProductListServlet
 */
@WebServlet("/productList.do")
public class ProductListServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      //리스트이기 때문에 페이징처리, 썸네일 사진도 불러올 수 있게 해야함
      
      int listCateCount;
      int currentPage;
      int pageLimit;
      int boardLimit;
      int maxPage;
      int startPage;
      int endPage;
      
      ProductService pService = new ProductService();
      
      //1. 전체 게시글 개수 조회   
      
   
         listCateCount = pService.getAllListCount();
         System.out.println("listCateCount서블릿:"+listCateCount);
      
      
      //2. 현재페이지 설정
      currentPage = 1;
      if(request.getParameter("currentPage") != null) {
         currentPage = Integer.parseInt(request.getParameter("currentPage"));
      }
      
      //3. boardLimit와 pageLimit설정
      pageLimit = 10;
      boardLimit = 6;
      
      //4. 각 변수 계산식 작성

      maxPage = (int)Math.ceil((double)listCateCount / boardLimit);
      startPage = (currentPage - 1)/pageLimit * pageLimit + 1;
      endPage = startPage + pageLimit - 1;
      if(maxPage < endPage) {//maxPage가 endPage보다 작을 수 있다.
         endPage = maxPage;
      }

      PageInfo pi = new PageInfo(currentPage, listCateCount, pageLimit, boardLimit, maxPage, startPage, endPage);
      System.out.println("리스트서블릿pi:"+pi);
      ArrayList<Product> plist = new ArrayList<Product>();
      
   
         plist = pService.selectPListAll(pi);   
      
   
      ArrayList<Photo> fList = pService.selectFList();
   
      String page = "";
      
      if(plist != null && fList != null) {
         request.setAttribute("fList", fList);
         request.setAttribute("pList", plist);
         request.setAttribute("pi", pi);
         page = "WEB-INF/views/product/productList.jsp";
      }else {
         request.setAttribute("msg", "상품리스트 조회 실패");
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