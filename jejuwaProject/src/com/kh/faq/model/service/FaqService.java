package com.kh.faq.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.model.vo.PageInfo;
import com.kh.faq.model.dao.FaqDao;
import com.kh.faq.model.vo.Faq;

public class FaqService {
	
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new FaqDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<Faq> selectFaqList(PageInfo pi){
		
		Connection conn = getConnection();
		
		ArrayList<Faq> list = new FaqDao().selectFaqList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	
	public ArrayList<Faq> selectFaqUserList(){
		Connection conn = getConnection();
		
		ArrayList<Faq> list = new FaqDao().selectFaqUserList(conn);
		
		close(conn);
		
		return list;
	}
	
	
	
	public int insertFaq(Faq f) {
		Connection conn = getConnection();
		int result = new FaqDao().insertFaq(conn, f);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		
		close(conn);
		return result;
		
	}
	
	
	public Faq selectFaq(int faqNo) {
		Connection conn = getConnection();
		Faq f = new FaqDao().selectFaq(conn, faqNo);
		
		close(conn);
		return f;
	}
	
	public int updateFaq(Faq f) {
		Connection conn = getConnection();
		int result = new FaqDao().updateFaq(conn,f);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public int delteFaq(int faqNo) {
		Connection conn = getConnection();
		int result = new FaqDao().delteFaq(conn, faqNo);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
}
