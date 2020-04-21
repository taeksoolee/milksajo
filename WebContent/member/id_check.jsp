<%@page import="com.milk.dao.MemberDAO"%>
<%@page import="com.milk.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 회원정보 입력페이지(member_join.jsp)에서 전달된 아이디를 반환받아
MEMBER 테이블에 저장된 아이디와 비교하여 사용가능 여부를 클라이언트에게 전달하는 JSP 문서 --%>
<%-- => 아이디 사용 불가능(중복일 시) : 사용 불가 메세지 전달 - 아이디 재입력 후 재요청 --%>
<%-- => 아이디 사용 가능(미중복일 시) : 사용 가능 메세지 전달 - 부모창의 아이디 입력태그에 입력값 변경 --%>
<%
	//비정상적인 요청에 대한 응답처리
	if(request.getParameter("id")==null){
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
	}

	//입력값을 반환받아 저장
	String id=request.getParameter("id");
	
	//아이디를 전달하여 MEMBER 테이블에 저장된 회원정보를 검색하는 DAO 클래스의 메소드 호출
	// => null 반환 : 회원정보 미검색 - 전달된 아이디 사용 가능
	// => MemberDTO 인스턴스 반환 : 회원정보 검색 - 전달된 아이디 사용 불가
	MemberDTO member=MemberDAO.getDAO().selectIdMember(id);	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 검사</title>
<style type="text/css">
div {
	text-align: center;
	margin: 10px;
}

.id {
	color: red;
}
</style>
</head>
<body>
	<% if(member==null) {//아이디 사용이 가능한 경우 %>
		<div>입력한 <span class="id">[<%= id %>]</span>은(는) 사용 가능한 아이디입니다.<br>&nbsp;</div>
		<div><button type="button" onclick="windowClose();">아이디 사용</button></div>
	<% } else { //아이디 사용이 불가능한 경우%>
		<div id="message">입력한 <span class="id">[<%= id %>]</span>은(는) 이미 사용중입니다.<br>
		다른 아이디를 입력해주세요.</div>
		<%-- form태그의 action 속성이 생략된 경우 현재 JSP 문서를 재요청 --%>
		<%-- form태그의 method 속성이 생략된 경우 GET 방식으로 요청하여 입력값 전달 --%>		
		<div>
		<form name="form" onsubmit="return submitCheck();">
			<input type="text" name="id">
			<button type="submit">확인</button>
		</form>
		</div>
	<% } %>
	
	<script type="text/javascript">
	function windowClose() {
		//opener : 부모창
		opener.joinForm.id.value="<%=id%>";
		opener.joinForm.idCheckResult.value="1";
		window.close();//현재 오픈된 창 닫기
	}
	
	function submitCheck() {
		var id=form.id.value;
		if(id=="") {
			document.getElementById("message").innerHTML="아이디를 입력해주세요.<br>&nbsp;";
			document.getElementById("message").style="color: red;";
			return false;
		}
		
		var idReg=/^[a-zA-Z]\w{5,19}$/g;
		if(!idReg.test(id)) {
			document.getElementById("message").innerHTML="아이디는 영문자로 시작되는 영문자,숫자,_의 6~20범위의 문자로만 작성 가능합니다.";
			document.getElementById("message").style="color: red;";
			return false;
		}
		
		return true;
	}
	</script>
</body>
</html>