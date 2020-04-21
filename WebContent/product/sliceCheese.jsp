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
	int no = 11;
	int serialNo = 31;
	
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
	                    <p class="wow fadeInUp" data-wow-delay="0.2s">남녀노소 누구나 즐길수 있는 고소한 치즈.
                              <br>우유칼슘첨가로 칼슘 흡수율 UP!</p>
	                    <br>
	                    <p id="price" class="wow fadeInUp" data-wow-delay="0.5s">가격 : <%=DecimalFormat.getInstance().format(product.getpPrice()) %>원</p>
	     				<p id="capacity" class="wow fadeInUp" data-wow-delay="0.5s">용량 : <%=DecimalFormat.getInstance().format(product.getpSize()) %>g</p>
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
				<td>슬라이스 치즈</td>
			</tr>
			<tr>
				<th>식품의 유형</th>
				<td>치즈</td>
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
				<td>0~10ºC 냉장보관</td>
			</tr>
			<tr>
				<th>중량 및 구성</th>
				<td>180g</td>
			</tr>
			<tr>
				<th>원재료 및 함량</th>
				<td>자연치즈 60%[체다 91.7%(호주산 81.8%, 뉴질랜드산 18.2% / 원유, 식염, 유산균, 우유응고효소), 크림치즈 8.3%(호주산 / 원유, 크림, 식염, 
				로커스트콩검, 구아검, 유산균) ], 정제수, 식물성유지(말레이시아산), 미셀라카제인(독일산), 산도조절제, 우유칼슘, 혼합분유, 로마노치즈페이스트, 아미노베이스</td>
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
