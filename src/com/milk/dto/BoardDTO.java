package com.milk.dto;
/*
�̸�        ��?       ����             
--------- -------- -------------- 
1.NUM       NOT NULL NUMBER(4)       - �Խñ۹�ȣ      
2.ID                 VARCHAR2(20)    - �ۼ���(���̵�)
3.WRITER             VARCHAR2(50)    - �ۼ���(�̸�)
4.SUBJECT            VARCHAR2(500)   - ����
5.REG_DATE           DATE            - �ۼ���¥ 
6.READCOUNT          NUMBER(4)       - ��ȸ�� 
7.REF                NUMBER(4)       - �Խñ� �׷�
8.RE_STEP            NUMBER(4)       - �Խñ� ����
9.CONTENT            VARCHAR2(4000)  - ���� 
10.IP                 VARCHAR2(20)   - Ŭ���̾�Ʈ IP �ּ�
11.STATE             NUMBER(1)       - �Խñ� ���� : 0(�Ϲݱ�),1(��б�),3(�����),8(��Ȱ��/�Ⱥ��̰���), 9(������)     
12.QNA				 NUMBER(1)       - �Խñ� ���� ���� : 1(��۰���), 2(��ǰ����),3(��Ÿ)

*/

public class BoardDTO {

	private int num;
	private String id;
	private String writer;
	private String subject;
	private String regDate;
	private int readCount;
	private int ref;
	private int reStep;
	private String content;
	private String ip;
	private int state;
	private	String qna;
	private int serial;
	

	public BoardDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getReStep() {
		return reStep;
	}

	public void setReStep(int reStep) {
		this.reStep = reStep;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}
	
	public String getQna() {
		return qna;
	}
	
	public void setQna(String qna) {
		this.qna = qna;
	}

	public int getSerial() {
		return serial;
	}

	public void setSerial(int serial) {
		this.serial = serial;
	}
	
	
}
	
	
