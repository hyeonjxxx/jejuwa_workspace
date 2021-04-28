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
	private String cpnName;
	private int memNo;
	private String localName;
	private String themeName;
	
	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public Product(String pName, String pCode, int price, String basicPath, String detailPath, String cpnName,
			int memNo) {
		super();
		this.pName = pName;
		this.pCode = pCode;
		this.price = price;
		this.basicPath = basicPath;
		this.detailPath = detailPath;
		this.cpnName = cpnName;
		this.memNo = memNo;
	}

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

	// 수정페이지 
	public Product(String localCode, String themeCode, String pCode, String pName, String basicPath,  
		 int price, int pStock, String detailPath){
		super();
		this.localCode = localCode;
		this.themeCode = themeCode;
		this.pCode = pCode;
		this.pName = pName;
		this.basicPath = basicPath;
		this.price = price;
		this.pStock = pStock;
		this.detailPath = detailPath;
	}	
	
	// 썸네일리스트 조회시
	public Product(String pCode, String pName, int price, String basicPath) {
		super();
		this.pCode = pCode;
		this.pName = pName;
		this.price = price;
		this.basicPath = basicPath;
	}
	
	public String getpCode() {
		return pCode;
	}

	public Product(String pName, String pCode, int price, String basicPath, String detailPath, String localName,String themeName) {
		super();
		this.pCode = pCode;
		this.pName = pName;
		this.price = price;
		this.basicPath = basicPath;
		this.detailPath = detailPath;
		this.localName = localName;
		this.themeName = themeName;
	}


	public Product(String pName, String pCode, int price, String basicPath, String detailPath) {
		super();
		this.pCode = pCode;
		this.pName = pName;
		this.price = price;
		this.basicPath = basicPath;
		this.detailPath = detailPath;
	}	
	
	public Product(String pName, String pCode, int price, String basicPath, String detailPath, String cpnName) {
		super();
		this.pName = pName;
		this.pCode = pCode;
		this.price = price;
		this.basicPath = basicPath;
		this.detailPath = detailPath;
		this.cpnName = cpnName;
	}
	
	
	
	public String getLocalName() {
		return localName;
	}

	public void setLocalName(String localName) {
		this.localName = localName;
	}

	public String getThemeName() {
		return themeName;
	}

	public void setThemeName(String themeName) {
		this.themeName = themeName;
	}

	public String getCpnName() {
		return cpnName;
	}

	public void setCpnName(String cpnName) {
		this.cpnName = cpnName;
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
