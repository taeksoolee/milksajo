<%@page import="java.text.DecimalFormat"%>
<%@page import="com.milk.dto.MemberOrderDTO"%>
<%@page import="com.milk.dto.BuyingRecordDTO"%>
<%@page import="com.milk.dao.OrderDAO"%>
<%@page import="com.milk.dao.CartDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.milk.dto.CartDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/login_check.jspf" %>
<%
	
	//현재 세션에 저장된 아이디 저장
	String id = loginMember.getId();
/* 
	//주문한 제품의 시리얼 넘버 저장
	String[] serialNo = request.getParameterValues("serialNo");
	
	//시리얼 넘버의 배열을 int 형변환
	int[] serial = null;
	if(serialNo!=null){
		serial = new int[serialNo.length];
		for(int i=0;i<serialNo.length;i++){
			serial[i] = Integer.parseInt(serialNo[i]);
		}
	}
	
 */	
 
 	//주문번호 생성
	String orderNo = OrderDAO.createOrderNo();
	
	//BUYING_INF 테이블에 저장
	OrderDAO.getDAO().insertBuyingInf(orderNo, id);
	
	
	List<CartDTO> payList = CartDAO.getDAO().selectIdCartt(id);
	BuyingRecordDTO record = null;
	for(CartDTO pay:payList){
		//System.out.println(pay.getCaAmount());
		//System.out.println(pay.getCaSerialNo());
		record = new BuyingRecordDTO();
		record.setBrOrderNo(orderNo);
		record.setBrSerialNo(pay.getCaSerialNo());
		record.setBrAmount(pay.getCaAmount());
		
		OrderDAO.getDAO().insertBuyingRecord(record);
		CartDAO.getDAO().deleteCart(pay);
	}
	
	List<MemberOrderDTO> list = OrderDAO.getDAO().selectMemberIdOrder(id);
	
	//총 결제 금액
	int totalPrice=0;
	for(MemberOrderDTO cart:list){
		totalPrice += cart.getPrice();
	}
	
	String orderNum = null;
	for(MemberOrderDTO pay:list) {
		orderNum = pay.getOrderNo();
	}
	
	
	
%>

<style type="text/css">
.pay {
	margin-top: 50px;
	text-align: center;
}

strong {
	font-size: 20px;
}

.order_list img {
	height: 200px;
	width: 150px !important;
}

.order_list table {
	margin-left: 18%;
	margin-right: 5% !important;
}

.order_list th,td {
	width: 300px;
	text-align: center;
	font-size: 18px;
}

td.total {
	font-size: 18px;
}

.order_list p {
	margin-top: 5px;
	color: #dc3545;
	font-size: 18px;
}

#payment {
    margin-top: 10%;
    margin-bottom: 100px;
    margin-left: 35%;
}

#payment p {
	margin-top: 20px;
}

tfoot td .order_price>p {
	font-size: 20px;
}

tfoot td .order_price strong {
	font-size: 20px;
}

tfoot td .order_price {
	display: inline-block;
	margin: 0 40px 0 40px;
}

#mypage {
	margin-bottom: 10%;
	text-align: center;
}

#mypage p {
	font-size: 18px;
}

</style>

<div id="payment">    
<h3>구매가 완료되었습니다.</h3>
<h3>오늘도 우유사조와 함께 좋은하루되세요S2</h3>

<div>
	<p>주문번호 : <%=orderNum %></p>
</div>
</div>

<div class="order_list">
<p style="margin-left: 20%; font-size: 13px;">*주문변경 및 취소는 게시판을 통해 문의해주세요.</p>
	<table summary="사진, 제품명, 수량, 가격, 취소">
		<thead>
			<tr>
				<th scope="col" class="picture">사진</th>
				<th scope="col" class="product">제품명</th>
				<!-- <th scope="col" class="price">가격</th> -->
				<th scope="col" class="quantity">수량</th>
				<th scope="col" class="total">합계</th>
			</tr>
		</thead>
		
		<tbody>
		<% for(MemberOrderDTO pay:list) { %>
		<tr>
		<td class="picture">
		<a href="<%=request.getContextPath() %>/index.jsp?workgroup=product&work=<%=pay.getImage() %>">
			<img src="images/<%=pay.getImage() %>.jpg">
		</a>
		</td>
		<td class="product">
		<a href="<%=request.getContextPath() %>/index.jsp?workgroup=product&work=<%=pay.getImage() %>">
			<strong><%=pay.getProduct() %></strong>
		</a>
		</td>
		<%-- <td class="price">
		<%=DecimalFormat.getInstance().format(pay.getPrice())%>원
		</td> --%>
		<td class="quantity"><%=pay.getAmount() %></td>
		<td class="total">
		<%=DecimalFormat.getInstance().format(pay.getPrice())%>원
		</td>
		</tr>
		<% } %>
		</tbody>
		
		<tfoot>
			<tr>
				<td colspan="10" style="padding: 30px 0 30px 0;">
					<div class="order_foot">
						<div class="order_price">
							<p>총 주문금액</p>
							<strong>
								<%=DecimalFormat.getInstance().format(totalPrice) %>원
							</strong>
						</div>
						<span class="mark">+</span>
						<div class="order_price">
							<p>배송료</p>
							<strong>2,500원</strong>
						</div>
						<span class="mark">=</span>
						<div class="order_price">
							<p>총 결제금액</p>
							<strong>
							<%=DecimalFormat.getInstance().format(totalPrice+2500) %>원
							</strong>
						</div>
					</div>
				</td>
			</tr>
		</tfoot>
	</table>	
</div>	
<br>


<div id="mypage">
<p>
<a href="<%=request.getContextPath() %>/index.jsp?workgroup=member&work=member_detail">[MYPAGE]</a>&nbsp;&nbsp;
<a href="<%=request.getContextPath() %>/index.jsp?workgroup=home&work=home">[MAIN]</a>&nbsp;&nbsp;
<a href="<%=request.getContextPath() %>/index.jsp?workgroup=product&work=shop">[SHOP]</a>
</p>
</div>









