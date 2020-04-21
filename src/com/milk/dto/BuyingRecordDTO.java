package com.milk.dto;
// 회원을 통해 주문된 내역
/*
	이름           널?       유형           
------------ -------- ------------ 
BR_ORDER_NO  NOT NULL VARCHAR2(11) 
BR_SERIAL_NO          NUMBER(4)    
BR_AMOUNT    NOT NULL NUMBER(3)    
BR_DEPOSIT            NUMBER(10)   
BR_REFUND             NUMBER(10)   
BR_STATE     NOT NULL NUMBER(1)  
 */
public class BuyingRecordDTO {
	private String brOrderNo; // 주문번호
	private int brSerialNo; // 주문제품
	private int brAmount; // 주문수량
	private int brDeposit; // 입금된금액
	private int brRefund; // 환불된금액
	private int brState; // 주문 상태  (0: 주문  | 1: 입금완료 | 2: 배송완료 )
	
	public String getBrOrderNo() {
		return brOrderNo;
	}
	public void setBrOrderNo(String brOrderNo) {
		this.brOrderNo = brOrderNo;
	}
	public int getBrSerialNo() {
		return brSerialNo;
	}
	public void setBrSerialNo(int brSerialNo) {
		this.brSerialNo = brSerialNo;
	}
	public int getBrAmount() {
		return brAmount;
	}
	public void setBrAmount(int brAmount) {
		this.brAmount = brAmount;
	}
	public int getBrDeposit() {
		return brDeposit;
	}
	public void setBrDeposit(int brDeposit) {
		this.brDeposit = brDeposit;
	}
	public int getBrRefund() {
		return brRefund;
	}
	public void setBrRefund(int brRefund) {
		this.brRefund = brRefund;
	}
	public int getBrState() {
		return brState;
	}
	public void setBrState(int brState) {
		this.brState = brState;
	}
}