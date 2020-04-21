<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.milk.dao.ProductDAO"%>
<%@page import="com.milk.dto.ProductDTO"%>
<%@page import="com.milk.dto.CartDTO"%>
<%@page import="com.milk.dao.CartDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/login_check.jspf" %>
<%-- 주문하기 위한 문서 --%>
<%
	//현재 세션에 저장된 아이디 저장
	String id = loginMember.getId();
	
	//선택한 제품들의 시리얼넘버 저장
	String[] checkCart = request.getParameterValues("checkCart");
	//System.out.println("checkCart="+checkCart);
	
	//시리얼 넘버의 배열을 int 형변환
	int[] intCheckCart = null;
	if(checkCart!=null){
		intCheckCart = new int[checkCart.length];
		for(int i=0;i<checkCart.length;i++){
			intCheckCart[i] = Integer.parseInt(checkCart[i]);
		}
	}
	//System.out.println("intCheckCart="+intCheckCart);
	
	//CART 테이블에서 select
	List<CartDTO> cartList = new ArrayList<CartDTO>();
	CartDTO orderList = null;
	for(int no:intCheckCart){
		orderList = CartDAO.getDAO().selectNoCart(no);
		cartList.add(orderList);
	}
	//System.out.println("cartList="+cartList);
	

	//총 결제 금액
	int totalPrice=0;
	for(CartDTO cart:cartList){
		int proPrice = cart.getCaAmount()*cart.product.getpPrice();
		totalPrice += proPrice;
	}
	
	
%>

<style type="text/css">
.pay {
	margin-top: 100px;
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
	margin-left: 10%;
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

#order {
	margin-left: 35%;
	padding: 0 !important;
	font-family: 'Noto Sans KR', sans-serif;
	margin-bottom: 20px;
}

#order label {
	width: 75px;
    text-align: left;
    float: left;
    margin-right: 20px;
    font-size: 20px;
}

#order ul li {
	list-style-type: none;
	margin: 30px 0;
	height: 30px;
}

#order ul {
    margin-top: 3%;
    margin-bottom: 3%;
}

#zip-btn {
	height: 23px;
    font-size: 15px;
    padding-top: 0px;
}

.error {
	color: red;
	position: relative;
	left: 88px;
	display: none;
}

#pay {
	text-align: center;
	margin-top: 80px;
}

#pay #pay_btn {
	font-size: 20px;
	background: #ff6875;
	color: #fff;
	padding: 16px 50px 15px;
	margin-bottom: 100px;
	box-sizing: border-box;
	text-align: center;
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

#order h2 {
	text-align: left;
	font-family: 'Noto Sans KR', sans-serif;
	margin-left: 30px;
}

#order input {
	height: 27px;
	font-size: 15px;
}

#detailMem {
	margin: 20px 20px;
}
</style>


<form id="orderForm" name="orderForm" action="<%=request.getContextPath() %>/index.jsp?workgroup=cart&work=payment_finish" method="post">
<h2 class="pay" style="font-size: 1.8rem; color: #dc3545;">주문 / 결제</h2>
<br>

<div class="order_list">
	<table summary="사진, 제품명, 수량, 가격, 취소">
		<thead>
			<tr>
				<th scope="col" class="cart_check" style="width: 0;"></th>
				<th scope="col" class="picture">사진</th>
				<th scope="col" class="product">제품명</th>
				<th scope="col" class="price">가격</th>
				<th scope="col" class="quantity">수량</th>
				<th scope="col" class="total">합계</th>
			</tr>
		</thead>
		
		<tbody>
		<% for(CartDTO cart:cartList) { %>
		<tr>
		<td class="cart_check">
			<input type="hidden" name="serialNo" class="serialNo" value="<%=cart.product.getpSerialNo() %>">
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
		<td class="price">
		<%=DecimalFormat.getInstance().format(cart.product.getpPrice())%>원
		</td>
		<td class="quantity"><%=cart.getCaAmount() %></td>
		<td class="total">
		<%=DecimalFormat.getInstance().format(cart.getCaAmount()*cart.product.getpPrice())%>원
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
<br>
<br>
<br>			
<div id="detailMem">
<div id="order">
	<h2 style="font-size: 1.5rem; color: #0d90a5;">주문자 정보</h2>
	<ul>
		<li>
			<label for="name">이름</label>
			<input type="text" name="name" id="name" value="<%=loginMember.getName()%>">
			<div id="nameMsg" class="error">이름을 입력해 주세요.</div>
		</li>
		<% String[] mobile=loginMember.getPhone().split("-"); %>
		<li>
			<label for="phone">전화번호</label>
			<select name="phone1">
				<option value="010" <% if(mobile[0].equals("010")) { %> selected <% } %>>&nbsp;010&nbsp;</option>
				<option value="011" <% if(mobile[0].equals("011")) { %> selected <% } %>>&nbsp;011&nbsp;</option>
				<option value="016" <% if(mobile[0].equals("016")) { %> selected <% } %>>&nbsp;016&nbsp;</option>
				<option value="017" <% if(mobile[0].equals("017")) { %> selected <% } %>>&nbsp;017&nbsp;</option>
				<option value="018" <% if(mobile[0].equals("018")) { %> selected <% } %>>&nbsp;018&nbsp;</option>
				<option value="019" <% if(mobile[0].equals("019")) { %> selected <% } %>>&nbsp;019&nbsp;</option>
			</select>
			- <input type="text" name="phone2" id="phone2" size="4" maxlength="4" value="<%=mobile[1] %>">
			- <input type="text" name="phone3" id="phone3" size="4" maxlength="4" value="<%=mobile[2] %>">
			<div id="phoneMsg" class="error">전화번호를 입력해 입력해 주세요.</div>
			<div id="phoneRegMsg" class="error">전화번호는 3~4 자리의 숫자로만 입력해 주세요.</div>
		</li>
		<li>
			<div class="address-input-group">
			<label for="address">우편번호</label>
				<input name="zipcode" type="text" id="sample4_postcode" class="zip" value="<%=loginMember.getZipcode()%>" style="margin-top: 10px;" readonly="readonly">
				<input type="button" id="zip-btn" class="btn btn-dark zip-btn"onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
				<br>
			<label for="address" style="margin-top: 10px;">주소</label>
				<input name="address1"type="text" id="sample4_roadAddress" value="<%=loginMember.getAddress1()%>" style="margin-top: 10px; width: 300px;"><br>
				<br>
			<label for="address" style="margin-top: 10px;">상세주소</label>				
				<input name="address2" type="text" class="detail-addr" id="sample4_detailAddress" value="<%=loginMember.getAddress2()%>" style="margin-top: 10px;  width: 300px;">
				<br>
			</div>
		</li>
	</ul>
</div>
</div>
<br>
<br>
<br>
<br>
<div id="pay">
	<button type="submit" id="pay_btn">결제하기</button>
</div>
</form>

<script type="text/javascript">
$(".error").css("display","none");

$("#orderForm").submit(function() {
	var submitResult=true;
	
	if($("#name").val()=="") {
		$("#nameMsg").css("display","block");
		submitResult=false;
	}
	
	var phone2Reg=/\d{3,4}/;
	var phone3Reg=/\d{4}/;
	if($("#phone2").val()=="" || $("#phone3").val()=="") {
		$("#phoneMsg").css("display","block");
		submitResult=false;
	} else if(!phone2Reg.test($("#phone2").val()) || !phone3Reg.test($("#phone3").val())) {
		$("#phoneRegMsg").css("display","block");
		submitResult=false;
	}		
	return submitResult;
	
	
	<%-- $("#cartForm").attr("method","post");
	$("#cartForm").attr("action","<%=request.getContextPath() %>/index.jsp?workgroup=cart&work=payment_finish");
	$("#cartForm").submit(); --%>
	
});


//daum address API-------------------------------------------------------------
function sample4_execDaumPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var roadAddr = data.roadAddress; // 도로명 주소 변수
			var extraRoadAddr = ''; // 참고 항목 변수
	
	        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	            extraRoadAddr += data.bname;
	        }
	        // 건물명이 있고, 공동주택일 경우 추가한다.
	        if(data.buildingName !== '' && data.apartment === 'Y'){
	           extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	        }
	        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	        if(extraRoadAddr !== ''){
	            extraRoadAddr = ' (' + extraRoadAddr + ')';
	        }
	
	        // 우편번호와 주소 정보를 해당 필드에 넣는다.
	        document.getElementById('sample4_postcode').value = data.zonecode;
	        document.getElementById("sample4_roadAddress").value = roadAddr;
	        document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
	        
	        // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
	        if(roadAddr !== ''){
	            document.getElementById("sample4_extraAddress").value = extraRoadAddr;
	        } else {
	            document.getElementById("sample4_extraAddress").value = '';
	        }
	
	        var guideTextBox = document.getElementById("guide");
	        // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	        if(data.autoRoadAddress) {
	            var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	            guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	            guideTextBox.style.display = 'block';
	
	        } else if(data.autoJibunAddress) {
	            var expJibunAddr = data.autoJibunAddress;
	            guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
	            guideTextBox.style.display = 'block';
	        } else {
	            guideTextBox.innerHTML = '';
	            guideTextBox.style.display = 'none';
	        }
	    }
	}).open();
}


</script>









