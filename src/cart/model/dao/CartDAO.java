package cart.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import cart.model.vo.Cart;
import cart.model.vo.Order;

public class CartDAO {
	private Properties prop = null;
	
	public CartDAO() {
		prop = new Properties();
		String fileName = CartDAO.class.getResource("/sql/cart/cart-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertCart(Connection conn, Cart cart, String[] name, String[] count) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String opn = "";
		String opc = "";
		
		for(int i = 0; i < name.length; i++) {
			if(i == 0) {
				opn += name[i];
				opc += count[i];
			} else {
				opn += ", " + name[i];
				opc += ", " + count[i];
			}
		}
		
		String query = prop.getProperty("insertCart");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, cart.getAmount());
			pstmt.setString(2, cart.getUserId());
			pstmt.setInt(3, cart.getProdNo());
			pstmt.setString(4, opn);
			pstmt.setString(5, opc);
			pstmt.setInt(6, cart.getTotal());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateCart(Connection conn, Cart cart, String[] name, String[] mcount) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String opn = "";
		String opc = "";
		
		for(int i = 0; i < name.length; i++) {
			if(i == 0) {
				opn += name[i];
				opc += mcount[i];
			} else {
				opn += ", " + name[i];
				opc += ", " + mcount[i];
			}
		}
		
		String query = prop.getProperty("insertCart");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, cart.getAmount());
			pstmt.setString(2, opn);
			pstmt.setString(3, opc);
			pstmt.setString(4, cart.getUserId());
			pstmt.setInt(5, cart.getProdNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int countCart(Connection conn, String userId, int pNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("countCart");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setInt(2, pNo);
			rset = pstmt.executeQuery();
			
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public ArrayList<Cart> cartList(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Cart> list = null;
		
		String query = prop.getProperty("cartList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Cart>();
			
			while(rset.next()) {
				int cartNo = rset.getInt("cart_no");
				int prodNo = rset.getInt("prod_no");
				String prodName = rset.getString("prod_name");
				int amount = rset.getInt("amount");
				int price = rset.getInt("price");
				userId = rset.getString("user_id");
				String opn = rset.getString("option_name");
				String opc = rset.getString("option_count");
				int total = rset.getInt("total");
				
				Cart c = new Cart(cartNo, prodNo, prodName, amount, price, total, userId, opn, opc);
				
				list.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public Cart cartOptionList(Connection conn, Cart cart) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Cart c = null;
		
		String query = prop.getProperty("cartOptionList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, cart.getUserId());
			pstmt.setInt(2, cart.getCartNo());
			rset = pstmt.executeQuery();
			
			
			if(rset.next()) {
				int cartNo = rset.getInt("cart_no");
				int prodNo = rset.getInt("prod_no");
				String prodName = rset.getString("prod_name");
				int amount = rset.getInt("amount");
				int price = rset.getInt("price");
				String userId = rset.getString("user_id");
				String opn = rset.getString("option_name");
				String opc = rset.getString("option_count");
				int total = rset.getInt("total");
				
				c = new Cart(cartNo, prodNo, prodName, amount, price, total, userId, opn, opc);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return c;
	}
	
	public int cartOneDelete(Connection conn, String userId, int cartNo, int prodNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("cartOneDelete");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setInt(2, cartNo);
			pstmt.setInt(3, prodNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int amountUpdate(Connection conn, Cart c) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("amountUpdate");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, c.getAmount());
			pstmt.setInt(2, c.getTotal());
			pstmt.setString(3, c.getUserId());
			pstmt.setInt(4, c.getCartNo());
			pstmt.setInt(5, c.getProdNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
//	public int cartOptionUpdate(Connection conn, Cart c) {
//		PreparedStatement pstmt = null;
//		int result = 0;
//		
//		String query = prop.getProperty("cartOptionUpdate");
//		
//		try {
//			pstmt = conn.prepareStatement(query);
//			pstmt.setInt(1, c.getOption1());
//			pstmt.setInt(2, c.getOption2());
//			pstmt.setInt(3, c.getOption3());
//			pstmt.setString(4, c.getUserId());
//			pstmt.setInt(5, c.getCartNo());
//			
//			result = pstmt.executeUpdate();
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(pstmt);
//		}
//		
//		return result;
//	}
	
	public int cartSelectDelete(Connection conn, String userId, String[] carts) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String paras = "";
		
		for(int i = 0; i < carts.length; i++) {
			if(i == 0) {
				paras += "?";
			} else {
				paras += ", ?";
			}
		}
		
		String query = "DELETE FROM CART WHERE CART_NO IN (" + paras + ") AND USER_ID = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			for(int i = 0; i < carts.length; i++) {			
				pstmt.setString(i + 1, carts[i]);
			}
			pstmt.setString(carts.length + 1, userId);
		
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int cartAllDelete(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("cartAllDelete");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Cart> cartOneOrder(Connection conn, Cart cart) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Cart> list = null;
		
		String query = prop.getProperty("cartOneOrder");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, cart.getUserId());
			pstmt.setInt(2, cart.getCartNo());
			pstmt.setInt(3, cart.getProdNo());
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Cart>();
			
			if(rset.next()) {
				int prodNo = rset.getInt("prod_no");
				String prodName = rset.getString("prod_name");
				int amount = rset.getInt("amount");
				int price = rset.getInt("price");
				String userId = rset.getString("user_id");
				String opn = rset.getString("option_name");
				String opc = rset.getString("option_count");
				int total = rset.getInt("total");
				
				Cart c = new Cart(prodNo, prodName, amount, price, total, userId, opn, opc);
				
				list.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public ArrayList<Cart> cartSelectOrder(Connection conn, String userId, String[] carts) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Cart> list = null;
		
		String paras = "";
		
		for(int i = 0; i < carts.length; i++) {
			if(i == 0) {
				paras += "?";
			} else {
				paras += ", ?";
			}
		}
		
		String query = "SELECT PROD_NO, PROD_NAME, AMOUNT, PRICE, USER_ID, OPTION_NAME, OPTION_COUNT, TOTAL FROM CART C JOIN PRODUCT USING (PROD_NO) WHERE USER_ID = ? AND CART_NO IN (" + paras + ")";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, userId);
			for(int i = 0; i < carts.length; i++) {			
				pstmt.setString(1 + (i + 1), carts[i]);
			}
		
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Cart>();
			
			while(rset.next()) {
				int prodNo = rset.getInt("prod_no");
				String prodName = rset.getString("prod_name");
				int amount = rset.getInt("amount");
				int price = rset.getInt("price");
				userId = rset.getString("user_id");
				String opn = rset.getString("option_name");
				String opc = rset.getString("option_count");
				int total = rset.getInt("total");
				
				Cart c = new Cart(prodNo, prodName, amount, price, total, userId, opn, opc);
				
				list.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public ArrayList<Cart> cartAllOrder(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Cart> list = null;
		
		String query = prop.getProperty("cartAllOrder");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Cart>();
			
			while(rset.next()) {
				int prodNo = rset.getInt("prod_no");
				String prodName = rset.getString("prod_name");
				int amount = rset.getInt("amount");
				int price = rset.getInt("price");
				userId = rset.getString("user_id");
				String opn = rset.getString("option_name");
				String opc = rset.getString("option_count");
				int total = rset.getInt("total");
				
				Cart c = new Cart(prodNo, prodName, amount, price, total, userId, opn, opc);
				
				list.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public int insertOrder(Connection conn, Order o) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertOrder");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, o.getOrderNo());
			pstmt.setString(2, o.getUserId());
			pstmt.setString(3, o.getProdName());
			pstmt.setInt(4, o.getPrice());
			pstmt.setString(5, o.getReceiver());
			pstmt.setInt(6, o.getPostal());
			pstmt.setString(7, o.getAddress());
			pstmt.setString(8, o.getDeAddress());
			pstmt.setString(9, o.getNormalPhone());
			pstmt.setString(10, o.getPhone());
			pstmt.setString(11, o.getMessage());
			pstmt.setInt(12, o.getAmount());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}
