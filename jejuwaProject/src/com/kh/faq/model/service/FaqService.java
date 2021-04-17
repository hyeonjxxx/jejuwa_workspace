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
}
