package com.kh.order.model.vo;

import java.sql.Date;

public class Order {

	private int orderNo;
	private Date orderDate;
	private int amount;
	private String travelDate;
	private String travelUser;
	private String travelEmail;
	private String status;
	private String cReason;
	private int memNo;
	private String pCode;
	private String pName;
	private String basicPath;
	
	public Order() {}

	

	public Order(int orderNo, Date orderDate, int amount, String travelDate, String travelUser, String travelEmail,
			String status, String cReason, int memNo, String pCode) {
		super();
		this.orderNo = orderNo;
		this.orderDate = orderDate;
		this.amount = amount;
		this.travelDate = travelDate;
		this.travelUser = travelUser;
		this.travelEmail = travelEmail;
		this.status = status;
		this.cReason = cReason;
		this.memNo = memNo;
		this.pCode = pCode;
	}

	
	

	public Order(int orderNo, Date orderDate, int amount, String travelDate, String travelUser, String travelEmail,
			String status, int memNo, String pCode, String pName) {
		super();
		this.orderNo = orderNo;
		this.orderDate = orderDate;
		this.amount = amount;
		this.travelDate = travelDate;
		this.travelUser = travelUser;
		this.travelEmail = travelEmail;
		this.status = status;
		this.memNo = memNo;
		this.pCode = pCode;
		this.pName = pName;
	}



	public Order(int orderNo, Date orderDate, int amount, String travelDate, String travelUser, String travelEmail,
			String status, String cReason, int memNo, String pCode, String pName) {
		super();
		this.orderNo = orderNo;
		this.orderDate = orderDate;
		this.amount = amount;
		this.travelDate = travelDate;
		this.travelUser = travelUser;
		this.travelEmail = travelEmail;
		this.status = status;
		this.cReason = cReason;
		this.memNo = memNo;
		this.pCode = pCode;
		this.pName = pName;
	}

	

	public String getpName() {
		return pName;
	}



	public void setpName(String pName) {
		this.pName = pName;
	}



	public Order(int orderNo, Date orderDate, int amount, String travelDate, String travelUser, String travelEmail,
			String status, int memNo, String pCode) {
		super();
		this.orderNo = orderNo;
		this.orderDate = orderDate;
		this.amount = amount;
		this.travelDate = travelDate;
		this.travelUser = travelUser;
		this.travelEmail = travelEmail;
		this.status = status;
		this.memNo = memNo;
		this.pCode = pCode;
	}

	

	public Order(int orderNo, Date orderDate, int amount, String travelDate, String travelUser, String travelEmail,
			String status, String cReason, int memNo, String pCode, String pName, String basicPath) {
		super();
		this.orderNo = orderNo;
		this.orderDate = orderDate;
		this.amount = amount;
		this.travelDate = travelDate;
		this.travelUser = travelUser;
		this.travelEmail = travelEmail;
		this.status = status;
		this.cReason = cReason;
		this.memNo = memNo;
		this.pCode = pCode;
		this.pName = pName;
		this.basicPath = basicPath;
	}
	

	public String getBasicPath() {
		return basicPath;
	}



	public void setBasicPath(String basicPath) {
		this.basicPath = basicPath;
	}



	public int getOrderNo() {
		return orderNo;
	}



	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}



	public Date getOrderDate() {
		return orderDate;
	}



	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}



	public int getAmount() {
		return amount;
	}



	public void setAmount(int amount) {
		this.amount = amount;
	}



	public String getTravelDate() {
		return travelDate;
	}



	public void setTravelDate(String travelDate) {
		this.travelDate = travelDate;
	}



	public String getTravelUser() {
		return travelUser;
	}



	public void setTravelUser(String travelUser) {
		this.travelUser = travelUser;
	}



	public String getTravelEmail() {
		return travelEmail;
	}



	public void setTravelEmail(String travelEmail) {
		this.travelEmail = travelEmail;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	public String getcReason() {
		return cReason;
	}



	public void setcReason(String cReason) {
		this.cReason = cReason;
	}



	public int getMemNo() {
		return memNo;
	}



	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}



	public String getpCode() {
		return pCode;
	}



	public void setpCode(String pCode) {
		this.pCode = pCode;
	}



	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", orderDate=" + orderDate + ", amount=" + amount + ", travelDate="
				+ travelDate + ", travelUser=" + travelUser + ", travelEmail=" + travelEmail + ", status=" + status
				+ ", cReason=" + cReason + ", memNo=" + memNo + ", pCode=" + pCode + "]";
	}

	

	

	
	
}
