package com.milk.dto;
/*
	�̸�           ��?       ����           
------------ -------- ------------ 
CA_USER_ID            VARCHAR2(20) 
CA_AMOUNT    NOT NULL NUMBER(4)    
CA_SERIAL_NO          NUMBER(4) 
*/
public class CartDTO {
	private String caUserId; // ȸ��
	private int caSerialNo; // ��ٱ��� ���� ��ǰ
	private int caAmount;  // ��ǰ�� ����
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