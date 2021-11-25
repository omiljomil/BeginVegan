package order.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import cart.model.vo.Cart;
import order.model.dao.OrderDAO;
import order.model.vo.Order;

public class OrderService {
	private OrderDAO paiePAO = new OrderDAO();
	
	public ArrayList<Order> cartOneOrder(Cart cart) {
		Connection conn = getConnection();
		
		ArrayList<Order> list = paiePAO.cartOneOrder(conn, cart);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Order> cartSelectOrder(String userId, String[] carts) {
		Connection conn = getConnection();
		
		ArrayList<Order> list = paiePAO.cartSelectOrder(conn, userId, carts);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Order> cartAllOrder(String userId) {
		Connection conn = getConnection();
		
		ArrayList<Order> list = paiePAO.cartAllOrder(conn, userId);
		
		close(conn);
		
		return list;
	}
}
