
package com.kh.review.model.service;



public class ReviewService {

	
	public ArrayList<Review> selectReviewList1(PageInfo pi) {
		
		Connection conn = getConnection();
		int listCount = new ReviewDao().selectReviewList(PageInfo pi) {
			
		}
	}
		
}
