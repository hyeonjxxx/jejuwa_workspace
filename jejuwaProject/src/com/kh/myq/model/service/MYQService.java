package com.kh.myq.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.model.vo.Attachment;
import com.kh.common.model.vo.PageInfo;
import com.kh.myq.model.dao.MYQDao;
import com.kh.myq.model.vo.MYQ;
import com.kh.product.model.dao.ProductDao;
import com.kh.product.model.vo.Product;

public class MYQService {

	
	/**
	 * 관리자 현재 총 게시글 조회
	 * @return
	 */
	public int selectListCountAdmin() {
		Connection conn = getConnection();
		
		int listCount = new MYQDao().selectListCountAdmin(conn);
		close(conn);
		return listCount;
	}
	
	
	public ArrayList<MYQ> selectListAdmin(PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<MYQ> list = new MYQDao().selectListAdmin(conn, pi);
		
		close(conn);
		return list;
	}


	public MYQ selectDetailAdmin(int myqNo) {
		
		Connection conn = getConnection();
		
		MYQ q = new MYQDao().selectDetailAdmin(conn, myqNo);
		
		System.out.println(q);
		
		close(conn);
		
		return q;
	}


	public ArrayList<Attachment> selectAttachmentAdmin(int myqNo) {
		
		Connection conn = getConnection();
		
		ArrayList<Attachment> list = new MYQDao().selectAttachmentAdmin(conn, myqNo);
		
		close(conn);
		
		return list;
	}


	public int answer(String answer, int getMyq_no) {
		Connection conn = getConnection();
		
		int result = new MYQDao().answer(conn, answer, getMyq_no);
		
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	/**
	 * 사용자 게시글 조회
	 * @return
	 */
	public int selectListCountUser(String memId) {
		
		Connection conn = getConnection();
		
		int listCount = new MYQDao().selectListCountUser(conn, memId);
		
		close(conn);
		
		return listCount;
		
	}


	public ArrayList<MYQ> selectListUser(String memId, PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<MYQ> list = new MYQDao().selectListUser(conn, memId, pi);
		
		close(conn);
		
		return list;
	}


	public MYQ selectDetailUser(int myqNo) {
		Connection conn = getConnection();
		
		MYQ q = new MYQDao().selectDetailUser(conn, myqNo);
		
		
		close(conn);
		
		return q;
	}


	public  ArrayList<Attachment> selectAttachmentUser(int myqNo) {
		Connection conn = getConnection();
		
		 ArrayList<Attachment> list = new MYQDao().selectAttachmentUser(conn, myqNo);
		
		close(conn);
		
		return list;
	}


	public int insertUser(MYQ q, ArrayList<Attachment> list) {
		Connection conn = getConnection();
		
		int result1 = new MYQDao().insertUser(conn, q);
		
		// list에 담긴 값이 없을 때 == 0, 담긴 값이 있을 때 !=0
		
		new MYQDao().insertUserAttachment(conn, list);

		if(result1 > 0 ) { // 게시글 insert 성공
			commit(conn);
		} else { // 게시글 insert실패
			rollback(conn);
		} 
		close(conn);
		return result1;
	}


	public Product selectProduct(String pcode) {
		Connection conn = getConnection();
		
		Product p = new MYQDao().selectProduct(conn, pcode);
		
		close(conn);
		System.out.println(p);
		return p;
	}


	public int insertProductUser(MYQ q, ArrayList<Attachment> list) {
		Connection conn = getConnection();
		
		int result1 = new MYQDao().insertProductUser(conn, q);
		
		// list에 담긴 값이 없을 때 == 0, 담긴 값이 있을 때 !=0
		new MYQDao().insertUserAttachment(conn, list);

		System.out.println("connection에 담긴 값 " + conn);
		
		if(result1 > 0 ) { // 게시글 insert 성공
			commit(conn);
		} else { // 게시글 insert실패
			rollback(conn);
		} 
		close(conn);
		
		return result1;
		
	}


	public int deleteUserMYQ(String[] myq_no) {
		
		Connection conn = getConnection();
		
		new MYQDao().deleteUserAttachment(conn, myq_no);
		
		int result = new MYQDao().deleteUserMYQ(conn, myq_no);
		
		
		if(result >0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
}
