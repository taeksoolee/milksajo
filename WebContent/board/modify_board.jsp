<%@page import="com.milk.dto.MemberDTO"%>
<%@page import="com.milk.dao.BoardDAO"%>
<%@page import="com.milk.dto.BoardDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 게시글번호를 전달받아 BOARD 테이블에 저장된 해당 게시글을 검색하여
입력태그에 출력하여 클라이언트에게 전달하는 JSP 문서 --%>
<%
	//비정상적인 요청에 대한 응답처리
	if(request.getParameter("num")==null) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}	
	
	//제목과 내용 입력하지 않았을경우 세션 메세지 저장
	String modiMsg=(String)session.getAttribute("modiError");
	
	if(modiMsg == null){
		modiMsg="";
	}

	//전달값을 반환받아 저장
	int num=Integer.parseInt(request.getParameter("num"));
	String pageNum=request.getParameter("pageNum");
	String search=request.getParameter("search");
	String keyword=request.getParameter("keyword");
	
	//게시글번호를 전달하여 BOARD 테이블에 저장된 게시글을 검색하여 반환하는
	//DAO 클래스의 메소드 호출
	BoardDTO board=BoardDAO.getDAO().selectNumBoarder(num);
	
	
	
	
	//검색된 게시글이 없거나 삭제글인 경우 => 비정상적인 요청
	if(board==null || board.getState()==9) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}			
	
	//세션에 저장된 인증정보(회원정보)를 반환받아 저장
	 MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");
	
	//로그인 상태의 사용자가 작성자가 아니거나 관리자가 아닌 경우 => 비정상적인 요청
	if(loginMember==null || !loginMember.getId().equals(board.getId()) 
		&& loginMember.getStatus()!=7) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}
%>    
<style type="text/css">

.was-validated .custom-control-input:valid~.custom-control-label {
	color: black !important;
}
</style>

<div style="padding: 100px;" class="container">
<form action="<%=request.getContextPath()%>/index.jsp?workgroup=board&work=modify_action"
	method="post" id="boardForm">
	<input type="hidden" name="num" value="<%=num%>">
	<input type="hidden" name="pageNum" value="<%=pageNum%>">
	<input type="hidden" name="search" value="<%=search%>">
	<input type="hidden" name="keyword" value="<%=keyword%>">
	
	<div class="custom-control custom-switch" style="padding-bottom: 15px;">
		<input class="custom-control-input" type="checkbox" name="secret"  id="customSwitch1" value="1" <% if(board.getState()==1) { %> checked <% } %>>
    	<label class="custom-control-label" for="customSwitch1">&nbsp;비밀글</label>
	</div>		
	
	
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
		<input class="form-control " type="text" name="subject" id="subject" size="40" value="<%=board.getSubject()%>" required>
	</div>
	
	<div class="mb-3" style="padding-top: 15px;">
    	<label for="validationTextarea">내용</label>
		<textarea class="form-control " rows="5" cols="50" name="content" id="board_content" required><%=board.getContent() %></textarea>
	</div>
	
	<div><%=modiMsg %></div>
	<div colspan="2">
		<button class="btn btn-light btn-sm " type="submit">글수정</button>
		<button class="btn btn-light btn-sm " type="reset" id="resetBtn">다시쓰기</button>
	</div>
	
</form>
<div id="message" style="color: red;"></div>
</div>
<script type="text/javascript">
$("#subject").focus();

$("#boardForm").submit(function() {
	if($("#subject").val()=="") {
		$("#message").text("제목을 입력해 주세요.");
		$("#subject").focus();
		return false;
	}
	
	if($("#board_content").val()=="") {
		$("#message").text("내용을 입력해 주세요.");
		$("#board_content").focus();
		return false;
	}
});

	if($("#qna").val()=="") {
	$("#message").text("문의사항을 선택해 주세요.");
	$("#qna").focus();
	return false;

$("#resetBtn").click(function() {
	$("#subject").focus();
	$("#message").text("");
});


 
console.log("flag");

var options = document.getElementById("boardForm").qna.getElementsByTagName("option");
console.log(<%=board.getQna()%>);

for(option of options){
	console.log(option);
	if(<%=board.getQna()%>== option.innerText){
		option.selected = "selected";
	}
}
</script>




