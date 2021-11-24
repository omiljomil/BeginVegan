package manager.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import manager.model.vo.OrderManager;

public class OrderManagerDAO {
	private Properties prop = null;
	
	public OrderManagerDAO() {
		prop = new Properties();
		
		String fileName = OrderManagerDAO.class.getResource("/sql/manager/OrderManager-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<OrderManager> orderList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<OrderManager> list = null;
		
		String query = prop.getProperty("orderList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<OrderManager>();
			
			while(rset.next()) {
				OrderManager o = new OrderManager(rset.getInt("order_no"),
									rset.getString("prod_name"),
									rset.getInt("amount"),
									rset.getInt("order_price"),
									rset.getDate("order_date"),
									rset.getString("user_id"),
									rset.getString("receiver"),
									rset.getString("phone"),
									rset.getString("status"));
				
				list.add(o);
			}
			System.out.println(list);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public int changeOrder(Connection conn, String[] orderNo, String status) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String paras = "";
		
		for(int i = 0; i < orderNo.length; i++) {
			if(i == 0) {
				paras += "?";
			} else {
				paras += ", ?";
			}
		}
		
		String query = "UPDATE ORDER_DETAIL SET STATUS = ? WHERE ORDER_NO IN (" + paras + ")";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, status);
			
			for(int i = 0; i < orderNo.length; i++) {			
				pstmt.setString(1 + (i + 1), orderNo[i]);
			}
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public ArrayList<OrderManager> orderSearch(Connection conn, String cond, String search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<OrderManager> list = null;
		
		String selectQuery = "";
		
		switch(cond) {
		case "orderno":
			selectQuery = "orderSearch1";
			break;
		case "prodname":
			selectQuery = "orderSearch2";
			break;
		case "orderprice":
			selectQuery = "orderSearch3";
			break;
		case "orderdate":
			selectQuery = "orderSearch4";
			break;
		case "userid":
			selectQuery = "orderSearch5";
			break;
		case "receiver":
			selectQuery = "orderSearch6";
			break;
		case "address":
			selectQuery = "orderSearch7";
			break;
		case "phone":
			selectQuery = "orderSearch8";
			break;
		case "status":
			selectQuery = "orderSearch9";
			break;
		}
		
		String query = prop.getProperty(selectQuery);
		
		try {
			pstmt = conn.prepareStatement(query);
			
			if(cond.equals("orderno") || cond.equals("orderprice")) {
				pstmt.setString(1, search);
			} else {
				pstmt.setString(1, "%" + search + "%");
			}
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<OrderManager>();
			
			while(rset.next()) {
				OrderManager o = new OrderManager(rset.getInt("order_no"),
									rset.getString("prod_name"),
									rset.getInt("amount"),
									rset.getInt("order_price"),
									rset.getDate("order_date"),
									rset.getString("user_id"),
									rset.getString("receiver"),
									rset.getString("phone"),
									rset.getString("status"));
				
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
