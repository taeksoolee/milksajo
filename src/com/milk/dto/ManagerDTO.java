package com.milk.dto;
/*
�̸�            		��?       ����           
------------- -------- ------------ 
M_EMPLOYEE_NO NOT NULL NUMBER(10)   
M_PASSWORD    NOT NULL VARCHAR2(30) 
M_NAME        NOT NULL VARCHAR2(10) 
M_GRADE       NOT NULL NUMBER(1)  
 */
public class ManagerDTO {
	private int mEmployeeNo; // �����ȣ
	private String mPassword; // �����й�ȣ
	private String mName; // ����̸�
	private int mGrade; // ������
	
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
