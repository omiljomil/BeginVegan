package cart.model.dao;

import static common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import cart.model.vo.Cart;

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
	
	public int insertCart(Connection conn, Cart cart) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertCart");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, cart.getAmount());
			pstmt.setString(2, cart.getUserId());
			pstmt.setInt(3, cart.getProdNo());
			
			result = pstmt.executeUpdate();
			
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
//				Cart c = new Cart(rset.getInt("cart_no"),
//								  rset.getInt("prod_no"),
//								  rset.getString("prod_name"),
//								  rset.getInt("amount"),
//								  rset.getInt("price"),
//								  rset.getInt("price") * rset.getInt("amount"),
//								  rset.getString("user_id"),
//								  rset.getDate("enroll_date"),
//								  rset.getString("status"));
				
				int cartNo = rset.getInt("cart_no");
				int prodNo = rset.getInt("prod_no");
				String prodName = rset.getString("prod_name");
				int amount = rset.getInt("amount");
				int price = rset.getInt("price");
				userId = rset.getString("user_id");
				
				Cart c = new Cart(cartNo, prodNo, prodName, amount, price, amount * price, userId);
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

}
