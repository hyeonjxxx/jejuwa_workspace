package com.kh.like.model.dao;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.like.model.vo.Like;

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
	
	
	public ArrayList<Like> selectLikePro(Connection conn, String pCode) {
		// select
		ArrayList<Like> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectLikePro");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			// 여러개 조회가능
			while(rset.next()){
				list.add(new Like(rset.getInt("MEM_NO"),
								  rset.getString("P_CODE"),
								  rset.getString("P_NAME"),
								  rset.getString("DEATIL_PATH")));
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	
	

	/*
	public int insertLikePro(Connection conn, Like like) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertLikePro");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, like.getMemNo());
			pstmt.setString(2, like.getpCode());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
		
	}
	
	// 좋아요 취소
	public int deleteLikePro(Connection conn, Like like) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteLikePro");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, like.getpCode());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

	*/

}
