package com.milk.dto;
/* 상세페이지를 관리하는 테이블
이름            		 널?       유형             
-------------- -------- -------------- 
PP_NO          NOT NULL NUMBER(3)      
PP_SERIAL_NO            NUMBER(4)      
PP_MAIN_IMAGE  NOT NULL VARCHAR2(1000) 
PP_EMPLOYEE_NO          NUMBER(10)
 */
public class ProductPageDTO {
	private int ppNo; // 페이지번호
	private int ppSerialNo; // 페이지에 등록하는 제품
	private String ppMainImage; // 페이지 섬네일 이미지
	private int ppEmployeeNo; // 페이지를 등록, 최종수정한 직원
	
	public int getPpNo() {
		return ppNo;
	}
	public void setPpNo(int ppNo) {
		this.ppNo = ppNo;
	}
	public int getPpSerialNo() {
		return ppSerialNo;
	}
	public void setPpSerialNo(int ppSerialNo) {
		this.ppSerialNo = ppSerialNo;
	}
	public String getPpMainImage() {
		return ppMainImage;
	}
	public void setPpMainImage(String ppMainImage) {
		this.ppMainImage = ppMainImage;
	}
	public int getPpEmployeeNo() {
		return ppEmployeeNo;
	}
	public void setPpEmployeeNo(int ppEmployeeNo) {
		this.ppEmployeeNo = ppEmployeeNo;
	}
}