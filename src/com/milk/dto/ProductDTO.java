package com.milk.dto;
/*
�̸�            		��?       ����           
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
	private int pSerialNo; // ��ǰ��ȣ
	private String pDivision; // ��ǰ����
	private String pName; // ��ǰ�̸�
	private String pOrigin; // ������
	private int pSize; // �뷮(���п� ���� �޶���)
	private int pPrice; // ����
	private int pAmount; // ���
	private int pSaleAmount; // �Ǹŷ�
	private int pStatus; // ��ǰ�� ����(����� ��)
	
	
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