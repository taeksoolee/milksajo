<%@page import="com.milk.dto.MemberDTO"%>

<%@page import="com.milk.dao.BoardDAO"%>
<%@page import="com.milk.dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 게시글번호를 전달받아 BOARD 테이블에 저장된 해당 행을 삭제 처리하고
게시글 목록 출력페이지(board_list.jsp)로 이동하는 JSP 문서 --%>    
<%
	
	if(request.getParameter("num")==null) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}	
 
	
	int num=Integer.parseInt(request.getParameter("num"));
	
	
	BoardDTO board=BoardDAO.getDAO().selectNumBoarder(num);
	
	
	if(board==null || board.getState()==9) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}		
	
	
	MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");
	
	
	if(loginMember==null || !loginMember.getId().equals(board.getId()) 
		&& loginMember.getStatus()!=7) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}
	
	
	BoardDAO.getDAO().deleteBoard(num);
	
	
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=board&work=board_list';");
	out.println("</script>");
%>