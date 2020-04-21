package com.milk.dto;
/*
이름        널?       유형             
--------- -------- -------------- 
1.NUM       NOT NULL NUMBER(4)       - 게시글번호      
2.ID                 VARCHAR2(20)    - 작성자(아이디)
3.WRITER             VARCHAR2(50)    - 작성자(이름)
4.SUBJECT            VARCHAR2(500)   - 제목
5.REG_DATE           DATE            - 작성날짜 
6.READCOUNT          NUMBER(4)       - 조회수 
7.REF                NUMBER(4)       - 게시글 그룹
8.RE_STEP            NUMBER(4)       - 게시글 순서
9.CONTENT            VARCHAR2(4000)  - 내용 
10.IP                 VARCHAR2(20)   - 클라이언트 IP 주소
11.STATE             NUMBER(1)       - 게시글 상태 : 0(일반글),1(비밀글),3(리뷰글),8(비활성/안보이게함), 9(삭제글)     
12.QNA				 NUMBER(1)       - 게시글 문의 종류 : 1(배송관련), 2(상품관련),3(기타)

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
	
	
