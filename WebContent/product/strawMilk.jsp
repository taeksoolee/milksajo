<%@page import="com.milk.dto.MemberDTO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.milk.dto.ProductDTO"%>
<%@page import="com.milk.dao.ProductDAO"%>
<%@page import="com.milk.dto.ProductPageDTO"%>
<%@page import="com.milk.dao.ProductPageDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
//현재 uri를 저장
	session.setAttribute("uri", request.getQueryString());
	MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");
	int no = 3;
	int serialNo = 13;
	
	//제품명을 전달받아 PRODUCT_PAGE 테이블에 저장된 이미지명을 반환받는 DAO 메소드 호출
	List<ProductPageDTO> image = ProductPageDAO.getDAO().selectImage(no);
	
	//제품 시리얼넘버로 PRODUCT 테이블에 저장된 제품 정보 반환
	List<ProductDTO> productList = ProductDAO.getDAO().selectNoProduct(serialNo);
	
%>
<form action="addFrom" id="addForm">
<div class="container-fluid">
	  <div class="row product-sec">
	        <div class="col-lg-6 prod-left">
	              <div class="hero-image">
	              <% for(ProductPageDTO pageImage:image) { %>
	        			<img src="images/<%=pageImage.getPpMainImage()%>.jpg" class="img wow fadeInUp">
	  			  <% } %>
	              </div>
	        </div>
	
	        <div class="col-lg-6 prod-right">
	              <div class="prod-opt">
	              <% for(ProductDTO product:productList) { %>
	                    <h3 id="prod-name" class="wow fadeInUp" data-wow-delay="0.2s"><%=product.getpName()%></h3>
	                    <p class="wow fadeInUp" data-wow-delay="0.2s">우유사조가 직접 키워 건강한 소에서 직접 추출한 신선하고 맛있는 우유.
                              <br>진짜 딸기과즙이 함유되어 있어 상큼하고 향긋한 딸기우유. </p>
	                    <br>
	                    <p id="price" class="wow fadeInUp" data-wow-delay="0.5s">가격 : <%=DecimalFormat.getInstance().format(product.getpPrice()) %>원</p>
	     				<p id="capacity" class="wow fadeInUp" data-wow-delay="0.5s">용량 : <%=DecimalFormat.getInstance().format(product.getpSize()) %>ml</p>
				 <% } %>
	
				<br>
	
					<input type="hidden" name="serialNum" value="<%=serialNo %>" class="serialNum">
			        <input type="number" placeholder="수량" name="amount" class="wow fadeInUp" data-wow-delay="0.8s" min="1" id="amountCheck">
					<input type="hidden" name="<%=loginMember %>" class="loginMember">
			        <div class="add-prod wow fadeInUp" data-wow-delay="1.1s">
			        	<button type="button" id="addBtn">Add to bag</button>
			        </div>
			        <div id="message" style="color: red;"></div>
			                <br>
			                <br>
			        <div class="link wow fadeInUp" data-wow-delay="0.8s">
			          <a href="index.jsp?workgroup=product&work=shop">다른 제품 보러가기 </a>
			     	</div>
	                        
	              </div>
	        </div>
	  </div>
</div>
</form>

            
            
<!-- 제품정보 -->
<div class="proDetail" id="proDetail1">
	<h3>제품 정보</h3>
	<table class="milkForm">
		<caption>제품 상세정보</caption>
		<colgroup>
			<col width="30%">
			<col width="">
		</colgroup>
		<tbody>
			<tr>
				<th>제품명</th>
				<td>딸기우유</td>
			</tr>
			<tr>
				<th>식품의 유형</th>
				<td>우유</td>
			</tr>
			<tr>
				<th>제조원 및 생산자</th>
				<td>MILKSAJO</td>
			</tr>
			<tr>
				<th>소재지</th>
				<td>서울시 강남구 테헤란로 123, 우유사조</td>
			</tr>
			<tr>
				<th>수입품의 경우 수입자</th>
				<td>해당사항 없음</td>
			</tr>
			<tr>
				<th>제조일/유통기한/보관방법</th>
				<td>실온10주</td>
			</tr>
			<tr>
				<th>중량 및 구성</th>
				<td>400ml</td>
			</tr>
			<tr>
				<th>원재료 및 함량</th>
				<td>정제수, 원유 20%(국산), 혼합탈지분유(네덜란드산), 설탕, 유크림(이탈리아산), 알룰로오스 S200M, 
				딸기과즙농축액 0.35%(고형분50%, 국산), 구연산나트륨, 효소처리스테비아, 합성향료(딸기향)</td>
			</tr>
			<tr>
				<th>고객상담실 연락처</th>
				<td>1588-1588</td>
			</tr>
		</tbody>
	</table>
	<br>
</div>
<!-- 제품 정보 ENDS -->
            
            
<div id="reviewPro" style="margin:150px">
	<%@include file="/board/product_review.jsp" %>
</div>

            

<script type="text/javascript">
$("#addBtn").click(function() {
	if($("#amountCheck").val()==null || $("#amountCheck").val()=="") {
		$("#message").text("제품수량을 입력해주세요.");
		return;
	}
	
	if($(".loginMember").attr("name")==null){
		location.href="<%=request.getContextPath()%>/index.jsp?workgroup=error&work=errorLogin";
	} else {
		var serialNum = $(".serialNum").attr("value");
		//alert("serialNum = "+serialNum);
		//alert("상품이 장바구니에 담겼습니당 S2");
		
		$("#addForm").attr("method","post");
		$("#addForm").attr("action","<%=request.getContextPath()%>/index.jsp?workgroup=cart&work=cart_add_action&serialNum="+serialNum);
		$("#addForm").submit();
		
	}
});

</script>
</body>
</html>
