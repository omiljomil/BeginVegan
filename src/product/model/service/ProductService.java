package product.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import category.model.vo.Category;
import material.model.dao.MaterialDAO;
import material.model.vo.Material;
import product.model.dao.ProductDAO;
import product.model.vo.Photo;
import product.model.vo.PageInfo;
import product.model.vo.Product;
import product.model.vo.ProductList;

public class ProductService {

	private ProductDAO pDAO = new ProductDAO();
	private MaterialDAO mDAO = new MaterialDAO();
	
	public int deleteProduct(int pNo) {
		Connection conn = getConnection();
		
		int result = pDAO.deleteProduct(conn, pNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int getListCount() {
		Connection conn = getConnection();
		
		int listCount = pDAO.getListCount(conn);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList selectList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Product> list = pDAO.selectList(conn, pi);
		
		close(conn);
		return list;
	}
	
	public ArrayList selectPList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<ProductList> list = pDAO.selectPList(conn, pi);
		
		close(conn);
		return list;
	}
	
	

	public int insertProduct(Product p, ArrayList<Photo> fileList, Material m) {
		Connection conn = getConnection();
		int result1 = pDAO.insertProduct(conn, p);
		int result2 = pDAO.insertPhoto(conn, fileList);
		int result3 = pDAO.insertMaterial(conn, m);
		
		if(result1 > 0 && result2 > 0 && result3 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 + result2;
	}



	public ArrayList<Photo> selectFList() {
	
		Connection conn = getConnection();
		
		ArrayList<Photo> list = pDAO.selectFList(conn);
		
		
		close(conn);
		
		return list;
	}

	public ArrayList<Category> ctgryList() {
		Connection conn = getConnection();

		ArrayList<Category> list = pDAO.ctgryList(conn);
		
		close(conn);
		
		return list;
	}

	public Product selectProduct(int pNo) {
		Connection conn = getConnection();
		int result = 0;
		
		Product p = pDAO.selectProduct(conn, pNo);
		
		if(result > 0 && p != null) {
				commit(conn);
			}else {
				rollback(conn);
			}


		close(conn);
		return p;
	}

	public ArrayList<Photo> selectPhoto(int pNo) {
		Connection conn = getConnection();
		ArrayList<Photo> list = pDAO.selectPhoto(pNo, conn);
		close(conn);
		
		return list;
	}

	public int updateProduct(Product p, ArrayList<Photo> fileList, Material m) {
		Connection conn = getConnection();
		int result1 = pDAO.updateProduct(conn, p);
		int result2 = pDAO.updatePhoto(conn, fileList);
		int result3 = pDAO.updateMaterial(conn, m);
		
		if(result1 > 0 && result2 > 0 && result3 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 + result2 + result3;

	}

	public int deletePhoto(ArrayList<String> thumb, Product p) {
		Connection conn = getConnection();
		
		int result = pDAO.deletePhoto(conn, thumb, p);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	


}
