package com.kh.like.model.dao;

import static com.kh.common.JDBCTemplate.close;
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
	
	
	// 좋아요한 상품 조회
	public ArrayList<Like> selectLikePro(Connection conn) {
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
								  rset.getString("BASIC_PATH")));
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public int insertLikePro(Connection conn, Like l) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertLikePro");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, l.getMemNo());
			pstmt.setString(2, l.getpCode());
			
			result = pstmt.executeUpdate();
			
			//System.out.println(result);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	

	
	
	// 좋아요 취소
	public int deleteLike(Connection conn, Like l) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteLike");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, l.getMemNo());
			pstmt.setString(2, l.getpCode());
			
			result = pstmt.executeUpdate();
			
			//System.out.println(result);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}


}
