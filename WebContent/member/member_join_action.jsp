<%@page import="com.milk.dao.MemberDAO"%>
<%@page import="com.milk.dto.MemberDTO"%>
<%@page import="com.milk.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 회원정보 입력페이지(user_join.jsp)에서 전달된 회원정보를 반환받아 
MEMBER 테이블에 저장하고 로그인 입력페이지(user_login.jsp)로 이동하는 JSP 문서 --%>
<%
	//비정상적인 요청에 대한 응답처리
	if(request.getMethod().equals("GET")) {
		//response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
		out.println("<script type='text/javascript'>");	
		out.println("location.href = '"+request.getContextPath()+"index.jsp?workgroup=error&work=error400';");			
		out.println("</script>");
		return;
	}

	if(request.getParameter("idCheckResult").equals("0")) {
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
	}

	//입력값을 반환받아 저장
	String id=request.getParameter("id");
	String password=request.getParameter("password");
	String name=request.getParameter("name");
	String birthday=request.getParameter("birthday");
	String phone=request.getParameter("phone1")+"-"+request.getParameter("phone2")
		+"-"+request.getParameter("phone3");
	String email=request.getParameter("email");	
	String zipcode=request.getParameter("zipcode");
	String address1=request.getParameter("address1");
	String address2=request.getParameter("address2");
	
	//DTO 인스턴스를 생성하여 반환받은 입력값으로 필드값 변경
	// => 입력값을 변환하여 필드값으로 저장
	MemberDTO member=new MemberDTO();
	member.setId(id);
	member.setPassword(Utility.encrypt(password));
	member.setName(Utility.stripTag(name));
	member.setBirthday(birthday);
	member.setPhone(phone);
	member.setEmail(email);
	member.setZipcode(zipcode);
	member.setAddress1(address1);
	member.setAddress2(address2);
	
	//학생정보를 전달하여 MEMBER 테이블에 저장하는 DAO 클래스의 메소드 호출
	MemberDAO.getDAO().insertMember(member);
	
	//로그인 입력페이지로 이동
	//=> 포함되는 JSP 문서에서는 리다이렉트 이동 불가능
	out.println("<script type='text/javascript'>");
	out.println("location.href = '"+request.getContextPath()+"/index.jsp?workgroup=home&work=home';");
	out.println("</script>");
%>