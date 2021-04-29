package com.kh.myq.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.model.vo.Attachment;
import com.kh.common.model.vo.PageInfo;
import com.kh.myq.model.dao.MYQDao;
import com.kh.myq.model.vo.MYQ;
import com.kh.product.model.dao.ProductDao;

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
		System.out.println(myqNo);
		MYQ q = new MYQDao().selectDetailAdmin(conn, myqNo);
		
		System.out.println(q);
		
		close(conn);
		
		return q;
	}


	public Attachment selectAttachmentAdmin(int myqNo) {
		
		Connection conn = getConnection();
		
		Attachment at = new MYQDao().selectAttachmentAdmin(conn, myqNo);
		
		close(conn);
		
		return at;
	}


	public int answer(String answer, int getMyq_no) {
		Connection conn = getConnection();
		
		int result = new MYQDao().answer(conn, answer, getMyq_no);
		System.out.println(getMyq_no);
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
		System.out.println(myqNo);
		MYQ q = new MYQDao().selectDetailUser(conn, myqNo);
		
		System.out.println(q);
		
		close(conn);
		
		return q;
	}


	public Attachment selectAttachmentUser(int myqNo) {
		Connection conn = getConnection();
		
		Attachment at = new MYQDao().selectAttachmentUser(conn, myqNo);
		
		close(conn);
		
		return at;
	}


	public int insertUser(MYQ q, ArrayList<Attachment> list) {
		Connection conn = getConnection();
		
		int result1 = new MYQDao().insertUser(conn, q);
		
		int result2 = 1;
		if(list != null ) {
			result2 = new MYQDao().insertUserAttachment(conn, list);
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else { //insert실패
			rollback(conn);
		} 
		close(conn);
		
		return result1 * result2;
	}
	
}
