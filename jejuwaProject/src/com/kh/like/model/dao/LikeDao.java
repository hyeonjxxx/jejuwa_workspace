package com.kh.like.model.dao;

import static com.kh.common.JDBCTemplate.*;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class LikeDao {
	
	private Properties prop = new Properties();
	
	public LikeDao() {
		String fileName = LikeDao.class.getResource("/sql/like/like-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	// 좋아요 여부
	public boolean isLike(Connection conn, int userId, int prodNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("isLike");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, userId);
			pstmt.setInt(2, prodNo);
			
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return false;
	}
	/*
	public ArrayList<Like> selectLikeList(Connection conn){
		//select문 
	}
	*/
}
