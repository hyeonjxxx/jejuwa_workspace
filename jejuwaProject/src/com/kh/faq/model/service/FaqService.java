package com.kh.faq.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.faq.model.dao.FaqDao;
import com.kh.faq.model.vo.Faq;

public class FaqService {

	public ArrayList<Faq> selectFaqList(){
		
		Connection conn = getConnection();
		
		ArrayList<Faq> list = new FaqDao().selectFaqList(conn);
		
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
}
