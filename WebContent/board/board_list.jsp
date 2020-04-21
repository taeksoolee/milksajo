<%@page import="com.milk.dto.MemberDTO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@page import="com.milk.dao.BoardDAO"%>
<%@page import="com.milk.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 현재 uri를 저장
	session.setAttribute("uri", request.getQueryString());
	
	
	
	String search=request.getParameter("search");
	if(search==null) search="";
	String keyword=request.getParameter("keyword");
	if(keyword==null) keyword="";

	int pageNum=1;
	if(request.getParameter("pageNum")!=null) {
		pageNum=Integer.parseInt(request.getParameter("pageNum"));
	}
	
	int pageSize=10;
	
	int totalBoard=BoardDAO.getDAO().selectBoarderCount(search,keyword);
	     
	int totalPage=(int)Math.ceil((double)totalBoard/pageSize);
	
	if(pageNum<=0 || pageNum>totalPage) {
		pageNum=1;
	}
	
	
	int startRow=(pageNum-1)*pageSize+1;
	int endRow=pageNum*pageSize;
	
	 if(endRow>totalBoard) {
		endRow=totalBoard;
	}
	
	
	List<BoardDTO> boardList=BoardDAO.getDAO().selectBoarder(startRow, endRow, search, keyword);
	
	int number=totalBoard-(pageNum-1)*pageSize;
	
	MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");
	String currentDate=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	
	
%>
<style>

.list-form {
	text-align: center;
	
}

.page-link {
	border: 2px solid #ffffff !important;
	color: #070803 !important;
}

.form-row>.col, .form-row>[class*=col-] {
	margin: 10px !important;
}


.container{
	padding: 100px;
}

</style>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="author" content="MILKSAJO">
  		
		<meta http-equiv="X-UA-Compatible" content="ie=edge">

		<link rel="icon" href="yourIconUrl" type="image/gif" sizes="16x16">
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>  		

		<!-- external stylesheet -->
      	<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet">

      	<!-- bootstrapcdn -->
      	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
      	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

      	<!-- icon pack -->
      	<script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script>

      	<!-- google font -->
      	<link href="https://fonts.googleapis.com/css?family=Playfair+Display&display=swap" rel="stylesheet">

      	<!-- jquery cdn -->
      	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

      	<!-- tweenmax (greensock) cdn -->
      	<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.1.2/TweenMax.min.js"></script>

<form id="board" name="boardForm" action="<%=request.getContextPath() %>/index.jsp?workgroup=board&work=board_list"></form>
<body>	
	<div class="container" style="text-align: center;">		
			<div class="row" >
				<div class="col-lg-6 ">
				
				</div>
				<div class="col-lg-6 ">
				<blockquote class="blockquote text right">
				<p class="mb-0">milk To </p>
				<footer class="blockquote-footer" >Q & A BOARD</footer>
				</div>
			</div>
			
	           		<table class="table table-sm"  >
						<thead >
							<tr>
							 	<th style=" background-color: white; border-bottom: 2px solid #070803; border-top: 2px solid #BB3E57; text-align: left;">번호</th>
							 	<th style=" background-color: white; border-bottom: 2px solid #070803; border-top: 2px solid #BB3E57; text-align: center;">문의사항</th>
							 	<th style=" background-color: white; border-bottom: 2px solid #070803; border-top: 2px solid #BB3E57; ">제목</th>
								<th style=" background-color: white; border-bottom: 2px solid #070803; border-top: 2px solid #BB3E57; text-align: left;">작성자</th>
								<th style=" background-color: white; border-bottom: 2px solid #070803; border-top: 2px solid #BB3E57;">조회수</th>
								<th style=" background-color: white; border-bottom: 2px solid #070803; border-top: 2px solid #BB3E57;">작성일</th>
							</tr>
						</thead>
						<tbody>
							<% if(totalBoard==0) { %>
							<tr>
								<td colspan="5">검색된 게시글이 하나도 없습니다.</td>
							</tr>
							<% } else { %>
								<%-- 게시글 목록 출력 --%>
								<% for(BoardDTO board:boardList) { %>
								<tr>
									<%-- 글번호 --%>
									<td style="text-align: left; border-bottom: 1px solid #070803;" ><%=number %></td>
									
									<%-- 문의사항--%>
									<td style="text-align: center; border-bottom: 1px solid #070803;" >[<%=board.getQna() %>]</td>
									
									<%-- 제목 --%>
									<td style="text-align: left; border-bottom: 1px solid #070803;" class="subject" id="subject">
									
									
									<%-- 게시글 상태에 따른 제목 출력과 하이퍼 링크 설정 --%>
									<% if(board.getState()==0) { %>
										<a  href="<%=request.getContextPath()%>/index.jsp?workgroup=board&work=detail_board&num=<%=board.getNum() %>&pageNum=<%=pageNum%>&search=<%=search%>&keyword=<%=keyword%>">
											<%=board.getSubject() %> <span class="badge badge-secondary"><%=BoardDAO.getDAO().selectReplyCount(board.getNum(), search, keyword) %></span>
										</a>
									<% } else if(board.getState()==1) { %>
										<span class="secret"><ion-icon style="height: 13px;" name="lock"></ion-icon></span>
										<% if(loginMember!=null && (loginMember.getId().equals
												(board.getId()) || loginMember.getStatus()==7)) { %>
										<a href="<%=request.getContextPath()%>/index.jsp?workgroup=board&work=detail_board&num=<%=board.getNum() %>&pageNum=<%=pageNum%>&search=<%=search%>&keyword=<%=keyword%>">
										작성자 또는 관리자만 확인 가능합니다.
										</a>
										<% } else { %>
										작성자 또는 관리자만 확인 가능합니다.
										<% } %>
									<% } else if(board.getState()==9) {//삭제글 %>
										<span class="remove">삭제글</span>
										작성자 또는 관리자에 의해 삭제된 게시글입니다.
									<% } %>
									</td>
								
									<% if(board.getState()!=9) {//삭제글이 아닌 경우 %>
									<%-- 작성자 --%>
									<td style="border-bottom: 1px solid #070803; text-align: left;"><%=board.getWriter() %></td>
								
									<%-- 조회수 --%>
									<td style=" border-bottom: 1px solid #070803;"><%=board.getReadCount() %></td>
								
									<%-- 작성일 --%>
									<td style=" border-bottom: 1px solid #070803;">
									<% if(currentDate.equals(board.getRegDate().substring(0, 10))) { %>
										<%=board.getRegDate().substring(11, 19) %>
									<% } else { %>
										<%=board.getRegDate().substring(0, 19) %>
									<% } %>
									</td>
									<% } else {//삭제글인 경우 %>
									<td style="border-bottom: 1px solid #070803;">&nbsp;</td>
									<td style="border-bottom: 1px solid #070803;">&nbsp;</td>
									<td style="border-bottom: 1px solid #070803;">&nbsp;</td>
									<% } %>
								</tr>
								<% number--; %>	
								<% } %>
							<% } %>
						</tbody>
					</table>
				
				
				<% if(loginMember!=null) { %>
				<div style="text-align: right;" id="writeBtn">
					<button type="button" class="btn btn-light btn-sm ">글쓰기</button>
				</div>
				<% } %>
				
				<%
					int blockSize=5;
	
					int startPage=(pageNum-1)/blockSize*blockSize+1;
					
					int endPage=startPage+blockSize-1;
		
					if (endPage>totalPage) {
						endPage=totalPage;
					}
				%>
				
				<div>
					<ul  class="pagination justify-content-center">
						
						<% if(startPage>blockSize) { %>
							<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/index.jsp?workgroup=board&work=board_list&pageNum=1&search=<%=search%>&keyword=<%=keyword%>">처음</a></li>
							<li class="page-item"><a class="page-link" href="<%=request.getContextPath() %>/index.jsp?workgroup=board&work=board_list&pageNum=<%=startPage-blockSize %>&search=<%=search %>&keyword=<%=keyword %>">이전 </a></li>
							
							<% } else { %>
							<li class="page-item"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">처음</a></li>
							<li class="page-item"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">이전</a></li>
							<% } %>
							
							<% for(int i=startPage;i<=endPage;i++) { %>
								
								<% if(pageNum!=i) { %>
									<li class="page-item">
									<a  class="page-link" href="<%=request.getContextPath()%>/index.jsp?workgroup=board&work=board_list&pageNum=<%=i %>&search=<%=search %>&keyword=<%=keyword %>"><%=i %></a>
									</li>
								<% } else { %>
									<li class="page-item">
									<a class="page-link" href="#"><%=i %></a>
									</li>
								<% } %>	
							<% } %>
							
							
							<%-- <%System.out.println(startPage + "|" + totalPage + "|" + endPage);%> --%>
						<% if(endPage!=totalPage) { %>
							<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/index.jsp?workgroup=board&work=board_list&pageNum=<%=startPage+blockSize %>&search=<%=search%>&keyword=<%=keyword %>">다음</a></li>
							<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/index.jsp?workgroup=board&work=board_list&pageNum=<%=totalPage%>&search=<%=search%>&keyword=<%=keyword%>">마지막</a></li>
							
							<% } else { %>	
							<li class="page-item"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">다음</a></li>
							<li class="page-item"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">마지막</a></li>
							<% } %>
					</ul>
				</div>
				
				<form action="<%=request.getContextPath()%>/index.jsp?workgroup=board&work=board_list" method="post" id="searchForm" class="list-form">
					<div class="form-row justify-content-sm-center">
						<select class="form-control-sm col-1" name="search">
							<option  value="writer" selected>&nbsp;작성자&nbsp;</option>
							<option  value="subject">&nbsp;제목&nbsp;</option>
							<option  value="content">&nbsp;내용&nbsp;</option>
						</select>
					
						<input class="form-control-sm col-6" type="text" name="keyword" id="keyword">
						<br>
						<button class="btn btn-light btn-sm col-1" type="submit" >검색</button>
					</div>
				</form>
			
	</div>
</body>

<script type="text/javascript">
$("#writeBtn").click(function() {
	location.href="<%=request.getContextPath() %>/index.jsp?workgroup=board&work=write_board";
});	


</script>
