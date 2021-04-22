package com.kh.coupon.model.vo;

import java.sql.Date;

public class Coupon {

	
	private Date cpn_Rgdt;
	private String cpn_Name;
	private int cpn_Dc;
	private Date cpn_Str_Date;
	private Date cpn_End_Date;
	
	
	public Coupon() {}


	public Coupon(Date cpn_Rgdt, String cpn_Name, int cpn_Dc, Date cpn_Str_Date, Date cpn_End_Date) {
		super();
		this.cpn_Rgdt = cpn_Rgdt;
		this.cpn_Name = cpn_Name;
		this.cpn_Dc = cpn_Dc;
		this.cpn_Str_Date = cpn_Str_Date;
		this.cpn_End_Date = cpn_End_Date;
	}


	public Date getCpn_Rgdt() {
		return cpn_Rgdt;
	}


	public void setCpn_Rgdt(Date cpn_Rgdt) {
		this.cpn_Rgdt = cpn_Rgdt;
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


	@Override
	public String toString() {
		return "Coupon [cpn_Rgdt=" + cpn_Rgdt + ", cpn_Name=" + cpn_Name + ", cpn_Dc=" + cpn_Dc + ", cpn_Str_Date="
				+ cpn_Str_Date + ", cpn_End_Date=" + cpn_End_Date + "]";
	}


	
	
	
	
}
