package com.milk.dto;
/*
	이름          널? 유형           
----------- -- ------------ 
BI_ORDER_NO    VARCHAR2(11) 
BI_USER_ID     VARCHAR2(20) 
 */
public class BuyingInfDTO {
	private String biOrderNo; // 주문번호
	private String biUserId; // 주문한 회원
	
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