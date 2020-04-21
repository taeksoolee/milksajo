<%-- 에러메세지(400)를 클라이언트에게 전달하는 JSP 문서 --%>    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h3>비정상적인 방법으로 페이지를 요청하였습니다. 
정상적인 방법으로 요청해 주세요.</h3>
<p><a href="<%=request.getContextPath() %>/index.jsp?workgroup=home&work=home">메인으로</a></p>