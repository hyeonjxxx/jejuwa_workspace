package com.kh.notice.model.vo;

import java.sql.Date;

public class Notice {

	private int noticeNo;				// 공지사항 번호
	private String noticeTitle;			// 공지사항 제목
	private String noticeContent;		// 공지사항 내용
	private Date enrollDate;			// 공지사항 등록일
	private Date modifyDate;			// 공지사항 수정일
	private int noticeCount;			// 공지사항 조회수
	private String noticeStatus;		// 공지사항 상태
	private String originFileName;		// 첨부파일 원본명
	private String filePath;			// 첨부파일 경로(수정명+폴더경로)
	
	public Notice() {}

	public Notice(int noticeNo, String noticeTitle, String noticeContent, Date enrollDate, Date modifyDate,
			int noticeCount, String noticeStatus, String originFileName, String filePath) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.noticeCount = noticeCount;
		this.noticeStatus = noticeStatus;
		this.originFileName = originFileName;
		this.filePath = filePath;
	}
	
	
	// 공지사항 리스트 조회용 생성자
	public Notice(int noticeNo, String noticeTitle, Date enrollDate, int noticeCount, String originFileName,
			String filePath) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.enrollDate = enrollDate;
		this.noticeCount = noticeCount;
		this.originFileName = originFileName;
		this.filePath = filePath;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public int getNoticeCount() {
		return noticeCount;
	}

	public void setNoticeCount(int noticeCount) {
		this.noticeCount = noticeCount;
	}

	public String getNoticeStatus() {
		return noticeStatus;
	}

	public void setNoticeStatus(String noticeStatus) {
		this.noticeStatus = noticeStatus;
	}

	public String getOriginFileName() {
		return originFileName;
	}

	public void setOriginFileName(String originFileName) {
		this.originFileName = originFileName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate + ", noticeCount=" + noticeCount
				+ ", noticeStatus=" + noticeStatus + ", originFileName=" + originFileName + ", filePath=" + filePath
				+ "]";
	}
}
