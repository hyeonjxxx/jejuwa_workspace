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
import com.kh.member.model.vo.Member;
import com.kh.report.model.vo.Report;

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
	 * [휘경] 블랙리스트 회원 수 조회
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
	
	
	/**
	 * [휘경] 블랙리스트 리스트 조회
	 * @param conn
	 * @param pi
	 * @return
	 */
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
	
	/**
	 * [휘경] 블랙리스트 상세 조회 1
	 * @param conn
	 * @param memId
	 * @return
	 */
	public Blacklist selectBlacklist(Connection conn, String memId) {
		// select문 => ResultSet(한 행)
		Blacklist b = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBlacklist");
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성 sql
			pstmt.setString(1, memId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				b = new Blacklist(rset.getInt("BLACKLIST_NO"),
						          rset.getInt("MEM_NO"),
								  rset.getString("MEM_ID"),
								  rset.getString("MEM_NAME"),
								  rset.getDate("RESTRICT_DATE"),
								  rset.getInt("REPORTED_COUNT"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return b;
	}
	
	
	public ArrayList<Report> selectBlacklist2(Connection conn, String memId){
		// select문 => ResultSet (여러 행)
		ArrayList<Report> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectBlacklist2");
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성 sql문
			pstmt.setString(1, memId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Report(rset.getInt("REPORT_NO"),
						            rset.getInt("MEM_NO2"),
						            rset.getInt("MEM_NO3"),
						            rset.getInt("REVIEW_NO"),
						            rset.getString("REPORT_RS"),
						            rset.getDate("REPORT_DATE")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	
	/**
	 *[휘경] 블랙리스트 해제 
	 * @param conn
	 * @param memNo
	 * @return
	 */
	public int removeBlacklist(Connection conn, int memNo) {
		// update문 => 처리된 행 수
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("removeBlacklist");
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성 sql문
			pstmt.setInt(1, memNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	public ArrayList<Blacklist> searchBlacklist(Connection conn, String searchCtg, String keyword){
		// select문 => ResultSet(여러 행)
		ArrayList<Blacklist> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = "";
		
		// 카테고리 : 아이디 로 검색한 경우
		if(searchCtg.equals("memId")) {
			sql=prop.getProperty("searchBlacklistId");
			
			try {
				pstmt = conn.prepareStatement(sql); // 미완성 sql
				pstmt.setString(1, "%" + keyword + "%");
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
			
		}
		
		
		// 카테고리 : 이름 으로 검색한 경우
		if(searchCtg.equals("memName")) {
			sql=prop.getProperty("searchBlacklistName");
			
			try {
				pstmt = conn.prepareStatement(sql); // 미완성 sql
				pstmt.setString(1, "%" + keyword + "%");
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
			
		}
		
		return list;
		
	}
}
