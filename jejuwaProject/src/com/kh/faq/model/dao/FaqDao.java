package com.kh.faq.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.faq.model.vo.Faq;

public class FaqDao {

	private Properties prop = new Properties();
	
	public FaqDao() {
		String fileName = FaqDao.class.getResource("/sql/faq/faq-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Faq> selectFaqList(Connection conn){
		// select문
		
		ArrayList<Faq> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectFaqList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Faq(rset.getInt("FAQ_NO"),
								 rset.getString("FAQ_TITLE"),
						         rset.getString("Q_CATEGORY")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	public ArrayList<Faq> selectFaqUserList(Connection conn){
		
		// select 
		ArrayList<Faq> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectFaqUserList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Faq(rset.getInt("faq_no"),
						         rset.getString("faq_title"),
						         rset.getString("FAQ_CONTENT"),
						         rset.getString("Q_CATEGORY")));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
		
	}
	
	public int insertFaq(Connection conn, Faq f) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertFaq");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, f.getqCategory());
			pstmt.setString(2, f.getFaqTitle());
			pstmt.setString(3, f.getFaqContent());
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

	public Faq selectFaq(Connection conn, int faqNo) {
		Faq f = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectFaq");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, faqNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				f = new Faq(rset.getInt("faq_no"),
						    rset.getString("faq_title"),
						    rset.getString("faq_content"),
						    rset.getString("q_category"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return f;
		
		
		
	}
	
	public int updateFaq(Connection conn, Faq f) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateFaq");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, f.getqCategory());
			pstmt.setString(2, f.getFaqTitle());
			pstmt.setString(3, f.getFaqContent());
			pstmt.setInt(4, f.getFaqNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
}
