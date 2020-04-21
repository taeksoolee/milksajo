<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 회원탈퇴를 위한 비밀번호를 입력하는 JSP 문서 --%>
<%-- => 비로그인 상태에서 요청(비정상적인 요청)한 경우 에러페이지(error400)로 이동 --%>
<%-- => [입력완료] 버튼을 클릭한 경우 회원탈퇴 처리페이지(member_remove_action.jsp)를 요청하여 입력값 전달 --%>
<%@include file="/security/login_check.jspf" %>
<%
	String message=(String)session.getAttribute("messagePasswd");
	if(message==null) {
		message="";
	} else {
		session.removeAttribute("messagePasswd");
	}
%>

<style type="text/css">
#passwordForm {
	margin-left: 43%;
    margin-top: 16.5%;
    margin-bottom: 14%;
    }
    
</style>

<form id="passwordForm" name="passwordForm" action="<%=request.getContextPath() %>/index.jsp?workgroup=member&work=member_remove_action" method="post" onsubmit="return sumbitCheck();">
	<p>비밀번호를 입력하면 돌이킬 수 없습니다.</p>
	<p>
		<input type="password" name="password"/>
		<button type="submit">입력완료</button>
	</p>
	<p id="messagePasswd" style="color: red;"><%=message %></p>
</form>
<script type="text/javascript">

function sumbitCheck() {
	if(passwordForm.password.value=="") {
		document.getElementById("messagePasswd").innerHTML="비밀번호를 입력해주세요.";
		passwordForm.password.focus();		
		return false;
	}
	return true;
}

</script>