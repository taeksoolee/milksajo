<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/login_check.jspf" %>

<%
	request.setCharacterEncoding("utf-8");

	String message = (String)session.getAttribute("message");
	
	if(message==null){
		message="";
	}else{
		session.removeAttribute("message");
	}

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>살림살이</title>
<%-- head 태그 영역 내 공통 인클루드 --%>
<jsp:include page="../include/innerHeadTag.jsp"/>
<link rel="stylesheet" href="mypage.css">
</head>
<body id="mypage_pw">
	<%-- header 인클루드 --%>
	<div id="header">
		<jsp:include page="../include/header.jsp"/>
	</div>
	
	
	<%-- 본문 내용 --%>
	<div id="wrapper">
		<h2>비밀번호 변경</h2>
		<form action="<%=request.getContextPath()%>/action/member_pw_update_action.jsp" method="post" name="pwForm" id="pwForm">
			<div id="inputRow">
				<p>현재 비밀번호</p>
				<input type="password" name="user_pw" id="user_pw" placeholder="현재 비밀번호 입력"/>
				<p id="pwMsg" class="errMsg">*현재 비밀번호를 입력해주세요.</p>
				<p class="checkMsg"><%=message %></p>
			</div>
			
			<div id="inputRow">
				<p>새 비밀번호</p>
				<input type="password" name="new_user_pw" id="new_user_pw" placeholder="영문/숫자/특수문자 조합, 6~20자"/>
				<p id="newPwMsg" class="errMsg">*비밀번호를 형식에 맞게 입력해주세요.</p>
				<p class="checkMsg"></p>
			</div>
			
			<div id="inputRow">
				<p>새 비밀번호 확인</p>
				<input type="password" name="new_user_pw_confirm" id="new_user_pw_confirm" placeholder="영문/숫자/특수문자 조합, 6~20자"/>
				<p id="newPwConfirmMsg" class="errMsg">*비밀번호가 일치하지 않습니다.</p>
				<p class="checkMsg"></p>
			</div>
			
			<div id="inputRow">
				<button type="submit" class="changeBtn">변경하기</button>
			</div>
		</form>
	</div>
	
	
	
	<%-- footer 인클루드 --%>
	<div id="footer">
		<jsp:include page="../include/footer.jsp"/>
	</div>
	
	<script src="../js/login.js"></script>
</body>
</html>