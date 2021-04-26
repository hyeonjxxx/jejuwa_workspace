
package com.kh.review.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.model.vo.PageInfo;
import com.kh.review.model.dao.ReviewDao;
import com.kh.review.model.vo.Review;



public class ReviewService {
	
	
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new ReviewDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
		
	}
	
//----------------------고객센터 리뷰리스트 
	
	public ArrayList<Review> NoticeReviewList(PageInfo pi) {
		
		Connection conn = getConnection();
		ArrayList<Review> list = new ReviewDao().NoticeReviewList(conn, pi);
		close(conn);
		return list;
			
	}
	
	
//----------------------	
	
	

		

		
}
