<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// id or pwd
	String inf = request.getParameter("inf");
	// error : 실패 / id 성공 : id / pwd 성공 : complete(메일발송) 
	String msg = request.getParameter("msg");
%>

<style>
.search-div{
    margin: 100px 30%;
    margin-bottom: 50px;
    padding: 107px;
    padding-bottom: 0px;
    border: 1px solid #e5e5e5;
    border-radius: 10px;
    height: 470px;
}

h1 {
	margin-top: -11%;
    border-left: 4px solid;
    font-size: 2.3rem;
}

h2 {
	margin-top: 13%;
	margin-bottom: 10%;
	text-align: center;
	font-size: 1.7rem;
}

#aBtn {
	font-size: 1.2em;
	margin-left: 42%;
}

#aBtn1 {margin-left: 33%; font-size: 1.2em;}

#aBtn2 {margin-left: 5%; font-size: 1.2em;}



</style>

<div class="search-div">
	<%if(inf.equals("id")){ %>
		<%if(msg.equals("error")) { %>
			<h1>&nbsp;아이디 찾기</h1>
			<hr>
			<h2>이름과 생년월일이 일치하지 않습니다. <br> 다시 입력해주세요.</h2>
			<a id="aBtn" href="index.jsp?workgroup=member&work=search_login&inf=id">다시 입력하기</a>
		<% } else { %>
			<h1>&nbsp;축하합니다! 아이디를 찾았습니다!</h1>
			<hr>
			<h2>당신의 아이디는 <%=msg %>입니다. </h2>
			<a id="aBtn1" href="index.jsp?workgroup=home&work=home">홈으로</a>
			<a id="aBtn2" href="index.jsp?workgroup=member&work=search_login&inf=pwd">비밀번호 찾기</a>			
		<% } %>
	<%}else if(inf.equals("pwd")){ %>	
		<%if(msg.equals("error")) { %>
			<h1>&nbsp;비밀번호 찾기</h1>
			<hr>
			<h2>입력하신 아이디와 이메일이 일치하지 않습니다. <br> 다시 입력해주세요.</h2>
			<a id="aBtn" href="index.jsp?workgroup=member&work=search_login&inf=pwd">다시 입력하기</a>
		<% } else { %>
			<h1>&nbsp;비밀번호 찾기</h1>
			<hr>
			<h2>이메일로 새로운 비밀번호를 전송했습니다. 비밀번호는 반드시 바꿔서 사용해주시기 바랍니다. </h2>
			<a id="aBtn" href="index.jsp?workgroup=home&work=home">홈으로</a>
		<% } %>
	<%} %>
</div>


