package com.kh.coupon.model.vo;

import java.sql.Date;

public class Coupon {

	
	
	private int cpn_Code;
	private String cpn_Name;
	private int cpn_Dc;
	private Date cpn_Rgdt;
	private Date cpn_Str_Date;
	private Date cpn_End_Date;
	private int cpn_Min;
	private int memNo;
	
	
	public Coupon() {}
	
	public Coupon(int cpn_Code, String cpn_Name, int cpn_Dc, Date cpn_Rgdt, Date cpn_Str_Date, Date cpn_End_Date,
			int cpn_Min) {
		super();
		this.cpn_Code = cpn_Code;
		this.cpn_Name = cpn_Name;
		this.cpn_Dc = cpn_Dc;
		this.cpn_Rgdt = cpn_Rgdt;
		this.cpn_Str_Date = cpn_Str_Date;
		this.cpn_End_Date = cpn_End_Date;
		this.cpn_Min = cpn_Min;
	}


	// 관리자 쿠폰조회 

public Coupon(int cpn_Code, String cpn_Name, int cpn_Dc, Date cpn_Rgdt, Date cpn_Str_Date, Date cpn_End_Date) {
		super();
		this.cpn_Code = cpn_Code;
		this.cpn_Name = cpn_Name;
		this.cpn_Dc = cpn_Dc;
		this.cpn_Rgdt = cpn_Rgdt;
		this.cpn_Str_Date = cpn_Str_Date;
		this.cpn_End_Date = cpn_End_Date;
	}




	//마이쿠폰리스트
public Coupon(String cpn_Name, int cpn_Dc, Date cpn_Rgdt, Date cpn_Str_Date, Date cpn_End_Date) {
	super();
	this.cpn_Name = cpn_Name;
	this.cpn_Dc = cpn_Dc;
	this.cpn_Rgdt = cpn_Rgdt;
	this.cpn_Str_Date = cpn_Str_Date;
	this.cpn_End_Date = cpn_End_Date;
	
	
	// 결제페이지 쿠폰리스트 조회
	
}

public Coupon(int cpn_Code, String cpn_Name, int cpn_Dc, Date cpn_Rgdt, Date cpn_Str_Date, Date cpn_End_Date,
		int cpn_Min, int memNo) {
	super();
	this.cpn_Code = cpn_Code;
	this.cpn_Name = cpn_Name;
	this.cpn_Dc = cpn_Dc;
	this.cpn_Rgdt = cpn_Rgdt;
	this.cpn_Str_Date = cpn_Str_Date;
	this.cpn_End_Date = cpn_End_Date;
	this.cpn_Min = cpn_Min;
	this.memNo = memNo;
}











public int getCpn_Code() {
	return cpn_Code;
}









public void setCpn_Code(int cpn_Code) {
	this.cpn_Code = cpn_Code;
}









public String getCpn_Name() {
	return cpn_Name;
}









public void setCpn_Name(String cpn_Name) {
	this.cpn_Name = cpn_Name;
}









public int getCpn_Dc() {
	return cpn_Dc;
}









public void setCpn_Dc(int cpn_Dc) {
	this.cpn_Dc = cpn_Dc;
}









public Date getCpn_Rgdt() {
	return cpn_Rgdt;
}









public void setCpn_Rgdt(Date cpn_Rgdt) {
	this.cpn_Rgdt = cpn_Rgdt;
}









public Date getCpn_Str_Date() {
	return cpn_Str_Date;
}









public void setCpn_Str_Date(Date cpn_Str_Date) {
	this.cpn_Str_Date = cpn_Str_Date;
}









public Date getCpn_End_Date() {
	return cpn_End_Date;
}









public void setCpn_End_Date(Date cpn_End_Date) {
	this.cpn_End_Date = cpn_End_Date;
}









public int getCpn_Min() {
	return cpn_Min;
}









public void setCpn_Min(int cpn_Min) {
	this.cpn_Min = cpn_Min;
}


//-------------------------

	
	
	
	
}
