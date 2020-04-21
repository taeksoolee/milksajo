<%@page import="java.util.List"%>
<%@page import="com.milk.dao.BoardDAO"%>
<%@page import="com.milk.dto.BoardDTO"%>
<%@page import="com.milk.dao.MemberDAO"%>
<%@page import="com.milk.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 리뷰 게시판 만들기--%>
<%
	//현재 uri를 저장
	session.setAttribute("uri", request.getQueryString());
	//MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");
	
	//String nullMsg=(String)session.getAttribute("error");
	List<BoardDTO> reviews= BoardDAO.getDAO().selectReview(serialNo);
%>

<div class="reply" style="border-bottom: 1px solid rgba(0,0,0,.125); text-align: left; padding: 35px; padding-top: 5px; padding-bottom: 12px;">
	<div style="padding-bottom: 15px; padding-top: 12px; font-size :20px; font: bold;">[ REVIEW ]</div>
	<div class="row" >
	
	<%for(BoardDTO review : reviews) { %>
		<div class="col-2" style="padding-top: 30px; padding-bottom: 30px; border-right: 1px solid rgba(0,0,0,.125); border-bottom : 1px solid rgba(0,0,0,.125); border-top:1px solid rgba(0,0,0,.125); font-size: 12px;">
			- 작성자 : <%=review.getId() %>	
		</div>
		<div class="col-10" style="padding-top: 10px;  border-bottom: 1px solid rgba(0,0,0,.125); border-top:1px solid rgba(0,0,0,.125); border-left: 1px solid rgba(0,0,0,.125);">
			<%=review.getContent() %>
		</div>
		<% } %>
	</div>
</div>
	
<br>	
<form action="<%=request.getContextPath()%>/index.jsp?workgroup=board&work=write_action" method="post">
<div style="text-align: right; padding: 20px;" id="board_menu">
	<%-- 로그인 사용자가 작성자이거나 관리자인 경우 --%>
	<input type="hidden" name="serial" value="<%=serialNo %>" /><!-- 지선 -->
		
		<div style="padding: 20px; padding-top: 12px; padding-bottom: 12px;">
			<textarea class="form-control" id="content" name="content" rows="5" cols="50" placeholder="리뷰를 작성해 주세요" style="resize: none;"></textarea>
			<div style="color: red; text-align: left;"></div>
			<input type="hidden" name="replyState" value="3">
		</div>
	
		
		<button class="btn btn-light btn-sm " type="button" id="modifyBtn">리뷰변경</button>
		<button class="btn btn-light btn-sm " type="submit" id="replyBtn">리뷰쓰기</button>
</div>
</form>