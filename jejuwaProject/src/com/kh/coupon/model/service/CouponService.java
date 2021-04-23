package com.kh.coupon.model.service;
import static com.kh.common.JDBCTemplate.* ;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.coupon.model.dao.CouponDao;
import com.kh.coupon.model.vo.Coupon;

public class CouponService {

	
	public ArrayList<Coupon> selectListCoupon() {
		Connection conn = getConnection();
		
		ArrayList<Coupon> cplist = new CouponDao().selectListCoupon(conn);
		
		close(conn);
		
		return cplist;

	}
	
	public CouponService() {
		Connection conn = new getConnection();
		
	}
}
