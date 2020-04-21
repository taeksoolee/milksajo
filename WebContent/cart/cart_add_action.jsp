<%@page import="com.milk.dto.CartDTO"%>
<%@page import="com.milk.dao.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 장바구니에 선택한 제품을 등록하고 출력페이지(cart_list.jsp) 이동 --%>
<%@include file="/security/login_check.jspf" %>
<%
	//현재 uri를 저장
	String uri = (String)session.getAttribute("uri");
	
	//전달값을 반환받아 저장
	int serialNum = Integer.parseInt(request.getParameter("serialNum"));
	int amount = Integer.parseInt(request.getParameter("amount"));
	
	//CART 테이블에 insert
 	CartDTO cart = new CartDTO();
	cart.setCaUserId(loginMember.getId());
	cart.setCaAmount(amount); 
	cart.setCaSerialNo(serialNum);
	
	CartDAO.getDAO().insertCart(cart);
	
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?"+uri+"';");
	out.println("</script>");
%>