package cart.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import cart.model.dao.CartDAO;
import cart.model.vo.Cart;

public class CartService {
	private CartDAO cDAO = new CartDAO();
	
	public int insertCart(Cart cart) {
		Connection conn = getConnection();
		
		int result = cDAO.insertCart(conn, cart);
		
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
	
}
