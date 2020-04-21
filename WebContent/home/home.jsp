<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- MAINMILK SECTION STARTS -->
 <%
	//현재 uri를 저장
	session.setAttribute("uri", request.getQueryString());
 %>
 
 <!-- 이미지 슬라이드 영역 테스트
			<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
			  <ol class="carousel-indicators">
			    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
			    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			  </ol>
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img src="images/mainMilk1.jpg" class="d-block w-100" alt="흰우유">
			    </div>
			    <div class="carousel-item active">
			      <img src="images/chocoMilk.jpg" class="d-block w-100" alt="초코우유">
			    </div>
			    <div class="carousel-item active">
			      <img src="images/whiteMilk.jpg" class="d-block w-100" alt="고급우유" >
			    </div>
			  </div>
			  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="sr-only">Previous</span>
			  </a>
			  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
			  </a>
			</div>
  -->

<div class="mainMilk-section">
      <div class="container-fluid">
            <div class="row">
                  <div class="col-lg-6 mainMilk-left">
                        <div class="tagline">
                              <p class="wow fadeInUp">당신의 아침을 <br>신선한 우유와 함께 <br>시작하세요!<br> by. 우유사조</p>
                        </div>

                        <div class="shipping">
                              <p class="wow fadeInUp" data-wow-delay="0.5s">I love fresh milk!</p>
                        </div>
                  </div>

                  <div class="col-lg-6 mainMilk-right">
                        <div class="mainMilk-image">
                              <img src="images/shopMilkBrunch.jpg" class="img wow fadeInUp" data-wow-delay="0.3s" alt="">
                        </div>
                  </div>
            </div>
      </div>
</div>




<!-- PRODUCT LIST STARTS -->

<div class="section prod-list">
      <div class="container-fluid">
            <div class="row some-cards">
                  <div class="col-lg-3 prod wow fadeInUp" data-wow-delay="0.5s">
                        <a href="index.jsp?workgroup=product&work=whiteMilk">
                              <p id="price">4,000원</p>
                              <img src="images/whiteMilk.jpg" alt="">
                              <p id="prod-desc">흰우유</p>
                        </a>
                  </div>
                  <div class="col-lg-3 prod wow fadeInUp" data-wow-delay="0.8s">
                        <a href="index.jsp?workgroup=product&work=chocoMilk">
                              <p id="price">2,000원</p>
                              <img src="images/chocoMilk.jpg" alt="">
                              <p id="prod-desc">초코우유</p>
                        </a>
                  </div>
                  <div class="col-lg-3 prod wow fadeInUp" data-wow-delay="1.1s">
                        <a href="index.jsp?workgroup=product&work=strawMilk">
                              <p id="price">2,000원</p>
                              <img src="images/strawMilk.jpg" alt="">
                              <p id="prod-desc">딸기우유</p>
                        </a>
                  </div>
                  <div class="col-lg-3 prod wow fadeInUp" data-wow-delay="1.4s">
                        <a href="index.jsp?workgroup=product&work=bananaMilk">
                              <p id="price">2,000원</p>
                              <img src="images/bananaMilk.jpg" alt="">
                              <p id="prod-desc">바나나우유</p>
                        </a>
                  </div>
            </div>
      </div>
</div>

<!-- PRODUCT LIST ENDS -->

<!-- BANNER SECTION STARTS -->

<div class="row prod-sec">
      <div class="col-lg-6 prod-img">
            <img src="images/milkmilk.jpg" alt="">
      </div>

      <div class="col-lg-4 prod-desc">
            <br><br>
            <p class="wow fadeInUp" data-wow-delay="0.5s">우유사조에서 엄선한 신선한 우유와 유제품. <br>당신의 하루를 특별하게 시작하세요.</p>

            <div class="link wow fadeInUp" data-wow-delay="0.6s" >
                  <a href="index.jsp?workgroup=product&work=shop">shop now →</a>
            </div>
      </div>
</div>


<!-- CATEGORIES SECTION STARTS -->
<!-- 
<div class="container-fluid">
      <div class="row section shop">
            <div class="col-lg-8">
                  <p class="wow fadeInUp" data-wow-delay="0.4s">우리집 주방에서 가장 신선한 우유를 맛보세요. <br>Milksajo의 우유는 당신의 하루를 행복하게 만들어줄거에요. <br> 특별한 당신을 위해 준비된 스페셜 밀크와 요거트 그리고 치즈까지..  </p>

                  <div class="link wow fadeInUp" data-wow-delay="0.6s">
                        <a href="shop.html">learn more <ion-icon name="arrow-round-forward"></ion-icon></a>
                  </div>
            </div>
      </div>

      <div class="container-fluid">
            <div class="row some-cards">
                  <div class="col-lg-3"></div>

                  <div class="col-lg-3 prod wow fadeInUp" data-wow-delay="0.3s">
                        <img src="images/mainWhitemilk.jpg" alt="">
                        <p id="prod-desc">Aimez-vous le lait?</p>
                  </div>

                  <div class="col-lg-3 prod wow fadeInUp" data-wow-delay="0.5s">
                        <img src="images/mainStrawYogurt.jpg" alt="">
                        <p id="prod-desc">Quel genre de lait aimez-vous?</p>
                  </div>

                  <div class="col-lg-3 prod wow fadeInUp" data-wow-delay="0.7s">
                        <img src="images/mainThreeMilk.jpg" alt="">
                        <p id="prod-desc">Quel que soit le lait que vous buvez, notre lait est génial.</p>
                  </div>
            </div>
      </div>
</div>
-->