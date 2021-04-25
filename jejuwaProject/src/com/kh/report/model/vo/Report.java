package com.kh.report.model.vo;

import java.sql.Date;

public class Report { // 신고
	
	private int reportNo;			// 신고 번호
	private int memNo2;				// 신고자 회원번호
	private int memNo3;				// 신고된 회원번호
	private int reviewNo;			// 신고된 리뷰 번호 
	private String reportReason; 	// 신고 사유 (욕설/비방, 게시글도배)
	private Date reportDate;		// 신고 날짜
	
	public Report() {}

	public Report(int reportNo, int memNo2, int memNo3, int reviewNo, String reportReason, Date reportDate) {
		super();
		this.reportNo = reportNo;
		this.memNo2 = memNo2;
		this.memNo3 = memNo3;
		this.reviewNo = reviewNo;
		this.reportReason = reportReason;
		this.reportDate = reportDate;
	}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public int getMemNo2() {
		return memNo2;
	}

	public void setMemNo2(int memNo2) {
		this.memNo2 = memNo2;
	}

	public int getMemNo3() {
		return memNo3;
	}

	public void setMemNo3(int memNo3) {
		this.memNo3 = memNo3;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getReportReason() {
		return reportReason;
	}

	public void setReportReason(String reportReason) {
		this.reportReason = reportReason;
	}

	public Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", memNo2=" + memNo2 + ", memNo3=" + memNo3 + ", reviewNo=" + reviewNo
				+ ", reportReason=" + reportReason + ", reportDate=" + reportDate + "]";
	}

	
}
