package com.kh.coupon.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.model.vo.PageInfo;
import com.kh.coupon.model.vo.Coupon;

import static com.kh.common.JDBCTemplate.*;


public class CouponDao {
	
	private Properties prop = new Properties();
	
	
	public CouponDao() {
		String filename = CouponDao.class.getResource("/sql/coupon/coupon-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filename));
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
	}
	

	public int selectListCount(Connection conn) {
		// select문 => ResultSet객체 (총게시글갯수 == 정수)
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
	
//	관리자 쿠폰조회 
	public ArrayList<Coupon> adminCouponList(Connection conn, PageInfo pi){
		// select문 => ResultSet객체 (여러행)
		ArrayList<Coupon> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			/*
			 * ex) boardLimit : 10 라는 가정하에 
			 * currentPage = 1	=> startRow : 1		endRow : 10
			 * currentPage = 2	=> startRow : 11	endRow : 20
			 * currentPage = 3	=> startRow : 21	endRow : 30
			 * 
			 * startRow = (currentPage - 1) * boardLimit + 1
			 * endRow = currentPage * boardLimit
			 */
			pstmt.setInt(1, (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
			pstmt.setInt(2, pi.getCurrentPage() * pi.getBoardLimit());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Coupon(rset.getInt("cpn_code"),
								   rset.getString("cpn_name"),
								   rset.getInt("cpn_dc"),
								   rset.getDate("cpn_rgdt"),
								   rset.getDate("cpn_str_date"),
								   rset.getDate("cpn_end_date")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
		


public ArrayList<Coupon> selectListCoupon(Connection conn) {
//	여러행 조회 select문
	
	ArrayList<Coupon> list = new ArrayList<>();
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	
	String sql = prop.getProperty("selectListCoupon");
	
	
	try {
		pstmt = conn.prepareStatement(sql);
		rset = pstmt.executeQuery();
		
		while(rset.next()) {
			list.add(new Coupon(rset.getInt("cpn_code"),
							   rset.getString("cpn_name"),
							   rset.getInt("cpn_dc"),
							   rset.getDate("cpn_rgdt"),
							   rset.getDate("cpn_str_date"),
							   rset.getDate("cpn_end_date")));
		}
	} catch (SQLException e) {
		
		e.printStackTrace();
	}finally {
		close(rset);
		close(pstmt);
	}
	
	return list;
	
	
}
//쿠폰갯수 조회 한행조회 
public int selectCouponCount(Connection conn) {

	int CouponCount = 0;
	
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	
	String sql = prop.getProperty("selectCouponCount");
	
	try {
		pstmt = conn.prepareStatement(sql);
		rset = pstmt.executeQuery();
		
		if(rset.next()) {
			CouponCount = rset.getInt("CouponCount");
		}
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(rset);
		close(pstmt);
	}
	
	return CouponCount;
	
}
}










