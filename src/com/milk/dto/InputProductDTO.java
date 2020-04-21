package com.milk.dto;
/*
	이름            	 널?       유형         
-------------- -------- ---------- 
IP_EMPLOYEE_NO          NUMBER(10) 
IP_DATE        NOT NULL DATE       
IP_SERIAL_NO            NUMBER(4)  
IP_AMOUNT      NOT NULL NUMBER(3)
 */
public class InputProductDTO {
	private int ipEmployeeNo; // 입고직원
	private String ipDate; // 입고날짜
	private int ipSerialNo; // 입고 물품
	private int ipAmount; // 입고수량
	
	public int getIpEmployeeNo() {
		return ipEmployeeNo;
	}
	public void setIpEmployeeNo(int ipEmployeeNo) {
		this.ipEmployeeNo = ipEmployeeNo;
	}
	public String getIpDate() {
		return ipDate;
	}
	public void setIpDate(String ipDate) {
		this.ipDate = ipDate;
	}
	public int getIpSerialNo() {
		return ipSerialNo;
	}
	public void setIpSerialNo(int ipSerialNo) {
		this.ipSerialNo = ipSerialNo;
	}
	public int getIpAmount() {
		return ipAmount;
	}
	public void setIpAmount(int ipAmount) {
		this.ipAmount = ipAmount;
	}
}