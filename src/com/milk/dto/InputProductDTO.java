package com.milk.dto;
/*
	�̸�            	 ��?       ����         
-------------- -------- ---------- 
IP_EMPLOYEE_NO          NUMBER(10) 
IP_DATE        NOT NULL DATE       
IP_SERIAL_NO            NUMBER(4)  
IP_AMOUNT      NOT NULL NUMBER(3)
 */
public class InputProductDTO {
	private int ipEmployeeNo; // �԰�����
	private String ipDate; // �԰�¥
	private int ipSerialNo; // �԰� ��ǰ
	private int ipAmount; // �԰����
	
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