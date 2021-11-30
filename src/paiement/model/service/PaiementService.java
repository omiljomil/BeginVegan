package paiement.model.service;

import static common.JDBCTemplate.*;


import java.sql.Connection;
import java.util.ArrayList;

import paiement.model.dao.PaiementDAO;
import paiement.model.vo.OrderPay;
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


	

}
