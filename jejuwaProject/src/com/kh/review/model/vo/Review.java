package com.kh.review.model.vo;

import java.sql.Date;

public class Review {
	
	private int review_No;
	private String  mem_No;	//join 멤버아이디 String
	private String p_Code;  //join 
	private String rv_Content;
	private Date rv_Date;
	private Date rv_Modify;
	private String rv_Status;
	private int rv_Rating;
	
	
	public Review() {}

	//int인것 조인할거기 때문에 String으로 담기 
	
	
public Review(int review_No, String mem_No, String p_Code, String rv_Content, Date rv_Date, Date rv_Modify,
			String rv_Status, int rv_Rating) {
		super();
		this.review_No = review_No;
		this.mem_No = mem_No;
		this.p_Code = p_Code;
		this.rv_Content = rv_Content;
		this.rv_Date = rv_Date;
		this.rv_Modify = rv_Modify;
		this.rv_Status = rv_Status;
		this.rv_Rating = rv_Rating;
	}



	//	고객센터 리뷰 순서중요 
	
	public Review(int review_No, String mem_No, String p_Code, String rv_Content, Date rv_Date) {
	super();
	this.review_No = review_No;
	this.mem_No = mem_No;
	this.p_Code = p_Code;
	this.rv_Content = rv_Content;
	this.rv_Date = rv_Date;
}



	public Review(int review_No, String mem_No, String rv_Content, Date rv_Date, String rv_Status) {
		super();
		this.review_No = review_No;
		this.mem_No = mem_No;
		this.rv_Content = rv_Content;
		this.rv_Date = rv_Date;
		this.rv_Status = rv_Status;
	}


	


	public int getReview_No() {
		return review_No;
	}



	// 상품상세 리뷰조회 
	public Review(String mem_No, String p_Code, String rv_Content, Date rv_Date, String rv_Status) {
		super();
		this.mem_No = mem_No;
		this.p_Code = p_Code;
		this.rv_Content = rv_Content;
		this.rv_Date = rv_Date;
		this.rv_Status = rv_Status;
	}



	
	
	public void setReview_No(int review_No) {
		this.review_No = review_No;
	}




	

	public String getMem_No() {
		return mem_No;
	}




	public void setMem_No(String mem_No) {
		this.mem_No = mem_No;
	}




	public String getP_Code() {
		return p_Code;
	}




	public void setP_Code(String p_Code) {
		this.p_Code = p_Code;
	}




	public String getRv_Content() {
		return rv_Content;
	}




	public void setRv_Content(String rv_Content) {
		this.rv_Content = rv_Content;
	}




	public Date getRv_Date() {
		return rv_Date;
	}




	public void setRv_Date(Date rv_Date) {
		this.rv_Date = rv_Date;
	}




	public Date getRv_Modify() {
		return rv_Modify;
	}




	public void setRv_Modify(Date rv_Modify) {
		this.rv_Modify = rv_Modify;
	}




	public String getRv_Status() {
		return rv_Status;
	}




	public void setRv_Status(String rv_Status) {
		this.rv_Status = rv_Status;
	}




	public int getRv_Rating() {
		return rv_Rating;
	}




	public void setRv_Rating(int rv_Rating) {
		this.rv_Rating = rv_Rating;
	}

	@Override
	public String toString() {
		return "Review [review_No=" + review_No + ", mem_No=" + mem_No + ", p_Code=" + p_Code + ", rv_Content="
				+ rv_Content + ", rv_Date=" + rv_Date + ", rv_Modify=" + rv_Modify + ", rv_Status=" + rv_Status
				+ ", rv_Rating=" + rv_Rating + "]";
	}



	//   리뷰작성--------


	
	
	
}
