package cart.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import cart.model.dao.CartDAO;
import cart.model.vo.Cart;
import cart.model.vo.Order;

public class CartService {
	private CartDAO cDAO = new CartDAO();
	
	public int insertCart(Cart cart, String[] name, String[] count) {
		Connection conn = getConnection();
		
		int result = cDAO.insertCart(conn, cart, name, count);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		 
		return result;
	}

	public int updateCart(Cart cart, String[] name, String[] mcount) {
		Connection conn = getConnection();
		
		int result = cDAO.updateCart(conn, cart, name, mcount);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public ArrayList<Cart> cartList(String userId) {
		Connection conn = getConnection();
		
		ArrayList<Cart> list = cDAO.cartList(conn, userId);
		
		close(conn);
		
		return list;
	}
	
	public Cart cartOptionList(Cart cart) {
		Connection conn = getConnection();
		
		Cart c = cDAO.cartOptionList(conn, cart);
		
		close(conn);
		
		return c;
	}

	public int cartOneDelete(String userId, int cartNo) {
		Connection conn = getConnection();
		
		int result = cDAO.cartOneDelete(conn, userId, cartNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int amountUpdate(String userId, int cartNo, int amount, int total) {
		Connection conn = getConnection();
		
		int result = cDAO.amountUpdate(conn, userId, cartNo, amount, total);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
//	public int cartOptionUpdate(Cart c) {
//		Connection conn = getConnection();
//		
//		int result = cDAO.cartOptionUpdate(conn, c);
//		
//		if(result > 0) {
//			commit(conn);
//		} else {
//			rollback(conn);
//		}
//		
//		close(conn);
//		
//		return result;
//	}

	public int cartSelectDelete(String userId, String[] carts) {
		Connection conn = getConnection();
		
		int result = cDAO.cartSelectDelete(conn, userId, carts);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int cartAllDelete(String userId) {
		Connection conn = getConnection();
		
		int result = cDAO.cartAllDelete(conn, userId);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int countCart(String userId, int pNo) {
		Connection conn = getConnection();
		
		int result = cDAO.countCart(conn, userId, pNo);
		
		close(conn);
		
		return result;
	}
	
	public ArrayList<Cart> cartOneOrder(Cart cart) {
		Connection conn = getConnection();
		
		ArrayList<Cart> list = cDAO.cartOneOrder(conn, cart);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Cart> cartSelectOrder(String userId, String[] carts) {
		Connection conn = getConnection();
		
		ArrayList<Cart> list = cDAO.cartSelectOrder(conn, userId, carts);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Cart> cartAllOrder(String userId) {
		Connection conn = getConnection();
		
		ArrayList<Cart> list = cDAO.cartAllOrder(conn, userId);
		
		close(conn);
		
		return list;
	}
	
	public int insertOrder(Order o) {
		Connection conn = getConnection();
		
		int result = cDAO.insertOrder(conn, o);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
}
