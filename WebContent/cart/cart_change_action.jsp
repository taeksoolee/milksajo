<%@page import="com.milk.dao.CartDAO"%>
<%@page import="com.milk.dto.CartDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 장바구니에 선택한 제품을 등록하고 출력페이지 이동 --%>
<%
	System.out.println("...");
%>
<%@include file="/security/login_check.jspf" %>
<%
	
	//현재 uri를 저장
	String uri = (String)session.getAttribute("uri");
	//전달값을 반환받아 저장
	int amount = Integer.parseInt(request.getParameter("amount"));
	int serialNum = Integer.parseInt(request.getParameter("serialNum"));
	//System.out.println("amount="+amount);
	//System.out.println("serialNum="+serialNum);
	
	//CART 테이블에 update
 	CartDTO cart = new CartDTO();
	cart.setCaAmount(amount);
	cart.setCaUserId(loginMember.getId());
	cart.setCaSerialNo(serialNum);
	
	CartDAO.getDAO().updateCart(cart);
	 
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?"+uri+"';");
	out.println("</script>");
	
%>