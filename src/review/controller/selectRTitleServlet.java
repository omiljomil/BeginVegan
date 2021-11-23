package review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;

import review.model.service.ReviewService;
import review.model.vo.Photo;
import review.model.vo.Review;

/**
 * Servlet implementation class selectRTitleServlet
 */
@WebServlet("/selectRTitle.bo")
public class selectRTitleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public selectRTitleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		ArrayList<Review> rList=new ReviewService().selectRTitle();
		ArrayList<Photo> fList=new ReviewService().selectFTitle();
		
		response.setContentType("application/json; charset=UTF-8");
		Gson gson=new Gson();
		JSONObject review=new JSONObject();
		
		review.put("fList", fList);
		review.put("rList", rList);
		gson.toJson(review,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
