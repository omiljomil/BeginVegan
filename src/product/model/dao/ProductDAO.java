package product.model.dao;

import static common.JDBCTemplate.*;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import category.model.vo.Category;
import material.model.vo.Material;
import product.model.vo.Product;
import product.model.vo.ProductList;
import product.model.vo.Photo;
import product.model.vo.PageInfo;




public class ProductDAO {
	private Properties prop = null;
	
	public ProductDAO() {
		
		prop = new Properties();
		
		String fileName = ProductDAO.class.getResource("/sql/product/product-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public int deleteProduct(Connection conn, int pNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		
		String query = prop.getProperty("deleteProduct");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pNo);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
	}

	public int getListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = prop.getProperty("getListCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return listCount;
	}

	public ArrayList<Product> selectList(Connection conn, PageInfo pi) {
	
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = null;

		String query = prop.getProperty("selectList");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;//1,11,21 currentPage�씠�슜�빐�꽌 怨듭떇 留뚮뱾湲�
		int endRow = startRow + pi.getBoardLimit() - 1;//10, 20, 30

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Product>();
			while(rset.next()) {
				Product p = new Product();
				p.setProdNo(rset.getInt("PROD_NO"));
				p.setProdName(rset.getString("PROD_NAME"));
				p.setPrice(rset.getInt("PRICE"));
				p.setCtgryName(rset.getString("CTGRY_NAME"));
				p.setMtrlName(rset.getString("MTRL_NAME"));
				p.setEnrollDate(rset.getDate("ENROLL_DATE"));
				p.setShortInfo(rset.getString("SHORT_INFO"));
				p.setProdExple(rset.getString("PROD_EXPLE"));
				p.setProdTag(rset.getString("PROD_TAG"));
				p.setStatus(rset.getString("STATUS"));
			

				list.add(p);		
						
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int insertProduct(Connection conn, Product p) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertProduct");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, p.getProdName());
			pstmt.setInt(2, p.getPrice());
			pstmt.setString(3, p.getCtgryName());
			pstmt.setString(4, p.getProdExple());
			pstmt.setString(5, p.getProdTag());
			pstmt.setString(6,  p.getShortInfo());
			pstmt.setString(7, p.getMtrlName());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList selectPList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = null;
		
		String query = prop.getProperty("selectPList");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
				
			list = new ArrayList<Product>();
			while(rset.next()) {
				list.add(new Product(rset.getInt("PROD_NO"),
									rset.getString("PROD_NAME"),
									rset.getInt("PRICE"),
									rset.getString("CTGRY_Name"),
									rset.getString("MTRL_NAME"),
									rset.getDate("ENROLL_DATE"),
									rset.getString("SHORT_INFO"),
									rset.getString("PROD_EXPLE"),
									rset.getString("PROD_TAG"),
									rset.getString("STATUS")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}

	public ArrayList<Photo> selectFList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Photo> list = null;
		
		String query = prop.getProperty("selectFList");
		
		try {
			 stmt = conn.createStatement();

			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Photo>();
			
			while(rset.next()) {
				Photo ph = new Photo();
				ph.setProdNo(rset.getInt("PROD_NO"));
				ph.setImgChangeName(rset.getString("IMG_CHANGE_NAME"));
				
				list.add(ph);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return list;
	}

	public int insertPhoto(Connection conn, ArrayList<Photo> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertPhoto");
		
		try {
			for(int i = 0; i < fileList.size(); i++) {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, fileList.get(i).getImgName());
			pstmt.setString(2, fileList.get(i).getImgChangeName());
			pstmt.setString(3, fileList.get(i).getPath());
			pstmt.setInt(4, fileList.get(i).getFileLevel());
			//pstmt.setInt(5, fileList.get(i).getType());
			
			result += pstmt.executeUpdate();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Category> ctgryList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Category> list = null;
		
		String query = prop.getProperty("ctgryList");
		
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Category>();
			while(rset.next()) {
				Category c = new Category();
				c.setCtgryName(rset.getString("CTGRY_NAME"));
				c.setCtgryCode(rset.getString("CTGRY_CODE"));
				c.setCtgryRef(rset.getString("CTGRY_REF"));
				
				list.add(c);
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		

		return list;
	}

	public Product selectProduct(Connection conn, int pNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Product p = null;
		
		String query = prop.getProperty("selectProduct");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				p = new Product();
				p.setProdNo(rset.getInt("PROD_NO"));
				p.setProdName(rset.getString("PROD_NAME"));
				p.setPrice(rset.getInt("PRICE"));
				p.setCtgryName(rset.getString("CTGRY_NAME"));
				p.setProdExple(rset.getString("PROD_EXPLE"));
				p.setProdTag(rset.getString("PROD_TAG"));
				p.setMtrlName(rset.getString("MTRL_NAME"));
				p.setShortInfo(rset.getString("SHORT_INFO"));

			}
	
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return p;
	}
	
//	public HashMap<String,String> selectProductDetail(Connection conn, int pNo) {
//		PreparedStatement pstmt = null;
//		ResultSet rset = null;
//		HashMap<String,String> p = null;
//		
//		String query = prop.getProperty("selectProduct");
//		
//		try {
//			pstmt = conn.prepareStatement(query);
//			pstmt.setInt(1, pNo);
//			rset = pstmt.executeQuery();
//			
//			p.put("PROD_NAME",rset.getString("PROD_NAME"));
//		
//	
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close(rset);
//			close(pstmt);
//		}
//		
//		return p;
//	}

	public ArrayList<Photo> selectPhoto(int pNo, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Photo> list = null;
		
		String query = prop.getProperty("selectPhoto");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pNo);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Photo>();
			while(rset.next()) {
				Photo ph = new Photo();
				ph.setImgNo(rset.getInt("IMG_NO"));
				ph.setImgName(rset.getString("IMG_NAME"));
				ph.setImgChangeName(rset.getString("IMG_CHANGE_NAME"));
				ph.setPath(rset.getString("PATH"));
											 
				list.add(ph);

			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public int updatePhoto(Connection conn, ArrayList<Photo> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updatePhoto");
		
		try {
			for(int i = 0; i < fileList.size(); i++) {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, fileList.get(i).getImgName());
			pstmt.setString(2, fileList.get(i).getImgChangeName());
			pstmt.setString(3, fileList.get(i).getPath());
			pstmt.setInt(4, fileList.get(i).getFileLevel());
			pstmt.setInt(5, fileList.get(i).getType());
			pstmt.setInt(6, fileList.get(i).getProdNo());

			result += pstmt.executeUpdate();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		System.out.println("사진:" + result);
		return result;
	}
	
	public int updateProduct(Connection conn, Product p) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateProduct");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, p.getProdName());
			pstmt.setInt(2, p.getPrice());
			pstmt.setString(3, p.getCtgryName());
			pstmt.setString(4, p.getProdExple());
			pstmt.setString(5, p.getProdTag());
			pstmt.setString(6,  p.getShortInfo());
			pstmt.setString(7, p.getMtrlName());
			pstmt.setInt(8, p.getProdNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		System.out.println("상품카테고리:" + p.getCtgryName());
		System.out.println("상품:" + result);
		return result;
	}
	
	public int insertMaterial(Connection conn, Material m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertMaterial");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getMtrlName());
			pstmt.setString(2, m.getMtrlPrice());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	
}
