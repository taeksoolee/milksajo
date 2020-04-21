<%@page import="com.milk.dao.MemberDAO"%>
<%@page import="com.milk.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 회원정보 변경 입력페이지(member_modify.jsp)에서 전달된 회원정보를 반환받아 
MEMBER 테이블에 저장된 회원정보를 변경하고 회원정보 상세 출력페이지(member_detail.jsp)로 이동하는 JSP 문서 --%>
<%@include file="/security/login_check.jspf" %>
<%
	//비정상적인 요청에 대한 응답처리
	if(request.getMethod().equals("GET")) {
		//response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
		out.println("<script type='text/javascript'>");	
		out.println("location.href = '"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");			
		out.println("</script>");
		return;
	}	

	//입력값을 반환받아 저장
	String id=request.getParameter("id");
	String password=request.getParameter("password");
	if(password!=null && !password.equals("")) { //비밀번호가 입력된 경우 - 새로운 비밀번호 사용
		password=Utility.encrypt(password);
	} else { //비밀번호가 입력되지 않은 경우 - 기존 비밀번호 사용
		password=loginMember.getPassword();
	}	
	String name=Utility.stripTag(request.getParameter("name"));
	String birthday=request.getParameter("birthday");
	String email=request.getParameter("email");
	String phone=request.getParameter("phone1")+"-"+request.getParameter("phone2")
		+"-"+request.getParameter("phone3");
	String zipcode=request.getParameter("zipcode");
	out.println("zipcode = "+zipcode);
	String address1=request.getParameter("address1");
	String address2=Utility.stripTag(request.getParameter("address2"));	
	
	//DTO 인스턴스를 생성하여 반환받은 입력값으로 필드값 변경
	// => 입력값을 변환하여 필드값으로 저장
	MemberDTO member=new MemberDTO();
	member.setId(id);
	member.setPassword(password);
	member.setName(name);
	member.setBirthday(birthday);
	member.setEmail(email);
	member.setPhone(phone);	
	member.setZipcode(zipcode);
	member.setAddress1(address1);
	member.setAddress2(address2);
	
	//변경된 회원정보를 전달하여 MEMBER 테이블에 저장된 회원정보를 변경하는 DAO 클래스의 메소드 호출
	MemberDAO.getDAO().updateMember(member);
	
	//변경된 회원정보를 세션의 인증정보로 저장
	session.setAttribute("loginMember", MemberDAO.getDAO().selectIdMember(id));
	
	//회원정보 상세 출력페이지(member_detail.jsp)로 이동	
	out.println("<script type='text/javascript'>");
	out.println("location.href = '"+request.getContextPath()+"/index.jsp?workgroup=member&work=member_detail';");
	out.println("</script>");
%>