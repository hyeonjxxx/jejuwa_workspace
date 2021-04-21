package com.kh.product.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.product.model.vo.Product;

public class ProductDao {
	

	private Properties prop = new Properties();
	

	public ProductDao() {
		
		String fileName = ProductDao.class.getResource("/sql/product/product-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Product> selectProductList(Connection conn) {
		//select문 => ResultSet 객체 (여러행)
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectProductList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Product(rset.getString("p_code"),
						             rset.getString("P_name"),
						             rset.getInt("price"),
						             rset.getInt("p_stock"),
						             rset.getString("p_status")));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public int insertProduct(Connection conn, Product p) {
		// insert문 => 처리된 행수
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertProduct");
		
		try {
			pstmt = conn.prepareStatement(sql); //미완성
			pstmt.setString(1, p.getpName());
			pstmt.setInt(2, p.getPrice());
			pstmt.setInt(3, p.getpStock());
			pstmt.setString(4, p.getBasicPath());
			pstmt.setString(5, p.getDetailPath());
			pstmt.setString(6, p.getLocalCode());
			pstmt.setString(7, p.getThemeCode());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}	

	
	//쎔네일리스트로 상품보기
		public ArrayList<Product> selectThList(Connection conn){
			
			ArrayList<Product> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectThList");
			
			try {
				pstmt = conn.prepareStatement(sql);
				rset = pstmt.executeQuery();

				while(rset.next()) {
					
					Product p = new Product();
					p.setpCode(rset.getString("p_code"));
					p.setpName(rset.getString("p_name"));
					p.setPrice(rset.getInt("price"));
					p.setBasicPath(rset.getString("basic_path"));
				
					list.add(p);	
					
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally{
				close(rset);
				close(pstmt);
			}		
			
			return list;
		}
		

		// 상세페이지에서 불려올 상품 리스트
		public Product selectInfoProduct(Connection conn, String pCode) {
			
			Product p = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectInfoProduct");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, pCode);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					p = new Product(rset.getString("p_name"),
							        rset.getInt("price"),
							        rset.getString("basic_path"),
							        rset.getString("deatil_path"));
					
				}
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			
			return p;
				
		}
}
