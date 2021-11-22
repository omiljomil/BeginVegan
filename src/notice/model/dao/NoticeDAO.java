package notice.model.dao;

import static common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import java.util.Properties;
import notice.model.vo.Notice;
import page.PageInfo;

public class NoticeDAO {
	 private Properties prop=null;
	 
	public NoticeDAO(){
		prop=new Properties();
		String fileName=NoticeDAO.class.getResource("/sql/notice/notice-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	public ArrayList<Notice> selectList(Connection conn, PageInfo pi) {
	  PreparedStatement  pstmt=null;
	   ArrayList<Notice>list=null;
	   ResultSet rset=null;
		
	   String query=prop.getProperty("selectList");
		int startRow=(pi.getCurrentPage()-1)* pi.getBoardLimit()+1;//startRow 페이지에 01,11,21 이 들어가게되니깐 ?
		int endRow=startRow+pi.getBoardLimit()-1;//
	   
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset=pstmt.executeQuery();
			list=new ArrayList<Notice>();
			while(rset.next()) {
				Notice n=new Notice(rset.getInt("NOTICE_NO"),
						            rset.getString("NOTICE_TITLE"),
						            rset.getString("NOTICE_CONTENT"),
						            rset.getString("USER_NAME"),
						            rset.getDate("ENROLL_DATE"),
						            rset.getDate("MODIFY_DATE"),
						            rset.getString("STATUS"));
				list.add(n);
		   }
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		} 
	   return list;
	}

	public int getListCount(Connection conn) {
		Statement stmt=null;
		ResultSet rset=null;
		int listCount=0;
		
		String query=prop.getProperty("listCount");
		
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



	public Notice bringNotice(Connection conn, int no) {
		PreparedStatement pstmt=null;
		Notice n=null;
		ResultSet rset=null;
		String query=prop.getProperty("bringNotice");
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, no);
			rset=pstmt.executeQuery();
			if(rset.next()) {
				n=new Notice(rset.getInt("NOTICE_NO"),
					     rset.getString("NOTICE_TITLE"),
					     rset.getString("NOTICE_CONTENT"),
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
		return n;
	}

	public int insertNotice(Connection conn, Notice n) {
		  PreparedStatement pstmt=null;
		     int result=0;
		 
		     try {
		       String query=prop.getProperty("insertNotice");
				pstmt=conn.prepareStatement(query);
				pstmt.setString(1,n.getNoticeTitle());
				pstmt.setString(2,n.getNoticeContent());
				pstmt.setString(3,n.getNoticeWriter());
				pstmt.setDate(4, n.getEnrollDate());
				result=pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}	 
			return result;
	}

	public int updateNotice(Connection conn, Notice n) {
		PreparedStatement pstmt=null;
		int result=0;
		
		String query=prop.getProperty("updateNotice");
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContent());
			pstmt.setDate(3, n.getEnrollDate());
			 pstmt.setString(4, n.getNoticeWriter()); 
			pstmt.setInt(5, n.getNoticeNo());
	       result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteNotice(Connection conn, int no) {
		PreparedStatement pstmt=null;
		int result=0;
		String query=prop.getProperty("deleteNotice");
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, no);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
}