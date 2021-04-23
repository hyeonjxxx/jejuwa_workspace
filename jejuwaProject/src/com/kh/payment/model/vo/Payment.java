package com.kh.payment.model.vo;

import java.sql.Date;

public class Payment {
	
	private int memNo;
	private int orderNo;
	private int amount;
	private Date accountday;
	private String pMethod;
	private String cashReceipt;
	private String card;
	private String sales;
	private int keyNo;
	private String pCode;
	private String pName;
	private String travelDate;
	private String memName;
	private String phone;
	private String email;
	private String cpnName;
	
	public Payment() {}

	public Payment(int memNo, int orderNo, int amount, Date accountday, String pMethod, String cashReceipt, String card,
			String sales, int keyNo, String pCode, String pName, String travelDate, String memName, String phone,
			String email, String cpnName) {
		super();
		this.memNo = memNo;
		this.orderNo = orderNo;
		this.amount = amount;
		this.accountday = accountday;
		this.pMethod = pMethod;
		this.cashReceipt = cashReceipt;
		this.card = card;
		this.sales = sales;
		this.keyNo = keyNo;
		this.pCode = pCode;
		this.pName = pName;
		this.travelDate = travelDate;
		this.memName = memName;
		this.phone = phone;
		this.email = email;
		this.cpnName = cpnName;
	}

	public Payment(int memNo, int orderNo, int amount, Date accountday, String pMethod, String cashReceipt, String card,
			String sales, int keyNo, String pName, String travelDate, String memName, String phone, String email,
			String cpnName) {
		super();
		this.memNo = memNo;
		this.orderNo = orderNo;
		this.amount = amount;
		this.accountday = accountday;
		this.pMethod = pMethod;
		this.cashReceipt = cashReceipt;
		this.card = card;
		this.sales = sales;
		this.keyNo = keyNo;
		this.pName = pName;
		this.travelDate = travelDate;
		this.memName = memName;
		this.phone = phone;
		this.email = email;
		this.cpnName = cpnName;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public Date getAccountday() {
		return accountday;
	}

	public void setAccountday(Date accountday) {
		this.accountday = accountday;
	}

	public String getpMethod() {
		return pMethod;
	}

	public void setpMethod(String pMethod) {
		this.pMethod = pMethod;
	}

	public String getCashReceipt() {
		return cashReceipt;
	}

	public void setCashReceipt(String cashReceipt) {
		this.cashReceipt = cashReceipt;
	}

	public String getCard() {
		return card;
	}

	public void setCard(String card) {
		this.card = card;
	}

	public String getSales() {
		return sales;
	}

	public void setSales(String sales) {
		this.sales = sales;
	}

	public int getKeyNo() {
		return keyNo;
	}

	public void setKeyNo(int keyNo) {
		this.keyNo = keyNo;
	}

	public String getpCode() {
		return pCode;
	}

	public void setpCode(String pCode) {
		this.pCode = pCode;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getTravelDate() {
		return travelDate;
	}

	public void setTravelDate(String travelDate) {
		this.travelDate = travelDate;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCpnName() {
		return cpnName;
	}

	public void setCpnName(String cpnName) {
		this.cpnName = cpnName;
	}

	@Override
	public String toString() {
		return "Payment [memNo=" + memNo + ", orderNo=" + orderNo + ", amount=" + amount + ", accountday=" + accountday
				+ ", pMethod=" + pMethod + ", cashReceipt=" + cashReceipt + ", card=" + card + ", sales=" + sales
				+ ", keyNo=" + keyNo + ", pCode=" + pCode + ", pName=" + pName + ", travelDate=" + travelDate
				+ ", memName=" + memName + ", phone=" + phone + ", email=" + email + ", cpnName=" + cpnName + "]";
	}

	
	
}
