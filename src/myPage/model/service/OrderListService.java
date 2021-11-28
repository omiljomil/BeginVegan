package myPage.model.service;

import static common.JDBCTemplate.*;


import java.sql.Connection;
import java.util.ArrayList;

import myPage.model.vo.PageInfo;
import myPage.model.dao.OrderListDAO;
import paiement.model.vo.Paiement;

public class OrderListService {
   
   private OrderListDAO oDAO = new OrderListDAO();

   public ArrayList<Paiement> selectList(PageInfo pi) {
      Connection conn = getConnection();
      
      ArrayList<Paiement> list = oDAO.selectList(conn, pi);
      
      close(conn);
      
      return list;
   
}

   public int deleteOrderList(String orderNo) {
      Connection conn = getConnection();
      
      int result = oDAO.deleteOrderList(orderNo, conn);
      
      if(result > 0) {
         commit(conn);
      } else {
         rollback(conn);
      }
      
      close(conn);

      return result;
   }


   public ArrayList<Paiement> deleteListSelect() {
      Connection conn = getConnection();
      
      ArrayList<Paiement> list = oDAO.deleteListSelect(conn);
      
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


}