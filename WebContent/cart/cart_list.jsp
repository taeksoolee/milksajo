<%@page import="java.text.DecimalFormat"%>
<%@page import="com.milk.dao.ProductDAO"%>
<%@page import="com.milk.dto.ProductDTO"%>
<%@page import="com.milk.dao.CartDAO"%>
<%@page import="com.milk.dto.CartDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- CART 테이블에 저장된 장바구니 목록을 검색하여 전달 --%>
<%-- [선택상품삭제]을 클릭한 경우 장바구니 삭제 처리페이지(cart_remove_action.jsp)이동 --%>
<%-- [수정]을 클릭한 경우 장바구니 수량 변경페이지(cart_chage_action.jsp)이동 --%>
<%-- [선택상품주문]을 클릭한 경우 결제페이지(cart_order.jsp)이동 --%>
<%
	//현재 세션에 저장된 아이디 저장
	String id = (String)loginMember.getId();
	//System.out.println(id);
	
	//CART 테이블에 저장된 장바구니 목록을 확인하는 메소드 호출
	List<CartDTO> cartList = CartDAO.getDAO().selectCart(id);
	
	int pSerial=0;
	//장바구니에 저장된 제품의 시리얼넘버를 반환받는 메소드 호출
	for(CartDTO cart:cartList) {
		pSerial = cart.getCaSerialNo();
	}

	//제품 시리얼넘버로 PRODUCT 테이블에 저장된 제품 정보 반환
	List<ProductDTO> product = ProductDAO.getDAO().selectNoProduct(pSerial);
	
	//총 결제금액
	int totalPrice=0;
	for(CartDTO cart:cartList){
		int proPrice = cart.getCaAmount()*cart.product.getpPrice();
		totalPrice += proPrice;
	}
%>
<style type="text/css">
.cart_list p {
	margin-left: 40px;
	margin-top: 20px;
	color: #dc3545;
}

#emptyCart a {
	margin-left: 45px;
	margin-top: 30px;
}

.cart_list ion-icon {
	margin-left: 12px;
	height: 18px;
}

div.icon-inner {
	margin-top: 55px !important;
}

button.btn_order {
	width: 200px;
	height: 55px;
	display: inline-block;
	text-align: center;
	background: #2d88b3;
	line-height: 57px;
	font-weight: 600;
	color: #fff !important;
	margin: 30px auto;
	margin-left: 30px;
}

button.btn_delete {
	width: 200px;
	height: 55px;
	display: inline-block;
	text-align: center;
	background: #2d88b3;
	line-height: 57px;
	font-weight: 600;
	color: #fff !important;
	margin: 30px auto;
	margin-left: 15%;
}

#cart_list tr {
	height: 150px !important;
}

.shop_cart img {
	height: 120px;
}


</style>
<form name="cartForm" id="cartForm">
<div class="shop_cart" id="shop_cart">
	<h4>SHOPPING CART</h4>
	<hr>
	
	<h5>장바구니 담긴 상품</h5>
	<div class="cart_list">
		<% if(cartList==null || cartList.isEmpty()) { %>
		<hr>
		<p>현재 장바구니가 비어있습니다.</p>
		<div class="link wow fadeInUp" data-wow-delay="0.8s" id="emptyCart">
            <a href="<%=request.getContextPath() %>/index.jsp?workgroup=product&work=shop">쇼핑하러가기 <ion-icon name="arrow-round-forward" class="shopIcon"></ion-icon></a>
       	</div>
		<%} else { %>
		<table summary="사진, 제품명, 수량, 가격, 취소">
			<thead>
				<tr>
					<th scope="col" class="cart_check"><input type="checkbox" id="allCheck"></th>
					<th scope="col" class="picture">사진</th>
					<th scope="col" class="product">제품명</th>
					<th scope="col" class="quantity">수량</th>
					<th scope="col" class="total">가격</th>
					<th scope="col" class="remove">취소</th>
				</tr>
			</thead>
			<tbody>
			<% for(CartDTO cart:cartList){ %>
			<tr>
				<td class="cart_check">
					<input type="checkbox" name="checkCart" class="check" id="check" value="<%=cart.product.getpSerialNo() %>">
				</td>
				<td class="picture">
					<a href="<%=request.getContextPath() %>/index.jsp?workgroup=product&work=<%=cart.page.getPpMainImage() %>">
						<img src="images/<%=cart.page.getPpMainImage() %>.jpg">
					</a>
				</td>
				<td class="product">
					<a href="<%=request.getContextPath() %>/index.jsp?workgroup=product&work=<%=cart.page.getPpMainImage() %>">
						<strong><%=cart.product.getpName() %></strong>
					</a>
				</td>
				<td class="quantity">
					<input type="number" name="amount" class="amount" min="1" value="<%=cart.getCaAmount() %>" style="width: 50px;">
					<button class="btn_modify" id="btn_modify">수정</button>
				</td>
				<td class="total">
					<%=DecimalFormat.getInstance().format(cart.getCaAmount()*cart.product.getpPrice())%>원
				</td>
				<td class="remove">
					<button class="btn_remove" id="btn_remove">삭제</button>
				</td>
			</tr>
			<% } %>
			</tbody>
			
			<tfoot>
				<tr>
					<td colspan="10">
						<div class="order_foot">
							<div class="order-price">
								<p>총 주문금액</p>
								<strong>
									<%=DecimalFormat.getInstance().format(totalPrice) %>원
								</strong>
							</div>
							<span class="mark">+</span>
							<div class="order-price">
								<p>배송료</p>
								<strong>2,500원</strong>
							</div>
							<span class="mark">=</span>
							<div class="order-price">
								<p>총 결제 금액</p>
								<strong>
									<%=DecimalFormat.getInstance().format(totalPrice+2500) %>원
								</strong>
							</div>
						</div>
					</td>
				</tr>
			</tfoot>
		</table>
		<div id="message" class="message" style="color: red; text-align: center; margin-top: 10px; font: bold;"></div>
		<div class="center">
			<button type="button" id="btn_delete" class="btn_delete">장바구니비우기</button>
			<button type="button" id="btn_order" class="btn_order">선택상품주문</button>
		</div>
		
		<% } %>
		<br>
		<br>
		<br>
		<br>
		
			
	</div>
</div>
</form>
<script type="text/javascript">
$("#allCheck").change(function() {
	if($(this).is(":checked")) {
		$(".check").prop("checked", true);
	} else {
		$(".check").prop("checked", false);
	}
});

$(".btn_modify").click(function() {
 	var clickBtn = $(this);
	
 	var tr = clickBtn.parent().parent();
 	var td = tr.children();
 	
 	var amount = td.eq(3).find("input").val();
 	var serialNum = td.eq(0).find("input").attr("value");

 	location.href="<%=request.getContextPath()%>/index.jsp?workgroup=cart&work=cart_change_action&amount="+amount+"&serialNum="+serialNum;
	return false;
});

$(".btn_remove").click(function() {
	var clickBtn = $(this);
	
 	var tr = clickBtn.parent().parent();
 	var td = tr.children();
 	
 	var serialNum = td.eq(0).find("input").attr("value");
	//alert("serialNum="+serialNum);
	
	location.href="<%=request.getContextPath()%>/index.jsp?workgroup=cart&work=cart_product_remove_action&serialNum="+serialNum;
	return false;
});

$(".btn_delete").click(function() {
	if(confirm("장바구니를 비우시겠습니까?")){
		location.href="<%=request.getContextPath()%>/index.jsp?workgroup=cart&work=cart_remove_action";
	}
});

$(".btn_order").click(function() {
	if($("input:checkbox[name=checkCart]").is(":checked")==false) {
		$("#message").text("주문할 제품을 선택하시오.");
		return;
	}
	
	$("#cartForm").attr("method","post");
	$("#cartForm").attr("action","<%=request.getContextPath()%>/index.jsp?workgroup=cart&work=cart_order");
	$("#cartForm").submit();
});
</script>
