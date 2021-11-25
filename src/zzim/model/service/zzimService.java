package zzim.model.service;
import static common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;

import zzim.model.dao.zzimDAO;
import zzim.model.vo.zzim;

public class zzimService {
	private zzimDAO zDAO = new zzimDAO();

	public ArrayList<zzim> selectZzim(String uId) {
		Connection conn = getConnection();
		ArrayList<zzim> list = zDAO.selectZzim(conn, uId);
		close(conn);
		return list;
	}
}
