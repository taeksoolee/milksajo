package com.milk.dto;
/*
이름            		널?       유형            
------------- -------- ------------- 
C_CREATED              DATE          
C_STATE       NOT NULL NUMBER(1)     
C_EMPLOYEE_NO          NUMBER(10)    
C_BD_NO                NUMBER(4)     
C_COMMENT              VARCHAR2(200) 
 */
public class CommentsDTO {
	private String cCreated; // 답변날짜 
	private int cState; // 게시상태 (0: 중지, 1: 게시)
	private int cEmployeeNo; // 답변직원
	private int cBdNo; // 답변 게시판 번호
	private int cComment; // 답변내용
	
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