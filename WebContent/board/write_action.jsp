<%@page import="com.milk.dao.ProductPageDAO"%>
<%@page import="com.milk.dto.ProductPageDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.milk.dto.BoardDTO"%>
<%@page import="com.milk.dao.BoardDAO"%>
<%@page import="com.milk.mg.LoginMg"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 게시글 입력페이지(board_write.jsp)에서 전달된 게시글(새글 또는 답급)을
반환받아 BOARD 테이블에 저장하고 게시글 목록 출력페이지(board_list.jsp)로 
이동하는 JSP 문서 --%>    
<%@include file="/security/login_check.jspf" %>
<%
	
	if(request.getMethod().equals("GET")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}

	int state=Integer.parseInt(request.getParameter("replyState"));
	String subject="";
	int reStep=0;
	String qna="";
	int pageNum=0;
	int serial=0;
	
	
	if(state == 0){
		pageNum=Integer.parseInt(request.getParameter("pageNum"));
		reStep=Integer.parseInt(request.getParameter("reStep"));
		qna=request.getParameter("qna");
		subject=request.getParameter("bdTitle")
				.replace("<", "&lt;").replace(">", "&gt;");
		
		//비밀글 체크하여 전달된 경우
		if(request.getParameter("secret")!=null) {
			state=Integer.parseInt(request.getParameter("secret"));
		}
	}else if(state == 3){
		serial=Integer.parseInt(request.getParameter("serial"));
	}
		
		
		
	String content=request.getParameter("content")
			.replace("<", "&lt;").replace(">", "&gt;");
		
	//시퀸스 객체의 다음값을 검색하여 반환하는 DAO 클래스의 메소드 호출
	int num=BoardDAO.getDAO().selectNextNum();
		
	String ip=request.getRemoteAddr();
		
		
	BoardDTO board=new BoardDTO();
	board.setNum(num);
	board.setId(loginMember.getId());
	board.setWriter(loginMember.getName());
	board.setSubject(subject);
	board.setRef(num);
	board.setReStep(reStep);
	board.setContent(content);
	board.setIp(ip);
	board.setState(state);
	board.setQna(qna);
	board.setSerial(serial);
		
	BoardDAO.getDAO().insertBoarder(board);
	
	ProductPageDTO image = ProductPageDAO.getDAO().selectSerial(serial);
	
	//
	if(state==3){
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=product&work="+image.getPpMainImage()+"'");
		out.println("</script>");
	} else if(state==0) {
  		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=board&work=board_list&pageNum="+pageNum+"';");
		out.println("</script>");
	} else if(state==1) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=board&work=board_list&pageNum="+pageNum+"';");
		out.println("</script>");
	}
%>

