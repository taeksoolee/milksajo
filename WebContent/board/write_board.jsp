<%@page import="com.milk.dao.BoardDAO"%>
<%@page import="com.milk.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 게시글 입력 페이지 게시글 입력 받아 write_action 페이지로 이동 --%>

<%@include file="/security/login_status.jspf" %>
<%
	
	String ref="0", reStep="0";
	String pageNum="1";
	
	
	if(request.getParameter("ref")!=null) {
		ref=request.getParameter("ref");
		reStep=request.getParameter("reStep");
		pageNum=request.getParameter("pageNum");
	}
	
	
%>
<style>
.was-validated .custom-control-input:valid~.custom-control-label {
	color: black !important;
}
</style>

<div style="padding: 100px;" class="container">
<form class="was-validated" action="<%=request.getContextPath()%>/index.jsp?workgroup=board&work=write_action"
	method="post" id="boardForm">
	<input type="hidden" name="ref" value="<%=ref%>">
	<input type="hidden" name="reStep" value="<%=reStep%>">
	<input type="hidden" name="pageNum" value="<%=pageNum%>">
	<input type="hidden" name="replyState" value="0">
	
	<br>
	
	
	<div class="form-group">
		<select class="custom-select" name="qna" required>
		 	<option value="">문의 사항</option>
		  	<option value="배송 관련 문의" >배송 관련 문의</option>
		  	<option value="상품 관련 문의" >상품 관련 문의</option>
		 	<option value="기타 문의" >기타 문의</option>
		</select>
		
	</div>	

    <div>
    	<label for="validationTextarea">제목</label>
    	<input class="form-control is-invalid" name="bdTitle" id="bdTitle" type="text"  placeholder="제목" required>
    	
    </div>
    	
    <div class="mb-3">
    	<label for="validationTextarea">내용</label>
    	<textarea class="form-control is-invalid" name="content" id="bdContent" rows="5" cols="50" placeholder="내용" required style="resize: none"></textarea>
  		
  	</div>	
	
	<div class="custom-control custom-switch">
    	<input class="custom-control-input" type="checkbox" name="secret"  id="customSwitch1" value="1">
    	<label class="custom-control-label" for="customSwitch1">&nbsp;비밀글</label>
    </div>
	<br>
	
	<div>
		<button class="btn btn-light btn-sm" type="submit" >글쓰기</button>
		<button class="btn btn-light btn-sm" type="button" id="listBtn" onclick="location.href='<%=request.getContextPath()%>/index.jsp?workgroup=board&work=board_list'">목록으로</button>
	</div>      
</form>
<div id="message" style="color: red;"></div>
</div>
<script>
$("#subject").focus();

$("#boardForm").submit(function() {
	if($("#bdTitle").val()=="") {
		$("#message").text("제목을 입력해 주세요.");
		$("#bdTitle").focus();
		return false;
	}
	
	if($("#bdContent").val()=="") {
		$("#message").text("내용을 입력해 주세요.");
		$("#bdContent").focus();
		return false;
	}
	
	if($("#qna").val()=="") {
		$("#message").text("문의사항을 선택해 주세요.");
		$("#qna").focus();
		return false;
	}
});

</script>
