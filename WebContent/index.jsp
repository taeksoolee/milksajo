<%@page import="com.milk.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String workgroup=request.getParameter("workgroup");
	String work=request.getParameter("work");
	if(workgroup==null) workgroup="home";
	if(work==null) work="home";
	
	String contentPath=workgroup+"/"+work+".jsp";
	// 로그인 된 회원인지 확인
	MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");
	
	String messageId = "";
	if(session.getAttribute("messageId") != null){
		messageId = (String)session.getAttribute("messageId");
	}
	
	String messagePasswd = "";
	if(session.getAttribute("messagePasswd") != null){
		messagePasswd = (String)session.getAttribute("messagePasswd");
	}
%>

<!DOCTYPE html>
<html>
<head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <meta http-equiv="X-UA-Compatible" content="ie=edge">
      <title>MILKSAJO - The store designed by MILKSAJO</title>

      <!-- external stylesheet -->
      <link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet">

      <!-- bootstrapcdn -->
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

      <!-- icon pack -->
      <script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script>

      <!-- google font -->
      <link href="https://fonts.googleapis.com/css?family=Playfair+Display&display=swap" rel="stylesheet">
      <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

      <!-- jquery cdn -->
      <script src="https://code.jquery.com/jquery-3.4.1.js"></script>

      <!-- tweenmax (greensock) cdn -->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.1.2/TweenMax.min.js"></script>

      <!-- for on scroll animations -->
      <link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
      <link rel="stylesheet" href="<%=request.getContextPath() %>/css/animate.css">
      <script src="<%=request.getContextPath() %>/js/wow.min.js"></script>
      
      <!-- 회원가입 주소입력 카카오 API -->
      <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>     
</head>
<body>
	  <%-- 관리자용 회원인 경우 관리자 페이지로 이동하는 버튼 활성화 --%>
	  <%if(loginMember != null && loginMember.getStatus() == 7){ %>
		  <button type="button" id="manager-btn" onclick="location.href = '<%=request.getContextPath() %>/management/manager.jsp';">
		  		<ion-icon name="settings" size="large"></ion-icon>
		  </button>
	  <%} %>
<!------------------------------ 헤더 : NAVIGATION STARTS ------------------------------------->
      <div class="my-container">
            <div class="nav">
                 <!-- 메인로고 -->
                  <div class="brand">
                        <span><a href="index.jsp?workgroup=home&work=home">MILKSAJO</a></span>
                  </div>
            	 <!-- 메뉴창 -->
                  <div class="menu-open">
                        <ion-icon name="menu" size="large"></ion-icon>
                  </div>
                  <div class="menu">
                        <div class="menu-close">
                              <ion-icon name="close" size="large"></ion-icon>
                        </div>
                        <ul>
                              <li><a href="index.jsp?workgroup=home&work=home">Home</a></li>
                              <li><a href="#">Category</a>
	                              <div>
	                              		<a href="index.jsp?workgroup=product&work=shop">ALL</a><br>
	                              		<a href="index.jsp?workgroup=product&work=shop#milk">MILK</a><br>
	                              		<a href="index.jsp?workgroup=product&work=shop#fermented">FERMENTED</a><br>
	                              		<a href="index.jsp?workgroup=product&work=shop#cheese">CHEESE</a><br>
	                              		<a href="index.jsp?workgroup=product&work=shop#fat">FATS&OIL</a><br>
	                              	</div>
                              </li>                             
                              <li><a href="index.jsp?workgroup=board&work=board_list">board</a></li>
                              <li><a href="index.jsp?workgroup=member&work=member_detail">MY PAGE</a></li>
                              <li><a href="index.jsp?workgroup=contact&work=contact">Contact</a></li>
                        </ul>
                  </div>
                  
                  
                  
                  <%if(loginMember == null){ // 비로그인상태 : 로그인%>
				  <!--로그인창 -->
                  <div class="cart-open">
                        <ion-icon name="log-in" size="large"></ion-icon>
                  </div>
                  <div class="cart"> <%-- 이 클래스 바꾸면 슬라이드 안됨...! --%>
                        <div class="cart-close">
                              <ion-icon name="close" size="large"></ion-icon>
                        </div>
                        <div class="cart-join">
                              <a id="cart-join" href="index.jsp?workgroup=member&work=member_join" style="font-size:15px;">JOIN</a>
                        </div>
                        <!-- LOGIN FORM -->
                        <div id="login-form"> 
	                        <form action="<%=request.getContextPath() %>/index.jsp?workgroup=home&work=login_action" method="post">
	                        	<label class="title">Login</label>
	                        	<div class="login-input">
		                        	<div class="id-form">
			                        	<label>I&nbsp;D</label>
		                              	<input type="text" name="id"/>
		                              	<div class="error"></div>
		                              	<div class="error"><%=messageId %></div>
	                              	</div>
	                              	<div class="pwd-form">
		                              	<label>PASSWORD</label>
		                              	<input type="password" name="password"/>
		                              	<div class="error"><%=messagePasswd %></div>
	                              	</div>
                              	</div>
                              	<div class="login-btns">
                              		<button type="submit" id="signIn" class="btn btn-dark">Sign in</button>
	                              	<p><a href="index.jsp?workgroup=member&work=search_login&inf=id">아이디찾기</a><a>&nbsp;&nbsp;|&nbsp;&nbsp;</a><a href="index.jsp?workgroup=member&work=search_login&inf=pwd">비밀번호찾기</a></p>
                              	</div>
    	                    </form>
                        </div>
                  </div>  
                                  
                  <%}else{ // 로그인상태 : 장바구니 %>
                  <div class="welcome-name" style="margin-left: 87%; margin-top: 1%">                  
                  		<p><%=loginMember.getName() %>님 환영합니다!</p>
                  </div>
                  <!--장바구니 창-->
                  <div class="cart-open"> 
                        <ion-icon name="cart" size="large"></ion-icon>
                  </div>
                  <div class="cart"  style="overflow: scroll;"> <%-- 이 클래스 바꾸면 슬라이드 안됨...! --%>
                        <div class="cart-close">
                              <ion-icon name="close" size="large"></ion-icon>
                        </div>
                        <div class="cart-join">
                              <a href="home/logout_action.jsp">LOGOUT</a> &nbsp;&nbsp;
                        </div>
                        <%@include file="cart/cart_list.jsp" %>
                  </div>
                  <%} %>
            </div>
 <!------------------------------ 컨텐츠 ------------------------------------->         
<div id="content" style="margin-top:60px">
		<jsp:include page="<%=contentPath %>"/>
</div>
<!------------------------------ 푸터 ------------------------------------->
            <div class="container-fluid footer">
                  <div class="section container">
                        <footer>
                              <div class="row">
                                    <div class="col-lg-4 block">
                                          <p>우유사조, 123 테헤란로,
                                          <br>
                                          강남구, 서울시.
                                          <br>
                                          대한민국</p>
                                    </div>
                                    <div class="col-lg-4 block">
                                          <p>FAQs
                                          <br>
                                          Return Policy
                                          <br>
                                          Shipping</p>
                                    </div>
                                    <div class="col-lg-4 block">
                                          <p>Careers
                                          <br>
                                          Community
                                          <br>
                                          Wholesale</p>
                                    </div>
                              </div>
                        </footer>
                  </div>
            </div>

            <!-- FOOTER ENDS -->

      </div>
	  
      <script type="text/javascript">
      
      //애니메이션
      new WOW().init();
      //Scroll activated background change
      $(function() {
            $(document).scroll(function() {
                  var $nav = $(".nav");
                  $nav.toggleClass('scrolled', $(this).scrollTop() > $nav.height());
            });
      });
      
    //Toggle MENU

     var t1 = new TimelineMax({paused: true});
     t1.to(".menu", 0.5, {
           left: "0%",
           ease: Power2.easeInOut
     });

     t1.reverse();
     $(document).on("click", ".menu-open", function() {
           t1.reversed(!t1.reversed());
     });
     $(document).on("click", ".menu-close", function() {
        t1.reversed(!t1.reversed());
     });
      
    //Toggle CART

    var t2 = new TimelineMax({paused: true});
    t2.to(".cart", 0.5, {
          right: "0%",
          ease: Power2.easeInOut
    });
 
    var cartToggle = function() {
        t2.reversed(!t2.reversed());
	 }
    
    
    var toggle = function(){
    	 cartToggle();
    	 
    	 var loginForm = document.getElementById("login-form");
    	 var errors = loginForm.getElementsByClassName("error");
    	 var inputs = loginForm.getElementsByTagName("input");
    	 
    	 for(error of errors){
    	     error.innerText="";
    	 }
    	 for(input of inputs){
    		input.value="" 
    	 }
    }
    
    t2.reverse();
    $(document).on("click", ".cart-open", toggle);
    $(document).on("click", ".cart-close", toggle);
    
	//CATEGORY
    $(function(){
		var m=$('.menu>ul>li>a');
		var div=$('.menu>ul>li>div');

		m.each(function(){
			$(this).click(function(){
				//$(this).next().slideToggle(800)
				$(this).next().slideToggle(800)
				.parent().siblings().find('div:visible').slideUp(800);
			});
		});
	});
	
	//쿠키 관련처리
	var cookies = document.cookie;
	var csArr = cookies.split("; ");
	for(var cs of csArr){
		var c = cs.split("=")
		if(c[0] == "error"){
			cartToggle();
			var date = new Date();
		    date.setDate(date.getDate() - 1);
		    document.cookie = "error=error; expires="+date.toGMTString()+";";
		}
	}
    </script>
</body>
</html>
