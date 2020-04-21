<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 찾기를 요청하는 정보를 받아옴
	String inf = request.getParameter("inf");
%>
<style>
.search-div{
    margin: 100px 30%;
    margin-bottom: 51px;
    padding: 107px;
    padding-bottom: 0px;
    border: 1px solid #e5e5e5;
    border-radius: 10px;
}

.search-div label{
	font-size: 15px;
}

.search-div .input-label{
	margin-bottom: 30px;
}

.search-div .btns{
	margin: 72px auto;
	text-align: center;
}
.search-div .btns .btn{
	padding: 10px;
}
</style>
<div class="search-div">
<%if(inf.equals("id")){ %>
<%-- 아이디 찾기버튼을 눌렀을때 실행 --%>

<form action="<%=request.getContextPath() %>/member/search_id_action.jsp" method="post">
	<div class="input-label">
		<label for="name">이름</label>
		<input type="text" name="name" class="form-control" required>
	</div>
	<div class="input-label">
		<label for="birthday">생년월일</label>
		<div class="input-group-prepend">
		<select name="year" class="form-control" style="width:40%;" onChange="setInputDate()"></select>	<input type="text" class="input-group-text" value="-" disabled="disabled" style="width: 40px; border: none; background: white;"/>
		<select name="month" class="form-control" style="width:30%;" onChange="setInputDate()"></select>	<input type="text" class="input-group-text" value="-" disabled="disabled" style="width: 40px; border: none; background: white;"/>
		<select name="day" class="form-control" style="width:30%;" onChange="setInputDate()"></select>
		</div>
	</div>
	<div class="btns">
		<button type="submit" class="btn btn-light">아이디 찾기</button>
	</div>	
</form>
</div>

<%}else if(inf.equals("pwd")){ %>
<%-- 비밀번호 찾기버튼을 눌렀을때 실행 --%>
<div>
<form action="<%=request.getContextPath() %>/member/search_pwd_action.jsp" method="post">
	<div class="input-label">
		<label for="id">아이디</label>
		<input type="text" name="id" class="form-control" required>
	</div>
	<div class="input-label">
		<label for="email">이메일</label>
		<div class="input-group-prepend">
		<input type="text" name="email1" class="form-control" required>
		<input type="text" class="input-group-text" value="@" disabled="disabled" style="width: 40px;"/>
		<input type="text" name="email2" class="form-control" required>
		<select id="select-email"class="form-control" onChange="selected()">
			<option value="member">직접입력</option>
			<option value="naver.com">naver.com</option>
			<option value="daum.net">daum.net</option>
			<option value="gmail.com">gmail.com</option>
			<option value="nate.com">nate.com</option>
		</select>
		</div>
	</div>
	<div class="btns">
	<button type="submit" class="btn btn-light">비밀번호 찾기</button>
	</div>
</form>
<%}else{ %>
<script>
	<%-- 비정상적인 요청에 대한 처리 : 에러페이지로 보냄 --%>
	location.href="/index.jsp?workgroup=error&work=error400";
</script>
<%} %>
</div>



<script>
// 날짜 출력 이벤트
	// select 객체를 선택
	var setInputDate = function(){
		var yearSelect = document.getElementsByName("year")[0];
		var monthSelect = document.getElementsByName("month")[0];
		var daySelect = document.getElementsByName("day")[0];
		// 현재 저장된 년 월 일을 저장
		var selectedYear = yearSelect.value;
		var selectedMonth = monthSelect.value;
		var selectedDay = daySelect.value;
		
		//현재 길이를 반환하여 저장
		var yearLength = yearSelect.options.length;
		var monthLength = monthSelect.options.length;
		var dayLength = daySelect.options.length;
		
		for(let i = 0; i < yearLength; i++){
			yearSelect.remove(0);
		}
		for(let i = 0; i < monthLength; i++){
			monthSelect.remove(0);
		}
		for(let i = 0; i < dayLength; i++){
			daySelect.remove(0);
		}
		//월별 일수를 저장하는 변수
		var dayAmounts = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
		
		// 현재의 년월일을 설정
		var now = new Date();
		var year = now.getYear()+1900;
		var month = now.getMonth()+1;
		var day = now.getDate();
		
		// 1900~현재년도까지
		for(let i = year; i > 1900; i--){
			var op = new Option();
	    	op.value = ''+i;
	    	op.text = ''+i;
	    	yearSelect.add(op);
		}
		
		for(let i = 1; i <= 12; i++){
			var op = new Option();
	    	op.value = ''+i;
	    	op.text = ''+i;
	    	monthSelect.add(op);
		}
		
		//윤년일경우 2월을 29일로 변경
		if((selectedYear%4==0 && selectedYear%100!=0) || selectedYear%400==0){
			dayAmounts[1] = 29;
		}
		
		//
		var ind = selectedMonth-1;
		
		if(ind == -1){
			ind = 1;
		}
		
		for(let i = 1; i <= dayAmounts[ind]; i++){
			var op = new Option();
	    	op.value = ''+i;
	    	op.text = ''+i;
	    	daySelect.add(op);
		}
		
		yearSelect.value = selectedYear;
		monthSelect.value = selectedMonth;
		daySelect.value = selectedDay;
		
		if(yearSelect.value == ""){
			yearSelect.value = year;
		}
		
		if(monthSelect.value == ""){
			monthSelect.value = month;
		}
		
		if(daySelect.value == ""){
			daySelect.value = day;
		}
	};
	
	setInputDate();

// 이메일 선택 이벤트
	
</script>

<script>
	var selected = function(){
		//초기화
		var email2 = document.getElementsByName("email2")[0];
		email2.value = "";
		email2.readOnly = true;
		// 변화될때 생성될 함수
		var v = document.getElementById("select-email").value;
		switch (v) {
		case "member":
			email2.removeAttribute("readOnly");
			break;
		case "naver.com":
			email2.value = 	"naver.com";
			break;
		case "daum.net":
			email2.value = 	"daum.net";	
			break;
		case "gmail.com":
			email2.value = 	"gmail.com";	
			break;
		case "nate.com":
			email2.value = 	"nate.com";
			break;
		}
	};
</script>



