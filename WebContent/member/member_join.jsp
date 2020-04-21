<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 회원정보를 입력하기 위한 JSP 문서 --%>    
<%-- => [회원가입] 버튼을 클릭한 경우 회원가입 처리페이지(user_join_action.jsp)를 요청하여 값 전달 --%>
<%-- => [아이디 중복 검사]를 클릭한 경우 새창에 아이디 중복검사 페이지(id_check.jsp)를 요청 - 아이디 전달(GET 방식) --%>

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

#join label {
	width: 75px;
    text-align: left;
    float: left;
    margin-right: 10px;
}

#join ul {
	margin-left: 20%;
    margin-top: 3%;
    margin-bottom: 3%;
}

#join ul li {
	list-style-type: none;
	margin: 15px 0;
}

#fs {
	text-align: center;
	margin-bottom: 20px;
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
<form id="join" name="joinForm" action="<%=request.getContextPath() %>/index.jsp?workgroup=member&work=member_join_action" method="post">
<%-- 아이디 중복 검사 실행 유무를 판단하기 위한 입력태그 --%>
<%-- => 입력값 : 0 - 아이디 중복 검사 미실행(사용 불가능 아이디) --%>
<%-- => 입력값 : 1 - 아이디 중복 검사 실행(사용 불가능 아이디) --%>
<input type="hidden" name="idCheckResult" id="idCheckResult" value="0">
<div id="joinBasic">
<fieldset>
	<h2 id="head">JOIN</h2>
	<ul>
		<li>
			<label for="id">아이디</label>
			<input type="text" name="id" id="id"><span id="idCheck">아이디 중복 검사</span>
			<div id="idMsg" class="error">아이디를 입력해 주세요.</div>
			<div id="idRegMsg" class="error">아이디는 영문자로 시작되는 영문자,숫자,_의 6~20범위의 문자로만 작성 가능합니다.</div>
			<div id="idCheckMsg" class="error">아이디 중복 검사를 반드시 실행해 주세요.</div>
		</li>
		<li>
			<label for="password">비밀번호</label>
			<input type="password" name="password" id="password">
			<div id="passwdMsg" class="error">비밀번호를 입력해 주세요.</div>
			<div id="passwdRegMsg" class="error">비밀번호는 영문자,숫자,특수문자가 반드시 하나이상 포함된 6~20 범위의 문자로만 작성 가능합니다.</div>
		</li>
		<li>
			<label for="password">비밀번호 확인</label>
			<input type="password" name="repasswd" id="repasswd">
			<div id="repasswdMsg" class="error"></div>
			<div id="repasswdMatchMsg" class="error">비밀번호가 일치하지 않습니다.</div>
		</li>
		<hr>
		<li>
			<label for="name">이름</label>
			<input type="text" name="name" id="name">
			<div id="nameMsg" class="error">이름을 입력해 주세요.</div>
		</li>						
		<li>
			<label for="birthday">생일</label>
			<input type="text" name="birthday"  id="birthday" placeholder="ex) 1990-01-01">			
			<div id="birthdayMsg" class="error">생일을 입력해 주세요.</div>
			<div id="birthdayRegMsg" class="error">예 1990-01-01 형식으로 입력해주세요.</div>			
		</li>		
		<li>
			<label for="phone">전화번호</label>
			<select name="phone1">
				<option value="010" selected>&nbsp;010&nbsp;</option>
				<option value="011">&nbsp;011&nbsp;</option>
				<option value="016">&nbsp;016&nbsp;</option>
				<option value="017">&nbsp;017&nbsp;</option>
				<option value="018">&nbsp;018&nbsp;</option>
				<option value="019">&nbsp;019&nbsp;</option>
			</select>
			- <input type="text" name="phone2" id="phone2" size="4" maxlength="4">
			- <input type="text" name="phone3" id="phone3" size="4" maxlength="4">
			<div id="phoneMsg" class="error">전화번호를 입력해 주세요.</div>
			<div id="phoneRegMsg" class="error">전화번호는 3~4 자리의 숫자로만 입력해 주세요.</div>
		</li>
		<li>
			<label for="email">이메일</label>
			<input type="text" name="email" id="email" placeholder="example1@milksajo.com">
			<div id="emailMsg" class="error">이메일을 입력해 주세요.</div>
			<div id="emailRegMsg" class="error">입력한 이메일이 형식에 맞지 않습니다.</div>
		</li>
		<hr>
		<li>
			<div class="address-input-group">
			<label for="address">우편번호</label>
				<input name="zipcode" type="text" id="sample4_postcode" class="zip" placeholder="우편번호" style="margin-top: 10px;" readonly="readonly">
				<input type="button" id="zip-btn" class="btn btn-dark zip-btn"onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
			<label for="address" style="margin-top: 10px;">주소</label>
				<input name="address1"type="text" id="sample4_roadAddress" placeholder="도로명주소" style="margin-top: 10px;"><br>
			<label for="address" style="margin-top: 10px; margin-left: -85px;">상세주소</label>				
				<!--<input type="text" id="sample4_jibunAddress" placeholder="지번주소">-->
				<!-- <span id="guide" style="color:#999;display:none"></span> -->
				<input name="address2" type="text" class="detail-addr" id="sample4_detailAddress" placeholder="상세주소" style="margin-top: 10px;">
				<!-- <input name="referAddr" type="text" class="refer-addr" id="sample4_extraAddress" placeholder="참고항목"> -->
			</div>
		</li>
	</ul>
<div id="fs">
	<button type="submit">회원가입</button>
	<button type="reset">다시입력</button>
</div>
</fieldset>
</div>
</form>
<script type="text/javascript">
$("#id").focus();

$("#join").submit(function() {
	var submitResult=true;
	
	$(".error").css("display","none");

	var idReg=/^[a-zA-Z]\w{5,19}$/g;
	if($("#id").val()=="") {
		$("#idMsg").css("display","block");
		submitResult=false;
	} else if(!idReg.test($("#id").val())) {
		$("#idRegMsg").css("display","block");
		submitResult=false;
	} else if($("#idCheckResult").val()=="0") {
		$("#idCheckMsg").css("display","block");
		submitResult=false;
	}
		
	var passwdReg=/^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~!@#$%^&*_-]).{6,20}$/g;
	if($("#password").val()=="") {
		$("#passwdMsg").css("display","block");
		submitResult=false;
	} else if(!passwdReg.test($("#password").val())) {
		$("#passwdRegMsg").css("display","block");
		submitResult=false;
	} 
	
	if($("#repasswd").val()=="") {
		$("#repasswdMsg").css("display","block");
		submitResult=false;
	} else if($("#password").val()!=$("#repasswd").val()) {
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
			
	return submitResult;
});

//메세지 영역 초기화
$("#idCheck").click(function() {
	$("#idMsg").css("display","none");
	$("#idRegMsg").css("display","none");
	
	var idReg=/^[a-zA-Z]\w{5,19}$/g;
	if($("#id").val()=="") {
		$("#idMsg").css("display","block");
		return;
		//submitResult=false;
	} else if(!idReg.test($("#id").val())) {
		$("#idRegMsg").css("display","block");
		//submitResult=false;
		return;
	}
	
	window.open("<%=request.getContextPath()%>/member/id_check.jsp?id="
			+$("#id").val(),"idcheck", "width=600, height=100,left=450, top=250");
});

$("#id").keyup(function () {
	if($("#idCheckResult").val()=="1") {
		$("#idCheckResult").val("0");
	}
});



//daum address API-------------------------------------------------------------
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