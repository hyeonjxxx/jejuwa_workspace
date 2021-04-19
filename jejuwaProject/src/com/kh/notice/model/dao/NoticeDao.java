package com.kh.notice.model.dao;

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
import com.kh.notice.model.vo.Notice;

public class NoticeDao {
	
	private Properties prop = new Properties();
	
	public NoticeDao() {
		String fileName = NoticeDao.class.getResource("/sql/notice/notice-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 공지사항 총 게시글 갯수 조회
	 * @param conn
	 * @return 공지사항 게시글 총 갯수
	 */
	public int selectListCount(Connection conn) {
		// select문 => ResultSet(게시글 총 수)
		int listCount = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql); // 완성된 sql
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
	
	/**
	 * 공지사항 리스트 조회
	 * @param conn
	 * @param pi
	 * @return
	 */
	public ArrayList<Notice> selectList(Connection conn, PageInfo pi){
		// select문 => ResultSet(여러행)
		ArrayList<Notice> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성 sql문
			/*
			 * startRow = (currentPage - 1) * boardLimit + 1
			 * endRow = currentPage * boardLimit
			 */
			pstmt.setInt(1, (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
			pstmt.setInt(2, pi.getCurrentPage() * pi.getBoardLimit());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Notice(rset.getInt("NOTICE_NO"),
									rset.getString("NOTICE_TITLE"),
									rset.getDate("ENROLL_DATE"),
									rset.getInt("NOTICE_COUNT"),
									rset.getString("ORG_FILENAME"),
									rset.getString("FILE_PATH")));
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
	 * 공지사항 상세조회시 조회수 증가
	 * @param conn
	 * @param noticeNo
	 * @return
	 */
	public int increaseCount(Connection conn, int noticeNo) {
		// update문 => 처리된 행 수
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성 sql
			pstmt.setInt(1, noticeNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	/**
	 * 상세조회 요청 (해야함)
	 */
	
	
	/**
	 * 공지사항 insert(테이블 내에 첨부파일 따로 관리)
	 * @param conn
	 * @param n
	 * @return
	 */
	public int insertNotice(Connection conn, Notice n) {
		// insert => 처리된 행수
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNotice");
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성 sql문
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContent());
			pstmt.setString(3, n.getOriginFileName()); // Q
			pstmt.setString(4, n.getFilePath()); // Q
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	
	
	

}
