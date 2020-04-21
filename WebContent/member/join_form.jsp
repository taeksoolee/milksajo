<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JOIN FORM -->
				 <div id="join-form"> 
				  <form action="#" method="post">
				  	<label class="title">Join</label>
				  	<div class="join-input">
					   	<div class="id-form">
					    	<label>아이디</label>
				         	<input name="id" type="text" class="id"/>
				         	<!-- <div class="error id-error">아이디를 입력해주세요.</div> -->
				         	<div class="error id-error">아이디 형식이 잘못되었습니다.</div>
			        	</div>
			        	<div class="pwd-form">
			         		<label>비밀번호</label>
			         		<input name="pwd" type="text" class="pwd"/>
			         		<!-- <div class="error pwd-error">비밀번호를 입력하세요.</div> -->
			         		<div class="error pwd-error">비밀번호 형식이 잘못되었습니다.</div>
			        	</div>
			        	<div class="repwd-form">
				         	<label>비밀번호확인</label>
				         	<input name="rePwd" type="text" class="rePwd"/>
				         	<!-- <div class="error repwd-error">비밀번호를 입력하세요.</div> -->
		                   	<div class="error repwd-error">비밀번호가 일치하지않습니다.</div>
	                  	</div>
                    	<div class="name-form">
	                     	<label>성명</label>
	                     	<input name="name" type="text" class="name"/>
	                     	<div class="error name-error">이름을 입력하세요.</div>
                    	</div>
                    	<div class="birthday-form">
	                     	<label>생일</label>
	                     	<select class="year" value="2000"></select>
	                     	<select class="month" value="1"></select>
	                     	<select class="day" value="1"></select>
                    	</div>
                    	<div class="tel-form">
	                    	<label>전화번호</label>
		                    	<div class="tels">
		                    		<select name="tel1" class="tel1"></select>
		                    		<input name="tel2" type="text" class="tel2" maxlength="4"/>
		                    		<input name="tel3"type="text" class="tel3" maxlength="4"/>
		                    	</div>
                    	</div>
                    	<div class="email-form">
	                     	<label>이메일</label>
	                     	<input name="email" type="email"/>
	                     	<div class="error name-error">이메일 형식이 일치하지 않습니다.</div>
                    	</div>
                    	<div class="address-form">
                     	<label>주소</label>
	                    	<div class="address-input-group">
		                      	<input name="zip" type="text" id="sample4_postcode" class="zip" placeholder="우편번호">
								<input type="button" class="btn btn-dark zip-btn"onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
								<input name="address"type="text" id="sample4_roadAddress" placeholder="도로명주소">
								<!--<input type="text" id="sample4_jibunAddress" placeholder="지번주소">-->
								<!-- <span id="guide" style="color:#999;display:none"></span> -->
								<input name="detailAddr" type="text" class="detail-addr" id="sample4_detailAddress" placeholder="상세주소">
								<!-- <input name="referAddr" type="text" class="refer-addr" id="sample4_extraAddress" placeholder="참고항목"> -->
							</div>
                     	</div>
                   	</div>
                    	<div class="join-btns">
                    		<button type="submit" class="btn btn-dark">Join</button>
                    	</div>
					</form>
				</div>
				             
				        <script>
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