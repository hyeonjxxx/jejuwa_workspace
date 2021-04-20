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
	
	public Payment() {};
	
	public Payment(int memNo, int orderNo, int amount, Date accountday, String pMethod, String cashReceipt, String card,
			String sales, int keyNo) {
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

	@Override
	public String toString() {
		return "Payment [memNo=" + memNo + ", orderNo=" + orderNo + ", amount=" + amount + ", accountday=" + accountday
				+ ", pMethod=" + pMethod + ", cashReceipt=" + cashReceipt + ", card=" + card + ", sales=" + sales
				+ ", keyNo=" + keyNo + "]";
	}
	
	
	
	
	
}
