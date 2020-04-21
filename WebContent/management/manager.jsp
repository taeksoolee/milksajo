
<%@page import="com.milk.dto.MemberDTO"%>
<%@page import="com.milk.dto.ManagerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	ManagerDTO login = (ManagerDTO)session.getAttribute("login");
	
	if(session.getAttribute("loginMember")==null && ((MemberDTO)session.getAttribute("loginMember")).getStatus() == 7){
		out.println("<script type='text/javascript'>");		
		out.println("document.cookie = 'error=error';");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=home&work=home';");
		out.println("</script>");
	}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/management/css/style.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap">
	
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.7.9/angular.min.js" charset="utf-8"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.28//angular-route.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-animate.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/bc20ae7d88.js" crossorigin="anonymous"></script>
	<script src="https://www.gstatic.com/charts/loader.js" type="text/javascript" ></script>
    
    <script src="<%=request.getContextPath() %>/management/js/ng_app.js"></script>
    <script src="<%=request.getContextPath() %>/management/js/ng_controller.js"></script>
    <script src="<%=request.getContextPath() %>/management/js/ng_directive.js"></script>
    <script src="<%=request.getContextPath() %>/management/js/ng_service.js"></script>
    <script src="<%=request.getContextPath() %>/management/js/ng_config.js"></script>
    <script src="<%=request.getContextPath() %>/management/js/ng_script.js"></script>
    <title>Management-page</title>
</head>
<body ng-app="managerApp" ng-controller="MainCtrl">
	<header style="z-index: 3;">
    	<mgr-header></mgr-header>
    </header>
    
    <mgr-contents></mgr-contents>
    <section id="main" style="z-index: 1;"> 
        <div id="content-view">
            <ng-view></ng-view>
        </div>
    </section>
    <footer style="z-index: 1;">
    	<mgr-footer></mgr-footer>
    </footer>
<%-- error bar --%>
	<div class="error-bar" ng-show="viewControl.errorBar.value">
	    {{messages.error}}
	</div>
<%--  --%>
	<div class="alert-bar" ng-show="viewControl.alertBar.value">
	    {{messages.alert}}
	</div>
<%-- dark space --%>
    <div class="background-dark" style="z-index: 3;" ng-show="viewControl.darkSpace.value"></div>  
<%-- Login form --%>
    <div ng-show="viewControl.formLogin.value">
    	<mgr-login></mgr-login>
    </div>
<%-- Join form --%>
    <div ng-show="viewControl.formJoin.value">
        <mgr-join></mgr-join>
    </div>
<%-- notice form --%>
	<div ng-show="viewControl.formNotice.value">
        <mgr-notice></mgr-notice>
    </div>
    
<%-- menual form --%>
	<div ng-show="viewControl.formMenual.value">
        <mgr-menual></mgr-menual>
    </div>
    
  	
<%-- fixedMenu --%>
	<div id="fixedMenu" class="btn-group-vertical mr-2" role="group" style="z-index: 2">
	    <button type="button top" class="btn btn-secondary" ng-click="toTop()">T&nbsp;o&nbsp;p</button>
	    <button type="button" class="btn btn-secondary" onClick="location.href='../index.jsp'">home</button>
	    <button type="button" class="btn btn-secondary ng-hide">4</button>
	    <button type="button bottom" class="btn btn-secondary" ng-click="toBottom()">Bottom</button>
  	</div>

  	
<% if(login != null){ // 로그인 상태일떄%>
	<div ng-controller="LoginCtrl"></div>
	<script type="text/javascript">
		location.href="http://localhost:8000/milk/management/manager.jsp#/home";
	</script>
<% }%>
</body>
</html>