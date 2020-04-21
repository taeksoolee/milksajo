package com.milk.dto;
// ȸ���� ���� �ֹ��� ����
/*
	�̸�           ��?       ����           
------------ -------- ------------ 
BR_ORDER_NO  NOT NULL VARCHAR2(11) 
BR_SERIAL_NO          NUMBER(4)    
BR_AMOUNT    NOT NULL NUMBER(3)    
BR_DEPOSIT            NUMBER(10)   
BR_REFUND             NUMBER(10)   
BR_STATE     NOT NULL NUMBER(1)  
 */
public class BuyingRecordDTO {
	private String brOrderNo; // �ֹ���ȣ
	private int brSerialNo; // �ֹ���ǰ
	private int brAmount; // �ֹ�����
	private int brDeposit; // �Աݵȱݾ�
	private int brRefund; // ȯ�ҵȱݾ�
	private int brState; // �ֹ� ����  (0: �ֹ�  | 1: �ԱݿϷ� | 2: ��ۿϷ� )
	
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