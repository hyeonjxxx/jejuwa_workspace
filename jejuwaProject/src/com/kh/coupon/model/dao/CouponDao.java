package com.kh.coupon.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

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


public ArrayList<Coupon> selectListCoupon(Connection conn) {
//	여러행 조회 select문
	
	ArrayList<Coupon> cplist = new ArrayList<>();
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	
	String sql = prop.getProperty("selectListCoupon");
	
	
	try {
		pstmt = conn.prepareStatement(sql);
		rset = pstmt.executeQuery();
		
		while(rset.next()) {
			
			cplist.add(new Coupon(rset.getDate("cpn_rgdt"),
								  rset.getString("cpn_name"),
								  rset.getInt("cpn_dc"),
								  rset.getDate("cpn_str_date"),
								  rset.getDate("cpn_end_date")));
		}
	} catch (SQLException e) {
		
		e.printStackTrace();
	}finally {
		close(rset);
		close(pstmt);
	}
	
	return cplist;
	
	
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










