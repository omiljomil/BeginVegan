package User.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import User.model.vo.Shpping;
import static common.JDBCTemplate.*;
public class ShppingDAO {
private Properties prop = null;
	
	public ShppingDAO() {
		prop = new Properties();
		String fileName = UserDAO.class.getResource("/sql/Shpping/Shpping-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertShpping(Connection conn, Shpping sp) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertShpping");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,sp.getUser_id());
			pstmt.setInt(2,sp.getPostal_code());
			pstmt.setString(3, sp.getAddress());
			pstmt.setString(4, sp.getDe_address());
			pstmt.setString(5, sp.getAlias());
			pstmt.setString(6, sp.getBasics());
			pstmt.setString(7, sp.getRecipient());
			pstmt.setString(8, sp.getSp_phone());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Shpping> selectShpping(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Shpping> list = null;
		String query = prop.getProperty("selectShpping");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<Shpping>();
			while(rset.next()) {
				Shpping s = new Shpping(rset.getInt("ship_no"),
										rset.getString("user_id"),
										rset.getInt("postal_code"),
										rset.getString("address"),
										rset.getString("de_address"),
										rset.getString("alias"),
										rset.getString("basics"),
										rset.getString("recipient"),
										rset.getString("sp_phone"));
				list.add(s);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}

	public int selectBasicsShpping(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset= null;
		int bNum = 0;
		String query = prop.getProperty("selectBasicsShpping");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			rset=pstmt.executeQuery();
			if(rset.next()) {
				bNum=rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return bNum;
	}

	public int deleteBasicsShpping(Connection conn, int bNum) {
		PreparedStatement pstmt = null;
		int deleteB = 0;
		String query = prop.getProperty("deleteBasicsShpping");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bNum);
			deleteB = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return deleteB;
	}

	public int deleteShppingList(Connection conn, String ship_no) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("deleteShppingList");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, ship_no);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public Shpping insertShip_no(Connection conn, String ship_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Shpping s = null;
		String query = prop.getProperty("insertShip_no");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, ship_no);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				s = new Shpping(rset.getInt("ship_no"),
										rset.getString("user_id"),
										rset.getInt("postal_code"),
										rset.getString("address"),
										rset.getString("de_address"),
										rset.getString("alias"),
										rset.getString("basics"),
										rset.getString("recipient"),
										rset.getString("sp_phone"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			close(rset);
			close(pstmt);
		}
		return s;
	}

	public int UpdateShpping(Connection conn, Shpping sp) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateShpping");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1,sp.getPostal_code());
			pstmt.setString(2, sp.getAddress());
			pstmt.setString(3, sp.getDe_address());
			pstmt.setString(4, sp.getAlias());
			pstmt.setString(5, sp.getBasics());
			pstmt.setString(6, sp.getRecipient());
			pstmt.setString(7, sp.getSp_phone());
			pstmt.setInt(8, sp.getShip_no());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
}
