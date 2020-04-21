package com.milk.dto;
/*
	이름           널?       유형           
------------ -------- ------------ 
CA_USER_ID            VARCHAR2(20) 
CA_AMOUNT    NOT NULL NUMBER(4)    
CA_SERIAL_NO          NUMBER(4) 
*/
public class CartDTO {
	private String caUserId; // 회원
	private int caSerialNo; // 장바구니 담은 제품
	private int caAmount;  // 제품의 수량
	public ProductDTO product;
	public ProductPageDTO page;
	
	public String getCaUserId() {
		return caUserId;
	}
	public void setCaUserId(String caUserId) {
		this.caUserId = caUserId;
	}
	public int getCaSerialNo() {
		return caSerialNo;
	}
	public void setCaSerialNo(int caSerialNo) {
		this.caSerialNo = caSerialNo;
	}
	public int getCaAmount() {
		return caAmount;
	}
	public void setCaAmount(int caAmount) {
		this.caAmount = caAmount;
	}
}