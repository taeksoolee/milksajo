package com.milk.dto;
/*
�̸�          		��?       ����           
----------- -------- ------------ 
PD_DIVISION NOT NULL VARCHAR2(10) 
PD_FEATURE           VARCHAR2(30)
PD_STDSIZE  NOT NULL VARCHAR2(5)  
 */
public class ProductDivisionDTO {
	private String pdDivision; // ��ǰ����
	private String pdFeature; // ��ǰƯ¡
	private String pdStdsize; // ��ǰ ǥ�� �԰�
	
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