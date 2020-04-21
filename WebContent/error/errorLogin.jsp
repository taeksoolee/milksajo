<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style type="text/css">
#loginMsg {
    margin-top: 14%;
    margin-bottom: 17%;
    margin-left: 40%;
}

</style>

<div id="loginMsg">    
<h3>로그인이 필요한 페이지 입니다!</h3>
<p><a href="<%=request.getContextPath() %>/index.jsp?workgroup=home&work=home">메인으로</a></p>
</div>