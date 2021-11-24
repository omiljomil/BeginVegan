package paiement.model.dao;

import static common.JDBCTemplate.close;

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
import paiement.model.vo.Paiement;

public class PaiementDAO {
	private Properties prop = null;
	
	public PaiementDAO() {
		prop = new Properties();
		String fileName = PaiementDAO.class.getResource("/sql/paiement/paiement-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Paiement> cartOneOrder(Connection conn, Cart cart) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Paiement> list = null;
		
		String query = prop.getProperty("cartOneOrder");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, cart.getUserId());
			pstmt.setInt(2, cart.getCartNo());
			pstmt.setInt(3, cart.getProdNo());
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Paiement>();
			
			if(rset.next()) {
				int prodNo = rset.getInt("prod_no");
				String prodName = rset.getString("prod_name");
				int amount = rset.getInt("amount");
				int price = rset.getInt("price");
				String userId = rset.getString("user_id");
				
				Paiement c = new Paiement(prodNo, prodName, amount, price, amount * price, userId);
				
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
	
	public ArrayList<Paiement> cartSelectOrder(Connection conn, String userId, String[] carts) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Paiement> list = null;
		
		String paras = "";
		
		for(int i = 0; i < carts.length; i++) {
			if(i == 0) {
				paras += "?";
			} else {
				paras += ", ?";
			}
		}
		
		String query = "SELECT PROD_NO, PROD_NAME, AMOUNT, PRICE, USER_ID FROM CART C JOIN PRODUCT USING (PROD_NO) WHERE CART_NO IN (" + paras + ")";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			for(int i = 0; i < carts.length; i++) {			
				pstmt.setString(i + 1, carts[i]);
			}
		
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Paiement>();
			
			while(rset.next()) {
				int prodNo = rset.getInt("prod_no");
				String prodName = rset.getString("prod_name");
				int amount = rset.getInt("amount");
				int price = rset.getInt("price");
				userId = rset.getString("user_id");
				
				Paiement c = new Paiement(prodNo, prodName, amount, price, amount * price, userId);
				
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
	
	public ArrayList<Paiement> cartAllOrder(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Paiement> list = null;
		
		String query = prop.getProperty("cartAllOrder");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Paiement>();
			
			while(rset.next()) {
				int prodNo = rset.getInt("prod_no");
				String prodName = rset.getString("prod_name");
				int amount = rset.getInt("amount");
				int price = rset.getInt("price");
				userId = rset.getString("user_id");
				
				Paiement c = new Paiement(prodNo, prodName, amount, price, amount * price, userId);
				
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
