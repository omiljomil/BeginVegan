package manager.model.service;

import static common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;

import manager.model.dao.OrderManagerDAO;
import manager.model.vo.OrderManager;

public class OrderManagerService {
	private OrderManagerDAO omDAO = new OrderManagerDAO();
	
	public ArrayList<OrderManager> orderList() {
		Connection conn = getConnection();
		
		ArrayList<OrderManager> list = omDAO.orderList(conn);
		
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
	
	public ArrayList<OrderManager> orderSearch(String cond, String search) {
		Connection conn = getConnection();
		
		ArrayList<OrderManager> list = omDAO.orderSearch(conn, cond, search);
		
		close(conn);
		
		return list;
	}

}
