package com.milk.dto;

/*
이름         널?       유형            
---------- -------- ------------- 
ID         NOT NULL VARCHAR2(20)  
PASSWORD   NOT NULL VARCHAR2(200) 
NAME       NOT NULL VARCHAR2(50)  
BIRTHDAY            DATE          
PHONE      NOT NULL VARCHAR2(20)  
EMAIL               VARCHAR2(30)  
ZIPCODE    NOT NULL VARCHAR2(20)  
ADDRESS1   NOT NULL VARCHAR2(500) 
ADDRESS2            VARCHAR2(500) 
JOIN_DATE  NOT NULL DATE          
LAST_LOGIN NOT NULL DATE          
STATUS     NOT NULL NUMBER(1)     - 회원상태 : 1(일반회원), 7(관리자), 0(휴면회원), 9(탈퇴회원)  
*/

public class MemberDTO {
	private String id;
	private String password;
	private String name;
	private String birthday;
	private String phone;
	private String email;
	private String zipcode;
	private String address1;
	private String address2;
	private String joinDate;
	private String lastLogin;
	private int status;
	
	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}

	public String getLastLogin() {
		return lastLogin;
	}

	public void setLastLogin(String lastLogin) {
		this.lastLogin = lastLogin;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	
	
}
