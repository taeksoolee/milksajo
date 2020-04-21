<%@page import="com.milk.dto.CartDTO"%>
<%@page import="com.milk.dao.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/login_check.jspf" %>
<%-- 장바구니페이지에서 삭제하고 싶은 제품의 시리얼넘버를 전달받고 삭제시키는 문서 --%>
<%
	//현재 uri를 저장
	String uri = (String)session.getAttribute("uri");	

	//시리얼넘버 저장
	int serialNum = Integer.parseInt(request.getParameter("serialNum"));
	//아이디 저장
	String id = loginMember.getId();
	//System.out.println("serialNum="+serialNum);
	//System.out.println("id="+id);
	
	CartDTO cart = new CartDTO();
	cart.setCaSerialNo(serialNum);
	cart.setCaUserId(id);
	
	CartDAO.getDAO().deleteCart(cart);
	
	
	//shop 페이지로 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?"+uri+"';");
	out.println("</script>");
	

%>