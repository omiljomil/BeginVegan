package question.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;


import page.PageInfo;

import question.model.dao.QuestionDAO;
import question.model.vo.Question;
import question.model.vo.Question_Comment;

public class QuestionService {
	private QuestionDAO qDAO = new QuestionDAO();

	public ArrayList<Question> selectQList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Question> list = qDAO.selectQList(conn,pi);
		close(conn);
		
		return list;
	}

	public ArrayList<Question> selectQList(String userId) {
		Connection conn = getConnection();
		ArrayList<Question> list = qDAO.selectQList(conn,userId);
		close(conn);
		
		return list;
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

	public ArrayList<Question_Comment> selectCommentList(int qId) {
		Connection conn = getConnection();
		ArrayList<Question_Comment> list = qDAO.selectCommentList(conn,qId);
		close(conn);
		
		return list;
	}

	public ArrayList<Question_Comment> insertQuestionCommont(Question_Comment qc) {
		Connection conn = getConnection();
		int result = qDAO.insertQuestionCommont(conn,qc);
		ArrayList<Question_Comment> list = null;
		
		if(result>0) {
			list = new ArrayList<Question_Comment>();
			list  = qDAO.selectCommentList(conn,qc.getQst_no());
			if(result >0 && list !=null) {
				commit(conn);
			}else {
				rollback(conn);
			}
		}else {
			rollback(conn);
		}
		close(conn);
		
		return list;
	}

	public int deleteQuestionComment(int no) {
		Connection conn = getConnection();
		int result = qDAO.deleteQuestionComment(conn,no);
		 if(result>0) {
				commit(conn);
			}else {
				rollback(conn);
			}
		 close(conn);
		return result;
	}

	public int selectCommentListCount(int qst_no) {
		Connection conn = getConnection();
		int count = qDAO.selectCommentListCount(conn,qst_no);
		close(conn);
		return count;
	}
	
}
