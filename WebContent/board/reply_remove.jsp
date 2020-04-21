<%@page import="com.milk.dao.BoardDAO"%>
<%@page import="com.milk.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.sun.corba.se.impl.protocol.giopmsgheaders.ReplyMessage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 	int num=Integer.parseInt(request.getParameter("num"));
	int replyNum=Integer.parseInt(request.getParameter("replyNum"));
	
	String pageNum=request.getParameter("pageNum");
	String search=request.getParameter("serch");
	String keyword=request.getParameter("keyword");
 
	BoardDAO.getDAO().removeReply(replyNum);
%>

<script type='text/javascript'>
	location.href='<%=request.getContextPath()%>/index.jsp?workgroup=board&work=detail_board&num=<%=num%>&pageNum=<%=pageNum%>&search=<%=search%>&keyword=<%=keyword%>';
</script>