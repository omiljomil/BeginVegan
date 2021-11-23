package material.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import material.model.vo.Material;


public class MaterialDAO {

private Properties prop = null;
	
	public MaterialDAO() {
		
		prop = new Properties();
		
		String fileName = MaterialDAO.class.getResource("/sql/material/material-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	public Material selectMaterial(Connection conn, int pNo) {
	
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Material m = null;
	
		
		String query = prop.getProperty("selectMaterial");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Material();
				m.setMtrlNo(rset.getInt("MTRL_NO"));
				m.setProdNo(rset.getInt("PROD_NO"));
				m.setMtrlName(rset.getString("MTRL_NAME"));
				m.setMtrlPrice(rset.getString("MTRL_PRICE"));
				m.setStatus(rset.getString("STATUS"));

			

			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
	}
	

}
