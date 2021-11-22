package question.model.dao;

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

import page.PageInfo;

import static common.JDBCTemplate.*;
import question.model.vo.Question;

public class QuestionDAO {
	private Properties prop = null;

	public QuestionDAO() {
		this.prop = new Properties();
		String fileName = QuestionDAO.class.getResource("/sql/Question/Question-query.properties").getPath();

		try {
			this.prop.load(new FileReader(fileName));
		} catch (FileNotFoundException var3) {
			var3.printStackTrace();
		} catch (IOException var4) {
			var4.printStackTrace();
		}

	}

	

	public ArrayList<Question> selectQList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Question> list = null;
		String query = prop.getProperty("selectQList");
		int startRow=(pi.getCurrentPage()-1)* pi.getBoardLimit()+1;
		int endRow=startRow+pi.getBoardLimit()-1;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			list = new ArrayList<Question>();
			while(rset.next()) {
				list.add(new Question(rset.getInt(2),
										rset.getString(3),
										rset.getString(4),
										rset.getString(5),
										rset.getDate(6),
										rset.getDate(7),
										rset.getString(8)
						));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}



	public Question selectQList(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Question q = null;
		String query = prop.getProperty("selectQListUserId");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				q = new Question(rset.getInt(2),
								rset.getString(3),
								rset.getString(4),
								rset.getString(5),
								rset.getDate(6),
								rset.getDate(7),
								rset.getString(8));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return q;
	}



	public int insertQuestion(Connection conn, Question q) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertQuestion");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, q.getQst_title());
			pstmt.setString(2, q.getQst_cont());
			pstmt.setString(3, q.getUser_id());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}



	public int QuestionListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = prop.getProperty("QuestionListCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			if(rset.next()) {
				result = rset.getInt(1);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
			
		}
		return result;
		
	}



	public Question questionDetail(Connection conn, int qId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Question q = null;
		String query = prop.getProperty("questionDetail");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, qId);
			rset=pstmt.executeQuery();
		if(rset.next()) {
			q = new Question(rset.getInt(2),
					rset.getString(3),
					rset.getString(4),
					rset.getString(5),
					rset.getDate(6),
					rset.getDate(7),
					rset.getString(8));
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
			
		}
		return q;
	}



	public int deleteQuestion(Connection conn, int qId) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("deleteQuestion");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, qId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		return result;
	}



	public ArrayList<Question> communitiyQuestion(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Question> q = null;
		String query = prop.getProperty("communitiyQuestion");
		try {
			stmt =conn.createStatement();
			rset = stmt.executeQuery(query);
			q = new ArrayList<Question>();
			while(rset.next()) {
				q.add(new Question(rset.getInt(2),
						rset.getString(3),
						rset.getString(4),
						rset.getString(5),
						rset.getDate(6),
						rset.getDate(7),
						rset.getString(8)
				));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
			
		}
		return q;
	}
}
