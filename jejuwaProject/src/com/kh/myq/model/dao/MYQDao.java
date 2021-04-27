package com.kh.myq.model.dao;

import static com.kh.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.model.vo.PageInfo;
import com.kh.myq.model.vo.MYQ;

public class MYQDao {
	
	private Properties prop = new Properties();
	
	public MYQDao() {
		String filename = MYQDao.class.getResource("/sql/myq/myq-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filename));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public int selectListCountAdmin(Connection conn) {
		// SELECT
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("LISTCOUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	public ArrayList<MYQ> selectListAdmin(Connection conn, PageInfo pi) {
		// SELECT 
		ArrayList<MYQ> list = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) { 
			list.add(new MYQ(rset.getInt("MYQ_NO")
				            , rset.getString("MYQ_CATEGORY")
				            , rset.getString("MYQ_TITLE")
				            , rset.getString("MYQ_CONTENT")
				            , rset.getDate("MYQ_ENROLL_DATE")
				            , rset.getString("MYQ_ANS_CONTENT")
				            , rset.getInt("MEM_NO")
			
			System.out.println(list);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}


}
