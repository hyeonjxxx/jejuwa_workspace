package com.kh.review.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.model.vo.PageInfo;
import com.kh.review.model.vo.Review;

import static com.kh.common.JDBCTemplate.*;


public class ReviewDao {
	
	private Properties prop = new Properties();
	
	public ReviewDao() {
		
		String fileName = ReviewDao.class.getResource("/sql/review/review-mapper.xml").getPath();
	
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}

		
	}
	
	
	public int selectListCount(Connection conn) {
		
//		1개 조회  select 정수값 총게시글 수 
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			
			if(rset.next()) {
				listCount = rset.getInt("LISTCOUNT");
				//별칭으로 했으면 똑같이 별칭으로 뽑아야함.
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
		
	}

	
	
//	-------------고객센터리뷰 
	
	public ArrayList<Review> NoticeReviewList(Connection conn, PageInfo pi) {
		
		ArrayList<Review> ctlist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("NoticeReviewList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
			pstmt.setInt(2, pi.getCurrentPage() * pi.getBoardLimit());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				ctlist.add(new Review(rset.getInt("review_no"),
									rset.getString("mem_name"),
									rset.getString("p_name"),
									rset.getString("rv_content"),
									rset.getDate("rv_date")));
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return ctlist;
		
		
}
	
	
		
//	-------------------------------
	
	public ArrayList<Review> selectReviewList(Connection conn, PageInfo pi) {
		
		ArrayList<Review> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReviewList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
			pstmt.setInt(2, pi.getCurrentPage() * pi.getBoardLimit());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Review(rset.getInt("review_no"),
									rset.getString("mem_no"),
									rset.getString("rv_content"),
									rset.getDate("rv_date"),
									rset.getString("rv_status")));
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
		
}

//상품 리뷰작성 
public int insertReview(Connection conn, Review ir) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ir.getRv_Content());
			pstmt.setDate(2, ir.getRv_Date());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
		
	

public ArrayList<Review> selectReviewListPr(Connection conn, String pcoder){
	//select문 여러행 조회
	ArrayList<Review> listr = new ArrayList<>();
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	String sql = prop.getProperty("selectReviewListPr");
	
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pcoder);
		
		rset = pstmt.executeQuery();
		while(rset.next()) {
			listr.add(new Review(rset.getString("mem_id"),
								 rset.getString("pcode"),
								 rset.getString("rv_content"),
								 rset.getDate("rv_date"),
								 rset.getString("rv_status")));
		}
;	} catch (SQLException e) {
		
		e.printStackTrace();
	}finally {
		close(rset);
		close(pstmt);
		
	}
	return listr;
	
	
	
	
	
}
	
	
	
	
	
	
	
	
}
