<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 로그인 회원정보를 클라이언트에게 전달하는 JSP 문서 --%>
<%-- => 비로그인 상태에서 요청(비정상적인 요청)한 경우 에러페이지(error400)로 이동 --%>
<%-- [회원정보변경]을 클릭한 경우 회원정보 변경을 위한 비밀번호 입력페이지(modify_confirm.jsp)로 이동(포함) --%>
<%-- [회원탈퇴]를 클릭한 경우 회원정보 삭제를 위한 비밀번호 입력페이지(remove_confirm.jsp)로 이동(포함) --%>
<style type="text/css">

h2 {
	margin-left: 42%;
    border-left: 5px solid black;
    margin-top: 5%;
	
}

#detail {
	margin-top: 25%;
	width: 400px;
	margin: 0 auto;
	text-align: left;
	border-top: 1px solid black;
    border-bottom: 1px solid black;
}

#detail ul li {
	margin-top: 12px;
	font-size: 1.08em;
	list-style-type: none;
}

#mypage {
	padding-top: 30px;
	padding-bottom: 78px;
	margin-left: 41%;
	font-size: 1.2em;	
	bo
}

#mypagehead {
	margin-bottom: 36px;
}

#mypage a:hover {
	color: pink;
}

</style>
<%@include file="/security/login_check.jspf" %>
<div id="mypagehead">
	<h2>&nbsp;&nbsp;MY PAGE</h2>
</div>
<hr>
<div id="detail">
	<ul>
		<li><span style="font-weight: bold;">아이디</span> <%=loginMember.getId() %></li>
		<li><span style="font-weight: bold;">이름</span> <%=loginMember.getName() %></li>
		<li><span style="font-weight: bold;">생일</span> <%=loginMember.getBirthday().substring(0, 10) %></li>
		<li><span style="font-weight: bold;">전화번호</span> <%=loginMember.getPhone() %></li>
		<li><span style="font-weight: bold;">이메일</span> <%=loginMember.getEmail() %></li>
		<li><span style="font-weight: bold;">우편번호</span> <%=loginMember.getZipcode() %></li>
		<li><span style="font-weight: bold;">주소</span> <%=loginMember.getAddress1() %></li>
		<li><span style="font-weight: bold;">상세주소</span> <%=loginMember.getAddress2() %></li>
		<li><span style="font-weight: bold;">회원가입일</span> <%=loginMember.getJoinDate().substring(0, 19) %></li>
		<li><span style="font-weight: bold;">마지막 로그인</span> <%=loginMember.getLastLogin().substring(0, 19) %></li>
	</ul>
</div>

<div id="mypage">
	<a href="<%=request.getContextPath() %>/index.jsp?workgroup=member&work=modify_confirm">[회원정보수정]</a>&nbsp;&nbsp;
	<a href="<%=request.getContextPath() %>/index.jsp?workgroup=member&work=order_history">[주문내역보기]</a>&nbsp;&nbsp;
	<a href="<%=request.getContextPath() %>/index.jsp?workgroup=member&work=remove_confirm">[회원탈퇴ㅠㅠ]</a>&nbsp;&nbsp;
</div>