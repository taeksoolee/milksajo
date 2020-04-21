<%@page import="com.milk.dao.MemberDAO"%>
<%@page import="com.milk.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- 비밀번호 찾기 실행하여 성공시 해당 메일로 발송후, 결과값 출력 --%>
<%
	//비정상적인 요청에 대한 응답처리
	if(request.getMethod().equals("GET")) {
		//response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
		out.println("<script type='text/javascript'>");	
		out.println("location.href = '"+request.getContextPath()+"index.jsp?workgroup=error&work=error400';");			
		out.println("</script>");
		return;
	}

	// 받아온 파라미터 저장
	String id = request.getParameter("id").replace("<", "");
	String email = request.getParameter("email1").replace("<", "")+"@"+request.getParameter("email2");
	
	System.out.println(id+"|"+email);
	
	// member dto에 대한 처리
	MemberDTO m = MemberDAO.getDAO().selectSearchMemberPwd(id, email);
	String result = "";
	System.out.println(m);
	
	// 검색되는 아이디가 있을 경우
	if(m != null){
		//메일 발송 logic
		result = "complete"; 
	}else{
		result = "error";
	}
	
%>
<script>
	location.href="<%=request.getContextPath()%>/index.jsp?workgroup=member&work=search_result&inf=pwd&msg=<%=result%>";
</script>
