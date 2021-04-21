package com.kh.like.model.vo;

public class Like {

	private int memNo;
	private String pCode;
	private String pName;
	private String detailPath;
	
	
	public Like() {}


	public Like(int memNo, String pCode, String pName, String detailPath) {
		super();
		this.memNo = memNo;
		this.pCode = pCode;
		this.pName = pName;
		this.detailPath = detailPath;
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


	public String getpName() {
		return pName;
	}


	public void setpName(String pName) {
		this.pName = pName;
	}


	public String getDetailPath() {
		return detailPath;
	}


	public void setDetailPath(String detailPath) {
		this.detailPath = detailPath;
	}


	@Override
	public String toString() {
		return "Like [memNo=" + memNo + ", pCode=" + pCode + ", pName=" + pName + ", detailPath=" + detailPath + "]";
	}

	
	
}
