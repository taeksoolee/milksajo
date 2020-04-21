<%@page import="site.itwill.dao.Shop_productDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="site.itwill.dao.Shop_orderDAO"%>
<%@page import="site.itwill.dto.Shop_orderDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/login_check.jspf" %>

<%
	//입력값에 대한 캐릭터셋 변경
	request.setCharacterEncoding("utf-8");

	//회원 번호를 전달받아 order테이블에서 해당행을 검색해 반환하는 DAO클래스의 메소드
	List<Shop_orderDTO> orderList = Shop_orderDAO.getDAO().selectUserShop_order(loginMember.getUser_num());

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>살림살이</title>
<%-- head 태그 영역 내 공통 인클루드 --%>
<jsp:include page="../include/innerHeadTag.jsp"/>
<link rel="stylesheet" href="mypage.css">
</head>
<body id="mypage">
	<%-- header 인클루드 --%>
	<div id="header">
		<jsp:include page="../include/header.jsp"/>
	</div>
	
	<%-- 본문 내용 --%>
	<!-- 마이페이지 내용 부분 -->
	<div id="wrap">
		<div class="container">
			<div class="order_list">
				<span>주문 내역</span>
				
				<%if(orderList.isEmpty()){ %>
					<div class="emtyMsg">주문 내역이 없습니다.</div>
				<%} else{ %>
					<div class="infoHead">
						<span class="name">상품정보</span>
						<span class="qty">금액</span>
						<span class="price">상태</span>
					</div>
					
					<%for(Shop_orderDTO order:orderList){ %>
						<div class="infoBox">
							<div class="name">
								<a href="<%=request.getContextPath() %>/store/store_detail.jsp?productNum=<%=order.getProduct_num()%>">
									<img src="/semi/images/storeImages/<%=Shop_productDAO.getDAO().selectNumShop_product(order.getProduct_num()).getProduct_img()%>" alt="상품 이미지" />
									<%=Shop_productDAO.getDAO().selectNumShop_product(order.getProduct_num()).getProduct_name() %>
								</a>
							</div>
							<div class="qty"><%=DecimalFormat.getInstance().format(order.getOrder_price()) %>원</div>
							<div class="price"><%=order.getOrder_state() %></div>
						</div>
					<%} %>
				<%} %>
				
			</div>
			<div class="user_info">
				<span>회원 정보</span>
				<form action="<%=request.getContextPath()%>/action/member_update_action.jsp" method="post" name="updateForm" id="updateForm">
					<div>
						<ul>
							<li>
								<span>이메일</span>
								<input type="email" name="user_email" id="user_email" class="inputDesign" value="<%=loginMember.getUser_email() %>" readonly>
							</li>
							<li>
								<span>이름</span>
								<input type="text" name="user_name" id="user_name" class="inputDesign" value="<%=loginMember.getUser_name() %>" placeholder="이름 입력">
								<p id="nameMsg" class="errMsg">*이름을 입력해 주세요.</p>
							</li>
							<li>
								<span>생년월일</span>
								<div class="birthdayBox">
									<select name="user_year" id="year">
										<option selected="selected" value="<%=loginMember.getUser_birth().substring(0, 4)%>"><%=loginMember.getUser_birth().substring(0, 4)%></option>
									</select>
								</div>
								
								<div class="birthdayBox">
									<select name="user_month" id="month">
										<option selected="selected" value=<%=loginMember.getUser_birth().substring(5, 7) %>><%=loginMember.getUser_birth().substring(5, 7) %></option>
									</select>
								</div>
								
								<div class="birthdayBox">	
									<select name="user_date" id="date">
										<option selected="selected" value="<%=loginMember.getUser_birth().substring(8)%>"><%=loginMember.getUser_birth().substring(8) %></option>
									</select>
								</div>
								<p id="birthMsg" class="errMsg">*생년월일을 입력해주세요.</p>
							</li>
							<li>
								<span>전화번호</span>
								<input type="tel" name="user_tel" id="user_tel" class="inputDesign" maxlength="10" value="<%=loginMember.getUser_tel() %>" placeholder=" - 을 제외한 전화번호 입력">
								<p id="telMsg" class="errMsg">*전화번호를 형식에 맞게 입력해주세요.</p>
							</li>
							<li>
								<span>우편번호</span>
								<input type="text" name="user_post" id="user_post" class="inputDesign" value="<%=loginMember.getUser_post() %>" placeholder="우편번호">
								<button type="button" id="searchBtn" class="postSearchBtn">우편번호 검색</button>
							</li>
							<li>
								<span>주소</span>
								<input type="text" id="user_add1" name="user_add1" class="inputDesign" value="<%=loginMember.getUser_add1() %>" placeholder="기본 주소 입력">
								<input type="text" id="user_add2" name="user_add2" class="inputDesign" value="<%=loginMember.getUser_add2() %>" placeholder="상세 주소 입력">
								<p id="addMsg" class="errMsg">*주소를 입력해주세요.</p>
							</li>
						</ul>
						<ul class="info_save">
							<li>
								<a href="mypage_pw.jsp">비밀번호 변경하기</a>
								<a href="mypage_withdrawal.jsp">탈퇴하기</a>
							</li>
							<li>
								<button id="saveBtn">변경사항 저장하기</button>
							</li>
						</ul>
					</div>
				</form>
			</div>
		</div>
	</div><!-- wrap end -->
	
	
	
	<%-- footer 인클루드 --%>
	<div id="footer">
		<jsp:include page="../include/footer.jsp"/>
	</div>

	<!-- 우편번호 js -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- join 페이지  js 파일 -->
	<script src="<%=request.getContextPath() %>/js/join.js"></script>
</body>
</html>