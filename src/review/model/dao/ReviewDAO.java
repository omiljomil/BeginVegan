package review.model.dao;
import static common.JDBCTemplate.*;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.util.ArrayList;
import java.util.Properties;


import page.PageInfo;
import review.model.vo.Photo;
import review.model.vo.Review;

public class ReviewDAO {
private Properties prop=null;
	
	public ReviewDAO() {
		
		prop =new Properties();
		String fileName=ReviewDAO.class.getResource("/sql/review/review-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Review> selectRList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		ArrayList<Review> rList=null;
		String query=prop.getProperty("selectRList");
		int startRow=(pi.getCurrentPage()-1)* pi.getBoardLimit()+1;//startRow 페이지에 01,11,21 이 들어가게되니깐 ?
		int endRow=startRow+pi.getBoardLimit()-1;
		
		try {
		      pstmt=conn.prepareStatement(query);
			rList=new ArrayList<Review>();
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset=pstmt.executeQuery();
			while(rset.next()) {
				rList.add(new Review(rset.getInt("RE_NO"),
						             rset.getString("RE_TITLE"),
						             rset.getString("RE_CONT"),
						             rset.getString("USER_ID"),
						             rset.getString("USER_NAME"),
						             rset.getDate("ENROLL_DATE"),
						             rset.getDate("MODIFY_DATE"),
						             rset.getString("STATUS")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return rList;
	}

	public ArrayList<Photo> selectFList(Connection conn) {
		Statement stmt=null;
		ResultSet rset=null;
		ArrayList<Photo> fList=null;
		String query=prop.getProperty("selectFList");
		
		try {
			stmt=conn.createStatement();
			rset=stmt.executeQuery(query);
			fList=new ArrayList<Photo>();
			while(rset.next()) {
				Photo p=new Photo();
				p.setReviewNo(rset.getInt("RE_NO"));
				p.setImgChangeName(rset.getString("IMG_CHANGE_NAME"));
				fList.add(p);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);	
		}
		return fList;
	}

	public int insertReview(Connection conn, Review r) {
		PreparedStatement pstmt=null;
		int result=0;
		
		String query=prop.getProperty("insertReview");
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1,r.getReviewTitle());
			pstmt.setString(2, r.getReviewCon());
			pstmt.setString(3, r.getUserId());
			result=pstmt.executeUpdate();	
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int insertPhoto(Connection conn, ArrayList<Photo> fileList) {
		PreparedStatement pstmt=null;
		int result=0;
		
		String query=prop.getProperty("insertPhoto");
		try {
			pstmt=conn.prepareStatement(query);
			 for(int i=0; i<fileList.size();i++) {
			 pstmt.setString(1, fileList.get(i).getImgName());	
		        pstmt.setString(2, fileList.get(i).getImgChangeName());
		        pstmt.setString(3,fileList.get(i).getFilePath());
		        pstmt.setInt(4,fileList.get(i).getFileLevel());
		        result+=pstmt.executeUpdate();
			 }
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public Review selectReview(Connection conn, int bId) {
		PreparedStatement pstmt=null;
		Review review=null;
		ResultSet rset=null;
		String query=prop.getProperty("selectReview");
	
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, bId);
			rset=pstmt.executeQuery();
			if(rset.next()) {
			  review=new Review(rset.getInt("RE_NO"),
					            rset.getString("RE_TITLE"),
					            rset.getString("RE_CONT"),
					            rset.getString("USER_ID"),
					            rset.getString("USER_NAME"),
					            rset.getDate("ENROLL_DATE"),
					            rset.getDate("MODIFY_DATE"),
					            rset.getString("STATUS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return review;
	}

	public ArrayList<Photo> selectPhoto(int bId, Connection conn) {
		 PreparedStatement pstmt=null;
		    ResultSet rset=null;
		    ArrayList<Photo> list=null;
		    
		    String query=prop.getProperty("selectPhoto");
		    list=new ArrayList<Photo>();
		    try {
				pstmt=conn.prepareStatement(query);
				   pstmt.setInt(1, bId);
				    rset=pstmt.executeQuery();
				    while(rset.next()) {
				    	Photo p=new Photo();
				    	 p.setImgNo(rset.getInt("IMG_NO"));
				    	 p.setReviewNo(rset.getInt("RE_NO"));
				    	 p.setImgName(rset.getNString("IMG_NAME"));
				    	 p.setImgChangeName(rset.getString("IMG_CHANGE_NAME"));
				    	 p.setFilePath(rset.getString("PATH"));
				    	 p.setFileLevel(rset.getInt("FILE_LEVEL"));
				    	 p.setStatus(rset.getString("STATUS"));
				    	 list.add(p);
				    	
				    }
			} catch (SQLException e) {
				
				e.printStackTrace();
			}finally {
				close(pstmt);
				close(rset);
			}
		return list;
	}

	public int getFSListCount(Connection conn) {
		Statement stmt=null;
		ResultSet rset=null;
		int listCount=0;
		String query=prop.getProperty("FListCount");
		
		
	    try {
	    	stmt=conn.createStatement();
			rset=stmt.executeQuery(query);
			if(rset.next()) {
		    	listCount=rset.getInt(1);
		    }
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
			
		}
		return listCount;
	}

	public int updateReview(Connection conn, Review r) {
	    PreparedStatement pstmt=null;
	    int result=0;
	    
	    String query=prop.getProperty("updateReview");
	    
	    try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1,r.getReviewTitle());
			pstmt.setString(2,r.getReviewCon());	
		    pstmt.setInt(3, r.getReviewNo());
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return  result;
	}

	public int updatePhoto(Connection conn, Photo p) {
	    PreparedStatement pstmt=null;
	    int result=0;
	    
	    String query=prop.getProperty("updatePhoto");
	    
	    try {
			pstmt=conn.prepareStatement(query);
				 pstmt.setString(1, p.getImgName());	
			        pstmt.setString(2, p.getImgChangeName());
			        pstmt.setString(3,p.getFilePath());
			        pstmt.setInt(4,p.getFileLevel());
			        pstmt.setInt(5, p.getReviewNo());
			        result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteReview(Connection conn, int reviewNo) {
		PreparedStatement pstmt=null;
		int result=0;
		String query=prop.getProperty("deleteReview");
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, reviewNo);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int deletePhoto(Connection conn, int reviewNo) {
		PreparedStatement pstmt=null;
		int result=0;
		String query=prop.getProperty("deletePhoto");
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, reviewNo);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	
	
	
}	
