package com.milk.dto;
/* 구매에 관련된 조인한테이블에 관한 dto */
/* buying_record
	이름           널?       유형           
------------ -------- ------------ 
BR_ORDER_NO  NOT NULL VARCHAR2(11) 
BR_SERIAL_NO          NUMBER(4)    
BR_AMOUNT    NOT NULL NUMBER(3)    
BR_DEPOSIT            NUMBER(10)   
BR_REFUND             NUMBER(10)   
BR_STATE     NOT NULL NUMBER(1)  
 */

/* buying_inf
	이름          널? 유형           
----------- -- ------------ 
BI_ORDER_NO    VARCHAR2(11) 
BI_USER_ID     VARCHAR2(20) 
 */
public class OrderDTO {
	private String orderNo; // 주문번호
	private int serialNo; // 주문제품
	private int amount; // 주문수량
	private int price; // 주문에 해당 금액
	private int deposit; // 입금된금액
	private int refund; // 환불된금액
	private int state; // 주문 상태  (0: 주문  | 1: 입금완료 | 2: 배송완료 )
	private String userId; // 주문한 회원
	
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