package com.kh.product.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.model.vo.Attachment;
import com.kh.common.model.vo.PageInfo;
import com.kh.product.model.dao.ProductDao;
import com.kh.product.model.vo.Product;

public class ProductService {
		
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new ProductDao().selectListCount(conn);
		close(conn);
		return listCount;
	}
	
	public ArrayList<Product> selectProductList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectProductList(conn, pi);
		close(conn);
		
		return list;
	}
	
	public int insertProduct(Product p, Attachment at)	{
		Connection conn = getConnection();
		int result1 = new ProductDao().insertProduct(conn, p);
		
		int result2 = 1;
		if(at != null ) {
			result2 = new ProductDao().insertAttachment(conn, at);
		}
		
		if(result1 > 0 && result2 > 0) { //insert 성공
			commit(conn);
		}else { // insert실 패
			rollback(conn);
		}
		close(conn);
		
		return result1 * result2;
		
	}	

	// 상품수정페이지에서 보여질 상품데이터 및 세부이미지 데이터 선택
	public Product selectProduct(String pCode) {
		Connection conn = getConnection();
		Product p = new ProductDao().selectProduct(conn, pCode);
		close(conn);
		return p;
	}

	public ArrayList<Attachment> selectAttachmemt(String pCode) {
		Connection conn = getConnection();
		ArrayList<Attachment> list = new ProductDao().selectAttachment(conn, pCode);
		return list;
	}
	
	// delete
	public int deleteProduct(String pCode) {
		Connection conn = getConnection();
		int result = new ProductDao().deleteProduct(conn, pCode);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}	
	
	// Update시켜주시
	public int updateProduct(Product p, Attachment at) {
		Connection conn = getConnection();
		
		int result1 = new ProductDao().updateProduct(conn, p);
		
		int result2 = 1;		
		if(at != null) {  // 새로운 첨부파일이 있을 경우
			if(at.getFileNo() != 0) {
				// 기존 첨부파일이 있을 경우(update)
				result2 = new ProductDao().updateAttachment(conn, at);
			}else {
				// 기존의 첨부파일이 없었을 경우(insertNew)
				result2 = new ProductDao().insertNewAttachment(conn, at);
			}
		}
	
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result1 * result2;
	}	
	
	// 쎔네일리스트로 상품보기 (기본이미지)
	public ArrayList<Product> selectThList() {
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectThList(conn);
		close(conn);
		return list;
	}
	
	// 상품디테일 페이지에서 조회될 상품 선택
	public Product selectInfoProduct(String pCode) {
		Connection conn = getConnection();
		Product p = new ProductDao().selectInfoProduct(conn, pCode);
		close(conn);
		
		return p;
	}

	// 상품디테일 페이지에서 조회될 세부이미지 1,2,3 선택 ==> 상품수정form selectAT와 동일


	// 투어 카테고리 선택
	public ArrayList<Product> selectThList_TR(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectThList_TR(conn, pi);
		close(conn);
		return list;
	}
	
	public int selectListCount_TR() {
		Connection conn = getConnection();
		int listCount = new ProductDao().selectListCount_TR(conn);
		close(conn);
		return listCount;
	}

	public ArrayList<Product> selectThList_TT(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectThList_TT(conn, pi);
		close(conn);
		return list;
	}		

	public int selectListCount_TT() {
		Connection conn = getConnection();
		int listCount = new ProductDao().selectListCount_TT(conn);
		close(conn);
		return listCount;
	}	
		
	public ArrayList<Product> selectThList_AY(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectThList_AY(conn, pi);
		close(conn);
		return list;
	}	
	
	public int selectListCount_AY() {
		Connection conn = getConnection();
		int listCount = new ProductDao().selectListCount_AY(conn);
		close(conn);
		return listCount;
	}	
		
	public ArrayList<Product> selectThList_FD(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectThList_FD(conn, pi);
		close(conn);
		return list;
	}

	public int selectListCount_FD() {
		Connection conn = getConnection();
		int listCount = new ProductDao().selectListCount_FD(conn);
		close(conn);
		return listCount;
	}	
	
	// local로 조회
	public ArrayList<Product> selectThList_SS() {
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectThList_SS(conn);
		close(conn);
		return list;
	}
	
	// list에서 option으로 검색
	/**
	 * @param searchOp : 검색 options
	 * @param keyword : 검색어	 
	 * @return
	 */
	public ArrayList<Product> searchOptions(String searchOp, String keyword) {
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().searchOptions(conn, searchOp, keyword);
		close(conn);
		return list;
	}	
	
	public ArrayList<Product> searchKeyword(String keyword_pdt) {
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().searchKeyword(conn, keyword_pdt);
		close(conn);
		return list;
	}
	
	// 인기순
	/*
	 * public ArrayList<Product> bestSelect() { Connection conn = getConnection();
	 * ArrayList<Product> list = new ProductDao().bestSelect(conn); close(conn);
	 * 
	 * return list; }
	 */
	
	public ArrayList<Product> saleSelect() {
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().saleSelect(conn);
		close(conn);
		return list;
	}	
	
	public ArrayList<Product> highPriceSelect_TT() {
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().highPriceSelect_TT(conn);
		close(conn);
		
		return list;
	}	
		
	
	
	// 좋아요 관련 

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
	
	// 결제페이지
	
	public Product selectPayment(String pcode) {
		Connection conn = getConnection();
		Product p = new ProductDao().selectPayment(conn, pcode);
		close(conn);
		
		return p;
	}


	
}
