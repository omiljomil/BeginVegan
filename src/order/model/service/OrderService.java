package order.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import order.model.dao.OrderDAO;
import order.model.vo.Order;

public class OrderService {

	private OrderDAO oDAO = new OrderDAO();
	
	public int insertReadyOrder(Order order, String[] sub, String[] count) {
		Connection conn = getConnection();
		
		int result = oDAO.insertReadyOrder(conn, order, sub, count);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public ArrayList<Order> orderList(String userId) {
		Connection conn = getConnection();
		
		ArrayList<Order> list = oDAO.orderList(conn, userId);
		
		close(conn);
		
		return list;
	}

}
