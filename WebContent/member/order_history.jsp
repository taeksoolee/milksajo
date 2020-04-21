<%@page import="com.milk.dto.MemberOrderDTO"%>
<%@page import="com.milk.dao.MemberDAO"%>
<%@page import="com.milk.dto.MemberDTO"%>
<%@page import="com.milk.dao.OrderDAO"%>
<%@page import="com.milk.dto.OrderDTO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.milk.dao.ProductDAO"%>
<%@page import="com.milk.dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/login_check.jspf" %>
 <% 
	//현재 uri를 저장
	session.setAttribute("uri", request.getQueryString());
 	
 	
 	MemberDTO member=(MemberDTO)session.getAttribute("loginMember");
 	
 	
 	String id=member.getId();
 	List<MemberOrderDTO> orderList=OrderDAO.getDAO().selectMemberIdOrder(id);
 %>
	<div class="container" style="padding: 60px; color: #808080;">
		<div class="header" style="margin: 20px; padding: 10px; font-size: 20px; padding-bottom: 40px;">주문 내역</div>
		<div>
		<%if(orderList.size() == 0){ %>
			<div class="emtyMsg" style="font-size: 15px; padding: 20px;">주문 내역이 없습니다.</div>
		<%} else{ %>
			<div class="row" >
				<span class="col-2 orderNo" style="text-align: center; padding-bottom: 10px;">주문번호</span>
				<span class="col-2 pname" style="text-align: center; padding-bottom: 10px;">상품</span>
				<span class="col-2 pname" style="text-align: center; padding-bottom: 10px;">상품명</span>
				<span class="col-2 amount" style="text-align: center; padding-bottom: 10px;">주문 수량</span>
				<span class="col-2 price" style="text-align: center; padding-bottom: 10px;">가격</span>
				<span class="col-2 state" style="text-align: center; padding-bottom: 10px; padding-right: 60px;">주문 상황</span>
			</div>
			<%int status = 0;%>
			<%for(MemberOrderDTO order: orderList){ %>
				<div class="infoBox" style="border: 1px solid rgba(0,0,0,.125);">
					<div class="row" style="text-align: center; padding: 15px;">
						<div class=" orderNo col-2" style="padding-top: 30px; text-align: center"><%=order.getOrderNo() %></div>
						<div class="images col-2" ><img src="images/<%=order.getImage() %>.jpg" style="width: 60px; height:80px; padding: 5px; margin: 5px;" ></div>
						<div class="pname col-2" style="text-align: center;  padding-top: 30px;"><%=order.getProduct()%></div>
						<div class="state col-2" style="text-align: center; padding-top: 30px;"><%=order.getAmount() %></div>
						<div class="qty col-2" style="text-align: center; padding-top: 30px;"><%=DecimalFormat.getInstance().format(order.getPrice()) %>원</div>
						<% status = order.getState(); %>
						<% if(status==0) { %>
							<div class="col-2 state" style="text-align: center; padding-top: 30px;">주문 확인중</div>
						<% } else if (status==1){%>
							<div class="col-2 state" style="text-align: center; padding-top: 30px;">입금 완료</div>
						<% } else if(status==2) {%>
							<div class="col-2 state" style="text-align: center; padding-top: 30px;">배송 중</div>
						<% } %>
						
					</div>
				</div>
			<%} %>
		<%} %>
		</div>
		<div class="row" style="padding: 10px; padding-left: 20px;">
			<div style="padding: 5px;"><a href="<%=request.getContextPath() %>/index.jsp?workgroup=member&work=member_detail">[MY PAGE]</a></div>
			<div style="padding: 5px;"><a href="<%=request.getContextPath() %>/index.jsp?workgroup=home&work=home">[HOME]</a></div>
		</div>
	</div>
<div>