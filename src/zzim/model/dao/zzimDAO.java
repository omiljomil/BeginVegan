package zzim.model.dao;

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

import User.model.dao.UserDAO;
import zzim.model.vo.zzim;

public class zzimDAO {
private Properties prop = null;
	
	public zzimDAO() {
		prop = new Properties();
		String fileName = UserDAO.class.getResource("/sql/Zzim/Zzim-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<zzim> selectZzim(Connection conn, String uId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<zzim> list = null;
		String query = prop.getProperty("selectZzim");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, uId);
			rset = pstmt.executeQuery();
			list = new ArrayList<zzim>();
			while(rset.next()) {
				list.add(new zzim(rset.getInt(1),
								rset.getString(2),
								rset.getString(3),
								rset.getInt(4),
								rset.getInt(5)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			
			close(rset);
			close(pstmt);
		}
		return list;
	}

}
