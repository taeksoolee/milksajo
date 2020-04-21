package com.milk.dto;
/*
이름            		널?       유형           
------------- -------- ------------ 
M_EMPLOYEE_NO NOT NULL NUMBER(10)   
M_PASSWORD    NOT NULL VARCHAR2(30) 
M_NAME        NOT NULL VARCHAR2(10) 
M_GRADE       NOT NULL NUMBER(1)  
 */
public class ManagerDTO {
	private int mEmployeeNo; // 사원번호
	private String mPassword; // 사원비밀번호
	private String mName; // 사원이름
	private int mGrade; // 사원등급
	
	public int getmEmployeeNo() {
		return mEmployeeNo;
	}
	public void setmEmployeeNo(int mEmployeeNo) {
		this.mEmployeeNo = mEmployeeNo;
	}
	public String getmPassword() {
		return mPassword;
	}
	public void setmPassword(String mPassword) {
		this.mPassword = mPassword;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public int getmGrade() {
		return mGrade;
	}
	public void setmGrade(int mGrade) {
		this.mGrade = mGrade;
	}
}
