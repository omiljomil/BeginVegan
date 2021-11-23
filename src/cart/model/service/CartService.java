package cart.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import cart.model.dao.CartDAO;
import cart.model.vo.Cart;

public class CartService {
	private CartDAO cDAO = new CartDAO();
	
	public int insertCart(Cart cart, String[] option, int count1, int count2, int count3) {
		Connection conn = getConnection();
		
		int result = cDAO.insertCart(conn, cart);
//		int result2 = cDAO.insertOption(conn, cart, option, count1, count2, count3);
		
		if(result > 0/* && result2 > 0*/) {
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
	
	public Cart cartOption(Cart cart) {
		Connection conn = getConnection();
		
		Cart c = cDAO.cartOption(conn, cart);
		
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
	
	public int amountUpdate(String userId, int cartNo, int amount) {
		Connection conn = getConnection();
		
		int result = cDAO.amountUpdate(conn, userId, cartNo, amount);
		
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

	public int cartCheckDelete(String userId, String[] carts) {
		Connection conn = getConnection();
		
		int result = cDAO.cartCheckDelete(conn, userId, carts);
		
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
	
	public int updateCart(Cart cart) {
		Connection conn = getConnection();
		
		int result = cDAO.updateCart(conn, cart);
		
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
	
	public ArrayList<Cart> cartAllOrder(String userId) {
		Connection conn = getConnection();
		
		ArrayList<Cart> list = cDAO.cartAllOrder(conn, userId);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Cart> cartCheckOrder(String userId, String[] carts) {
		Connection conn = getConnection();
		
		ArrayList<Cart> list = cDAO.cartCheckOrder(conn, userId, carts);
		
		close(conn);
		
		return list;
	}
}
