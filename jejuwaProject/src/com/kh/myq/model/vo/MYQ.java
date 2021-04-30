package com.kh.myq.model.vo;

import java.sql.Date;

public class MYQ {
	private int myq_no;
	private String myq_category;
	private String myq_title;
	private String myq_content;
	private Date myq_enroll_date;
	private String myq_ans_content;
	private Date myq_ans_date;
	private int mem_no;	
	private String p_code;
	
	private String mem_id; // join 해온 것
	private String p_name; // join 해온 것
	private String mem_name; // join 해온 것
	
	public MYQ() {}

	public MYQ(int myq_no, String myq_category, String myq_title, String myq_content, Date myq_enroll_date,
			String myq_ans_content, Date myq_ans_date, int mem_no, String p_code) {
		super();
		this.myq_no = myq_no;
		this.myq_category = myq_category;
		this.myq_title = myq_title;
		this.myq_content = myq_content;
		this.myq_enroll_date = myq_enroll_date;
		this.myq_ans_content = myq_ans_content;
		this.myq_ans_date = myq_ans_date;
		this.mem_no = mem_no;
		this.p_code = p_code;
	}
	
	
	

	public MYQ(int myq_no, String myq_category, String myq_title, Date myq_enroll_date, Date myq_ans_date,
			String mem_id, String p_code, String myq_ans_content, String p_name) {
		super();
		this.myq_no = myq_no;
		this.myq_category = myq_category;
		this.myq_title = myq_title;
		this.myq_enroll_date = myq_enroll_date;
		this.myq_ans_date = myq_ans_date;
		this.mem_id = mem_id;
		this.p_code = p_code;
		this.myq_ans_content = myq_ans_content;
		this.p_name = p_name;
	}
	
	
	public MYQ(int myq_no, String myq_category, String myq_title, String myq_content, Date myq_enroll_date,
			String myq_ans_content, Date myq_ans_date, int mem_no, String p_code, String mem_id, String p_name, String mem_name) {
		super();
		this.myq_no = myq_no;
		this.myq_category = myq_category;
		this.myq_title = myq_title;
		this.myq_content = myq_content;
		this.myq_enroll_date = myq_enroll_date;
		this.myq_ans_content = myq_ans_content;
		this.myq_ans_date = myq_ans_date;
		this.mem_no = mem_no;
		this.p_code = p_code;
		this.mem_id = mem_id;
		this.p_name = p_name;
		this.mem_name = mem_name;
	}
	
	
	public MYQ(int myq_no) {
		super();
		this.myq_no = myq_no;
	}

	public int getMyq_no() {
		return myq_no;
	}

	public void setMyq_no(int myq_no) {
		this.myq_no = myq_no;
	}

	public String getMyq_category() {
		return myq_category;
	}

	public void setMyq_category(String myq_category) {
		this.myq_category = myq_category;
	}

	public String getMyq_title() {
		return myq_title;
	}

	public void setMyq_title(String myq_title) {
		this.myq_title = myq_title;
	}

	public String getMyq_content() {
		return myq_content;
	}

	public void setMyq_content(String myq_content) {
		this.myq_content = myq_content;
	}

	public Date getMyq_enroll_date() {
		return myq_enroll_date;
	}

	public void setMyq_enroll_date(Date myq_enroll_date) {
		this.myq_enroll_date = myq_enroll_date;
	}

	public String getMyq_ans_content() {
		return myq_ans_content;
	}

	public void setMyq_ans_content(String myq_ans_content) {
		this.myq_ans_content = myq_ans_content;
	}

	public Date getMyq_ans_date() {
		return myq_ans_date;
	}

	public void setMyq_ans_date(Date myq_ans_date) {
		this.myq_ans_date = myq_ans_date;
	}

	public int getMem_no() {
		return mem_no;
	}

	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}

	public String getP_code() {
		return p_code;
	}

	public void setP_code(String p_code) {
		this.p_code = p_code;
	}
	
	
	// 조인문 mem_id 추가
	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	
	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	@Override
	public String toString() {
		return "MYQ [myq_no=" + myq_no + ", myq_category=" + myq_category + ", myq_title=" + myq_title
				+ ", myq_content=" + myq_content + ", myq_enroll_date=" + myq_enroll_date + ", myq_ans_content="
				+ myq_ans_content + ", myq_ans_date=" + myq_ans_date + ", mem_no=" + mem_no + ", p_code=" + p_code
				+ ", mem_id=" + mem_id + ", p_name=" + p_name + ", mem_name=" + mem_name + "]";
	}


	
	
	
}
