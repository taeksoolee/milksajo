package com.milk.dto;
/* ���������� �����ϴ� ���̺�
�̸�            		 ��?       ����             
-------------- -------- -------------- 
PP_NO          NOT NULL NUMBER(3)      
PP_SERIAL_NO            NUMBER(4)      
PP_MAIN_IMAGE  NOT NULL VARCHAR2(1000) 
PP_EMPLOYEE_NO          NUMBER(10)
 */
public class ProductPageDTO {
	private int ppNo; // ��������ȣ
	private int ppSerialNo; // �������� ����ϴ� ��ǰ
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