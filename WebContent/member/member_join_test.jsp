<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/styletest.css">
   
<div class="title">
  <h2>Join Us</h2>
</div>

<h3>기본정보</h3>
<div class="title">
    <h3>기본정보</h3>
    <p><span class="required">*</span> 필수입력사항</p>
  </div>
<div class="boardWrite ">
<table border="1" summary="">
	<caption>회원 기본정보</caption>
<tbody>
<tr>
	<th scope="row">아이디<span class="required">*</span></th>
    <td><input id="member_id" name="member_id" 
    fw-filter="isFill&isFill&isMin[4]&isMax[16]&isIdentity" fw-label="아이디" 
    fw-msg="" class="inputTypeText" placeholder="" value="" type="text"  /> 
   <a href="#none" title="새창 열기" onclick="checkIdLayer('<%=request.getContextPath()%>/user/id_check')" 
   class="btn-check">아이디 중복확인</a>
<span class="info-text">(영문소문자/숫자, 4~16자)</span>
</td>
</tr>
<tr>
	<th scope="row">비밀번호<span class="required">*</span></th>
	<td>
		<input id="passwd" name="passwd" fw-filter="isFill&isMin[4]&isMax[16]" fw-label="비밀번호" fw-msg="" autocomplete="off" maxlength="16" 0="disabled" value="" type="password"  /> <span class="info-text">(영문 대소문자/숫자 4자~16자)</span>
</td>
        </tr>
<tr>
<th scope="row">비밀번호 확인<span class="required">*</span>
</th>
          <td><input id="user_passwd_confirm" name="user_passwd_confirm" fw-filter="isFill&isMatch[passwd]" fw-label="비밀번호 확인" fw-msg="비밀번호가 일치하지 않습니다." autocomplete="off" maxlength="16" 0="disabled" value="" type="password"  /></td>
        </tr>
<!--<tr>
<th scope="row">비밀번호 확인 질문<span class="required">*</span></th>
                <td><select id="hint" name="hint" fw-filter="" fw-label="hint" fw-msg="" >
<option value="hint_01">기억에 남는 추억의 장소는?</option>
<option value="hint_02">자신의 인생 좌우명은?</option>
<option value="hint_03">자신의 보물 제1호는?</option>
<option value="hint_04">가장 기억에 남는 선생님 성함은?</option>
<option value="hint_05">타인이 모르는 자신만의 신체비밀이 있다면?</option>
<option value="hint_06">추억하고 싶은 날짜가 있다면?</option>
<option value="hint_07">받았던 선물 중 기억에 남는 독특한 선물은?</option>
<option value="hint_08">유년시절 가장 생각나는 친구 이름은?</option>
<option value="hint_09">인상 깊게 읽은 책 이름은?</option>
<option value="hint_10">읽은 책 중에서 좋아하는 구절이 있다면?</option>
<option value="hint_11">자신이 두번째로 존경하는 인물은?</option>
<option value="hint_12">친구들에게 공개하지 않은 어릴 적 별명이 있다면?</option>
<option value="hint_13">초등학교 때 기억에 남는 짝꿍 이름은?</option>
<option value="hint_14">다시 태어나면 되고 싶은 것은?</option>
<option value="hint_15">내가 좋아하는 캐릭터는?</option>
</select></td>
            </tr>
            <tr>
<th scope="row">비밀번호 확인 답변<span class="required">*</span></th>
                <td><input id="hint_answer" name="hint_answer" fw-filter="" fw-label="비밀번호 확인시 답변" fw-msg="" class="inputTypeText" placeholder="" value="" type="text"  /></td>
            </tr>--><tr class="displaynone">
<th scope="row">비밀번호 확인 질문</th>
          <td><select id="hint" name="hint" fw-filter="" fw-label="hint" fw-msg="" >
<option value="hint_01">기억에 남는 추억의 장소는?</option>
<option value="hint_02">자신의 인생 좌우명은?</option>
<option value="hint_03">자신의 보물 제1호는?</option>
<option value="hint_04">가장 기억에 남는 선생님 성함은?</option>
<option value="hint_05">타인이 모르는 자신만의 신체비밀이 있다면?</option>
<option value="hint_06">추억하고 싶은 날짜가 있다면?</option>
<option value="hint_07">받았던 선물 중 기억에 남는 독특한 선물은?</option>
<option value="hint_08">유년시절 가장 생각나는 친구 이름은?</option>
<option value="hint_09">인상 깊게 읽은 책 이름은?</option>
<option value="hint_10">읽은 책 중에서 좋아하는 구절이 있다면?</option>
<option value="hint_11">자신이 두번째로 존경하는 인물은?</option>
<option value="hint_12">친구들에게 공개하지 않은 어릴 적 별명이 있다면?</option>
<option value="hint_13">초등학교 때 기억에 남는 짝꿍 이름은?</option>
<option value="hint_14">다시 태어나면 되고 싶은 것은?</option>
<option value="hint_15">내가 좋아하는 캐릭터는?</option>
</select></td>
        </tr>
<tr class="displaynone">
<th scope="row">비밀번호 확인 답변</th>
          <td><input id="hint_answer" name="hint_answer" fw-filter="" fw-label="비밀번호 확인시 답변" fw-msg="" class="inputTypeText" placeholder="" value="" type="text"  /></td>
        </tr>
<tr>
<th scope="row" id="nameTitle">이름<span class="required">*</span>
</th>
          <td>
            <span id="nameContents"></span>
            <span id="under14Msg" class="displaynone">14세 미만 사용자는 법정대리인 동의가 필요합니다.</span>
          </td>
        </tr>
<tr class="displaynone">
<th scope="row">
<img src="/web/upload/hncok/img/cart/icon_required.png" id="icon_name_en" alt="필수"/>
            이름(영문)</th>
          <td><input id="name_en" name="name_en" fw-filter="isMax[30]" fw-label="이름(영문)" fw-msg="" class="ec-member-name" placeholder="" maxlength="30" value="" type="text"  /> (이름 - 성 형식으로 입력해 주세요.)</td>
        </tr>
<!-- 외국인 회원 정보 --><tr>
<th scope="row" id="ssnTitle"></th>
          <td id="ssnContents"></td>
        </tr>
<!-- //외국인 회원 정보 --><tr id="companyRow">
<th scope="row"> 상호명<span class="required">*</span>
</th>
          <td id="companyName"><input id="cname" name="cname" fw-filter="isMax[20]" fw-label="상호명" fw-msg="" class="inputTypeText" placeholder="" maxlength="20" value="" type="text"  /></td>
        </tr>
<tr id="companyNoRow">
<th scope="row"> 사업자번호<span class="required">*</span>
</th>
          <td id="companySsn"><input id="cssn" name="cssn" fw-filter="isMax[20]" fw-label="사업자 번호" fw-msg="" class="inputTypeText" placeholder="" maxlength="20" value="" type="text"  /></td>
        </tr>
<tr id="nation">
<th> 국적<span class="required">*</span>
</th>
          <td><select id="citizenship" name="citizenship" fw-filter="isFill" fw-label="국적" fw-msg="" >
<option value="" selected="selected">선택해 주세요.</option>
<option value="GH">가나(GHANA)</option>
<option value="GA">가봉(GABON)</option>
<option value="GY">가이아나(GUYANA)</option>
<option value="GM">감비아(GAMBIA)</option>
<option value="GT">과테말라(GUATEMALA)</option>
<option value="GD">그레나다(GRENADA)</option>
<option value="GE">그루지야(GEORGIA)</option>
<option value="GR">그리스(GREECE)</option>
<option value="GN">기니(GUINEA)</option>
<option value="GW">기니비소(GUINEA-BISSAU)</option>
<option value="NA">나미비아(NAMIBIA)</option>
<option value="NG">나이지리아(NIGERIA)</option>
<option value="ZA">남아프리카공화국(SOUTH AFRICA)</option>
<option value="AN">네덜란드(네덜란드령앤틸리스)(NETHERLANDS(ANTILLES))</option>
<option value="NL">네덜란드(네델란드)(NETHERLANDS)</option>
<option value="AW">네덜란드(아루바섬)(ARUBA)</option>
<option value="NP">네팔(NEPAL)</option>
<option value="NO">노르웨이(NORWAY)</option>
<option value="NZ">뉴질란드(NEW ZEALAND)</option>
<option value="NE">니제르(NIGER)</option>
<option value="NI">니카라과(NICARAGUA)</option>
<option value="KR">대한민국(KOREA (REP OF,))</option>
<option value="DK">덴마크(DENMARK)</option>
<option value="GL">덴마크(그린란드)(GREENLAND)</option>
<option value="FO">덴마크(페로즈제도)(FAROE ISLANDS)</option>
<option value="DO">도미니카공화국(DOMINICAN REPUBLIC)</option>
<option value="DM">도미니카연방(DOMINICA)</option>
<option value="DE">독일(GERMANY)</option>
<option value="TL">동티모르(TIMOR-LESTE)</option>
<option value="LA">라오스(LAO PEOPLE'S DEM REP)</option>
<option value="LR">라이베리아(LIBERIA)</option>
<option value="LV">라트비아(LATVIA)</option>
<option value="RU">러시아(RUSSIAN FEDERATION)</option>
<option value="LB">레바논(LEBANON)</option>
<option value="LS">레소토(LESOTHO)</option>
<option value="RO">루마니아(ROMANIA)</option>
<option value="LU">룩셈부르크(LUXEMBOURG)</option>
<option value="RW">르완다(RWANDA)</option>
<option value="LY">리비아(LIBYAN ARAB JAMAHIRIYA)</option>
<option value="LI">리첸쉬테인(LIECHTENSTEIN)</option>
<option value="LT">리투아니아(LITHUANIA)</option>
<option value="MG">마다가스카르(MADAGASCAR)</option>
<option value="MK">마케도니아(MACEDONIA)</option>
<option value="MW">말라위(MALAWI)</option>
<option value="MY">말레이지아(MALAYSIA)</option>
<option value="ML">말리(MALI)</option>
<option value="MX">멕시코(MEXICO)</option>
<option value="MC">모나코(MONACO)</option>
<option value="MA">모로코(MOROCCO)</option>
<option value="MU">모리셔스(MAURITIUS)</option>
<option value="MR">모리타니(MAURITANIA)</option>
<option value="MZ">모잠비크(MOZAMBIQUE)</option>
<option value="ME">몬테네그로(MONTENEGRO)</option>
<option value="MD">몰도바(MOLDOVA, REPUBLIC OF)</option>
<option value="MV">몰디브(MALDIVES)</option>
<option value="MT">몰타(MALTA)</option>
<option value="MN">몽고(MONGOLIA)</option>
<option value="US">미국(U.S.A)</option>
<option value="GU">미국(괌)(GUAM)</option>
<option value="MH">미국(마아샬제도)(MARSHALL ISLANDS)</option>
<option value="VI">미국(버진제도)(VIRGIN ISLANDS U.S.)</option>
<option value="WS">미국(사모아, 구 서사모아)(SAMOA)</option>
<option value="AS">미국(사모아제도)(AMERICAN SAMOA)</option>
<option value="MP">미국(사이판)(NORTHERN MARIANA ISLANDS)</option>
<option value="PW">미국(팔라우섬)(PALAU)</option>
<option value="PR">미국(푸에르토리코섬)(PUERTO RICO)</option>
<option value="MM">미얀마(MYANMAR)</option>
<option value="FM">미크로네시아(마이크로네시아)(MICRONESIA)</option>
<option value="VU">바누아투(VANUATU)</option>
<option value="BH">바레인(BAHRAIN)</option>
<option value="BB">바베이도스(BARBADOS)</option>
<option value="BS">바하마(BAHAMAS)</option>
<option value="BD">방글라데시(BANGLADESH)</option>
<option value="VE">베네수엘라(VENEZUELA)</option>
<option value="BJ">베넹(BENIN)</option>
<option value="VN">베트남(VIET NAM)</option>
<option value="BE">벨기에(BELGIUM)</option>
<option value="BY">벨라루스(BELARUS)</option>
<option value="BZ">벨리세(BELIZE)</option>
<option value="BA">보스니아헤르체코비나(Bosnia and Herzegovina)</option>
<option value="BW">보츠와나(BOTSWANA)</option>
<option value="BO">볼리비아(BOLIVIA)</option>
<option value="BF">부르키나파소(BURKINA FASO)</option>
<option value="BT">부탄(BHUTAN)</option>
<option value="BG">불가리아(BULGARIA(REP))</option>
<option value="BR">브라질(BRAZIL)</option>
<option value="BN">브루네이(나이)(BRUNEI DARUSSALAM)</option>
<option value="BI">브룬디(BURUNDI)</option>
<option value="SA">사우디아라비아(SAUDI ARABIA)</option>
<option value="CY">사이프러스(CYPRUS)</option>
<option value="SM">산마리노(SAN MARINO)</option>
<option value="SN">세네갈(SENEGAL)</option>
<option value="RS">세르비아/코소보(SERBIA/KOSOVO)</option>
<option value="SC">세이셸(SEYCHELLES)</option>
<option value="LC">세인트 루시아(SAINT LUCIA)</option>
<option value="VC">세인트빈센트그레나딘(SAINT VINCENT AND THE GRENADINES)</option>
<option value="KN">세인트키츠네비스(SAINT KITTS AND NEVIS)</option>
<option value="SB">솔로몬아일란드(SOLOMON ISLANDS)</option>
<option value="SR">수리남(SURINAME)</option>
<option value="LK">스리랑카(SRI LANKA)</option>
<option value="SZ">스와질랜드(SWAZILAND)</option>
<option value="SE">스웨덴(SWEDEN)</option>
<option value="CH">스위스(SWITZERLAND)</option>
<option value="ES">스페인(에스파니아)(SPAIN)</option>
<option value="SK">슬로바키아(SLOVAKIA)</option>
<option value="SI">슬로베니아(SLOVENIA)</option>
<option value="SL">시에라리온(SIERRA LEONE)</option>
<option value="SG">싱가포르(SINGAPORE)</option>
<option value="AE">아랍에미레이트연합국(UNITED ARAB EMIRATES)</option>
<option value="AM">아르메니아(ARMENIA)</option>
<option value="AR">아르헨티나(ARGENTINA)</option>
<option value="IS">아이슬란드(ICELAND)</option>
<option value="HT">아이티(HAITI)</option>
<option value="IE">아일란드(에이레)(IRELAND)</option>
<option value="AZ">아제르바이잔(AZERBAIJAN)</option>
<option value="AF">아프가니스탄(AFGHANISTAN)</option>
<option value="AD">안도라(ANDORRA)</option>
<option value="AL">알바니아(ALBANIA)</option>
<option value="DZ">알제리(ALGERIA)</option>
<option value="AO">앙골라(ANGOLA)</option>
<option value="AG">앤티과바부다(ANTIGUA AND BARBUDA)</option>
<option value="ER">에리트리아(ERITREA)</option>
<option value="EE">에스토니아(ESTONIA)</option>
<option value="EC">에콰도르(ECUADOR)</option>
<option value="SV">엘살바도르(EL SALVADOR)</option>
<option value="GB">영국(UNITED KINGDOM)</option>
<option value="MS">영국(몽세라)(MONTSERRAT)</option>
<option value="BM">영국(버뮤다섬)(BERMUDA)</option>
<option value="VG">영국(버진제도)(VIRGIN ISLANDS BRITISH)</option>
<option value="AI">영국(안귈라섬)(ANGUILLA)</option>
<option value="GI">영국(지브롤터)(GIBRALTAR)</option>
<option value="KY">영국(케이만제도)(CAYMAN ISLANDS)</option>
<option value="TC">영국(터크스케이코스제도)(TURKS AND CAICOS ISLANDS)</option>
<option value="YE">예멘(YEMEN)</option>
<option value="OM">오만(OMAN)</option>
<option value="NF">오스트레일리아(노퍽섬)(NORFOLK ISLAND)</option>
<option value="AU">오스트레일리아(호주)(AUSTRALIA)</option>
<option value="AT">오스트리아(AUSTRIA)</option>
<option value="HN">온두라스(HONDURAS)</option>
<option value="JO">요르단(JORDAN)</option>
<option value="UG">우간다(UGANDA)</option>
<option value="UY">우루과이(URUGUAY)</option>
<option value="UZ">우즈베크(UZBEKISTAN)</option>
<option value="UA">우크라이나(UKRAINE)</option>
<option value="ET">이디오피아(ETHIOPIA)</option>
<option value="IQ">이라크(IRAQ)</option>
<option value="IR">이란(IRAN(ISLAMIC REP))</option>
<option value="IL">이스라엘(ISRAEL)</option>
<option value="EG">이집트(EGYPT)</option>
<option value="IT">이탈리아(이태리)(ITALY)</option>
<option value="IN">인도(INDIA)</option>
<option value="ID">인도네시아(INDONESIA)</option>
<option value="JP">일본(JAPAN)</option>
<option value="JM">자메이카(JAMAICA)</option>
<option value="ZM">잠비아(ZAMBIA)</option>
<option value="CN">중국(CHINA(PEOPLE'S REP))</option>
<option value="MO">중국(마카오)(MACAU)</option>
<option value="HK">중국(홍콩)(HONG KONG)</option>
<option value="CF">중앙 아프리카(CENTRAL AFRICAN REPUBLIC)</option>
<option value="DJ">지부티(DJIBOUTI)</option>
<option value="ZW">짐바브웨(ZIMBABWE)</option>
<option value="TD">차드(CHAD)</option>
<option value="CZ">체코(CZECH REP)</option>
<option value="CL">칠레(CHILE)</option>
<option value="CM">카메룬(CAMEROON)</option>
<option value="CV">카보베르데(CAPE VERDE)</option>
<option value="KZ">카자흐(KAZAKHSTAN)</option>
<option value="QA">카타르(QATAR)</option>
<option value="KH">캄보디아(CAMBODIA)</option>
<option value="CA">캐나다(CANADA)</option>
<option value="KE">케냐(KENYA)</option>
<option value="CR">코스타리카(COSTA RICA)</option>
<option value="CI">코트디봐르(COTE D IVOIRE)</option>
<option value="CO">콜롬비아(COLOMBIA)</option>
<option value="CG">콩고(CONGO)</option>
<option value="CU">쿠바(CUBA)</option>
<option value="KW">쿠웨이트(KUWAIT)</option>
<option value="HR">크로아티아(CROATIA)</option>
<option value="KG">키르키즈스탄(KYRGYZSTAN)</option>
<option value="KI">키리바티(KIRIBATI)</option>
<option value="TH">타이(태국)(THAILAND)</option>
<option value="TW">타이완(대만)(TAIWAN)</option>
<option value="TJ">타지키스탄(TAJIKISTAN)</option>
<option value="TZ">탄자니아(TANZANIA(UNITED REP))</option>
<option value="TR">터키(TURKEY)</option>
<option value="TG">토고(TOGO)</option>
<option value="TO">통가(TONGA)</option>
<option value="TM">투르크메니스탄(TURKMENISTAN)</option>
<option value="TV">투발루(TUVALU)</option>
<option value="TN">튀니지(TUNISIA)</option>
<option value="TT">트리니다드토바고(TRINIDAD AND TOBAGO)</option>
<option value="PA">파나마(PANAMA(REP))</option>
<option value="PY">파라과이(PARAGUAY)</option>
<option value="PK">파키스탄(PAKISTAN)</option>
<option value="PG">파푸아뉴기니(PAPUA NEW GUINEA)</option>
<option value="PE">페루(PERU)</option>
<option value="PT">포르투갈(PORTUGAL)</option>
<option value="PL">폴란드(POLAND(REP))</option>
<option value="FR">프랑스(FRANCE)</option>
<option value="GP">프랑스(과데루프섬)(GUADELOUPE)</option>
<option value="GF">프랑스(기아나)(FRENCH GUIANA)</option>
<option value="NC">프랑스(뉴칼레도니아섬)(NEW CALEDONIA)</option>
<option value="RE">프랑스(레위니옹섬)(REUNION)</option>
<option value="MQ">프랑스(마르티니크섬)(MARTINIQUE)</option>
<option value="PF">프랑스(폴리네시아)(FRENCH POLYNESIA)</option>
<option value="FJ">피지(FIJI)</option>
<option value="FI">필란드(FINLAND)</option>
<option value="PH">필리핀(PHILIPPINES)</option>
<option value="HU">헝가리(HUNGARY(REP))</option>
</select></td>
        </tr>
<tr>
<th scope="row"> 주소<span class="required">*</span>
</th>
          <td>
            <input id="postcode1" name="postcode1" fw-filter="isLengthRange[1][14]" fw-label="우편번호1" fw-msg="" class="inputTypeText" placeholder="" readonly="readonly" maxlength="14" value="" type="text"  /> <input id="postcode2" name="postcode2" fw-filter="isLengthRange[3][8]" fw-label="우편번호2" fw-msg="" class="inputTypeText" placeholder="" readonly="readonly" value="" type="text"  />            <a href="#none" onclick="" id="postBtn" class="btn-zipcode">우편번호 검색</a><br/>
            <input id="addr1" name="addr1" fw-filter="isFill" fw-label="주소" fw-msg="" class="inputTypeText" placeholder="" readonly="readonly" value="" type="text"  /> <span class="info-text">기본주소</span> <br/>
            <input id="addr2" name="addr2" fw-filter="" fw-label="주소" fw-msg="" class="inputTypeText" placeholder="" value="" type="text"  /> <span class="info-text"> 나머지주소</span>
          </td>
        </tr>
<tr>
<th scope="row">
<img src="/web/upload/hncok/img/cart/icon_required.png" id="icon_phone" alt="필수"/>
            유선전화</th>
          <td><select id="phone1" name="phone[]" fw-filter="isNumber&isNumber" fw-label="일반전화" fw-alone="N" fw-msg="" >
<option value="02">02</option>
<option value="031">031</option>
<option value="032">032</option>
<option value="033">033</option>
<option value="041">041</option>
<option value="042">042</option>
<option value="043">043</option>
<option value="044">044</option>
<option value="051">051</option>
<option value="052">052</option>
<option value="053">053</option>
<option value="054">054</option>
<option value="055">055</option>
<option value="061">061</option>
<option value="062">062</option>
<option value="063">063</option>
<option value="064">064</option>
<option value="0502">0502</option>
<option value="0503">0503</option>
<option value="0504">0504</option>
<option value="0505">0505</option>
<option value="0506">0506</option>
<option value="0507">0507</option>
<option value="070">070</option>
<option value="010">010</option>
<option value="011">011</option>
<option value="016">016</option>
<option value="017">017</option>
<option value="018">018</option>
<option value="019">019</option>
</select>-<input id="phone2" name="phone[]" maxlength="4" fw-filter="isNumber&isNumber" fw-label="일반전화" fw-alone="N" fw-msg="" value="" type="text"  />-<input id="phone3" name="phone[]" maxlength="4" fw-filter="isNumber&isNumber" fw-label="일반전화" fw-alone="N" fw-msg="" value="" type="text"  /></td>
        </tr>
<tr>
<th scope="row"> 휴대전화<span class="required">*</span>
</th>
          <td><select id="mobile1" name="mobile[]" fw-filter="isNumber&isFill" fw-label="휴대전화" fw-alone="N" fw-msg="" >
<option value="010">010</option>
<option value="011">011</option>
<option value="016">016</option>
<option value="017">017</option>
<option value="018">018</option>
<option value="019">019</option>
</select>-<input id="mobile2" name="mobile[]" maxlength="4" fw-filter="isNumber&isFill" fw-label="휴대전화" fw-alone="N" fw-msg="" value="" type="text"  />-<input id="mobile3" name="mobile[]" maxlength="4" fw-filter="isNumber&isFill" fw-label="휴대전화" fw-alone="N" fw-msg="" value="" type="text"  /></td>
        </tr>
<tr class="">
<th scope="row"> SMS 수신여부<span class="required">*</span>
</th>
          <td class="sub-info"><label for=is_sms0><input id="is_sms0" name="is_sms" fw-filter="isFill" fw-label="is_sms" fw-msg="" class="ec-base-chk" value="T" type="checkbox"  />동의함</label><p class="sub-info-text">쇼핑몰에서 제공하는 유익한 이벤트 소식을 SMS로 받으실 수 있습니다.</p>
          </td>
        </tr>
<tr>
<th scope="row"> 이메일<span class="required">*</span>
</th>
          <td><input id="email1" name="email1" fw-filter="isFill&isEmail" fw-label="이메일" fw-alone="N" fw-msg="" value="" type="text"  /><span id="emailMsg" class="info-text"></span>
</td>
        </tr>
<tr class="">
<th scope="row">이메일 수신여부<span class="required">*</span>
</th>
          <td class="sub-info"><label for=is_news_mail0><input id="is_news_mail0" name="is_news_mail" fw-filter="isFill" fw-label="is_news_mail" fw-msg="" class="ec-base-chk" value="T" type="checkbox"  />동의함</label><p class="sub-info-text">쇼핑몰에서 제공하는 유익한 이벤트 소식을 이메일로 받으실 수 있습니다.</p>
          </td>
        </tr>
</tbody>
</table>
</div>
<div class="title  ">
    <h3 class="">추가정보</h3>
  </div>
<div class="boardWrite typeAddinfo">
    <table border="0" summary="">
<caption>회원 추가정보</caption>
      <div>
        <tbody>
<tr class="displaynone">
<th scope="row">
<img src="/web/upload/hncok/img/cart/icon_required.png" id="icon_nick_name_flag" alt="필수"/>
              별명</th>
            <td><input id="nick_name" name="nick_name" fw-filter="" fw-label="별명" fw-msg="" class="inputTypeText" placeholder="" maxlength="20" value="" type="text"  /> <p id="nickMsg"></p>
            </td>
          </tr>
<tr class="displaynone">
<th scope="row">
<img src="/web/upload/hncok/img/cart/icon_required.png" id="icon_sex" alt="필수"/> 성별</th>
            <td><input id="is_sex0" name="is_sex" fw-filter="" fw-label="성별" fw-msg="" value="M" type="radio"  /><label for="is_sex0" >남자</label>
<input id="is_sex1" name="is_sex" fw-filter="" fw-label="성별" fw-msg="" value="F" type="radio"  /><label for="is_sex1" >여자</label></td>
          </tr>
<tr class="displaynone">
<th scope="row">
<img src="/web/upload/hncok/img/cart/icon_required.png" id="icon_is_birthday" alt="필수"/>
              생년월일</th>
            <td><input id="birth_year" name="birth_year" fw-filter="" fw-label="생년월일" fw-msg="" class="inputTypeText" placeholder="" maxlength="4" value="" type="text"  /> 년 <input id="birth_month" name="birth_month" fw-filter="" fw-label="생년월일" fw-msg="" class="inputTypeText" placeholder="" maxlength="2" value="" type="text"  /> 월 <input id="birth_day" name="birth_day" fw-filter="" fw-label="생년월일" fw-msg="" class="inputTypeText" placeholder="" maxlength="2" value="" type="text"  /> 일 <span class="birth "><input id="is_solar_calendar0" name="is_solar_calendar" fw-filter="" fw-label="생년월일" fw-msg="" value="T" type="radio" checked="checked"  /><label for="is_solar_calendar0" >양력</label>
<input id="is_solar_calendar1" name="is_solar_calendar" fw-filter="" fw-label="생년월일" fw-msg="" value="F" type="radio"  /><label for="is_solar_calendar1" >음력</label></span>
</td>
          </tr>
<tr class="displaynone">
<th scope="row">
<img src="/web/upload/hncok/img/cart/icon_required.png" id="icon_is_wedding_anniversary" alt="필수"/> 결혼기념일</th>
            <td><input id="marry_year" name="marry_year" fw-filter="" fw-label="결혼 기념일" fw-msg="" class="inputTypeText" placeholder="" maxlength="4" value="" type="text"  /> 년 <input id="marry_month" name="marry_month" fw-filter="" fw-label="결혼 기념일" fw-msg="" class="inputTypeText" placeholder="" maxlength="2" value="" type="text"  /> 월 <input id="marry_day" name="marry_day" fw-filter="" fw-label="결혼 기념일" fw-msg="" class="inputTypeText" placeholder="" maxlength="2" value="" type="text"  /> 일</td>
          </tr>
<tr class="displaynone">
<th scope="row">
<img src="/web/upload/hncok/img/cart/icon_required.png" id="icon_is_life_partner" alt="필수"/>
              배우자생일</th>
            <td><input id="partner_year" name="partner_year" fw-filter="" fw-label="배우자 생일" fw-msg="" class="inputTypeText" placeholder="" maxlength="4" value="" type="text"  /> 년 <input id="partner_month" name="partner_month" fw-filter="" fw-label="배우자 생일" fw-msg="" class="inputTypeText" placeholder="" maxlength="2" value="" type="text"  /> 월 <input id="partner_day" name="partner_day" fw-filter="" fw-label="배우자 생일" fw-msg="" class="inputTypeText" placeholder="" maxlength="2" value="" type="text"  /> 일</td>
          </tr>
<tr class="displaynone">
<th scope="row">
<img src="/web/upload/hncok/img/cart/icon_required.png" id="icon_child" alt="필수"/>
              자녀</th>
            <td><select id="child" name="child" fw-filter="isFill" fw-label="child" fw-msg="" >
<option value="child_00">선택</option>
<option value="child_01">없음</option>
<option value="child_02">1</option>
<option value="child_03">2</option>
<option value="child_04">3</option>
<option value="child_05">4</option>
<option value="child_06">5</option>
<option value="child_07">6</option>
<option value="child_08">7</option>
<option value="child_09">8</option>
<option value="child_10">9</option>
<option value="child_11">10 이상</option>
</select></td>
          </tr>
<tr class="displaynone">
<th scope="row">
<img src="/web/upload/hncok/img/cart/icon_required.png" id="icon_school" alt="필수"/>
              최종학력</th>
            <td><select id="school" name="school" fw-filter="isFill" fw-label="school" fw-msg="" >
<option value="school_00">선택</option>
<option value="school_01">초등학교재학</option>
<option value="school_02">초등학교졸업</option>
<option value="school_03">중학교재학</option>
<option value="school_04">중학교졸업</option>
<option value="school_05">고등학교재학</option>
<option value="school_06">고등학교졸업</option>
<option value="school_07">대학교재학</option>
<option value="school_08">대학교졸업</option>
<option value="school_09">대학원재학</option>
<option value="school_10">대학원졸업이상</option>
</select></td>
          </tr>
<tr class="displaynone">
<th scope="row">
<img src="/web/upload/hncok/img/cart/icon_required.png" id="icon_job_class" alt="필수"/>
              직종</th>
            <td><select id="job_class" name="job_class" fw-filter="isFill" fw-label="직종" fw-msg="" >
<option value="job_class_04">선택</option>
<option value="job_class_05">서비스</option>
<option value="job_class_06">교육</option>
<option value="job_class_07">부동산/운송</option>
<option value="job_class_08">농/임/수/광업</option>
<option value="job_class_09">금융</option>
<option value="job_class_10">유통</option>
<option value="job_class_11">예술</option>
<option value="job_class_12">의료</option>
<option value="job_class_13">법률</option>
<option value="job_class_14">제조/무역</option>
<option value="job_class_15">건설업</option>
</select></td>
          </tr>
<tr class="displaynone">
<th scope="row">
<img src="/web/upload/hncok/img/cart/icon_required.png" id="icon_job" alt="필수"/> 직업</th>
            <td><select id="job" name="job" fw-filter="isFill" fw-label="직업" fw-msg="" >
<option value="job_00">선택</option>
<option value="job_01">학생</option>
<option value="job_02">회사원</option>
<option value="job_03">자영업</option>
<option value="job_04">무직</option>
<option value="job_05">기타</option>
</select></td>
          </tr>
<tr class="displaynone">
<th scope="row">
<img src="/web/upload/hncok/img/cart/icon_required.png" id="icon_earning" alt="필수"/>
              연소득</th>
            <td><select id="earning" name="earning" fw-filter="isFill" fw-label="earning" fw-msg="" >
<option value="earning_00">선택</option>
<option value="earning_01">없음</option>
<option value="earning_02">1000만원 이하</option>
<option value="earning_03">1200만원 이하</option>
<option value="earning_04">1500만원 이하</option>
<option value="earning_05">1800만원 이하</option>
<option value="earning_06">2000만원 이하</option>
<option value="earning_07">2500만원 이하</option>
<option value="earning_08">3000만원 이하</option>
<option value="earning_09">4000만원 이하</option>
<option value="earning_10">5000만원 이하</option>
<option value="earning_11">5000만원 이상</option>
<option value="earning_12">기타</option>
</select></td>
          </tr>
<tr class="displaynone">
<th scope="row">
<img src="/web/upload/hncok/img/cart/icon_required.png" id="icon_car" alt="필수"/> 자동차</th>
            <td><select id="car" name="car" fw-filter="isFill" fw-label="car" fw-msg="" >
<option value="car_00">선택</option>
<option value="car_01">없음</option>
<option value="car_02">1000cc 이하</option>
<option value="car_03">1000cc ~ 1500cc</option>
<option value="car_04">1500cc ~ 2000cc</option>
<option value="car_05">2000cc ~ 3000cc</option>
<option value="car_06">3000cc ~ 4000cc</option>
<option value="car_07">4000cc 이상</option>
</select></td>
          </tr>
<tr class="displaynone">
<th scope="row">
<img src="/web/upload/hncok/img/cart/icon_required.png" id="icon_region" alt="필수"/>
              지역</th>
            <td><select id="region" name="region" fw-filter="isFill" fw-label="region" fw-msg="" >
<option value="region_00">선택</option>
<option value="region_01">경기</option>
<option value="region_02">서울</option>
<option value="region_03">인천</option>
<option value="region_04">강원</option>
<option value="region_05">충남</option>
<option value="region_06">충북</option>
<option value="region_07">대전</option>
<option value="region_08">경북</option>
<option value="region_09">경남</option>
<option value="region_10">대구</option>
<option value="region_11">부산</option>
<option value="region_12">울산</option>
<option value="region_13">전북</option>
<option value="region_14">전남</option>
<option value="region_15">광주</option>
<option value="region_16">제주</option>
<option value="region_17">해외</option>
</select></td>
          </tr>
<tr class="displaynone">
<th scope="row">
<img src="/web/upload/hncok/img/cart/icon_required.png" id="icon_internet" alt="필수"/>
              인터넷 이용장소</th>
            <td><select id="internet" name="internet" fw-filter="isFill" fw-label="internet" fw-msg="" >
<option value="internet_00">선택</option>
<option value="internet_01">집</option>
<option value="internet_02">회사</option>
<option value="internet_03">PC방</option>
<option value="internet_04">기타</option>
</select></td>
          </tr>
<tr class="displaynone">
<th scope="row">
<img src="/web/upload/hncok/img/cart/icon_required.png" id="icon_interest" alt="필수"/>
              관심분야</th>
            <td>
              <div class="interest"><input id="inter_check0" name="inter_check[]" fw-filter="" fw-label="inter_check" fw-msg="" value="0" type="checkbox"  /><label for="inter_check0" >애니메이션</label>
<input id="inter_check1" name="inter_check[]" fw-filter="" fw-label="inter_check" fw-msg="" value="1" type="checkbox"  /><label for="inter_check1" >영화/연극</label>
<input id="inter_check2" name="inter_check[]" fw-filter="" fw-label="inter_check" fw-msg="" value="2" type="checkbox"  /><label for="inter_check2" >놀이공원</label>
<input id="inter_check3" name="inter_check[]" fw-filter="" fw-label="inter_check" fw-msg="" value="3" type="checkbox"  /><label for="inter_check3" >경품정보</label>
<input id="inter_check4" name="inter_check[]" fw-filter="" fw-label="inter_check" fw-msg="" value="4" type="checkbox"  /><label for="inter_check4" >미술전시회</label>
<input id="inter_check5" name="inter_check[]" fw-filter="" fw-label="inter_check" fw-msg="" value="5" type="checkbox"  /><label for="inter_check5" >클래식 콘서트</label>
<input id="inter_check6" name="inter_check[]" fw-filter="" fw-label="inter_check" fw-msg="" value="6" type="checkbox"  /><label for="inter_check6" >패션/미용</label>
<input id="inter_check7" name="inter_check[]" fw-filter="" fw-label="inter_check" fw-msg="" value="7" type="checkbox"  /><label for="inter_check7" >정치</label>
<input id="inter_check8" name="inter_check[]" fw-filter="" fw-label="inter_check" fw-msg="" value="8" type="checkbox"  /><label for="inter_check8" >IT/정보통신</label>
<input id="inter_check9" name="inter_check[]" fw-filter="" fw-label="inter_check" fw-msg="" value="9" type="checkbox"  /><label for="inter_check9" >스포츠</label>
<input id="inter_check10" name="inter_check[]" fw-filter="" fw-label="inter_check" fw-msg="" value="10" type="checkbox"  /><label for="inter_check10" >요리/음식</label>
<input id="inter_check11" name="inter_check[]" fw-filter="" fw-label="inter_check" fw-msg="" value="11" type="checkbox"  /><label for="inter_check11" >연예인</label>
<input id="inter_check12" name="inter_check[]" fw-filter="" fw-label="inter_check" fw-msg="" value="12" type="checkbox"  /><label for="inter_check12" >여성/주부</label>
<input id="inter_check13" name="inter_check[]" fw-filter="" fw-label="inter_check" fw-msg="" value="13" type="checkbox"  /><label for="inter_check13" >육아</label>
<input id="inter_check14" name="inter_check[]" fw-filter="" fw-label="inter_check" fw-msg="" value="14" type="checkbox"  /><label for="inter_check14" >비즈니스/금융/부동산</label>
<input id="inter_check15" name="inter_check[]" fw-filter="" fw-label="inter_check" fw-msg="" value="15" type="checkbox"  /><label for="inter_check15" >주식/증권</label>
<input id="inter_check16" name="inter_check[]" fw-filter="" fw-label="inter_check" fw-msg="" value="16" type="checkbox"  /><label for="inter_check16" >스포츠/레져/취미</label>
<input id="inter_check17" name="inter_check[]" fw-filter="" fw-label="inter_check" fw-msg="" value="17" type="checkbox"  /><label for="inter_check17" >경매/공동구매</label>
<input id="inter_check18" name="inter_check[]" fw-filter="" fw-label="inter_check" fw-msg="" value="18" type="checkbox"  /><label for="inter_check18" >뉴스/정보</label>
<input id="inter_check19" name="inter_check[]" fw-filter="" fw-label="inter_check" fw-msg="" value="19" type="checkbox"  /><label for="inter_check19" >컴퓨터/게임</label>
<input id="inter_check20" name="inter_check[]" fw-filter="" fw-label="inter_check" fw-msg="" value="20" type="checkbox"  /><label for="inter_check20" >대학교/대학원정보</label>
<input id="inter_check21" name="inter_check[]" fw-filter="" fw-label="inter_check" fw-msg="" value="21" type="checkbox"  /><label for="inter_check21" >건강/의료</label>
<input id="inter_check22" name="inter_check[]" fw-filter="" fw-label="inter_check" fw-msg="" value="22" type="checkbox"  /><label for="inter_check22" >자동차/여행</label>
<input id="inter_check23" name="inter_check[]" fw-filter="" fw-label="inter_check" fw-msg="" value="23" type="checkbox"  /><label for="inter_check23" >쇼핑/전자상거래</label>
<input id="inter_check24" name="inter_check[]" fw-filter="" fw-label="inter_check" fw-msg="" value="24" type="checkbox"  /><label for="inter_check24" >구인/구직</label>
<input id="inter_check25" name="inter_check[]" fw-filter="" fw-label="inter_check" fw-msg="" value="25" type="checkbox"  /><label for="inter_check25" >어학강좌</label>
<input id="inter_check26" name="inter_check[]" fw-filter="" fw-label="inter_check" fw-msg="" value="26" type="checkbox"  /><label for="inter_check26" >기타등등</label></div>
            </td>
          </tr>
<tr class="">
<th scope="row">
<img src="/web/upload/hncok/img/cart/icon_required.png" id="icon_add1" alt="필수"/>
              츄를 알게된 계기</th>
            <td><label for=add10><input id="add10" name="add1[]" fw-filter="" fw-label="추가항목1" fw-msg="" value="인스타" type="checkbox"  />인스타</label>
<label for=add11><input id="add11" name="add1[]" fw-filter="" fw-label="추가항목1" fw-msg="" value="페이스북" type="checkbox"  />페이스북</label>
<label for=add12><input id="add12" name="add1[]" fw-filter="" fw-label="추가항목1" fw-msg="" value="유튜브" type="checkbox"  />유튜브</label>
<label for=add13><input id="add13" name="add1[]" fw-filter="" fw-label="추가항목1" fw-msg="" value="트위터" type="checkbox"  />트위터</label>
<label for=add14><input id="add14" name="add1[]" fw-filter="" fw-label="추가항목1" fw-msg="" value="지인소개" type="checkbox"  />지인소개</label>
<label for=add15><input id="add15" name="add1[]" fw-filter="" fw-label="추가항목1" fw-msg="" value="오프라인매장" type="checkbox"  />오프라인매장</label>
<label for=add16><input id="add16" name="add1[]" fw-filter="" fw-label="추가항목1" fw-msg="" value="기타" type="checkbox"  />기타</label></td>
          </tr>
<tr class="displaynone">
<th scope="row">
<img src="/web/upload/hncok/img/cart/icon_required.png" id="icon_add2" alt="필수"/>
              </th>
            <td><input id="add2" name="add2" fw-filter="" fw-label="추가항목2" fw-msg="" class="inputTypeText" placeholder="" maxlength="200" value="" type="text"  /></td>
          </tr>
<tr class="displaynone">
<th scope="row">
<img src="/web/upload/hncok/img/cart/icon_required.png" id="icon_add3" alt="필수"/>
              </th>
            <td><input id="add3" name="add3" fw-filter="" fw-label="추가항목3" fw-msg="" class="inputTypeText" placeholder="" maxlength="200" value="" type="text"  /></td>
          </tr>
<tr class="displaynone">
<th scope="row">
<img src="/web/upload/hncok/img/cart/icon_required.png" id="icon_add4" alt="필수"/>
              </th>
            <td><input id="add4" name="add4" fw-filter="" fw-label="추가항목4" fw-msg="" class="inputTypeText" placeholder="" maxlength="200" value="" type="text"  /></td>
          </tr>
<tr class="displaynone">
<th scope="row">
<img src="/web/upload/hncok/img/cart/icon_required.png" id="icon_reco_id" alt="필수"/>
              추천인 아이디</th>
            <td><input id="reco_id" name="reco_id" fw-filter="" fw-label="추천인 ID" fw-msg="" class="inputTypeText" placeholder="" value="" type="text"  /></td>
          </tr>
<tr class="">
<th scope="row">
<img src="/web/upload/hncok/img/cart/icon_required.png" id="icon_is_display_bank" alt="필수"/>
              환불계좌 정보</th>
            <td>
              <ul class="account">
<li>
                  <strong>예금주</strong>
                  <input id="bank_account_owner" name="bank_account_owner" fw-filter="" fw-label="예금주" fw-msg="" class="inputTypeText" placeholder="" autocomplete="off" value="" type="text"  />                </li>
                <li>
                  <strong>은행명</strong>
                  <select id="refund_bank_code" name="refund_bank_code" fw-filter="" fw-label="은행명" fw-msg="" >
<option value="" selected="selected">- 은행선택 -</option>
<option value="bank_02">산업은행</option>
<option value="bank_03">기업은행</option>
<option value="bank_04">국민은행</option>
<option value="bank_05">외환은행</option>
<option value="bank_07">수협중앙회</option>
<option value="bank_11">농협중앙회</option>
<option value="bank_12">농협개인</option>
<option value="bank_13">농협</option>
<option value="bank_20">우리은행</option>
<option value="bank_209">유안타증권</option>
<option value="bank_218">KB증권</option>
<option value="bank_23">SC제일은행</option>
<option value="bank_230">미래에셋증권</option>
<option value="bank_238">대우증권</option>
<option value="bank_240">삼성증권</option>
<option value="bank_243">한국투자증권</option>
<option value="bank_26">신한은행</option>
<option value="bank_261">교보증권</option>
<option value="bank_262">하이투자증권</option>
<option value="bank_263">현대차증권</option>
<option value="bank_266">SK증권</option>
<option value="bank_267">대신증권</option>
<option value="bank_269">한화증권</option>
<option value="bank_270">하나대투증권</option>
<option value="bank_278">신한금융투자</option>
<option value="bank_279">동부증권</option>
<option value="bank_280">유진투자증권</option>
<option value="bank_287">메리츠증권</option>
<option value="bank_289">NH투자증권</option>
<option value="bank_291">신영증권</option>
<option value="bank_292">케이뱅크</option>
<option value="bank_293">카카오뱅크</option>
<option value="bank_295">OK저축은행</option>
<option value="bank_31">대구은행</option>
<option value="bank_32">부산은행</option>
<option value="bank_34">광주은행</option>
<option value="bank_35">제주은행</option>
<option value="bank_37">전북은행</option>
<option value="bank_39">경남은행</option>
<option value="bank_52">모건스탠리은행</option>
<option value="bank_53">씨티은행</option>
<option value="bank_57">유에프제이은행</option>
<option value="bank_58">미즈호코퍼레이트은행</option>
<option value="bank_59">미쓰비시도쿄은행</option>
<option value="bank_60">뱅크오브아메리카</option>
<option value="bank_71">우체국</option>
<option value="bank_76">신용보증기금</option>
<option value="bank_77">기술신용보증기금</option>
<option value="bank_81">KEB하나은행</option>
<option value="bank_82">농협회원조합</option>
<option value="bank_83">도이치은행</option>
<option value="bank_84">상호저축은행</option>
<option value="bank_85">새마을금고</option>
<option value="bank_86">수출입은행</option>
<option value="bank_87">신용협동조합</option>
<option value="bank_89">홍콩상하이은행(HSBC)</option>
<option value="bank_90">에이비엔암로은행</option>
<option value="bank_91">산림조합</option>
<option value="bank_93">한국주택금융공사</option>
<option value="bank_94">서울보증보험</option>
<option value="bank_95">경찰청</option>
<option value="bank_99">금융결제원</option>
</select>                </li>
                <li>
                  <strong>계좌번호</strong>
                  <input id="bank_account_no" name="bank_account_no" fw-filter="" fw-label="계좌번호" fw-msg="" class="inputTypeText" placeholder="" autocomplete="off" value="" type="text"  />                  ('-'와 숫자만 입력해주세요.)
                </li>
              </ul>
</td>
          </tr>
</tbody>
</div>
    </table>
</div>
<div class="teenager">* 만 14세 미만 청소년의 경우 가입하기를 누르신 후 나오는 <span>*14세미만 청소년 정보제공 및 활용동의서</span> 를 반드시 제출해 주시기
    바랍니다.  </div>
<div class="title">
    <h3>이용약관 동의</h3>
  </div>
<div class="agreeArea">
    <div class="agree">
      <p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;">
      <br />제1조(목적)<br />
      이 약관은 (주)피피비스튜디오스(전자상거래 사업자)가 운영하는 CHUU(chuu.co.kr) 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리․의무 및 책임사항을 규정함을 목적으로 합니다.<br />※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」</p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;"><br></p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;"><br />제2조(정의)<br />① “몰”이란 (주)피피비스튜디오스가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 몰을 운영하는 사업자의 의미로도 사용합니다.<br />② “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.<br />③ ‘회원’이라 함은 “몰”에 (삭제) 회원등록을 한 자로서, 계속적으로 “몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.<br />④ ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.</p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;"><br></p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;"><br />제3조 (약관 등의 명시와 설명 및 개정) <br />① “몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호․모사전송번호․전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.<br />② “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회․배송책임․환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.<br />③ “몰”은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.<br />④ “몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 "몰“은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다. <br />⑤ “몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 “몰”에 송신하여 “몰”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.<br />⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다.</p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;"><br></p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;"><br />제4조(서비스의 제공 및 변경) <br />① “몰”은 다음과 같은 업무를 수행합니다.<br />&nbsp;&nbsp; 1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결<br />&nbsp; 2. 구매계약이 체결된 재화 또는 용역의 배송<br />&nbsp; 3. 기타 “몰”이 정하는 업무<br />② “몰”은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.<br />③ “몰”이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.<br />④ 전항의 경우 “몰”은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.</p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;"><br></p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;"><br />제5조(서비스의 중단) <br />① “몰”은 컴퓨터 등 정보통신설비의 보수점검․교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.<br />② “몰”은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.<br />③ 사업종목의 전환, 사업의 포기, 업체 간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 “몰”은 제8조에 정한 방법으로 이용자에게 통지하고 당초 “몰”에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, “몰”이 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는 적립금 등을 “몰”에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.</p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;"><br></p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;"><br />제6조(회원가입) <br />① 이용자는 “몰”이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.<br />② “몰”은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.<br />&nbsp;&nbsp; 1. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 “몰”의 회원재가입 승낙을 얻은 경우에는 예외로 한다.<br />&nbsp;&nbsp; 2. 등록 내용에 허위, 기재누락, 오기가 있는 경우<br />&nbsp; 3. 기타 회원으로 등록하는 것이 “몰”의 기술상 현저히 지장이 있다고 판단되는 경우<br />③ 회원가입계약의 성립 시기는 “몰”의 승낙이 회원에게 도달한 시점으로 합니다.<br />④ 회원은 회원가입 시 등록한 사항에 변경이 있는 경우, 상당한 기간 이내에 “몰”에 대하여 회원정보 수정 등의 방법으로 그 변경사항을 알려야 합니다.</p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;"><br></p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;">제7조(회원 탈퇴 및 자격 상실 등) <br />① 회원은 “몰”에 언제든지 탈퇴를 요청할 수 있으며 “몰”은 즉시 회원탈퇴를 처리합니다.<br />② 회원이 다음 각 호의 사유에 해당하는 경우, “몰”은 회원자격을 제한 및 정지시킬 수 있습니다.<br />&nbsp;&nbsp; 1. 가입 신청 시에 허위 내용을 등록한 경우<br />&nbsp; 2. “몰”을 이용하여 구입한 재화 등의 대금, 기타 “몰”이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우<br />&nbsp; 3. 다른 사람의 “몰” 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우<br />&nbsp; 4. “몰”을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우<br />③ “몰”이 회원 자격을 제한․정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 “몰”은 회원자격을 상실시킬 수 있습니다.<br />④ “몰”이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.</p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;"><br></p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;">제8조(회원에 대한 통지)<br />① “몰”이 회원에 대한 통지를 하는 경우, 회원이 “몰”과 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다.<br />② “몰”은 불특정다수 회원에 대한 통지의 경우 1주일이상 “몰” 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.</p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;"><br></p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;">제9조(구매신청) <br />① “몰”이용자는 “몰”상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, “몰”은 이용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다. (삭제)<br />&nbsp;&nbsp; 1. 재화 등의 검색 및 선택<br />&nbsp; 2. 받는 사람의 성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력<br />&nbsp; 3. 약관내용, 청약철회권이 제한되는 서비스, 배송료․설치비 등의 비용부담과 관련한 내용에 대한 확인<br />&nbsp; 4. 이 약관에 동의하고 위 3.호의 사항을 확인하거나 거부하는 표시(예, 마우스 클릭)<br />&nbsp;&nbsp; 5. 재화등의 구매신청 및 이에 관한 확인 또는 “몰”의 확인에 대한 동의<br />&nbsp; 6. 결제방법의 선택<br />② “몰”이 제3자에게 구매자 개인정보를 제공•위탁할 필요가 있는 경우 실제 구매신청 시 구매자의 동의를 받아야 하며, 회원가입 시 미리 포괄적으로 동의를 받지 않습니다. 이 때 “몰”은 제공되는 개인정보 항목, 제공받는 자, 제공받는 자의 개인정보 이용 목적 및 보유‧이용 기간 등을 구매자에게 명시하여야 합니다. 다만 「정보통신망이용촉진 및 정보보호 등에 관한 법률」 제25조 제1항에 의한 개인정보 취급위탁의 경우 등 관련 법령에 달리 정함이 있는 경우에는 그에 따릅니다.</p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;"><br></p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;">제10조 (계약의 성립)<br />① “몰”은 제9조와 같은 구매신청에 대하여 다음 각 호에 해당하면 승낙하지 않을 수 있습니다. 다만, 미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다.<br />&nbsp;&nbsp; 1. 신청 내용에 허위, 기재누락, 오기가 있는 경우<br />&nbsp; 2. 미성년자가 담배, 주류 등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우<br />&nbsp; 3. 기타 구매신청에 승낙하는 것이 “몰” 기술상 현저히 지장이 있다고 판단하는 경우<br />② “몰”의 승낙이 제12조제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.<br />③ “몰”의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소 등에 관한 정보 등을 포함하여야 합니다.</p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;"><br />제11조(지급방법)<br />“몰”에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각 호의 방법중 가용한 방법으로 할 수 있습니다. 단, “몰”은 이용자의 지급방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도 추가하여 징수할 수 없습니다.<br />1. 폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의 각종 계좌이체 <br />2. 선불카드, 직불카드, 신용카드 등의 각종 카드 결제<br />3. 온라인무통장입금<br />4. 전자화폐에 의한 결제<br />5. 수령 시 대금지급<br />6. 마일리지 등 “몰”이 지급한 포인트에 의한 결제<br />7. “몰”과 계약을 맺었거나 “몰”이 인정한 상품권에 의한 결제 <br />8. 기타 전자적 지급 방법에 의한 대금 지급 등</p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;"><br />제12조(수신확인통지․구매신청 변경 및 취소)<br />① “몰”은 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.<br />② 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있고 “몰”은 배송 전에 이용자의 요청이 있는 경우에는 지체 없이 그 요청에 따라 처리하여야 합니다. 다만 이미 대금을 지불한 경우에는 제15조의 청약철회 등에 관한 규정에 따릅니다.</p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;"><br />제13조(재화 등의 공급)<br />① “몰”은 이용자와 재화 등의 공급시기에 관하여 별도의 약정이 없는 이상, 이용자가 청약을 한 날부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다. 다만, “몰”이 이미 재화 등의 대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는 일부를 받은 날부터 3영업일 이내에 조치를 취합니다. 이때 “몰”은 이용자가 재화 등의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다.<br />② “몰”은 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다. 만약 “몰”이 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 합니다. 다만 “몰”이 고의․과실이 없음을 입증한 경우에는 그러하지 아니합니다.</p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;"><br></p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;">제14조(환급)<br />“몰”은 이용자가 구매신청한 재화 등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 3영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다.</p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;"><br></p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;">제15조(청약철회 등)<br />① “몰”과 재화등의 구매에 관한 계약을 체결한 이용자는 「전자상거래 등에서의 소비자보호에 관한 법률」 제13조 제2항에 따른 계약내용에 관한 서면을 받은 날(그 서면을 받은 때보다 재화 등의 공급이 늦게 이루어진 경우에는 재화 등을 공급받거나 재화 등의 공급이 시작된 날을 말합니다)부터 7일 이내에는 청약의 철회를 할 수 있습니다. 다만, 청약철회에 관하여 「전자상거래 등에서의 소비자보호에 관한 법률」에 달리 정함이 있는 경우에는 동 법 규정에 따릅니다. <br />② 이용자는 재화 등을 배송 받은 경우 다음 각 호의 1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다.<br />&nbsp;&nbsp; 1. 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우(다만, 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다)<br />&nbsp;&nbsp; 2. 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우<br />&nbsp; 3. 시간의 경과에 의하여 재판매가 곤란할 정도로 재화등의 가치가 현저히 감소한 경우<br />&nbsp; 4. 같은 성능을 지닌 재화 등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우<br />③ 제2항제2호 내지 제4호의 경우에 “몰”이 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약철회 등이 제한되지 않습니다.<br />④ 이용자는 제1항 및 제2항의 규정에 불구하고 재화 등의 내용이 표시•광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 재화 등을 공급받은 날부터 3월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다.</p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;"><br></p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;"><br />제16조(청약철회 등의 효과)<br />① “몰”은 이용자로부터 재화 등을 반환받은 경우 3영업일 이내에 이미 지급받은 재화 등의 대금을 환급합니다. 이 경우 “몰”이 이용자에게 재화등의 환급을 지연한때에는 그 지연기간에 대하여 「전자상거래 등에서의 소비자보호에 관한 법률 시행령」제21조의2에서 정하는 지연이자율(괄호 부분 삭제)을 곱하여 산정한 지연이자를 지급합니다.<br />② “몰”은 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 결제수단으로 재화 등의 대금을 지급한 때에는 지체 없이 당해 결제수단을 제공한 사업자로 하여금 재화 등의 대금의 청구를 정지 또는 취소하도록 요청합니다.<br />③ 청약철회 등의 경우 공급받은 재화 등의 반환에 필요한 비용은 이용자가 부담합니다. “몰”은 이용자에게 청약철회 등을 이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만 재화 등의 내용이 표시•광고 내용과 다르거나 계약내용과 다르게 이행되어 청약철회 등을 하는 경우 재화 등의 반환에 필요한 비용은 “몰”이 부담합니다.<br />④ 이용자가 재화 등을 제공받을 때 발송비를 부담한 경우에 “몰”은 청약철회 시 그 비용을 누가 부담하는지를 이용자가 알기 쉽도록 명확하게 표시합니다.</p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;"><br />제17조(개인정보보호)<br />① “몰”은 이용자의 개인정보 수집시 서비스제공을 위하여 필요한 범위에서 최소한의 개인정보를 수집합니다. <br />② “몰”은 회원가입시 구매계약이행에 필요한 정보를 미리 수집하지 않습니다. 다만, 관련 법령상 의무이행을 위하여 구매계약 이전에 본인확인이 필요한 경우로서 최소한의 특정 개인정보를 수집하는 경우에는 그러하지 아니합니다.<br />③ “몰”은 이용자의 개인정보를 수집•이용하는 때에는 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. <br />④ “몰”은 수집된 개인정보를 목적외의 용도로 이용할 수 없으며, 새로운 이용목적이 발생한 경우 또는 제3자에게 제공하는 경우에는 이용•제공단계에서 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. 다만, 관련 법령에 달리 정함이 있는 경우에는 예외로 합니다.<br />⑤ “몰”이 제2항과 제3항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보관리 책임자의 신원(소속, 성명 및 전화번호, 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받은자, 제공목적 및 제공할 정보의 내용) 등 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」 제22조제2항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.<br />⑥ 이용자는 언제든지 “몰”이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 “몰”은 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 “몰”은 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.<br />⑦ “몰”은 개인정보 보호를 위하여 이용자의 개인정보를 취급하는 자를 최소한으로 제한하여야 하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 동의 없는 제3자 제공, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.<br />⑧ “몰” 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다.<br />⑨ “몰”은 개인정보의 수집•이용•제공에 관한 동의란을 미리 선택한 것으로 설정해두지 않습니다. 또한 개인정보의 수집•이용•제공에 관한 이용자의 동의거절시 제한되는 서비스를 구체적으로 명시하고, 필수수집항목이 아닌 개인정보의 수집•이용•제공에 관한 이용자의 동의 거절을 이유로 회원가입 등 서비스 제공을 제한하거나 거절하지 않습니다.</p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;"><br></p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;"><br />제18조(“몰“의 의무)<br />① “몰”은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화․용역을 제공하는데 최선을 다하여야 합니다.<br />② “몰”은 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.<br />③ “몰”이 상품이나 용역에 대하여 「표시․광고의 공정화에 관한 법률」 제3조 소정의 부당한 표시․광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.<br />④ “몰”은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.</p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;"><br></p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;"><br />제19조(회원의 ID 및 비밀번호에 대한 의무)<br />① 제17조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.<br />② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.<br />③ 회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 “몰”에 통보하고 “몰”의 안내가 있는 경우에는 그에 따라야 합니다.</p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;"><br></p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;"><br />제20조(이용자의 의무)<br />이용자는 다음 행위를 하여서는 안 됩니다.<br />1. 신청 또는 변경시 허위 내용의 등록<br />2. 타인의 정보 도용<br />3. “몰”에 게시된 정보의 변경<br />4. “몰”이 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시<br />5. “몰” 기타 제3자의 저작권 등 지적재산권에 대한 침해<br />6. “몰” 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위<br />7. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 몰에 공개 또는 게시하는 행위</p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;"><br></p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;"><br />제21조(연결“몰”과 피연결“몰” 간의 관계)<br />① 상위 “몰”과 하위 “몰”이 하이퍼링크(예: 하이퍼링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등으로 연결된 경우, 전자를 연결 “몰”(웹 사이트)이라고 하고 후자를 피연결 “몰”(웹사이트)이라고 합니다.<br />② 연결“몰”은 피연결“몰”이 독자적으로 제공하는 재화 등에 의하여 이용자와 행하는 거래에 대해서 보증 책임을 지지 않는다는 뜻을 연결“몰”의 초기화면 또는 연결되는 시점의 팝업화면으로 명시한 경우에는 그 거래에 대한 보증 책임을 지지 않습니다.</p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;"><br></p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;"><br />제22조(저작권의 귀속 및 이용제한)<br />① “몰“이 작성한 저작물에 대한 저작권 기타 지적재산권은 ”몰“에 귀속합니다.<br />② 이용자는 “몰”을 이용함으로써 얻은 정보 중 “몰”에게 지적재산권이 귀속된 정보를 “몰”의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.<br />③ “몰”은 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다.<br />④ "몰"은 이용자가 작성한 상품평, 포토리뷰 등 상품 및 서비스와 관련된 모든 컨텐츠를 무상으로 이용할 수 있고, 이용자는 이를 허락합니다.<br />⑤ 본 조 제3항에도 불구하고 제4항의 상품평, 포토리뷰 등의 모든 컨텐츠를 회사가 제공하거나 운영하는 서비스, 제휴관계가 체결되어 있는 경우에 이용할 경우 이용자에 대한 통보 없이 이용할 수 있습니다.</p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;"><br></p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;"><br />제23조(분쟁해결)<br />① “몰”은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치․운영합니다.<br />② “몰”은 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다.<br />③ “몰”과 이용자 간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시•도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.</p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;"><br></p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;"><br />제24조(재판권 및 준거법)<br />① “몰”과 이용자 간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.<br />② “몰”과 이용자 간에 제기된 전자상거래 소송에는 한국법을 적용합니다.</p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;"><br></p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;">제25조(적립금 제도)<br />①쇼핑몰은 특정 재화등을 구입하거나 특정 결재수단으로 구입하는 회원에게 다음 각 호의 운영정책에 따라 적립금을 부여할 수 있습니다.<br />- 이용자는 재화등 구매 및 배송 후 쇼핑몰 사이트 내의 적립금 확인 절차를 통하여 재화등 구매 시 약정된 적립금을 부여 받을 수 있습니다.<br />- 이용자의 적립금 확인 절차 진행 시 쇼핑몰은 배송 관련 설문지 등의 작성을 이용자에게 요청할 수 있습니다.<br />②쇼핑몰은 적립금 부여를 안내한 재화등의 판매가에 대하여 특정한 비율만큼 적립금을 부여합니다.<br />③쇼핑몰의 운영정책에 따라 재화등별 주문증가에 따른 추가적립금 부여가 불가능할 수 있고, 적립금 사용 가능 시점 및 적립금의 분할 사용 가능 여부가 다를 수 있습니다.<br />④적립금은 사이트내에서 재화 등 구매시 현금가액과 동일하게 사용할 수 있으나 현금으로 교환할 수 없습니다. (단,적립금 사용이 불가하다고 사전 고지한 품목은 제외됩니다.)<br />⑤이용자가 구매한 상품에 대하여 ‘이용자’의 잘못으로 취소 및 반품 상황이 발생하였을 경우, 이미 적립된 적립금을 사용한 때에는 개인의 기적립 적립금에서 사용분 만큼 차감됩니다. 이미 적립된 적립금 잔여분이 없을 경우에는 사용분 금액에 대하여 별도 대금을 지급하여야 합니다.<br />⑥적립금 사용 가능 조건 및 소멸에 대한 내용이 별도로 공지된 경우(그 기간을 사용기한으로 정함)<br />또한 적립금의 유효기간은 적립금 지급 시점을 기준으로 12개월 이며, 유효기간 내에 사용되지 않은 적립금은 기간 만료 시 매년 12월 30일 자정 자동 소멸됩니다</p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;"><br></p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;"><br></p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;">제26조(카카오 알림톡 시행에 따른 데이터 이용)<br />①신규 회원의 전화번호수집 양식 및 기존 회원 대상의 공지 이메일 등을 통해 안내 주문, 배송 정보 등 비광고성 정보를 카카오톡 알림톡으로 알려드리며, <span style="font-size: 9pt;">만약 알림톡 수신이 불가능하거나 수신 차단하신 경우에는 일반 문자 메시지로 보내드립니다. 와이파이 아닌 이동통신망으로 접속시 알림톡 수신 중 데이터요금이 발생할 수 있습니다. </span>알림톡과는 다른 방식으로 정보 수신을 원하시면 알림톡을 차단해주세요.<br />②"몰"은 카카오톡 플러스친구, 상담톡으로 상담업무를 진행합니다. 카카오톡을 통한 상담을 원치 않으실 경우 고객센터, 게시판 문의를 이용해 주시기 바랍니다.</p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;"><br></p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;">제27조(경품지급)<br />"몰"이 이용자에게 경품을 지급할 경우 이용자는 경품의 추첨일로부터 3개월 이내에 "몰"에 경품 지급을 요청 할 수 있습니다. 단, 경품추첨 및 경품지급과 관련하여 "몰"이 별도의 통지 또는 공지를 하는 경우 그에 따릅니다.</p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;"><br></p><span style="color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;">제28조(할인쿠폰)</span><br style="color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;"><p style="padding-bottom: 7px;"><span style="color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;">① </span><font color="#8f8f8f" face="Overpass, NanumBarunGothic, sans-serif"><span style="font-size: 11px; letter-spacing: -0.25px;">할인쿠폰은 발행대상, 발행경로, 사용대상 등에 따라 구분될 수 있으며, 할인쿠폰의 세부구분, 할인금액(할인율), 사용방법, 사용기한 및 제한에 대한 사항은 할인쿠폰 또는 서비스화면에 표시됩니다. 할인쿠폰의 종류 및 내용과 발급여부에 관하여는 "몰'의 정책에 따라 달라질 수 있습니다.</span></font><br style="color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;"><span style="color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;">② </span><font color="#8f8f8f" face="Overpass, NanumBarunGothic, sans-serif"><span style="font-size: 11px; letter-spacing: -0.25px;">할인쿠폰은 현금으로 출금될 수 없으며, 할인쿠폰에 표시된 유효기간이 만료되거나 이용계약이 종료되면 소멸합니다.</span></font><br style="color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;"><span style="color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;">③</span><font color="#8f8f8f" face="Overpass, NanumBarunGothic, sans-serif"><span style="font-size: 11px; letter-spacing: -0.25px;">회원 탈퇴 시 "몰"로부터 발급받은 할인쿠폰 중 미사용한 할인쿠폰은 즉시 소멸되며, 탈퇴 후 재가입하더라도 복구되지 아니합니다.</span></font><br style="color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;"><span style="color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;">④ </span><font color="#8f8f8f" face="Overpass, NanumBarunGothic, sans-serif"><span style="font-size: 11px; letter-spacing: -0.25px;">"몰" 은 "회원" 이 할인쿠폰 사용 후 구매 취소 또는 반품/환불을 요청하는 경우 아래 내용에 따릅니다.</span></font></p><p style="padding-bottom: 3px;"><span style="color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;">1.주문취소</span></p><p style="padding-bottom: 3px;"><span style="color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;">• 배송 전 취소의 경우, 할인쿠폰 복구처리 (잔여 유효기간 내 재사용 가능)</span></p><p style="padding-bottom: 3px;"><span style="color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;">2.반품</span></p><p style="padding-bottom: 3px;"><span style="color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;">• 단순변심 반품사유&nbsp; 시 - 사용쿠폰 복구처리 (잔여 유효기간 내 재사용 가능)</span></p><p style="padding-bottom: 13px;"><span style="color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;">• 판매자 귀책사유 시 – 동일쿠폰 재발급</span></p><p style="padding-bottom: 17px;"><br></p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;">부 칙(시행일) 이 약관은 2012년 2월 14일부터 시행합니다.</p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;">부 칙(시행일) 이 약관은 2016년 2월 19일부터 시행합니다.</p><p style="padding-bottom: 13px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;">부 칙(시행일) 이 약관은 2016년 12월 12일부터 시행합니다.</p><p style="padding-bottom: 13px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;">부 칙(시행일) 이 약관은 2017년 1월 6일부터 시행합니다.</p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;">부 칙(시행일) 이 약관은 2017년 9월 1일부터 시행합니다.</p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;">부 칙(시행일) 이 약관은 2018년 9월 3일부터 시행합니다.</p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;">부 칙(시행일) 이 약관은 2019년 4월 1일부터 시행합니다.</p><p style="padding-bottom: 17px; color: rgb(143, 143, 143); font-family: Overpass, NanumBarunGothic, sans-serif; font-size: 11px; letter-spacing: -0.25px;">&nbsp;</p><p></p></div>
    <p class="check"><span>이용약관에 동의하십니까?</span> 
    <input id="agree_service_check0" name="agree_service_check[]" fw-filter="/1/" 
    fw-label="이용약관 동의" fw-msg="이용약관에 동의 하세요" value="1" type="checkbox"  />
    <label for="agree_service_check0" >동의함</label></p>
  </div>
<div class="title">
    <h3>개인정보 수집 및 이용 동의</h3>
  </div>
<div class="agreeArea">
    <div class="agree">
      <span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">■ 수집하는 개인정보 항목</span></span></span><br /><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">회사는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다.</span></span></span><p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);"> ο 수집항목 : 이름 , 생년월일 , 성별 , 로그인ID , 비밀번호 , 비밀번호 질문과 답변 , 자택 전화번호 , 자택 주소 , 휴대전화번호 , 이메일 , 직업 , 회사명 , 부서 , 직책 , 회사전화번호 , 취미 , 결혼여부 , 기념일 , 법정대리인정보 , 서비스 이용기록 , 접속 로그 , 접속 IP 정보 , 결제기록</span></span></span><br /><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">ο 개인정보 수집방법 : 홈페이지(회원가입), 서면양식, 배송요청 </span></span></span></p><p><br></p><p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);"> ■ 개인정보의 수집 및 이용목적</span></span></span></p><p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.</span></span></span></p><p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">o 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산</span></span></span></p><p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송 , 금융거래 본인 인증 및 금융 서비스</span></span></span></p><p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">o 회원 관리</span></span></span></p><p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지 , 가입 의사 확인 , 연령확인 , 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 불만처리 등 민원처리 , 고지사항 전달</span></span></span></p><p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">o 마케팅 및 광고에 활용</span></span></span></p><p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">이벤트 등 광고성 정보 전달 , 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계, 신규 서비스 개발 및 안내, 고객 최적화된 서비스 제공, 상품 및 서비스 이용 실적 분석, 고객 대상 설문조사, 정기 간행물 발송 </span></span></span></p><div><br></div><p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);"> ■ 개인정보의 보유 및 이용기간</span></span></span></p><p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);"> 회사는 개인정보 수집 및 이용목적이 달성된 후에는 예외 없이 해당 정보를 지체 없이 파기합니다. 단, 별도 명시한 경우 보존합니다.</span></span></span></p><p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">■ 개인정보 제공</span></span></span><br /><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">회사는 이용자의 개인정보를 원칙적으로 외부에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.</span></span></span><br /><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">o 이용자들이 사전에 동의한 경우</span></span></span><br /><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">o 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우</span></span></span></p><p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">■ 수집한 개인정보의 위탁</span></span></span></p><p align="left" style="margin: 1.5pt 0cm; line-height: normal;"><span style="font-family: 돋움; font-size: 9pt;"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">회사는 서비스 이행을 위해 아래와 같이 외부 전문업체에 위탁하여 운영하고 있습니다</span></span></span><span lang="EN-US"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">.</span></span></span><br /></span></span></p><p class="MsoNormal" align="left" style="margin: 1.5pt 0cm 0.0001pt; line-height: normal; word-break: keep-all;"><span lang="EN-US" style="font-size: 9pt;"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">&nbsp;</span></span></span></span></p><p align="left" style="margin: 1.5pt 0cm; line-height: normal;"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">

</span></span></span></p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
 </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
 </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
 </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
 </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
 </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
 </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
 </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
 </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
 </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
 </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
 </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
 </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
 </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
 </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
 </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
 </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
 </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
 </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
 </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
 </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
 </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
 </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
 </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
 </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
 </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
 </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
 </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
 </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
 </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
 </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
 </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
 </span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
</span></span></span><table class="MsoNormalTable" border="0" cellspacing="0" cellpadding="0" style="max-width:481.7pt;width:90%;border-collapse:collapse;mso-yfti-tbllook:1184;
 mso-padding-alt:0cm 0cm 0cm 0cm"><tbody><tr style="mso-yfti-irow:0;mso-yfti-firstrow:yes;height:6.95pt"><td nowrap="" style="max-width:219.5pt;width:45%;border:solid windowtext 1.0pt;
  background:#B7DEE8;padding:0cm 4.95pt 0cm 4.95pt;height:6.95pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><p class="MsoNormal" align="center" style="margin-top:1.5pt;margin-right:0cm;
  margin-bottom:1.5pt;margin-left:0cm;text-align:center;line-height:normal;
  mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:9.0pt;font-family:돋움;mso-bidi-font-family:
  굴림;mso-font-kerning:0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">위탁받은자</span></span></span></span><span lang="EN-US" style="font-size:12.0pt;
  font-family:굴림;mso-bidi-font-family:굴림;mso-font-kerning:0pt"></span></p><p></p><p></p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span></td><td nowrap="" style="max-width:262.2pt;;border:solid windowtext 1.0pt;
  border-left:none;background:#B7DEE8;padding:0cm 4.95pt 0cm 4.95pt;height:
  6.95pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><p class="MsoNormal" align="center" style="margin-top:1.5pt;margin-right:0cm;
  margin-bottom:1.5pt;margin-left:0cm;text-align:center;line-height:normal;
  mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:9.0pt;font-family:돋움;mso-bidi-font-family:
  굴림;mso-font-kerning:0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">위탁목적</span></span></span></span><span lang="EN-US" style="font-size:12.0pt;
  font-family:굴림;mso-bidi-font-family:굴림;mso-font-kerning:0pt"></span></p><p></p><p></p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span></td></tr><tr style="mso-yfti-irow:1;height:11.55pt"><td nowrap="" style="max-width:219.5pt;width:45%;border:solid windowtext 1.0pt;
  border-top:none;padding:0cm 4.95pt 0cm 4.95pt;height:11.55pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><p class="MsoNormal" align="center" style="margin-top:1.5pt;margin-right:0cm;
  margin-bottom:1.5pt;margin-left:0cm;text-align:center;line-height:normal;
  mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:9.0pt;font-family:돋움;mso-bidi-font-family:
  굴림;mso-font-kerning:0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">우정사업본부</span></span></span></span><span lang="EN-US" style="font-size:12.0pt;
  font-family:굴림;mso-bidi-font-family:굴림;mso-font-kerning:0pt"></span></p><p></p><p></p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span></td><td nowrap="" style="max-width:262.2pt;;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0cm 4.95pt 0cm 4.95pt;height:11.55pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><p class="MsoNormal" align="center" style="margin-top:1.5pt;margin-right:0cm;
  margin-bottom:1.5pt;margin-left:0cm;text-align:center;line-height:normal;
  mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:9.0pt;font-family:돋움;mso-bidi-font-family:
  굴림;mso-font-kerning:0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">배송 서비스</span></span></span></span><span lang="EN-US" style="font-size:12.0pt;
  font-family:굴림;mso-bidi-font-family:굴림;mso-font-kerning:0pt"></span></p><p></p><p></p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span></td></tr><tr style="mso-yfti-irow:2;height:5.55pt"><td nowrap="" style="max-width:219.5pt;width:45%;border:solid windowtext 1.0pt;
  border-top:none;padding:0cm 4.95pt 0cm 4.95pt;height:5.55pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><p class="MsoNormal" align="center" style="margin-top:1.5pt;margin-right:0cm;
  margin-bottom:1.5pt;margin-left:0cm;text-align:center;line-height:normal;
  mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span lang="EN-US" style="font-size:9.0pt;font-family:
  돋움;mso-bidi-font-family:굴림;mso-font-kerning:0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">(</span></span></span></span><span style="font-size:9.0pt;font-family:돋움;mso-bidi-font-family:굴림;mso-font-kerning:
  0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">주</span></span></span><span lang="EN-US"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">)</span></span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">바나나팩토리</span></span></span></span><span lang="EN-US" style="font-size:12.0pt;font-family:굴림;mso-bidi-font-family:굴림;mso-font-kerning:
  0pt"></span></p><p></p><p></p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span></td><td nowrap="" style="max-width:262.2pt;;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0cm 4.95pt 0cm 4.95pt;height:5.55pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><p class="MsoNormal" align="center" style="margin-top:1.5pt;margin-right:0cm;
  margin-bottom:1.5pt;margin-left:0cm;text-align:center;line-height:normal;
  mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:9.0pt;font-family:돋움;mso-bidi-font-family:
  굴림;mso-font-kerning:0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">리뷰 시스템</span></span></span><span lang="EN-US"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">/SMS </span></span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">발송</span></span></span></span><span lang="EN-US" style="font-size:12.0pt;font-family:굴림;mso-bidi-font-family:굴림;
  mso-font-kerning:0pt"></span></p><p></p><p></p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span></td></tr><tr style="mso-yfti-irow:3;height:25.0pt"><td nowrap="" style="max-width:219.5pt;width:45%;border:solid windowtext 1.0pt;
  border-top:none;padding:0cm 4.95pt 0cm 4.95pt;height:25.0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><p class="MsoNormal" align="center" style="margin-top:1.5pt;margin-right:0cm;
  margin-bottom:1.5pt;margin-left:0cm;text-align:center;line-height:normal;
  mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:9.0pt;font-family:돋움;mso-bidi-font-family:
  굴림;mso-font-kerning:0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">카페</span></span></span><span lang="EN-US"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">24(</span></span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">주</span></span></span><span lang="EN-US"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">)</span></span></span></span></span><span lang="EN-US" style="font-size:12.0pt;font-family:굴림;mso-bidi-font-family:굴림;
  mso-font-kerning:0pt"></span></p><p></p><p></p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span></td><td nowrap="" style="max-width:262.2pt;;border:none;border-right:solid windowtext 1.0pt;
  padding:0cm 4.95pt 0cm 4.95pt;height:25.0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><p class="MsoNormal" align="center" style="margin-top:1.5pt;margin-right:0cm;
  margin-bottom:1.5pt;margin-left:0cm;text-align:center;line-height:normal;
  mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:9.0pt;font-family:돋움;mso-bidi-font-family:
  굴림;mso-font-kerning:0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">서버 및 솔루션 제공</span></span></span></span><span lang="EN-US" style="font-size:
  12.0pt;font-family:굴림;mso-bidi-font-family:굴림;mso-font-kerning:0pt"></span></p><p></p><p></p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><p class="MsoNormal" align="center" style="margin-top:1.5pt;margin-right:0cm;
  margin-bottom:1.5pt;margin-left:0cm;text-align:center;line-height:normal;
  mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:9.0pt;font-family:돋움;mso-bidi-font-family:
  굴림;mso-font-kerning:0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">고객 상담 서비스</span></span></span></span><span lang="EN-US" style="font-size:
  12.0pt;font-family:굴림;mso-bidi-font-family:굴림;mso-font-kerning:0pt"></span></p><p></p><p></p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span></td></tr><tr style="mso-yfti-irow:4;height:9.3pt"><td nowrap="" style="max-width:219.5pt;width:45%;border:solid windowtext 1.0pt;
  border-top:none;padding:0cm 4.95pt 0cm 4.95pt;height:9.3pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><p class="MsoNormal" align="center" style="margin-top:1.5pt;margin-right:0cm;
  margin-bottom:1.5pt;margin-left:0cm;text-align:center;line-height:normal;
  mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span lang="EN-US" style="font-size:9.0pt;font-family:
  돋움;mso-bidi-font-family:굴림;mso-font-kerning:0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">(</span></span></span></span><span style="font-size:9.0pt;font-family:돋움;mso-bidi-font-family:굴림;mso-font-kerning:
  0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">주</span></span></span><span lang="EN-US"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">)</span></span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">셀메이트</span></span></span></span><span lang="EN-US" style="font-size:
  12.0pt;font-family:굴림;mso-bidi-font-family:굴림;mso-font-kerning:0pt"></span></p><p></p><p></p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span></td><td nowrap="" style="max-width:262.2pt;;border:solid windowtext 1.0pt;
  border-left:none;padding:0cm 4.95pt 0cm 4.95pt;height:9.3pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><p class="MsoNormal" align="center" style="margin-top:1.5pt;margin-right:0cm;
  margin-bottom:1.5pt;margin-left:0cm;text-align:center;line-height:normal;
  mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:9.0pt;font-family:돋움;mso-bidi-font-family:
  굴림;mso-font-kerning:0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">배송 및 재고 관리 시스템</span></span></span></span><span lang="EN-US" style="font-size:12.0pt;font-family:굴림;mso-bidi-font-family:굴림;mso-font-kerning:
  0pt"></span></p><p></p><p></p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span></td></tr><tr style="mso-yfti-irow:5;height:7.45pt"><td nowrap="" style="max-width:219.5pt;width:45%;border:solid windowtext 1.0pt;
  border-top:none;padding:0cm 4.95pt 0cm 4.95pt;height:7.45pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><p class="MsoNormal" align="center" style="margin-top:1.5pt;margin-right:0cm;
  margin-bottom:1.5pt;margin-left:0cm;text-align:center;line-height:normal;
  mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span lang="EN-US" style="font-size:9.0pt;font-family:
  돋움;mso-bidi-font-family:굴림;mso-font-kerning:0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">NHN</span></span></span></span><span style="font-size:9.0pt;font-family:돋움;mso-bidi-font-family:굴림;mso-font-kerning:
  0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">한국사이버결제</span></span></span><span lang="EN-US"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">(</span></span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">주</span></span></span><span lang="EN-US"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">)</span></span></span></span></span><span lang="EN-US" style="font-size:12.0pt;font-family:굴림;mso-bidi-font-family:굴림;
  mso-font-kerning:0pt"></span></p><p></p><p></p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span></td><td nowrap="" style="max-width:262.2pt;;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0cm 4.95pt 0cm 4.95pt;height:7.45pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><p class="MsoNormal" align="center" style="margin-top:1.5pt;margin-right:0cm;
  margin-bottom:1.5pt;margin-left:0cm;text-align:center;line-height:normal;
  mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:9.0pt;font-family:돋움;mso-bidi-font-family:
  굴림;mso-font-kerning:0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">전자 지불 서비스</span></span></span></span><span lang="EN-US" style="font-size:
  12.0pt;font-family:굴림;mso-bidi-font-family:굴림;mso-font-kerning:0pt"></span></p><p></p><p></p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span></td></tr><tr style="mso-yfti-irow:6;height:3.5pt"><td nowrap="" style="max-width:219.5pt;width:45%;border:solid windowtext 1.0pt;
  border-top:none;padding:0cm 4.95pt 0cm 4.95pt;height:3.5pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><p class="MsoNormal" align="center" style="margin-top:1.5pt;margin-right:0cm;
  margin-bottom:1.5pt;margin-left:0cm;text-align:center;line-height:normal;
  mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span lang="EN-US" style="font-size:9.0pt;font-family:
  돋움;mso-bidi-font-family:굴림;mso-font-kerning:0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">(</span></span></span></span><span style="font-size:9.0pt;font-family:돋움;mso-bidi-font-family:굴림;mso-font-kerning:
  0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">주</span></span></span><span lang="EN-US"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">)</span></span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">카카오페이</span></span></span></span><span lang="EN-US" style="font-size:
  12.0pt;font-family:굴림;mso-bidi-font-family:굴림;mso-font-kerning:0pt"></span></p><p></p><p></p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span></td><td nowrap="" style="max-width:262.2pt;;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0cm 4.95pt 0cm 4.95pt;height:3.5pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><p class="MsoNormal" align="center" style="margin-top:1.5pt;margin-right:0cm;
  margin-bottom:1.5pt;margin-left:0cm;text-align:center;line-height:normal;
  mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:9.0pt;font-family:돋움;mso-bidi-font-family:
  굴림;mso-font-kerning:0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">전자 지불 서비스</span></span></span></span><span lang="EN-US" style="font-size:
  12.0pt;font-family:굴림;mso-bidi-font-family:굴림;mso-font-kerning:0pt"></span></p><p></p><p></p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span></td></tr><tr style="mso-yfti-irow:7;height:3.5pt"><td nowrap="" style="max-width:219.5pt;width:45%;border:solid windowtext 1.0pt;
  border-top:none;padding:0cm 4.95pt 0cm 4.95pt;height:3.5pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><p class="MsoNormal" align="center" style="margin-top:1.5pt;margin-right:0cm;
  margin-bottom:1.5pt;margin-left:0cm;text-align:center;line-height:normal;
  mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:9.0pt;font-family:돋움;mso-bidi-font-family:
  굴림;mso-font-kerning:0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">엔에이치엔페이코</span></span></span><span lang="EN-US"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">(</span></span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">주</span></span></span><span lang="EN-US"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">)</span></span></span></span></span><span lang="EN-US" style="font-size:12.0pt;font-family:굴림;mso-bidi-font-family:굴림;
  mso-font-kerning:0pt"></span></p><p></p><p></p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span></td><td nowrap="" style="max-width:262.2pt;;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0cm 4.95pt 0cm 4.95pt;height:3.5pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><p class="MsoNormal" align="center" style="margin-top:1.5pt;margin-right:0cm;
  margin-bottom:1.5pt;margin-left:0cm;text-align:center;line-height:normal;
  mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:9.0pt;font-family:돋움;mso-bidi-font-family:
  굴림;mso-font-kerning:0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">전자 지불 서비스</span></span></span></span><span lang="EN-US" style="font-size:
  12.0pt;font-family:굴림;mso-bidi-font-family:굴림;mso-font-kerning:0pt"></span></p><p></p><p></p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span></td></tr><tr style="mso-yfti-irow:8;height:3.5pt"><td nowrap="" style="max-width:219.5pt;width:45%;border:solid windowtext 1.0pt;
  border-top:none;padding:0cm 4.95pt 0cm 4.95pt;height:3.5pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><p class="MsoNormal" align="center" style="margin-top:1.5pt;margin-right:0cm;
  margin-bottom:1.5pt;margin-left:0cm;text-align:center;line-height:normal;
  mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span lang="EN-US" style="font-size:9.0pt;font-family:
  돋움;mso-bidi-font-family:굴림;mso-font-kerning:0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">(</span></span></span></span><span style="font-size:9.0pt;font-family:돋움;mso-bidi-font-family:굴림;mso-font-kerning:
  0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">주</span></span></span><span lang="EN-US"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">)LGU+</span></span></span></span></span><span lang="EN-US" style="font-size:
  12.0pt;font-family:굴림;mso-bidi-font-family:굴림;mso-font-kerning:0pt"></span></p><p></p><p></p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span></td><td nowrap="" style="max-width:262.2pt;;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0cm 4.95pt 0cm 4.95pt;height:3.5pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><p class="MsoNormal" align="center" style="margin-top:1.5pt;margin-right:0cm;
  margin-bottom:1.5pt;margin-left:0cm;text-align:center;line-height:normal;
  mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:9.0pt;font-family:돋움;mso-bidi-font-family:
  굴림;mso-font-kerning:0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">전자 지불 서비스</span></span></span></span><span lang="EN-US" style="font-size:
  12.0pt;font-family:굴림;mso-bidi-font-family:굴림;mso-font-kerning:0pt"></span></p><p></p><p></p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span></td></tr><tr style="mso-yfti-irow:9;height:3.5pt"><td nowrap="" style="max-width:219.5pt;width:45%;border:solid windowtext 1.0pt;
  border-top:none;padding:0cm 4.95pt 0cm 4.95pt;height:3.5pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><p class="MsoNormal" align="center" style="margin-top:1.5pt;margin-right:0cm;
  margin-bottom:1.5pt;margin-left:0cm;text-align:center;line-height:normal;
  mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span lang="EN-US" style="font-size:9.0pt;font-family:
  돋움;mso-bidi-font-family:굴림;mso-font-kerning:0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">(</span></span></span></span><span style="font-size:9.0pt;font-family:돋움;mso-bidi-font-family:굴림;mso-font-kerning:
  0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">주</span></span></span><span lang="EN-US"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">)</span></span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">케이지모빌리언스</span></span></span></span><span lang="EN-US" style="font-size:12.0pt;font-family:굴림;mso-bidi-font-family:굴림;mso-font-kerning:
  0pt"></span></p><p></p><p></p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span></td><td nowrap="" style="max-width:262.2pt;;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0cm 4.95pt 0cm 4.95pt;height:3.5pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><p class="MsoNormal" align="center" style="margin-top:1.5pt;margin-right:0cm;
  margin-bottom:1.5pt;margin-left:0cm;text-align:center;line-height:normal;
  mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:9.0pt;font-family:돋움;mso-bidi-font-family:
  굴림;mso-font-kerning:0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">전자 지불 서비스</span></span></span></span><span lang="EN-US" style="font-size:
  12.0pt;font-family:굴림;mso-bidi-font-family:굴림;mso-font-kerning:0pt"></span></p><p></p><p></p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span></td></tr><tr style="mso-yfti-irow:10;height:3.5pt"><td nowrap="" style="max-width:219.5pt;width:45%;border:solid windowtext 1.0pt;
  border-top:none;padding:0cm 4.95pt 0cm 4.95pt;height:3.5pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><p class="MsoNormal" align="center" style="margin-top:1.5pt;margin-right:0cm;
  margin-bottom:1.5pt;margin-left:0cm;text-align:center;line-height:normal;
  mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span lang="EN-US" style="font-size:9.0pt;font-family:
  돋움;mso-bidi-font-family:굴림;mso-font-kerning:0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">(</span></span></span></span><span style="font-size:9.0pt;font-family:돋움;mso-bidi-font-family:굴림;mso-font-kerning:
  0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">주</span></span></span><span lang="EN-US"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">)</span></span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">다우기술</span></span></span></span><span lang="EN-US" style="font-size:
  12.0pt;font-family:굴림;mso-bidi-font-family:굴림;mso-font-kerning:0pt"></span></p><p></p><p></p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span></td><td nowrap="" style="max-width:262.2pt;;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0cm 4.95pt 0cm 4.95pt;height:3.5pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><p class="MsoNormal" align="center" style="margin-top:1.5pt;margin-right:0cm;
  margin-bottom:1.5pt;margin-left:0cm;text-align:center;line-height:normal;
  mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span lang="EN-US" style="font-size:9.0pt;font-family:
  돋움;mso-bidi-font-family:굴림;mso-font-kerning:0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">SMS </span></span></span></span><span style="font-size:9.0pt;font-family:돋움;mso-bidi-font-family:굴림;mso-font-kerning:
  0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">발송 서비스</span></span></span></span><span lang="EN-US" style="font-size:12.0pt;font-family:굴림;
  mso-bidi-font-family:굴림;mso-font-kerning:0pt"></span></p><p></p><p></p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span></td></tr><tr style="mso-yfti-irow:11;height:3.5pt"><td nowrap="" style="max-width:219.5pt;width:45%;border:solid windowtext 1.0pt;
  border-top:none;padding:0cm 4.95pt 0cm 4.95pt;height:3.5pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><p class="MsoNormal" align="center" style="margin-top:1.5pt;margin-right:0cm;
  margin-bottom:1.5pt;margin-left:0cm;text-align:center;line-height:normal;
  mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span lang="EN-US" style="font-size:9.0pt;font-family:
  돋움;mso-bidi-font-family:굴림;mso-font-kerning:0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">(</span></span></span></span><span style="font-size:9.0pt;font-family:돋움;mso-bidi-font-family:굴림;mso-font-kerning:
  0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">주</span></span></span><span lang="EN-US"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">)</span></span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">조이코퍼레이션</span></span></span></span><span lang="EN-US" style="font-size:12.0pt;font-family:굴림;mso-bidi-font-family:굴림;mso-font-kerning:
  0pt"></span></p><p></p><p></p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span></td><td nowrap="" style="max-width:262.2pt;;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0cm 4.95pt 0cm 4.95pt;height:3.5pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><p class="MsoNormal" align="center" style="margin-top:1.5pt;margin-right:0cm;
  margin-bottom:1.5pt;margin-left:0cm;text-align:center;line-height:normal;
  mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:9.0pt;font-family:돋움;mso-bidi-font-family:
  굴림;mso-font-kerning:0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">고객 상담 서비스</span></span></span></span><span lang="EN-US" style="font-size:
  12.0pt;font-family:굴림;mso-bidi-font-family:굴림;mso-font-kerning:0pt"></span></p><p></p><p></p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span></td></tr><tr style="mso-yfti-irow:12;height:3.5pt"><td nowrap="" style="max-width:219.5pt;width:45%;border:solid windowtext 1.0pt;
  border-top:none;padding:0cm 4.95pt 0cm 4.95pt;height:3.5pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><p class="MsoNormal" align="center" style="margin-top:1.5pt;margin-right:0cm;
  margin-bottom:1.5pt;margin-left:0cm;text-align:center;line-height:normal;
  mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:9.0pt;font-family:돋움;mso-bidi-font-family:
  굴림;mso-font-kerning:0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">엠비아이솔루션</span></span></span><span lang="EN-US"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">(</span></span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">주</span></span></span><span lang="EN-US"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">)</span></span></span></span></span><span lang="EN-US" style="font-size:12.0pt;font-family:굴림;mso-bidi-font-family:굴림;
  mso-font-kerning:0pt"></span></p><p></p><p></p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span></td><td nowrap="" style="max-width:262.2pt;;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0cm 4.95pt 0cm 4.95pt;height:3.5pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><p class="MsoNormal" align="center" style="margin-top:1.5pt;margin-right:0cm;
  margin-bottom:1.5pt;margin-left:0cm;text-align:center;line-height:normal;
  mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:9.0pt;font-family:돋움;mso-bidi-font-family:
  굴림;mso-font-kerning:0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">고객 상담 서비스</span></span></span></span><span lang="EN-US" style="font-size:
  12.0pt;font-family:굴림;mso-bidi-font-family:굴림;mso-font-kerning:0pt"></span></p><p></p><p></p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span></td></tr><tr style="mso-yfti-irow:13;height:3.5pt"><td nowrap="" style="max-width:219.5pt;width:45%;border:solid windowtext 1.0pt;
  border-top:none;padding:0cm 4.95pt 0cm 4.95pt;height:3.5pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><p class="MsoNormal" align="center" style="margin-top:1.5pt;margin-right:0cm;
  margin-bottom:1.5pt;margin-left:0cm;text-align:center;line-height:normal;
  mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span lang="EN-US" style="font-size:9.0pt;font-family:
  돋움;mso-bidi-font-family:굴림;mso-font-kerning:0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">(</span></span></span></span><span style="font-size:9.0pt;font-family:돋움;mso-bidi-font-family:굴림;mso-font-kerning:
  0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">주</span></span></span><span lang="EN-US"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">)</span></span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">이비즈엔시스템</span></span></span></span><span lang="EN-US" style="font-size:12.0pt;font-family:굴림;mso-bidi-font-family:굴림;mso-font-kerning:
  0pt"></span></p><p></p><p></p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span></td><td nowrap="" style="max-width:262.2pt;;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0cm 4.95pt 0cm 4.95pt;height:3.5pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><p class="MsoNormal" align="center" style="margin-top:1.5pt;margin-right:0cm;
  margin-bottom:1.5pt;margin-left:0cm;text-align:center;line-height:normal;
  mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span lang="EN-US" style="font-size:9.0pt;font-family:
  돋움;mso-bidi-font-family:굴림;mso-font-kerning:0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">E-mail </span></span></span></span><span style="font-size:9.0pt;font-family:돋움;mso-bidi-font-family:굴림;mso-font-kerning:
  0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">발송 서비스</span></span></span></span><span lang="EN-US" style="font-size:12.0pt;font-family:굴림;
  mso-bidi-font-family:굴림;mso-font-kerning:0pt"></span></p><p></p><p></p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span></td></tr><tr style="mso-yfti-irow:14;height:3.5pt"><td nowrap="" style="max-width:219.5pt;width:45%;border:solid windowtext 1.0pt;
  border-top:none;padding:0cm 4.95pt 0cm 4.95pt;height:3.5pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><p class="MsoNormal" align="center" style="margin-top:1.5pt;margin-right:0cm;
  margin-bottom:1.5pt;margin-left:0cm;text-align:center;line-height:normal;
  mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span lang="EN-US" style="font-size:9.0pt;font-family:
  돋움;mso-bidi-font-family:굴림;mso-font-kerning:0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">(</span></span></span></span><span style="font-size:9.0pt;font-family:돋움;mso-bidi-font-family:굴림;mso-font-kerning:
  0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">주</span></span></span><span lang="EN-US"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">)</span></span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">루나소프트</span></span></span></span><span lang="EN-US" style="font-size:
  12.0pt;font-family:굴림;mso-bidi-font-family:굴림;mso-font-kerning:0pt"></span></p><p></p><p></p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span></td><td nowrap="" style="max-width:262.2pt;;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0cm 4.95pt 0cm 4.95pt;height:3.5pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><p class="MsoNormal" align="center" style="margin-top:1.5pt;margin-right:0cm;
  margin-bottom:1.5pt;margin-left:0cm;text-align:center;line-height:normal;
  mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:9.0pt;font-family:돋움;mso-bidi-font-family:
  굴림;mso-font-kerning:0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">카카오 알림톡 발송 업무</span></span></span></span><span lang="EN-US" style="font-size:12.0pt;font-family:굴림;mso-bidi-font-family:굴림;mso-font-kerning:
  0pt"></span></p><p></p><p></p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><p class="MsoNormal" align="center" style="margin-top:1.5pt;margin-right:0cm;
  margin-bottom:1.5pt;margin-left:0cm;text-align:center;line-height:normal;
  mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:9.0pt;font-family:돋움;mso-bidi-font-family:
  굴림;mso-font-kerning:0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">직송 등 일부 배송형태에 따라</span></span></span><span lang="EN-US"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">,</span></span></span></span></span></p><p class="MsoNormal" align="center" style="margin-top:1.5pt;margin-right:0cm;
  margin-bottom:1.5pt;margin-left:0cm;text-align:center;line-height:normal;
  mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:9.0pt;font-family:돋움;mso-bidi-font-family:
  굴림;mso-font-kerning:0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">전자상거래소비자보호법
  제</span></span></span><span lang="EN-US"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">&nbsp;21</span></span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">조에 의거</span></span></span></span></p><p class="MsoNormal" align="center" style="margin-top:1.5pt;margin-right:0cm;
  margin-bottom:1.5pt;margin-left:0cm;text-align:center;line-height:normal;
  mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:9.0pt;font-family:돋움;mso-bidi-font-family:
  굴림;mso-font-kerning:0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">협력사에 배송정보가 제공 됩니다</span></span></span><span lang="EN-US"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">.</span></span></span></span></span><span lang="EN-US" style="font-size:12.0pt;font-family:굴림;mso-bidi-font-family:굴림;
  mso-font-kerning:0pt"></span></p><p></p><p></p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span></td></tr><tr style="mso-yfti-irow:15;mso-yfti-lastrow:yes;height:3.5pt"><td nowrap="" style="max-width:219.5pt;width:45%;border:solid windowtext 1.0pt;
  border-top:none;padding:0cm 4.95pt 0cm 4.95pt;height:3.5pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><p class="MsoNormal" align="center" style="margin-top:1.5pt;margin-right:0cm;
  margin-bottom:1.5pt;margin-left:0cm;text-align:center;line-height:normal;
  mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span lang="EN-US" style="font-size:9.0pt;font-family:
  돋움;mso-bidi-font-family:굴림;mso-font-kerning:0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">(</span></span></span></span><span style="font-size:9.0pt;font-family:돋움;mso-bidi-font-family:굴림;mso-font-kerning:
  0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">주</span></span></span><span lang="EN-US"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">)</span></span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">엘지씨엔에스</span></span></span></span><span lang="EN-US" style="font-size:12.0pt;font-family:굴림;mso-bidi-font-family:굴림;mso-font-kerning:
  0pt"></span></p><p></p><p></p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span></td><td nowrap="" style="max-width:262.2pt;;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0cm 4.95pt 0cm 4.95pt;height:3.5pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><p class="MsoNormal" align="center" style="margin-top:1.5pt;margin-right:0cm;
  margin-bottom:1.5pt;margin-left:0cm;text-align:center;line-height:normal;
  mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:9.0pt;font-family:돋움;mso-bidi-font-family:
  굴림;mso-font-kerning:0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">카카오 톡주문 서비스</span></span></span></span><span lang="EN-US" style="font-size:
  12.0pt;font-family:굴림;mso-bidi-font-family:굴림;mso-font-kerning:0pt"></span></p><p></p><p></p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span><p class="MsoNormal" align="center" style="margin-top:1.5pt;margin-right:0cm;
  margin-bottom:1.5pt;margin-left:0cm;text-align:center;line-height:normal;
  mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:9.0pt;font-family:돋움;mso-bidi-font-family:
  굴림;mso-font-kerning:0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">직송 등 일부 배송형태에 따라</span></span></span><span lang="EN-US"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">,</span></span></span></span></span></p><p class="MsoNormal" align="center" style="margin-top:1.5pt;margin-right:0cm;
  margin-bottom:1.5pt;margin-left:0cm;text-align:center;line-height:normal;
  mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:9.0pt;font-family:돋움;mso-bidi-font-family:
  굴림;mso-font-kerning:0pt"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">전자상거래소비자보호법
  제</span></span></span><span lang="EN-US"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">&nbsp;21</span></span></span></span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">조에 </span></span></span></span><span style="font-family: 돋움; font-size: 9pt; color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);">의거</span></span></p><p class="MsoNormal" align="center" style="margin-top:1.5pt;margin-right:0cm;
  margin-bottom:1.5pt;margin-left:0cm;text-align:center;line-height:normal;
  mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-family: 돋움; font-size: 9pt; color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);">협력사에 배송정보가 제공 됩니다</span></span><span lang="EN-US" style="font-family: 돋움; font-size: 9pt;"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);">.</span></span></span></p><p class="MsoNormal" align="center" style="margin-top:1.5pt;margin-right:0cm;
  margin-bottom:1.5pt;margin-left:0cm;text-align:center;line-height:normal;
  mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span lang="EN-US" style="font-size:12.0pt;font-family:굴림;mso-bidi-font-family:굴림;
  mso-font-kerning:0pt"></span></p><p></p><p></p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">
  </span></span></span></td></tr></tbody></table><p><font face="굴림" size="3"><br /></font></p><p><font face="굴림"></font><font face="굴림"></font><font face="굴림"></font><font face="굴림"></font><font face="굴림"></font><font face="굴림"></font><font face="굴림"></font><font face="굴림"></font><font face="굴림"></font><font face="굴림"></font><font face="굴림"></font><font face="굴림"></font><font face="굴림"></font><font face="굴림"></font><font face="굴림"></font><font face="굴림"></font><font face="굴림"></font><font face="굴림"></font><font face="굴림"></font><font face="굴림"></font><font face="굴림"></font><font face="굴림"></font><font face="굴림"></font><font face="굴림"></font><font face="굴림"></font><font face="굴림"></font><font face="굴림"></font><font face="굴림"></font><font face="굴림"></font><font face="굴림"></font><font face="굴림"></font><font face="굴림"></font><font face="굴림"></font><font face="굴림"></font><font face="굴림"></font><font face="굴림"></font><font face="굴림"></font><font face="굴림"></font><font face="굴림"></font><font face="굴림"></font><font face="굴림"></font><font face="굴림"></font><font face="굴림"></font><font face="굴림"></font><font face="굴림"></font></p><p align="left" style="margin: 1.5pt 0cm; line-height: normal;"><span lang="EN-US" style="font-family: 돋움; font-size: 9pt;"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">* </span></span></span></span><span style="font-family: 돋움; font-size: 9pt;"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">업체 리스트는 해당 서비스 변경 및 계약기간에 따라 변경될 수 있으며 변경 시 공지사항(또는 개별공지)을 통해 사전 공지합니다</span></span></span><span lang="EN-US"><span style="color: rgb(255, 0, 0);"><span style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">.</span></span></span></span></span></p>						

<style>.agreeArea .agree{word-break:break-all;}</style>									    </div>
    <p class="check"><span>개인정보 수집 및 이용에 동의하십니까?</span> <input id="agree_privacy_check0" name="agree_privacy_check[]" fw-filter="/1/" fw-label="개인정보 수집 및 이용 방침" fw-msg="개인정보 수집 및 이용 방침에 동의하세요" value="1" type="checkbox"  /><label for="agree_privacy_check0" >동의함</label></p>
  </div>
<div class="displaynone">
    <h3>개인정보 제3자 제공 동의(선택)</h3>
    <div class="agreeArea">
      <div class="agree">
        아래 내용의 동의 여부는 회원가입에 영향을 미치지 않습니다. 단, 동의 거부시 서비스 이용에 제한이 있을 수 있습니다.<br />
<br />
- 제공 받는 자 :<br />
- 제공 항목 :<br />
- 제공 목적 :<br />
- 보유 및 이용기간 :<br />
      </div>
      <p class="check"><span>개인정보 제3자 제공에 동의하십니까?</span> <input id="agree_information_check0" name="agree_information_check[]" fw-filter="" fw-label="개인정보 제3자 제공 동의" fw-msg="" class="ec-base-chk" value="1" type="checkbox"  /><label for="agree_information_check0" >동의함</label></p>
    </div>
  </div>
<div class="displaynone">
    <h3>개인정보 취급 위탁 동의(선택)</h3>
    <div class="agreeArea">
      <div class="agree">
        아래 내용의 동의 여부는 회원가입에 영향을 미치지 않습니다. 단, 동의 거부시 서비스 이용에 제한이 있을 수 있습니다.<br />
<br />
- 위탁받는 자(수탁업체) :<br />
- 위탁업무의 내용:<br />
      </div>
      <p class="check"><span>개인정보 취급 위탁에 동의하십니까?</span> <input id="agree_consignment_check0" name="agree_consignment_check[]" fw-filter="" fw-label="개인정보 처리 위탁 동의" fw-msg="" value="1" type="checkbox"  /><label for="agree_consignment_check0" >동의함</label></p>
    </div>
  </div>
<div class="btnArea center">
    <a href="/index.html" class="btn-cancel">취소</a>
    <a href="#none" onclick="memberJoinAction();" class="join-cofirm">회원가입</a>
  </div>
</div>
</form>