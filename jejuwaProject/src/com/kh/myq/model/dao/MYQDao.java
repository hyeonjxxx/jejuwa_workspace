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

import com.kh.common.model.vo.Attachment;
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
		ArrayList<MYQ> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			/*
			 * ex)boardLimit : 10이라는 가정하에
			 * currentPage = 1 => startRow : 1  endRow : 10
			 * currentPage = 2 => startRow : 11 endRow : 20
			 * currentPage = 5 => startRow : 51 endRow : 60
			 * 
			 * startRow = (currentPage - 1) * boardLimit + 1
			 * endRow = currentPage * boardLimit
			 */
			
			pstmt.setInt(1, (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
			pstmt.setInt(2, pi.getCurrentPage() * pi.getBoardLimit());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) { 
			list.add(new MYQ(rset.getInt("MYQ_NO")
				            , rset.getString("MYQ_CATEGORY")
				            , rset.getString("MYQ_TITLE")
				            , rset.getDate("MYQ_ENROLL_DATE")
				            , rset.getDate("MYQ_ANS_DATE")
				            , rset.getString("MEM_ID")
				            , rset.getString("P_CODE")));
			
			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public MYQ selectDetailAdmin(Connection conn, int myqNo) {
		// SELECT
		MYQ q = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		System.out.println(myqNo);
		String sql = prop.getProperty("selectDetailAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, myqNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) { 
				q = new MYQ(rset.getInt("MYQ_NO")
						  , rset.getString("MYQ_CATEGORY")
						  , rset.getString("MYQ_TITLE")
						  , rset.getString("MYQ_CONTENT")
						  , rset.getDate("MYQ_ENROLL_DATE")
						  , rset.getString("MYQ_ANS_CONTENT")
						  , rset.getDate("MYQ_ANS_DATE")
						  , rset.getInt("MEM_NO")
						  , rset.getString("P_CODE")
						  , rset.getString("MEM_ID")
						  , rset.getString("P_NAME")
						  , rset.getString("MEM_NAME"));
						}
			System.out.println(q);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return q;
	}

	public Attachment selectAttachmentAdmin(Connection conn, int myqNo) {
		// SELECT
		Attachment at = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAttachmentAdmin");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) { 
				at = new Attachment(rset.getInt("FILE_NO")
						  , rset.getString("ORG_FILENAME")
						  , rset.getString("MDF_FILENAME")
						  , rset.getString("FILE_PATH")
						  , rset.getString("REF_BOARD_TYPE")
						  , rset.getInt("REF_BOARD_NO")
						  , rset.getInt("MYQ_NO")
						  , rset.getString("P_CODE"));
						}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return at;
	}

	public int answer(Connection conn, String answer, int getMyq_no) {
		// Insert 
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("answer");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, getMyq_no);
			pstmt.setString(2, answer);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


}
