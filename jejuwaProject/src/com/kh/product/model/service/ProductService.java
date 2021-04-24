package com.kh.product.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.product.model.dao.ProductDao;
import com.kh.product.model.vo.Product;

public class ProductService {

	public ArrayList<Product> selectProductList() {
		Connection conn = getConnection();
		
		ArrayList<Product> list = new ProductDao().selectProductList(conn);
		
		close(conn);
		
		return list;
	}
	
	public int insertProduct(Product p)	{
		Connection conn = getConnection();
		int result = new ProductDao().insertProduct(conn, p);
		
		if(result>0) { //insert 성공
			commit(conn);
		}else { // insert실 패
			rollback(conn);
		}
		close(conn);
		
		return result;
		
	}	
	
	
	// 쎔네일리스트로 상품보기 (기본이미지)
	public ArrayList<Product> selectThList() {
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectThList(conn);
		close(conn);
		return list;
	}
	
	public Product selectInfoProduct(String pCode) {
		Connection conn = getConnection();
		Product p = new ProductDao().selectInfoProduct(conn, pCode);
		close(conn);
		
		return p;
	}	
	
	// 좋아요 관련 
	
	/*
	public int likeCount(String pCode, int memNo) {
		Connection conn = getConnection();
		int result = new ProductDao().likeCount(conn, pCode, memNo);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	*/
	
	
}
