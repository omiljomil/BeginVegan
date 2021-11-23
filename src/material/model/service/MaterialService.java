package material.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import material.model.dao.MaterialDAO;
import material.model.vo.Material;


public class MaterialService {
	
	private MaterialDAO mDAO = new MaterialDAO();

	public Material selectMatrial(int pNo) {
		Connection conn = getConnection();
		int result = 0;
		
		Material m = mDAO.selectMaterial(conn, pNo);
		
		if(result > 0 && m != null) {
				commit(conn);
			}else {
				rollback(conn);
			}


		close(conn);
		return m;
	}



}
