package com.kh.like.model.vo;

public class Like {

	private int memNo;
	private String pCode;
	private String pName;
	private String basicPath;
	private String detailPath;
	
	
	public Like() {}


	public Like(int memNo, String pCode, String pName, String basicPath, String detailPath) {
		super();
		this.memNo = memNo;
		this.pCode = pCode;
		this.pName = pName;
		this.basicPath = basicPath;
		this.detailPath = detailPath;
	}
	
	

	public Like(int memNo, String pCode, String pName, String basicPath) {
		super();
		this.memNo = memNo;
		this.pCode = pCode;
		this.pName = pName;
		this.basicPath = basicPath;
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


	public String getBasicPath() {
		return basicPath;
	}


	public void setBasicPath(String basicPath) {
		this.basicPath = basicPath;
	}


	public String getDetailPath() {
		return detailPath;
	}


	public void setDetailPath(String detailPath) {
		this.detailPath = detailPath;
	}


	@Override
	public String toString() {
		return "Like [memNo=" + memNo + ", pCode=" + pCode + ", pName=" + pName + ", basicPath=" + basicPath
				+ ", detailPath=" + detailPath + "]";
	}

		
}
