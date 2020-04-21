<%@page import="com.milk.dao.BoardDAO"%>
<%@page import="com.milk.dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 입력페이지(board_modify.jsp)에서 전달된 값을 반환받아 BOARD 테이블에
저장된 게시글을 변경하고 게시글 출력페이지(board_detail.jsp)로 이동하는 JSP 문서 --%>
<%
	//비정상적인 요청에 대한 응답처리
	if(request.getMethod().equals("GET")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}

	//전달값 반환받아 저장
	int num=Integer.parseInt(request.getParameter("num"));
	// 기존 페이지로 돌아가기위한 변수
	String pageNum=request.getParameter("pageNum");
	String search=request.getParameter("search");
	String keyword=request.getParameter("keyword");
	// 저장하기위한 변수
	String subject=request.getParameter("subject").replace("<", "&lt;").replace(">", "&gt;");
	int state=0;
	if(request.getParameter("secret")!=null) {
		state=Integer.parseInt(request.getParameter("secret"));
	}
	
	String content=request.getParameter("content").replace("<", "&lt;").replace(">", "&gt;");
	String qna=request.getParameter("qna");
	
	if(!content.equals("") || !subject.equals("")){
	//DTO 인스턴스를 생성하고 필드값 변경
	BoardDTO board=new BoardDTO();
	board.setNum(num);
	board.setSubject(subject);
	board.setState(state);
	board.setContent(content);
	board.setQna(qna);
	
	//게시글을 전달하여 BOARD 테이블에 저장된 해당 게시글을 변경하는 DAO 클래스의 메소드 호출
	BoardDAO.getDAO().updateBoard(board);
	
	//게시글 출력페이지로 이동
	//게시글 목록 출력페이지 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()
		+"/index.jsp?workgroup=board&work=detail_board&num="+num
		+"&pageNum="+pageNum+"&search="+search+"&keyword="+keyword+"';");
	out.println("</script>");
	}else {
		session.setAttribute("modiError", "수정할 제목과 내용을 입력해 주세요");
	}
%>  

