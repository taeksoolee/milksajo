package com.milk.dto;
/*
이름            		널?       유형           
------------- -------- ------------ 
P_SERIAL_NO   NOT NULL NUMBER(4)    
P_DIVISION             VARCHAR2(30) 
P_NAME        NOT NULL VARCHAR2(30) 
P_ORIGIN               VARCHAR2(10) 
P_SIZE        NOT NULL NUMBER(5)    
P_PRICE       NOT NULL NUMBER(10)   
P_AMOUNT      NOT NULL NUMBER(5)    
P_SALE_AMOUNT NOT NULL NUMBER(5)
P_STATUS      NOT NULL NUMBER(1)      
 */
public class ProductDTO {
	private int pSerialNo; // 제품번호
	private String pDivision; // 제품구분
	private String pName; // 제품이름
	private String pOrigin; // 원산지
	private int pSize; // 용량(구분에 따라 달라짐)
	private int pPrice; // 가격
	private int pAmount; // 재고
	private int pSaleAmount; // 판매량
	private int pStatus; // 상품의 상태(출고가능 등)
	
	
	public int getpSerialNo() {
		return pSerialNo;
	}
	public void setpSerialNo(int pSerialNo) {
		this.pSerialNo = pSerialNo;
	}
	public String getpDivision() {
		return pDivision;
	}
	public void setpDivision(String pDivision) {
		this.pDivision = pDivision;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpOrigin() {
		return pOrigin;
	}
	public void setpOrigin(String pOrigin) {
		this.pOrigin = pOrigin;
	}
	public int getpSize() {
		return pSize;
	}
	public void setpSize(int pSize) {
		this.pSize = pSize;
	}
	public int getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
	public int getpAmount() {
		return pAmount;
	}
	public void setpAmount(int pAmount) {
		this.pAmount = pAmount;
	}
	public int getpSaleAmount() {
		return pSaleAmount;
	}
	public void setpSaleAmount(int pSaleAmount) {
		this.pSaleAmount = pSaleAmount;
	}
	public int getpStatus() {
		return pStatus;
	}
	public void setpStatus(int pStatus) {
		this.pStatus = pStatus;
	}
	
}