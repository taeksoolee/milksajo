package com.milk.dto;
/*
	�̸�          ��? ����           
----------- -- ------------ 
BI_ORDER_NO    VARCHAR2(11) 
BI_USER_ID     VARCHAR2(20) 
 */
public class BuyingInfDTO {
	private String biOrderNo; // �ֹ���ȣ
	private String biUserId; // �ֹ��� ȸ��
	
	public String getBiOrderNo() {
		return biOrderNo;
	}
	public void setBiOrderNo(String biOrderNo) {
		this.biOrderNo = biOrderNo;
	}
	public String getBiUserId() {
		return biUserId;
	}
	public void setBiUserId(String biUserId) {
		this.biUserId = biUserId;
	}
	
}