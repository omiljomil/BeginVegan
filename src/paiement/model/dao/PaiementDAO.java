package paiement.model.dao;

import static common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import paiement.model.vo.Paiement;
import product.model.vo.Photo;
import product.model.vo.ProductList;

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

   public int insertPaiement(Connection conn, Paiement p) {
      PreparedStatement pstmt = null;
      int result = 0;
      
      String query = prop.getProperty("insertPaiement");
      
      try {
         pstmt = conn.prepareStatement(query);
         pstmt.setString(1, p.getOrderNo());
         pstmt.setString(2, p.getUserId());
         pstmt.setString(3, p.getProdName());
         pstmt.setInt(4, p.getPrice());
         pstmt.setString(5, p.getReceiver());
         pstmt.setInt(6, p.getPostal());
         pstmt.setString(7, p.getAddress());
         pstmt.setString(8, p.getDeAddress());
         pstmt.setString(9, p.getNormalPhone());
         pstmt.setString(10, p.getPhone());
         pstmt.setString(11, p.getMessage());
         pstmt.setInt(12, p.getAmount());
         
         result = pstmt.executeUpdate();
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      
      
      return result;
   }
}