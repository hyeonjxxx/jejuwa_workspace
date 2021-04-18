package com.kh.faq.model.vo;

public class Faq {

	private int faqNo;
	private String faqTitle;
	private String faqContent;
	private String faqStatus;
	private String qCategory;
	
	public Faq() {}

	public Faq(int faqNo, String faqTitle, String faqContent, String faqStatus, String qCategory) {
		super();
		this.faqNo = faqNo;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.faqStatus = faqStatus;
		this.qCategory = qCategory;
	}
	
	

	public Faq(String faqTitle, String faqContent, String qCategory) {
		super();
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.qCategory = qCategory;
	}

	public Faq(int faqNo, String faqTitle, String faqContent, String qCategory) {
		super();
		this.faqNo = faqNo;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.qCategory = qCategory;
	}
	
	

	public Faq(int faqNo, String faqTitle, String qCategory) {
		super();
		this.faqNo = faqNo;
		this.faqTitle = faqTitle;
		this.qCategory = qCategory;
	}

	public int getFaqNo() {
		return faqNo;
	}

	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}

	public String getFaqTitle() {
		return faqTitle;
	}

	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}

	public String getFaqContent() {
		return faqContent;
	}

	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}

	public String getFaqStatus() {
		return faqStatus;
	}

	public void setFaqStatus(String faqStatus) {
		this.faqStatus = faqStatus;
	}

	public String getqCategory() {
		return qCategory;
	}

	public void setqCategory(String qCategory) {
		this.qCategory = qCategory;
	}

	@Override
	public String toString() {
		return "Faq [faqNo=" + faqNo + ", faqTitle=" + faqTitle + ", faqContent=" + faqContent + ", faqStatus="
				+ faqStatus + ", qCategory=" + qCategory + "]";
	};
	
	
}
