package com.kh.blacklist.model.vo;

import java.sql.Date;

public class Blacklist {

	private int blacklistNo;
	private int memNo;
	private String memId;
	private String memName;
	private Date restrictDate;
	private int reportedCount;
	
	
	public Blacklist(int blacklistNo, int memNo, String memId, String memName, Date restrictDate, int reportedCount) {
		super();
		this.blacklistNo = blacklistNo;
		this.memNo = memNo;
		this.memId = memId;
		this.memName = memName;
		this.restrictDate = restrictDate;
		this.reportedCount = reportedCount;
	}


	public int getBlacklistNo() {
		return blacklistNo;
	}


	public void setBlacklistNo(int blacklistNo) {
		this.blacklistNo = blacklistNo;
	}


	public int getMemNo() {
		return memNo;
	}


	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}


	public String getMemId() {
		return memId;
	}


	public void setMemId(String memId) {
		this.memId = memId;
	}


	public String getMemName() {
		return memName;
	}


	public void setMemName(String memName) {
		this.memName = memName;
	}


	public Date getRestrictDate() {
		return restrictDate;
	}


	public void setRestrictDate(Date restrictDate) {
		this.restrictDate = restrictDate;
	}


	public int getReportedCount() {
		return reportedCount;
	}


	public void setReportedCount(int reportedCount) {
		this.reportedCount = reportedCount;
	}


	@Override
	public String toString() {
		return "Blacklist [blacklistNo=" + blacklistNo + ", memNo=" + memNo + ", memId=" + memId + ", memName="
				+ memName + ", restrictDate=" + restrictDate + ", reportedCount=" + reportedCount + "]";
	}
	
	
	
	
	
	
}
