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
		<h2>회원탈퇴</h2>
		<form action="<%=request.getContextPath()%>/action/member_remove_action.jsp" method="post" name="removeForm" id="removeForm">
			<div id="inputRow">
				<p>비밀번호</p>
				<input type="password" name="user_pw" id="user_pw" placeholder="현재 비밀번호 입력"/>
				<p id="pwMsg" class="errMsg">*비밀번호를 입력해주세요.</p>
				<p class="checkMsg"><%=message %></p>
			</div>
			<p class="mypageMsg">탈퇴가 완료된 계정은 다시 복구할 수 없습니다.<br>탈퇴하시겠습니까?</p>
			<div id="inputRow">
				<button type="submit" class="changeBtn"> 탈퇴하기</button>
			</div>
		</form>
	</div>
	
	<%-- footer 인클루드 --%>
	<div id="footer">
		<jsp:include page="../include/footer.jsp"/>
	</div>
</body>
</html>