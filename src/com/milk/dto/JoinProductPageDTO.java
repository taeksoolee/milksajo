package com.milk.dto;


// product, product_page join
public class JoinProductPageDTO {
	private int ppNo; // 페이지번호
	private int ppSerialNo; // 페이지에 등록하는 제품
	private String pName; // 제품이름
	private String pPrice; // 제품가격
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
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpPrice() {
		return pPrice;
	}
	public void setpPrice(String pPrice) {
		this.pPrice = pPrice;
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
