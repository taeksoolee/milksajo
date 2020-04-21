<%@page import="java.util.List"%>
<%@page import="com.milk.dto.MemberDTO"%>

<%@page import="com.milk.dao.BoardDAO"%>
<%@page import="com.milk.dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	session.setAttribute("uri", request.getQueryString());	
	
	String nullMsg=(String)session.getAttribute("error");
	
	if(nullMsg == null){
		nullMsg="";
	}
	
	if(request.getParameter("num")==null) {
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
	out.println("</script>");
	return;
	}
	
	int num=Integer.parseInt(request.getParameter("num"));
	String pageNum=request.getParameter("pageNum");
	String search=request.getParameter("search");
	String keyword=request.getParameter("keyword");
	
	BoardDTO board=BoardDAO.getDAO().selectNumBoarder(num);
	
	if(board==null || board.getState()==9){
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}
	
	MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");
	
	if(board.getState()==1){
		if(loginMember==null || !loginMember.getId().equals(board.getId()) && loginMember.getStatus()!=7){
			out.println("<script type='text/javascript'>");
			out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
			out.println("</script>");
			return;
		}
	}
	
	BoardDAO.getDAO().updateReadCount(num);
	
	int reg=0;
	
	//리플을 가져오는 함수호출
	List<BoardDTO> replys = BoardDAO.getDAO().selectAllComment(num);
						
%>

<style type="text/css">
.container{
	padding-top: 100px;
}

#board_detail {
	margin: auto;
	width: 1000px;
	
}



</style>
<form id="boardForm" method="post">	
	<input type="hidden" name="num" value="<%=num%>">
	<input type="hidden" name="pageNum" value="<%=pageNum%>">
	<input type="hidden" name="search" value="<%=search%>">
	<input type="hidden" name="keyword" value="<%=keyword%>">
	<input type="hidden" name="ref" value="<%=board.getRef()%>">
	<input type="hidden" name="reStep" value="<%=board.getReStep()%>">
	
	<input type="hidden" name="content" value="<%=board.getReStep()%>">
	
		<div class="container">
			<div class="card" id="board_detail">
				<div>
					<div style="padding-left: 25px; padding-top: 15px;">
						[<%=board.getQna() %>]							
					</div>
					<div style=" text-align: right; font-size: 5px; padding-right: 35px; padding-top: 20px;">
						<label style="font-size: 10px;">조회수 : </label> <%=board.getReadCount()+1 %>
					</div>
					
					<div style="text-align: right; font-size: 10px; padding-right: 35px; padding-bottom: 10px;" >
						<div><%=board.getRegDate().substring(0, 19) %></div>
					</div>
				</div>	
				<div class="card-header" >
					<div class="col-12" >
						<label class="subject" style="font-size: 25px;">
							<% if(board.getState()==1) { %>[비밀글]<% } %>
							<%=board.getSubject()%>
						</label>
					</div>
					<div class="col-12">
						<div style=" text-align: right; font-size: 12px;">
						<label>작성자 : </label>
							<%=board.getWriter() %>
							<%-- 로그인 사용자가 관리자인 경우 --%>
							<% if(loginMember!=null && loginMember.getStatus()==7) { %>
								[<%=board.getIp() %>]
							<% } %>
						</div>	
					</div>
				</div>
				
				<div style="border-bottom: 1px solid rgba(0,0,0,.125); text-align: left; padding: 35px; padding-top: 12px; padding-bottom: 12px;">
					<div class="content" style="font-size: 20px; color: #252c41;">
						<%=board.getContent().replace("\n", "<br>")%>
					</div>
				</div>
			
				
				
				<div class="reply" style="border-bottom: 1px solid rgba(0,0,0,.125); text-align: left; padding: 35px; padding-top: 5px; padding-bottom: 12px;">
					<div style="padding-bottom: 15px; padding-top: 12px; font-size :20px; font: bold;">[ REPLY ]</div>
					<div class="row" >
					
					<%for(BoardDTO reply : replys) { %>
						<div class="col-2" style="padding-top: 30px; padding-bottom: 30px; border-right: 1px solid rgba(0,0,0,.125); border-bottom : 1px solid rgba(0,0,0,.125); border-top:1px solid rgba(0,0,0,.125); font-size: 12px;">
							- 작성자 : <%=reply.getId() %>	
						</div>
						<div class="col-10" style="padding-top: 10px;  border-bottom: 1px solid rgba(0,0,0,.125); border-top:1px solid rgba(0,0,0,.125); border-left: 1px solid rgba(0,0,0,.125);">
							<%=reply.getContent() %>
							<% if(loginMember!=null && (loginMember.getId().equals(board.getId()) 
							|| loginMember.getStatus()==7)) { %>
							<a class="badge badge-light" style="margin: 10px; font-size:5px; border: 1px solid rgba(0,0,0,.125);" href="<%=request.getContextPath()%>/index.jsp?workgroup=board&work=reply_remove&num=<%=board.getNum() %>&pageNum=<%=pageNum%>&search=<%=search%>&keyword=<%=keyword%>&replyNum=<%=reply.getNum()%>">
							Del</a>	
							<% } %>
  						</div>
						<div><%reply.getRegDate().substring(0, 8); %></div>
					<% } %>
					</div>
				</div>
					
				<br>
				
				
				
				<div style="text-align: right; padding: 20px;" id="board_menu">
					<%-- 로그인 사용자가 작성자이거나 관리자인 경우 --%>
					<% if(loginMember!=null && (loginMember.getId().equals(board.getId()) 
						|| loginMember.getStatus()==7)) { %>
						
						<div style="padding: 20px; padding-top: 12px; padding-bottom: 12px;">
							<textarea class="form-control" name="reply" id="content" rows="5" cols="50" placeholder="답글 내용을 작성해주세요." style="resize: none;"></textarea>
							<div style="color: red; text-align: left;"><%=nullMsg %></div>
							<%session.removeAttribute("error"); %>
							
						</div>
					
						<button class="btn btn-light btn-sm " type="button" id="removeBtn">글삭제</button>
						<button class="btn btn-light btn-sm " type="button" id="modifyBtn">글변경</button>
						<button class="btn btn-light btn-sm " type="button" id="replyBtn">답글쓰기</button>
					<% } %>
					<button class="btn btn-light btn-sm "  type="button" id="listBtn">글목록</button>
				</div>
			</div>
		</div>
		<br>
</form>

<script type="text/javascript">
$("#removeBtn").click(function() {
	if(confirm("정말로 삭제 하시겠습니까?")) {
		$("#boardForm").attr("action","<%=request.getContextPath()%>/index.jsp?workgroup=board&work=remove_action");
		$("#boardForm").submit();
	}
});

$("#modifyBtn").click(function() {
	$("#boardForm").attr("action","<%=request.getContextPath()%>/index.jsp?workgroup=board&work=modify_board");
	$("#boardForm").submit();
});

$("#replyBtn").click(function() {
	$("#boardForm").attr("action","<%=request.getContextPath()%>/index.jsp?workgroup=board&work=reply_action");
	$("#boardForm").submit();
});

$("#listBtn").click(function() {
	$("#boardForm").attr("action","<%=request.getContextPath()%>/index.jsp?workgroup=board&work=board_list");
	$("#boardForm").submit();
});	
	

</script>









