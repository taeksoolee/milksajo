<%@page import="com.milk.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 비밀번호 입력페이지(modify_confirm.jsp)에서 전달된 값을 반환받아 
비밀번호 비교 후 회원정보를 입력태그에 출력하는 JSP 문서 --%>    
<%-- => 비로그인 상태에서 요청(비정상적인 요청)한 경우 에러페이지(error400.jsp)로 이동 --%>
<%-- => 비밀번호가 맞지 않을 경우 비밀번호 입력페이지로 이동 --%>
<%@include file="/security/login_check.jspf" %>
<%
	//GET방식 쫓아내기
	if(request.getMethod().equals("GET")) {
		out.println("<script type='text/javascript'>");	
		out.println("location.href = '"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");			
		out.println("</script>");
		return;
	}

	//입력값 저장
	String password=Utility.encrypt(request.getParameter("password"));	
	
	//입력비밀번호를 로그인 사용자의 비밀번호와 비교하여 맞지 않을 경우
	if(!password.equals(loginMember.getPassword())) {
		session.setAttribute("messagePasswd", "비밀번호가 맞지 않습니다.");
		out.println("<script type='text/javascript'>");	
		out.println("location.href = '"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");			
		out.println("</script>");
		return;
	}	
%>
<style type="text/css">
fieldset {
	margin-top: 50px;
	text-align: left;
	margin: 10px auto;
	width: 1100px;
}

legend {
	font-size: 1.2em;
}

hr {
    margin-top: 1rem;
    margin-bottom: 1rem;
    border: 0;
    border-top: 1px solid rgb(175, 175, 175);
    width: 600px;
    margin-left: -1%;
}

#head {
	border-bottom: 1px solid black;
    width: 597px;
    text-align: left;
    margin-left: 23%;
    height: 52px;
    margin-top: 2%;
}

#modify label {
	width: 75px;
    text-align: left;
    float: left;
    margin-right: 10px;
}

#modify ul {
	margin-left: 20%;
    margin-top: 3%;
    margin-bottom: 3%;
}

#modify ul li {
	list-style-type: none;
	margin: 15px 0;
}

#fs {
	text-align: center;
	margin-bottom: 41px;
}

.error {
	color: red;
	position: relative;
	left: 88px;
	display: none;
}

#idCheck {
	font-size: 12px;
	font-weight: bold;
	cursor: pointer;
	margin-left: 10px;
	padding: 2px 10px;
	border: 1px solid black;
}

#idCheck:hover {
	background: pink;
}

#zip-btn {
	height: 23px;
    font-size: 15px;
    padding-top: 0px;
}

</style>
<form id="modify" name="joinForm" action="<%=request.getContextPath() %>/index.jsp?workgroup=member&work=member_modify_action" method="post">
<fieldset>
	<h2 id="head">회원정보 변경</h2>
	<ul>
		<li>
			<label for="id">아이디</label>
			<input type="text" name="id" id="id" value="<%=loginMember.getId()%>" readonly>			
		</li>
		<li>
			<label for="password">비밀번호</label>
			<input type="password" name="password" id="password">&nbsp;
			<span style="color: red;">*입력하지 않을 경우 비밀번호는 변경되지 않습니다.</span>		
			<div id="passwdRegMsg" class="error">비밀번호는 영문자,숫자,특수문자가 반드시 하나이상 포함된 6~20 범위의 문자로만 작성 가능합니다.</div>
		</li>
		<li>
			<label for="password">비밀번호 확인</label>
			<input type="password" name="repasswd" id="repasswd">
			<div id="repasswdMatchMsg" class="error">비밀번호와 비밀번호 확인이 서로 맞지 않습니다.</div>
		</li>
		<hr>
		<li>
			<label for="name">이름</label>
			<input type="text" name="name" id="name" value="<%=loginMember.getName()%>">
			<div id="nameMsg" class="error">이름을 입력해 주세요.</div>
		</li>
		<li>
			<label for="birthday">생일</label>
			<input type="text" name="birthday" id="birthday" value="<%=loginMember.getBirthday().substring(0, 10)%>">
			<div id="birthdayMsg" class="error">생일을 입력해 주세요.</div>
			<div id="birthdayRegMsg" class="error">입력한 생일이 형식에 맞지 않습니다.</div>
		</li>
		<% String[] phone=loginMember.getPhone().split("-"); %>
		<li>			
			<label for="phone">전화번호</label>
			<select name="phone1">
				<option value="010" <% if(phone[0].equals("010" )) { %> selected <% } %>>&nbsp;010&nbsp;</option>
				<option value="011" <% if(phone[0].equals("011" )) { %> selected <% } %>>&nbsp;011&nbsp;</option>
				<option value="016" <% if(phone[0].equals("016" )) { %> selected <% } %>>&nbsp;016&nbsp;</option>
				<option value="017" <% if(phone[0].equals("017" )) { %> selected <% } %>>&nbsp;017&nbsp;</option>
				<option value="018" <% if(phone[0].equals("018" )) { %> selected <% } %>>&nbsp;018&nbsp;</option>
				<option value="019" <% if(phone[0].equals("019" )) { %> selected <% } %>>&nbsp;019&nbsp;</option>
			</select>
			- <input type="text" name="phone2" id="phone2" size="4" maxlength="4" value="<%=phone[1]%>">
			- <input type="text" name="phone3" id="phone3" size="4" maxlength="4" value="<%=phone[2]%>">
			<div id="phoneMsg" class="error">전화번호를 입력해 입력해 주세요.</div>
			<div id="phoneRegMsg" class="error">전화번호는 3~4 자리의 숫자로만 입력해 주세요.</div>
		</li>
		<li>
			<label for="email">이메일</label>
			<input type="text" name="email" id="email" value="<%=loginMember.getEmail()%>">
			<div id="emailMsg" class="error">이메일을 입력해 주세요.</div>
			<div id="emailRegMsg" class="error">입력한 이메일이 형식에 맞지 않습니다.</div>
		</li>
		<hr>				
		<li>
			<div class="address-input-group">
			<label for="address" style="margin-top: 10px;">우편번호</label>
				<input name="zipcode" type="text" id="sample4_postcode" class="zip" value="<%=loginMember.getZipcode() %>" style="margin-top: 10px;" readonly>
				<input type="button" id="zip-btn" class="btn btn-dark zip-btn"onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
			<label for="address" style="margin-top: 10px; margin-left: -85px;">주소</label>
				<input name="address1"type="text" id="sample4_roadAddress" value="<%=loginMember.getAddress1() %>" style="margin-top: 10px;"><br>
			<label for="address" style="margin-top: 10px; margin-left: -85px;">상세주소</label>				
				<!--<input type="text" id="sample4_jibunAddress" placeholder="지번주소">-->
				<!-- <span id="guide" style="color:#999;display:none"></span> -->
				<input name="address2" type="text" class="detail-addr" id="sample4_detailAddress" value="<%=loginMember.getAddress2() %>" style="margin-top: 10px;">
				<!-- <input name="referAddr" type="text" class="refer-addr" id="sample4_extraAddress" placeholder="참고항목"> -->
			</div>
		</li>	
		<hr>							
	</ul>
</fieldset>
<div id="fs">
	<button type="submit">정보변경</button>
	<button type="reset">다시입력</button>
</div>
</form>
<script type="text/javascript">
$("#modify").submit(function() {
	var submitResult=true;
	
	$(".error").css("display","none");
	
	var passwdReg=/^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~!@#$%^&*_-]).{6,20}$/g;
	if($("#password").val()!="" && !passwdReg.test($("#password").val())) {
		$("#passwdRegMsg").css("display","block");
		submitResult=false;
	}  
	
	if($("#repasswd").val()!="" && $("#password").val()!=$("#repasswd").val()) {
		$("#repasswdMatchMsg").css("display","block");
		submitResult=false;
	}
	
	if($("#name").val()=="") {
		$("#nameMsg").css("display","block");
		submitResult=false;
	}
	
	var emailReg=/^([a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+(\.[-a-zA-Z0-9]+)+)*$/g;
	if($("#email").val()=="") {
		$("#emailMsg").css("display","block");
		submitResult=false;
	} else if(!emailReg.test($("#email").val())) {
		$("#emailRegMsg").css("display","block");
		submitResult=false;
	}

	var birthdayReg=/^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/; 
	if($("#birthday").val()=="") {
		$("#birthdayMsg").css("display","block");
		submitResult=false;
	} else if(!birthdayReg.test($("#birthday").val())) {
		$("#birthdayRegMsg").css("display","block");
		submitResult=false;
	}	
	
	var phone2Reg=/\d{3,4}/;
	var phone3Reg=/\d{4}/;
	if($("#phone2").val()=="" || $("#phone3").val()=="") {
		$("#phoneMsg").css("display","block");
		submitResult=false;
	} else if(!phone2Reg.test($("#phone2").val()) || !phone3Reg.test($("#phone3").val())) {
		$("#phoneRegMsg").css("display","block");
		submitResult=false;
	}		
	
	if($("#zipcode").val()=="") {
		$("#zipcodeMsg").css("display","block");
		submitResult=false;
	}
	
	if($("#address1").val()=="") {
		$("#address1Msg").css("display","block");
		submitResult=false;
	}
	
	if($("#address2").val()=="") {
		$("#address2Msg").css("display","block");
		submitResult=false;
	}
	

	return submitResult;
});

//daum address API-------------------------------------------------------------
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {	
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}

</script>