<%@page import="com.milk.dto.CartDTO"%>
<%@page import="com.milk.dao.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/login_check.jspf" %>
<%-- 장바구니페이지에서 삭제하고 싶은 제품의 시리얼넘버를 전달받고 삭제시키는 문서 --%>
<%
	String id = loginMember.getId();
	
	CartDAO.getDAO().deleteAllCart(id);
	
	//shop 페이지로 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=product&work=shop';");
	out.println("</script>");
	

%>