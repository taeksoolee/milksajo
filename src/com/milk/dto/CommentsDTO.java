package com.milk.dto;
/*
�̸�            		��?       ����            
------------- -------- ------------- 
C_CREATED              DATE          
C_STATE       NOT NULL NUMBER(1)     
C_EMPLOYEE_NO          NUMBER(10)    
C_BD_NO                NUMBER(4)     
C_COMMENT              VARCHAR2(200) 
 */
public class CommentsDTO {
	private String cCreated; // �亯��¥ 
	private int cState; // �Խû��� (0: ����, 1: �Խ�)
	private int cEmployeeNo; // �亯����
	private int cBdNo; // �亯 �Խ��� ��ȣ
	private int cComment; // �亯����
	
	public String getcCreated() {
		return cCreated;
	}
	public void setcCreated(String cCreated) {
		this.cCreated = cCreated;
	}
	public int getcState() {
		return cState;
	}
	public void setcState(int cState) {
		this.cState = cState;
	}
	public int getcEmployeeNo() {
		return cEmployeeNo;
	}
	public void setcEmployeeNo(int cEmployeeNo) {
		this.cEmployeeNo = cEmployeeNo;
	}
	public int getcBdNo() {
		return cBdNo;
	}
	public void setcBdNo(int cBdNo) {
		this.cBdNo = cBdNo;
	}
	public int getcComment() {
		return cComment;
	}
	public void setcComment(int cComment) {
		this.cComment = cComment;
	}
}