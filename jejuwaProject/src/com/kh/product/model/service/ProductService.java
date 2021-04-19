package com.kh.product.model.service;

import static com.kh.common.JDBCTemplate.*;

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
	
}
