package com.kh.review.model.vo;

import java.sql.Date;

public class Review {
	
	private int review_No;
	private String  mem_Name;
	private String p_Name;
	private String rv_Content;
	private Date rv_Date;
	private Date rv_Modify;
	private String rv_Status;
	private int rv_Rating;
	
	
	public Review() {}



	public Review(int review_No, String mem_Name, String p_Name, String rv_Content, Date rv_Date, Date rv_Modify,
			String rv_Status, int rv_Rating) {
		super();
		this.review_No = review_No;
		this.mem_Name = mem_Name;
		this.p_Name = p_Name;
		this.rv_Content = rv_Content;
		this.rv_Date = rv_Date;
		this.rv_Modify = rv_Modify;
		this.rv_Status = rv_Status;
		this.rv_Rating = rv_Rating;
	}


	public Review(int review_No, String mem_Name, String rv_Content, Date rv_Date, String rv_Status) {
		super();
		this.review_No = review_No;
		this.mem_Name = mem_Name;
		this.rv_Content = rv_Content;
		this.rv_Date = rv_Date;
		
	}

	// 	고객센터 리뷰조회---


	public Review(int review_No, String mem_Name, String p_Name, String rv_Content, Date rv_Date) {
		super();
		this.review_No = review_No;
		this.mem_Name = mem_Name;
		this.p_Name = p_Name;
		this.rv_Content = rv_Content;
		this.rv_Date = rv_Date;
	}



	public int getReview_No() {
		return review_No;
	}


	public void setReview_No(int review_No) {
		this.review_No = review_No;
	}


	public String getMem_Name() {
		return mem_Name;
	}


	public void setMem_Name(String mem_Name) {
		this.mem_Name = mem_Name;
	}


	public String getP_Name() {
		return p_Name;
	}


	public void setP_Name(String p_Name) {
		this.p_Name = p_Name;
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



	
	


	
	
	
}
