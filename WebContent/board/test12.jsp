<%@page import="com.milk.dao.BoardDAO"%>
<%@page import="com.milk.dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	for(int i=1;i<=100;i++) {
		BoardDTO board=new BoardDTO();
		int num=BoardDAO.getDAO().selectNextNum();
		board.setNum(num);
		board.setId("cow190");
		board.setWriter("아빠소");
		board.setSubject("테스트입니다.");
		board.setRef(num);
		board.setContent("보이니");
		board.setIp("127.0.0.1");
		board.setQna("배송 관련 문의");
		
		BoardDAO.getDAO().insertBoarder(board);
		
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<h1>20개의 테스트 게시글을 저장 하였습니다.</h1>
</body>
</html>