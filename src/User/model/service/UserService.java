package User.model.service;


import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import User.model.dao.UserDAO;
import User.model.vo.User;
import page.PageInfo;


public class UserService {
	
	private UserDAO mDAO = new UserDAO();

	public int checkId(String inputId) {
		Connection conn = getConnection();
		int result = mDAO.checkId(conn,inputId);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public User login(String userId, String userPwd) {
		Connection conn = getConnection();
		User m = mDAO.login(conn,userId,userPwd);
		close(conn);
		return m;
	}

	public String idFindResult(String userName, String email) {
		Connection conn = getConnection();
		String id = mDAO.idFindResult(conn,userName, email);
		close(conn);
		return id;
	}

	public User userIdsearch(String userId) {
		Connection conn = getConnection();
		User m = mDAO.UserIdsearch(conn,userId);
		close(conn);
		return m;
	}

	public int insertUser(User user) {
		Connection conn = getConnection();
		int result = mDAO.insertUser(conn,user);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}
	
	public ArrayList<User> userList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<User> list = mDAO.userList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	public int getListCount() {
		Connection conn=getConnection();
		
		int listCount = mDAO.getListCount(conn);
		
		close(conn);
		
		return listCount;
	}

	
	public ArrayList<User> userSearch(String cond, String search, PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<User> list = mDAO.userSearch(conn, cond, search, pi);
		
		close(conn);
		
		return list;
	}
	
	public int getSearchCount(String cond, String search) {
		Connection conn=getConnection();
		
		int listCount = mDAO.getSearchCount(conn, cond, search);
		
		close(conn);
		
		return listCount;
	}
	
	public int selectDelete(String[] users) {
		Connection conn = getConnection();
		
		int result = mDAO.selectDelete(conn, users);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
				
		return result;
	}
	
	public int checkPwd(String userId, String userPwd) {
		Connection conn = getConnection();
		
		int result = mDAO.checkPwd(conn, userId, userPwd);
		
		close(conn);
		
		return result;
	}
	
	public int updateUser(User m) {
		Connection conn = getConnection();
		
		int result = mDAO.updateUser(conn, m);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public User selectUser(String userId) {
		Connection conn = getConnection();
		
		User user = mDAO.selectUser(conn, userId);
		
		close(conn);
		
		return user;
	}
	 
	public int deleteUser(String userId) {
		Connection conn = getConnection();
		
		int result = mDAO.deleteUser(conn, userId);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
}
