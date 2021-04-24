package com.kh.blacklist.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.blacklist.model.vo.Blacklist;
import com.kh.common.model.vo.PageInfo;

public class BlacklistDao {

	private Properties prop = new Properties();
	
	public BlacklistDao() {
		
		String fileName = BlacklistDao.class.getResource("/sql/blacklist/blacklist-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 블랙리스트 회원 수 조회
	 * @param conn
	 * @return
	 */
	public int selectBlacklistCount(Connection conn) {
		// select문 => ResultSet
		int memberCount = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectBlacklistCount");
		
		try {
			pstmt = conn.prepareStatement(sql); // 완성된 sql
			rset = pstmt.executeQuery();
			if(rset.next()) {
				memberCount = rset.getInt("MEMBERCOUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return memberCount;
	}
	
	public ArrayList<Blacklist> selectList(Connection conn, PageInfo pi){
		// select문 => ResultSet(여러 행)
		ArrayList<Blacklist> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성 sql
			
			pstmt.setInt(1, (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
			pstmt.setInt(2, pi.getCurrentPage() * pi.getBoardLimit());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Blacklist(rset.getInt("BLACKLIST_NO"),
									   rset.getInt("MEM_NO"),
								       rset.getString("MEM_ID"),
								       rset.getString("MEM_NAME"),
								       rset.getDate("RESTRICT_DATE"),
								       rset.getInt("REPORTED_COUNT")));
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
