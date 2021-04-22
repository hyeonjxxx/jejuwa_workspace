package com.kh.common.model.vo;

public class Attachment { // 첨부파일 vo 클래스
	
	private int fileNo;				// 첨부파일 번호(PK)
	private String orgFileName;		// 첨부파일 원본명
	private String mdfFileName;		// 첨부파일 수정명
	private String filePath;		// 첨부파일 경로
	private String refBoardType;	// 참조 게시글 타입 (문의/리뷰/상품)
	private int refBoardNo;			// 해당게시글번호
	private int myqNo;				// 1:1문의등록번호
	private String pCode;			// 상품코드
	
	public Attachment() {}

	public Attachment(int fileNo, String orgFileName, String mdfFileName, String filePath, String refBoardType,
			int refBoardNo, int myqNo, String pCode) {
		super();
		this.fileNo = fileNo;
		this.orgFileName = orgFileName;
		this.mdfFileName = mdfFileName;
		this.filePath = filePath;
		this.refBoardType = refBoardType;
		this.refBoardNo = refBoardNo;
		this.myqNo = myqNo;
		this.pCode = pCode;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getOrgFileName() {
		return orgFileName;
	}

	public void setOrgFileName(String orgFileName) {
		this.orgFileName = orgFileName;
	}

	public String getMdfFileName() {
		return mdfFileName;
	}

	public void setMdfFileName(String mdfFileName) {
		this.mdfFileName = mdfFileName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getRefBoardType() {
		return refBoardType;
	}

	public void setRefBoardType(String refBoardType) {
		this.refBoardType = refBoardType;
	}

	public int getRefBoardNo() {
		return refBoardNo;
	}

	public void setRefBoardNo(int refBoardNo) {
		this.refBoardNo = refBoardNo;
	}

	public int getMyqNo() {
		return myqNo;
	}

	public void setMyqNo(int myqNo) {
		this.myqNo = myqNo;
	}

	public String getpCode() {
		return pCode;
	}

	public void setpCode(String pCode) {
		this.pCode = pCode;
	}

	@Override
	public String toString() {
		return "Attachment [fileNo=" + fileNo + ", orgFileName=" + orgFileName + ", mdfFileName=" + mdfFileName
				+ ", filePath=" + filePath + ", refBoardType=" + refBoardType + ", refBoardNo=" + refBoardNo
				+ ", myqNo=" + myqNo + ", pCode=" + pCode + "]";
	}
	
	
}
