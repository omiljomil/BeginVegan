package manager.model.service;

import static common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;

import manager.model.dao.OrderManagerDAO;
import manager.model.vo.OrderManager;
import page.PageInfo;

public class OrderManagerService {
	private OrderManagerDAO omDAO = new OrderManagerDAO();
	
	public ArrayList<OrderManager> orderList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<OrderManager> list = omDAO.orderList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	public int changeOrder(String[] orderNo, String status) {
		Connection conn = getConnection();
		
		int result = omDAO.changeOrder(conn, orderNo, status);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
				
		return result;
	}
	
	public ArrayList<OrderManager> orderSearch(String cond, String search, PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<OrderManager> list = omDAO.orderSearch(conn, cond, search, pi);
		
		close(conn);
		
		return list;
	}
	
	public int getListCount() {
		Connection conn=getConnection();
		
		int listCount = omDAO.getListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	public int getSearchCount(String cond, String search) {
		Connection conn=getConnection();
		
		int listCount = omDAO.getSearchCount(conn, cond, search);
		
		close(conn);
		
		return listCount;
	}

}
