package order.model.dao;

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

import order.model.vo.Order;

public class OrderDAO {
private Properties prop = null;
	
	public OrderDAO() {
		prop = new Properties();
		String fileName = OrderDAO.class.getResource("/sql/order/order-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertReadyOrder(Connection conn, Order order, String[] sub, String[] count) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String opn = "";
		String opc = "";
		
		for(int i = 0; i < sub.length; i++) {
			if(i == 0) {
				opn += sub[i];
				opc += count[i];
			} else {
				opn += ", " +  sub[i];
				opc += ", " + count[i];
			}
		}
		
		String query = prop.getProperty("intsertReadyOrder");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, order.getUserId());
			pstmt.setInt(2, order.getProdNo());
			pstmt.setInt(3, order.getAmount());
			pstmt.setString(4, opn);
			pstmt.setString(5, opc);
			pstmt.setInt(6, order.getTotal());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Order> orderList(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Order> list = null;
		
		String query = prop.getProperty("orderList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Order>();
			
			while(rset.next()) {
				Order o = new Order(
						rset.getInt("ORDER_NO"),
						rset.getString("USER_ID"),
						rset.getInt("PROD_NO"),
						rset.getString("PROD_NAME"),
						rset.getInt("AMOUNT"),
						rset.getInt("PRICE"),
						rset.getString("OPTION_NAME"),
						rset.getString("OPTION_COUNT"),
						rset.getInt("TOTAL")
						);
				
				list.add(o);
						
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
