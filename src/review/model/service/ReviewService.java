package review.model.service;
import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import page.PageInfo;
import review.model.dao.ReviewDAO;
import review.model.vo.Photo;
import review.model.vo.Review;


public class ReviewService {
	private ReviewDAO rDAO=new ReviewDAO();

	public ArrayList<Review> selectRList( PageInfo pi) {
		Connection conn=getConnection();
		ArrayList<Review> list=rDAO.selectRList(conn,pi);
		return list;
	}
	

	public ArrayList<Photo> selectLFList() {
		Connection conn=getConnection();
		ArrayList<Photo> list=rDAO.selectFList(conn);
		return list;
	}
	
	public int insertReview(Review r, ArrayList<Photo> fileList) {
		Connection conn=getConnection();
		
		int result1=rDAO.insertReview(conn, r);
		int result2=rDAO.insertPhoto(conn, fileList);
		if(result1>0 &&result2>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1+result2;
	}

	public Review selectReview(int bId) {
		Connection conn=getConnection();
		
		Review r=rDAO.selectReview(conn,bId);
		if(r!=null) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return r;
	}

	public ArrayList<Photo> selectPhoto(int bId) {
		Connection conn=getConnection();
		ArrayList<Photo>list=rDAO.selectPhoto(bId,conn);
		close(conn);
		return list;
	}

	public int getFListCount() {
		Connection conn=getConnection();
		int listCount=rDAO.getFSListCount(conn);
		  close(conn);
		return listCount;
	}


	public int updateReview(Review r, Photo p) {
		Connection conn=getConnection();
		int result1=rDAO.updateReview(conn, r);
		int result2=rDAO.updatePhoto(conn, p);
		
		if(result1>0 &&result2>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1+result2;
		
	}


	public int deleteReview(int reviewNo) {
	   Connection conn=getConnection();
	   int result1=rDAO.deleteReview(conn,reviewNo);
	   int result2=rDAO.deletePhoto(conn,reviewNo);
	   if(result1>0 &&result2>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1+result2;
	}


	
}
