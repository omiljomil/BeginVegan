package myPage.model.service;

import static common.JDBCTemplate.*;


import java.sql.Connection;
import java.util.ArrayList;

import myPage.model.vo.PageInfo;
import myPage.model.dao.OrderListDAO;
import paiement.model.vo.Paiement;

public class OrderListService {
	
	private OrderListDAO oDAO = new OrderListDAO();

	public ArrayList<Paiement> selectList(PageInfo pi, String userId) {
		Connection conn = getConnection();
		
		ArrayList<Paiement> list = oDAO.selectList(conn, pi, userId);
		
		close(conn);
		
		return list;
	
}

	public int deleteOrderList(String orderNo, String userId) {
		Connection conn = getConnection();
		
		int result = oDAO.deleteOrderList(orderNo, conn, userId);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);

		return result;
	}


	public ArrayList<Paiement> deleteListSelect(PageInfo pi, String userId) {
		Connection conn = getConnection();
		
		ArrayList<Paiement> list = oDAO.deleteListSelect(conn, pi, userId);
		
		close(conn);
		
		return list;
	}
	
	public int getListCount() {
		Connection conn = getConnection();
		
		int listCount = oDAO.getListCount(conn);
		
		close(conn);
		
		return listCount;
	}

	public int getChangeListCount() {
		Connection conn = getConnection();
		
		int listCount = oDAO.getChangeListCount(conn);
		
		close(conn);
		
		return listCount;
	}


	public int selectOListCount1(String userId) {
		Connection conn = getConnection();
		
		int result = oDAO.selectOListCount1(conn, userId);
		
		close(conn);
		
		return result;
	}
	
	public int selectOListCount2(String userId) {
		Connection conn = getConnection();
		
		int result = oDAO.selectOListCount2(conn, userId);
		
		close(conn);
		
		return result;
	}

	
	public int selectOListCount3(String userId) {
		Connection conn = getConnection();
		
		int result = oDAO.selectOListCount3(conn, userId);
		
		close(conn);
		
		return result;
	}

	public int selectOListCount4(String userId) {
		Connection conn = getConnection();
		
		int result = oDAO.selectOListCount4(conn, userId);
		
		close(conn);
		
		return result;
	}

	public int selectOListCount5(String userId) {
		Connection conn = getConnection();
		
		int result = oDAO.selectOListCount5(conn, userId);
		
		close(conn);
		
		return result;
	}

	public ArrayList<Paiement> orderListSearch(String search, page.PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Paiement> list = oDAO.orderListSearch(conn, search, pi);
		
		close(conn);
		
		return list;
	}

	public int getSearchCount(String search) {
		Connection conn=getConnection();
		
		int listCount = oDAO.getSearchCount(conn, search);
		
		close(conn);
		
		return listCount;
	}



}
