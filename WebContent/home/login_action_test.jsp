<%@page import="com.milk.dao.MemberDAO"%>
<%@page import="com.milk.dto.MemberDTO"%>
<%@page import="com.milk.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 로그인 입력페이지(member_login.jsp)에서 전달된 아이디와 비밀번호를 
반환받아 인증처리 후 페이지를 이동하는 JSP 문서 --%>
<%-- => 인증성공 : 세션에 인증정보를 저장(공유)하고 기존 요청페이지 이동
        (기존 요청페이지가 없는 경우 메인페이지로 이동) --%>    
<%-- => 인증실패 : 세션에 메세지와 아이디를 저장하고 로그인 입력페이지 이동 --%>    
<%
	//비정상적인 요청에 대한 응답처리
	if(request.getMethod().equals("GET")) {
		//response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}

	//입력값을 반환받아 저장
	String id=request.getParameter("id");
	String password=Utility.encrypt(request.getParameter("password"));
	
	//인증처리 - 아이디와 비밀번호 비교
	//아이디를 전달하여 MEMBER 테이블에 저장된 회원정보를 검색하여 반환하는 DAO 클래스의 메소드 호출
	// => null 반환 : 회원정보 미검색 - 아이디에 대한 인증 실패
	// => MemberDTO 인스턴스 반환 : 회원정보 검색 - 아이디에 대한 인증 성공 
	MemberDTO member=MemberDAO.getDAO().selectIdMember(id);	
	
	if(member==null) {
		session.setAttribute("messageId", "입력한 아이디가 존재하지 않습니다.");
		session.setAttribute("id", id);
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=home&work=home';");
		out.println("</script>");
		return;
	}
	
	//비밀번호에 대한 인증 처리 
	if(!member.getPassword().equals(password)) {//비밀번호에 대한 인증 실패
		session.setAttribute("messagePasswd", "비밀번호가 맞지 않습니다.");
		session.setAttribute("id", id);
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=home&work=home';");
		out.println("</script>");
		return;
	}
	
	//아이디를 전달하여 MEMBER 테이블에 저장된 회원의 마지막 로그인 날짜를
	//변경하는 DAO 클래스의 메소드 호출
	MemberDAO.getDAO().updateLastLogin(id);
	
	//세션에 인증정보(회원정보) 저장 - 로그인 상태 구분
	session.setAttribute("loginMember", MemberDAO.getDAO().selectIdMember(id));

	//세션에 저장된 기존 요청페이지의 URL 주소를 반환받아 저장
	String uri=(String)session.getAttribute("uri");
	
	//페이지 이동
	if(uri==null) {//기존 요청페이지가 존재하지 않는 경우 - 메인페이지 이동
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=home&work=home';");
		out.println("</script>");
	} else {//기존 요청페이지가 존재할 경우 - 요청페이지 이동
		session.removeAttribute("uri");
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+uri+"';");
		out.println("</script>");
	}
%>
