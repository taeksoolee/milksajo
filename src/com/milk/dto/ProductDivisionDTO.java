package com.milk.dto;
/*
이름          		널?       유형           
----------- -------- ------------ 
PD_DIVISION NOT NULL VARCHAR2(10) 
PD_FEATURE           VARCHAR2(30)
PD_STDSIZE  NOT NULL VARCHAR2(5)  
 */
public class ProductDivisionDTO {
	private String pdDivision; // 제품구분
	private String pdFeature; // 제품특징
	private String pdStdsize; // 제품 표준 규격
	
	public String getPdDivision() {
		return pdDivision;
	}
	public void setPdDivision(String pdDivision) {
		this.pdDivision = pdDivision;
	}
	public String getPdFeature() {
		return pdFeature;
	}
	public void setPdFeature(String pdFeature) {
		this.pdFeature = pdFeature;
	}
	public String getPdStdsize() {
		return pdStdsize;
	}
	public void setPdStdsize(String pdStdsize) {
		this.pdStdsize = pdStdsize;
	}
}