package question.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;


import page.PageInfo;

import question.model.dao.QuestionDAO;
import question.model.vo.Question;

public class QuestionService {
	private QuestionDAO qDAO = new QuestionDAO();

	public ArrayList<Question> selectQList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Question> list = qDAO.selectQList(conn,pi);
		close(conn);
		
		return list;
	}

	public Question selectQList(String userId) {
		Connection conn = getConnection();
		Question q = qDAO.selectQList(conn,userId);
		close(conn);
		
		return q;
	}

	public int insertQuestion(Question q) {
		Connection conn = getConnection();
		int result = qDAO.insertQuestion(conn,q);
		close(conn);
		 if(result>0) {
				commit(conn);
			}else {
				rollback(conn);
			}
		 close(conn);
		return result;
	}

	public int QuestionListCount() {
		Connection conn = getConnection();
		int result = qDAO.QuestionListCount(conn);
		return result;
	}

	public Question questionDetail(int qId) {
		Connection conn = getConnection();
		Question q = qDAO.questionDetail(conn,qId);
		return q;
	}

	public int deleteQuestion(int qId) {
		Connection conn = getConnection();
		int result = qDAO.deleteQuestion(conn,qId);
		 if(result>0) {
				commit(conn);
			}else {
				rollback(conn);
			}
		 close(conn);
		return result;
	}

	public ArrayList<Question> communitiyQuestion() {
		Connection conn = getConnection();
		ArrayList<Question> q = qDAO.communitiyQuestion(conn);
		return q;
	}
	
}
