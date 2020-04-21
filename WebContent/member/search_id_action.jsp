<%@page import="com.milk.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- 아이디 찾기 실행하여 결과값 출력 --%>
<%	
	request.setCharacterEncoding("utf-8");
	//비정상적인 요청에 대한 응답처리
	if(request.getMethod().equals("GET")) {
		//response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
		out.println("<script type='text/javascript'>");	
		out.println("location.href = '"+request.getContextPath()+"index.jsp?workgroup=error&work=error400';");			
		out.println("</script>");
		return;
	}

	// 받아온 파라미터 저장 (sxx 공격에 대한 처리 < 문자를 무시하게 함.)
	String name = request.getParameter("name").replace("<","");
	String birthDay = (request.getParameter("year")+"-"+request.getParameter("month")+"-"+request.getParameter("day")).replace("<","");
	
	// 검색
	String id = MemberDAO.getDAO().selectSearchMemberId(name, birthDay);
	
	if(id == null){
		id = "error";
	}
%>
<script>
	location.href="<%=request.getContextPath()%>/index.jsp?workgroup=member&work=search_result&inf=id&msg=<%=id%>";
</script>


