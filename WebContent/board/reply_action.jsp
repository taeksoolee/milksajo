<%@page import="com.milk.dto.BoardDTO"%>
<%@page import="com.milk.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/login_check.jspf" %>

<%

	if(request.getMethod().equals("GET")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}
	
	int ref=Integer.parseInt(request.getParameter("ref"));
	int reStep=Integer.parseInt(request.getParameter("reStep"));
	
	/*
	String subject=request
			.getParameter("subject")
			.replace("<", "&lt;")
			.replace(">", "&gt;");
	*/
	
	int state=0;
	
	String replyContent=request.getParameter("reply").replace("<", "&lt;").replace(">", "&gt;");
	
	
	String num=request.getParameter("num");
	String pageNum=request.getParameter("pageNum");
	String search=request.getParameter("search");
	String keyword=request.getParameter("keyword");
	
	
	if(!replyContent.equals("")){	

	
		int sequence=BoardDAO.getDAO().selectNextNum();
	
		
		
		
		String ip=request.getRemoteAddr();
		
		BoardDAO.getDAO().updateReStep(ref, reStep);
		
		BoardDTO reply=new BoardDTO();
		reply.setNum(sequence);
		reply.setId(loginMember.getId());
		reply.setWriter(loginMember.getName());
		reply.setRef(Integer.parseInt(num));
		reply.setReStep(1);
		reply.setContent(replyContent);
		reply.setState(state);
		
		
		BoardDAO.getDAO().insertReply(reply);
		/*
	  	out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=board&work=detail_board");
		out.println("</script>");
		*/
	}else{
		session.setAttribute("error", "답글 내용을 작성해 주세요");
	}
%>

<script type='text/javascript'>
	location.href='<%=request.getContextPath()%>/index.jsp?workgroup=board&work=detail_board&num=<%=num%>&pageNum=<%=pageNum%>&search=<%=search%>&keyword=<%=keyword%>';
</script>