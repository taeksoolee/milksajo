package com.milk.dto;


// product, product_page join
public class JoinProductPageDTO {
	private int ppNo; // ��������ȣ
	private int ppSerialNo; // �������� ����ϴ� ��ǰ
	private String pName; // ��ǰ�̸�
	private String pPrice; // ��ǰ����
	private String ppMainImage; // ������ ������ �̹���
	private int ppEmployeeNo; // �������� ���, ���������� ����
	
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
