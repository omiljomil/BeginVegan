package paiement.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import cart.model.vo.Cart;
import paiement.model.dao.PaiementDAO;
import paiement.model.vo.Paiement;

public class PaiementService {
	private PaiementDAO paiePAO = new PaiementDAO();
	
	public ArrayList<Paiement> cartOneOrder(Cart cart) {
		Connection conn = getConnection();
		
		ArrayList<Paiement> list = paiePAO.cartOneOrder(conn, cart);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Paiement> cartSelectOrder(String userId, String[] carts) {
		Connection conn = getConnection();
		
		ArrayList<Paiement> list = paiePAO.cartSelectOrder(conn, userId, carts);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Paiement> cartAllOrder(String userId) {
		Connection conn = getConnection();
		
		ArrayList<Paiement> list = paiePAO.cartAllOrder(conn, userId);
		
		close(conn);
		
		return list;
	}
}
