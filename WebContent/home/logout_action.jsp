<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 로그아웃 처리 --%>    
<%

	//uri 세션이 있는지 확인
	String uri = "";
	if(session.getAttribute("uri") != null){
		uri=(String)session.getAttribute("uri");
	}else{
		uri = "";
	}
	System.out.println(uri);

	session.removeAttribute("loginMember");

	
	/*
	session.invalidate();
	
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=home&work=home';");
	out.println("</script>");
	*/
	

	if(uri==null) {//기존 요청페이지가 존재하지 않는 경우 - 메인페이지 이동
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=home&work=home';");
		out.println("</script>");
	} else {//기존 요청페이지가 존재할 경우 - 요청페이지 이동
		session.removeAttribute("uri");
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?"+uri+"';");
		out.println("</script>");
	}

%>