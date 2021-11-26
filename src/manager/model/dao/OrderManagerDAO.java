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
import java.util.List;
import java.util.Properties;

import manager.model.vo.OrderManager;
import page.PageInfo;

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
	
	public ArrayList<OrderManager> orderList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<OrderManager> list = null;
		
		String query = prop.getProperty("orderList");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<OrderManager>();
			
			while(rset.next()) {
				OrderManager o = new OrderManager(Integer.parseInt(rset.getString("order_no")),
												  rset.getString("prod_name"),
												  rset.getInt("amount"),
												  rset.getInt("price"),
												  rset.getDate("enroll_date"),
												  rset.getString("user_id"),
												  rset.getString("receiver"),
												  rset.getString("address"),
												  rset.getString("phone"),
												  rset.getInt("order_type"));
				
				list.add(o);
				
				System.out.println(o);
			}
			System.out.println(list);
			System.out.println(startRow);
			System.out.println(endRow);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
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
		
		int orderType = 0; 
		switch(status) {
		case "주문완료":
			orderType = 0;
			break;
		case "상품준비중":
			orderType = 1;
			break;
		case "배송중":
			orderType = 2;
			break;
		case "배송완료":
			orderType = 3;
			break;
		case "주문취소":
			orderType = 4;
			break;
		}
		
		String query = "UPDATE SHIPINFO SET ORDER_TYPE = ? WHERE ORDER_NO IN (" + paras + ")";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, orderType);
			
			for(int i = 0; i < orderNo.length; i++) {			
				pstmt.setString(1 + (i + 1), orderNo[i]);
			}
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public ArrayList<OrderManager> orderSearch(Connection conn, String cond, String search, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<OrderManager> list = null;
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
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
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
			} else {
				pstmt.setString(1, "%" + search + "%");
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
			}
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<OrderManager>();
			
			while(rset.next()) {
				OrderManager o = new OrderManager(Integer.parseInt(rset.getString("order_no")),
												  rset.getString("prod_name"),
												  rset.getInt("amount"),
												  rset.getInt("price"),
												  rset.getDate("enroll_date"),
												  rset.getString("user_id"),
												  rset.getString("receiver"),
												  rset.getString("address"),
												  rset.getString("phone"),
												  rset.getInt("order_type"));
				
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

	public int getListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = prop.getProperty("getListCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return listCount;
	}

	public int getSearchCount(Connection conn, String cond, String search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		
		String selectQuery = "";
		
		switch(cond) {
		case "orderno":
			selectQuery = "getSearchCount1";
			break;
		case "prodname":
			selectQuery = "getSearchCount2";
			break;
		case "orderprice":
			selectQuery = "getSearchCount3";
			break;
		case "orderdate":
			selectQuery = "getSearchCount4";
			break;
		case "userid":
			selectQuery = "getSearchCount5";
			break;
		case "receiver":
			selectQuery = "getSearchCount6";
			break;
		case "address":
			selectQuery = "getSearchCount7";
			break;
		case "phone":
			selectQuery = "getSearchCount8";
			break;
		case "status":
			selectQuery = "getSearchCount9";
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
			
			if(rset.next()) {
				count = rset.getInt(1);
			}
			
			System.out.println(count);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
	}
}
