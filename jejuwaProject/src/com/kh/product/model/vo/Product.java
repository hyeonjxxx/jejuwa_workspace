package com.kh.product.model.vo;

public class Product {
	

	private String pCode;
	private String pName;
	private int price;
	private int pStock;
	private String pStatus;
	private String basicPath;
	private String detailPath;
	private String localCode;
	private String themeCode;
	
	public Product(){}

	public Product(String pCode, String pName, int price, int pStock, String pStatus, String basicPath,
			String detailPath, String localCode, String themeCode) {
		super();
		this.pCode = pCode;
		this.pName = pName;
		this.price = price;
		this.pStock = pStock;
		this.pStatus = pStatus;
		this.basicPath = basicPath;
		this.detailPath = detailPath;
		this.localCode = localCode;
		this.themeCode = themeCode;
	}

	// adminPage- 상품리스트 조회시
	public Product(String pCode, String pName, int price, int pStock, String pStatus) {
		super();
		this.pCode = pCode;
		this.pName = pName;
		this.price = price;
		this.pStock = pStock;
		this.pStatus = pStatus;
	}
	
	// 썸네일리스트 조회시
	public Product( String pName, int price, String basicPath, String detailPath) {
		super();
		this.pName = pName;
		this.price = price;
		this.basicPath = basicPath;
		this.basicPath = basicPath;
	}

	// 상품상세 조회시
	
	
	public String getpCode() {
		return pCode;
	}

	public Product(String pCode, String pName, int price, String basicPath, String detailPath) {
		super();
		this.pCode = pCode;
		this.pName = pName;
		this.price = price;
		this.basicPath = basicPath;
		this.detailPath = detailPath;
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getpStock() {
		return pStock;
	}

	public void setpStock(int pStock) {
		this.pStock = pStock;
	}

	public String getpStatus() {
		return pStatus;
	}

	public void setpStatus(String pStatus) {
		this.pStatus = pStatus;
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

	public String getLocalCode() {
		return localCode;
	}

	public void setLocalCode(String localCode) {
		this.localCode = localCode;
	}

	public String getThemeCode() {
		return themeCode;
	}

	public void setThemeCode(String themeCode) {
		this.themeCode = themeCode;
	}

	@Override
	public String toString() {
		return "Product [pCode=" + pCode + ", pName=" + pName + ", price=" + price + ", pStock=" + pStock + ", pStatus="
				+ pStatus + ", basicPath=" + basicPath + ", detailPath=" + detailPath + ", localCode=" + localCode
				+ ", themeCode=" + themeCode + "]";
	}	

}
