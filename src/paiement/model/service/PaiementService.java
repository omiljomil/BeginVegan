package paiement.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;

import paiement.model.dao.PaiementDAO;
import paiement.model.vo.Paiement;
import product.model.vo.Photo;
import product.model.vo.ProductList;

public class PaiementService {
	
	private PaiementDAO pDAO = new PaiementDAO();

	public int insertPaiement(Paiement p) {
		Connection conn = getConnection();
		
		int result = pDAO.insertPaiement(conn, p);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public Photo selectPhotoPaiement(int pNo) {
		Connection conn = getConnection();
		
		Photo pt = pDAO.selectPhotoPaiement(pNo, conn);
		
		close(conn);
		
		return pt;
	}


	/*
	 * public int selectPListPaiement(ProductList pl) { Connection conn =
	 * getConnection();
	 * 
	 * int result = pDAO.selectPListPaiement(conn, pl);
	 * 
	 * if(result > 0) { commit(conn); } else { rollback(conn); }
	 * 
	 * close(conn);
	 * 
	 * return result; }
	 */

	

}
