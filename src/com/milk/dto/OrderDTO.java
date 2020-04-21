package com.milk.dto;
/* ���ſ� ���õ� ���������̺� ���� dto */
/* buying_record
	�̸�           ��?       ����           
------------ -------- ------------ 
BR_ORDER_NO  NOT NULL VARCHAR2(11) 
BR_SERIAL_NO          NUMBER(4)    
BR_AMOUNT    NOT NULL NUMBER(3)    
BR_DEPOSIT            NUMBER(10)   
BR_REFUND             NUMBER(10)   
BR_STATE     NOT NULL NUMBER(1)  
 */

/* buying_inf
	�̸�          ��? ����           
----------- -- ------------ 
BI_ORDER_NO    VARCHAR2(11) 
BI_USER_ID     VARCHAR2(20) 
 */
public class OrderDTO {
	private String orderNo; // �ֹ���ȣ
	private int serialNo; // �ֹ���ǰ
	private int amount; // �ֹ�����
	private int price; // �ֹ��� �ش� �ݾ�
	private int deposit; // �Աݵȱݾ�
	private int refund; // ȯ�ҵȱݾ�
	private int state; // �ֹ� ����  (0: �ֹ�  | 1: �ԱݿϷ� | 2: ��ۿϷ� )
	private String userId; // �ֹ��� ȸ��
	
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public int getSerialNo() {
		return serialNo;
	}
	public void setSerialNo(int serialNo) {
		this.serialNo = serialNo;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getDeposit() {
		return deposit;
	}
	public void setDeposit(int deposit) {
		this.deposit = deposit;
	}
	public int getRefund() {
		return refund;
	}
	public void setRefund(int refund) {
		this.refund = refund;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
}