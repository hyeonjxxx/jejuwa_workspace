package com.kh.coupon.model.vo;

import java.sql.Date;

public class Coupon {

	
	
	private int Cpn_Code;
	private String Cpn_Name;
	private int Cpn_Dc;
	private Date Cpn_Rgdt;
	private Date Cpn_Str_Date;
	private Date Cpn_End_Date;
	private int Cpn_Min;

	
	
	public Coupon() {}
	


	public Coupon(int cpn_Code, String cpn_Name, int cpn_Dc, Date cpn_Rgdt, Date cpn_Str_Date, Date cpn_End_Date,
			int cpn_Min) {
		super();
		Cpn_Code = cpn_Code;
		Cpn_Name = cpn_Name;
		Cpn_Dc = cpn_Dc;
		Cpn_Rgdt = cpn_Rgdt;
		Cpn_Str_Date = cpn_Str_Date;
		Cpn_End_Date = cpn_End_Date;
		Cpn_Min = cpn_Min;
	}



	public Coupon(int cpn_Code, String cpn_Name, int cpn_Dc, Date cpn_Rgdt, Date cpn_Str_Date, Date cpn_End_Date) {
		super();
		Cpn_Code = cpn_Code;
		Cpn_Name = cpn_Name;
		Cpn_Dc = cpn_Dc;
		Cpn_Rgdt = cpn_Rgdt;
		Cpn_Str_Date = cpn_Str_Date;
		Cpn_End_Date = cpn_End_Date;
	}



	public int getCpn_Code() {
		return Cpn_Code;
	}



	public void setCpn_Code(int cpn_Code) {
		Cpn_Code = cpn_Code;
	}



	public String getCpn_Name() {
		return Cpn_Name;
	}



	public void setCpn_Name(String cpn_Name) {
		Cpn_Name = cpn_Name;
	}



	public int getCpn_Dc() {
		return Cpn_Dc;
	}



	public void setCpn_Dc(int cpn_Dc) {
		Cpn_Dc = cpn_Dc;
	}



	public Date getCpn_Rgdt() {
		return Cpn_Rgdt;
	}



	public void setCpn_Rgdt(Date cpn_Rgdt) {
		Cpn_Rgdt = cpn_Rgdt;
	}



	public Date getCpn_Str_Date() {
		return Cpn_Str_Date;
	}



	public void setCpn_Str_Date(Date cpn_Str_Date) {
		Cpn_Str_Date = cpn_Str_Date;
	}



	public Date getCpn_End_Date() {
		return Cpn_End_Date;
	}



	public void setCpn_End_Date(Date cpn_End_Date) {
		Cpn_End_Date = cpn_End_Date;
	}



	public int getCpn_Min() {
		return Cpn_Min;
	}



	public void setCpn_Min(int cpn_Min) {
		Cpn_Min = cpn_Min;
	}


	
	
	
	
	
}
