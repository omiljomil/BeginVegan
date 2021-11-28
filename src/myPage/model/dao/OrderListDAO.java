package myPage.model.dao;

import static common.JDBCTemplate.*;


import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import myPage.model.vo.PageInfo;
import paiement.model.vo.Paiement;
   
   
public class OrderListDAO {
   
   private Properties prop = null;
   
   public OrderListDAO() {
      prop = new Properties();
      
      String fileName = OrderListDAO.class.getResource("/sql/order/order-query.properties").getPath();
      
      try {
         prop.load(new FileReader(fileName));
      } catch (FileNotFoundException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      }
      
   }

   public ArrayList<Paiement> selectList(Connection conn, PageInfo pi) {
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      ArrayList<Paiement> list = null;
      
      String query = prop.getProperty("selectList");
      
      int startRow = (pi.getCuurentPage() -1) * pi.getBoardLimit() + 1;
      int endRow = startRow + pi.getBoardLimit() -1;
      
      try {
         pstmt = conn.prepareStatement(query);
         pstmt.setInt(1, startRow);
         pstmt.setInt(2, endRow);
         rset = pstmt.executeQuery();
         
         list = new ArrayList<Paiement>();
         while(rset.next()) {
            Paiement p = new Paiement(
                              rset.getInt("ORDER_TYPE"),
                              rset.getString("ORDER_NO"),
                                rset.getString("PROD_NAME"),
                                rset.getInt("PRICE"),
                                rset.getDate("ENROLL_DATE"),
                                rset.getInt("AMOUNT"));
            list.add(p);
         }
         
      } catch (SQLException e) {
      
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }

      return list;
   }

   public int deleteOrderList(String orderNo, Connection conn) {
      PreparedStatement pstmt = null;
      int result = 0;
      
      String query = prop.getProperty("deleteOrderList");
      
      try {
         pstmt = conn.prepareStatement(query);
         pstmt.setString(1, orderNo);
         
         result = pstmt.executeUpdate();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      
      
      return result;
   }

   public ArrayList<Paiement> deleteListSelect(Connection conn) {
      Statement stmt = null;
      ResultSet rset = null;
      ArrayList<Paiement> list = null;
      
      String query = prop.getProperty("deleteListSelect");
      
      try {
         stmt = conn.createStatement();
         rset = stmt.executeQuery(query);
         
         list = new ArrayList<Paiement>();
         while(rset.next()) {
            Paiement dp = new Paiement(
                              rset.getInt("ORDER_TYPE"),
                              rset.getString("ORDER_NO"),
                                rset.getString("PROD_NAME"),
                                rset.getInt("PRICE"),
                                rset.getDate("ENROLL_DATE"),
                                rset.getInt("AMOUNT"));
            list.add(dp);
         }
         
      } catch (SQLException e) {
      
         e.printStackTrace();
      } finally {
         close(rset);
         close(stmt);
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

   public int getChangeListCount(Connection conn) {
      Statement stmt = null;
      ResultSet rset = null;
      int listCount = 0;
      
      String query = prop.getProperty("getChangeListCount");
      
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






}