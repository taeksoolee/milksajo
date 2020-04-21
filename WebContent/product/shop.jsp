<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//현재 uri를 저장
	session.setAttribute("uri", request.getQueryString());
%>
<!-- COLLECTION STARTS - 우유  -->

<div class="collection" id="milk">
      <p id="heading">우유</p>

      <div class="section prod-list">
            <div class="container-fluid">
                  <div class="row some-cards">
                        <div class="col-lg-3 prod wow fadeInUp" data-wow-delay="0.5s">
                              <a href="index.jsp?workgroup=product&work=whiteMilk">
                                    <p id="prod-desc">흰우유</p>
                                    <img src="images/whiteMilk.jpg" alt="">
                                    <p id="price">4,000원</p>
                              </a>
                        </div>
                        <div class="col-lg-3 prod wow fadeInUp" data-wow-delay="0.8s">
                              <a href="index.jsp?workgroup=product&work=chocoMilk">
                                    <p id="prod-desc">초코우유</p>
                                    <img src="images/chocoMilk.jpg" alt="">
                                    <p id="price">2,000원</p>
                              </a>
                        </div>
                        <div class="col-lg-3 prod wow fadeInUp" data-wow-delay="1.1s">
                              <a href="index.jsp?workgroup=product&work=strawMilk">
                                    <p id="prod-desc">딸기우유</p>
                                    <img src="images/strawMilk.jpg" alt="">
                                    <p id="price">2,000원</p>
                              </a>
                        </div>
                        <div class="col-lg-3 prod wow fadeInUp" data-wow-delay="1.4s">
                              <a href="index.jsp?workgroup=product&work=bananaMilk">
                                    <p id="prod-desc">바나나우유</p>
                                    <img src="images/bananaMilk.jpg" alt="">
                                    <p id="price">2,000원</p>
                              </a>
                        </div>
                        <br>
                        <div class="col-lg-3 prod wow fadeInUp" data-wow-delay="1.4s">
                              <a href="index.jsp?workgroup=product&work=coffeeMilk">
                                    <p id="prod-desc">커피우유</p>
                                    <img src="images/coffeeMilk.png" alt="">
                                    <p id="price">2,000원</p>
                              </a>
                        </div>
                        <div class="col-lg-3 prod wow fadeInUp" data-wow-delay="1.4s">
                              <a href="index.jsp?workgroup=product&work=lowfatMilk">
                                    <p id="prod-desc">저지방우유</p>
                                    <img src="images/lowfatMilk.jpg" alt="">
                                    <p id="price">2,000원</p>
                              </a>
                        </div>
                  </div>
            </div>
      </div>
</div>

<!-- COLLECTION ENDS -->

<!-- BANNER SECTION STARTS -->

<div class="row prod-sec">
      <div class="col-lg-6 prod-img">
            <img src="images/milkmilk.jpg" alt="">
      </div>

      <div class="col-lg-4 prod-desc">
            <br><br>
            <p class="wow fadeInUp" data-wow-delay="0.5s">산뜻한 우유 한 잔으로 당신의 건강을 챙기세요.</p>

            <div class="link wow fadeInUp" data-wow-delay="0.6s">
                  <a href="index.jsp?workgroup=product&work=shop">shop now →</a>
            </div>
      </div>
</div>

<!-- BANNER SECTION ENDS -->

<!-- COLLECTION STARTS - 발효유  -->

<div class="collection" id="fermented">
      <p id="heading">발효유</p>

      <div class="section prod-list">
            <div class="container-fluid">
                  <div class="row some-cards">
                        <div class="col-lg-3 prod wow fadeInUp" data-wow-delay="0.5s">
                              <a href="index.jsp?workgroup=product&work=drinkYogurt">
                                    <p id="prod-desc">요구르트</p>
                                    <img src="images/drinkYogurt.jpg" alt="">
                                    <p id="price">2,000원</p>
                              </a>
                        </div>
                        <div class="col-lg-3 prod wow fadeInUp" data-wow-delay="0.5s">
                              <a href="index.jsp?workgroup=product&work=yogurt">
                                    <p id="prod-desc">플레인 요거트</p>
                                    <img src="images/yogurt.jpg" alt="">
                                    <p id="price">2,000원</p>
                              </a>
                        </div>
                        <div class="col-lg-3 prod wow fadeInUp" data-wow-delay="1.1s">
                              <a href="index.jsp?workgroup=product&work=strawYogurt">
                                    <p id="prod-desc">딸기 요거트</p>
                                    <img src="images/strawYogurt.jpg" alt="">
                                    <p id="price">2,500원</p>
                              </a>
                        </div>
                        <div class="col-lg-3 prod wow fadeInUp" data-wow-delay="1.1s">
                              <a href="index.jsp?workgroup=product&work=blueYogurt">
                                    <p id="prod-desc">블루베리 요거트</p>
                                    <img src="images/blueYogurt.jpg" alt="">
                                    <p id="price">2,500원</p>
                              </a>
                        </div>
                  </div>
            </div>
      </div>
</div>

<!-- COLLECTION ENDS -->


<!-- CHEESE COLLECTION - 치즈 -->

<div class="collection" id="cheese">
      <p id="heading">치즈</p>

      <div class="section prod-list">
            <div class="container-fluid">
                  <div class="row some-cards">
                        <div class="col-lg-3 prod wow fadeInUp" data-wow-delay="0.5s">
                              <a href="index.jsp?workgroup=product&work=sliceCheese">
                                    <p id="prod-desc">슬라이스 치즈</p>
                                    <img src="images/sliceCheese.jpg" alt="">
                                    <p id="price">2,000원</p>
                              </a>
                        </div>
                        <div class="col-lg-3 prod wow fadeInUp" data-wow-delay="1.1s">
                              <a href="index.jsp?workgroup=product&work=cheddar">
                                    <p id="prod-desc">체다 치즈</p>
                                    <img src="images/cheddar.jpg" alt="">
                                    <p id="price">2,000원</p>
                              </a>
                        </div>
                        <div class="col-lg-3 prod wow fadeInUp" data-wow-delay="1.1s">
                              <a href="index.jsp?workgroup=product&work=mozzarella">
                                    <p id="prod-desc">모짜렐라 치즈</p>
                                    <img src="images/mozzarella.jpg" alt="">
                                    <p id="price">2,000WON</p>
                              </a>
                        </div>
                        <div class="col-lg-3 prod wow fadeInUp" data-wow-delay="1.1s">
                              <a href="index.jsp?workgroup=product&work=camembert">
                                    <p id="prod-desc">까망베르 치즈</p>
                                    <img src="images/camembert.jpg" alt="">
                                    <p id="price">2,000원</p>
                              </a>
                        </div>
                  </div>
            </div>
      </div>
</div>

<!-- CHEESE ENDS -->

<!-- Fat and Oils COLLECTION - 유지류 -->

<div class="collection" id="fat">
      <p id="heading">유지류</p>

      <div class="section prod-list">
            <div class="container-fluid">
                  <div class="row some-cards">
                        <div class="col-lg-3 prod wow fadeInUp" data-wow-delay="0.5s">
                              <a href="index.jsp?workgroup=product&work=whipping">
                                    <p id="prod-desc">휘핑크림</p>
                                    <img src="images/whipping.png" alt="">
                                    <p id="price">2,000원</p>
                              </a>
                        </div>
                        <div class="col-lg-3 prod wow fadeInUp" data-wow-delay="1.1s">
                              <a href="index.jsp?workgroup=product&work=whipped">
                                    <p id="prod-desc">생크림</p>
                                    <img src="images/whipped.png" alt="">
                                    <p id="price">2,000원</p>
                              </a>
                        </div>
                        <div class="col-lg-3 prod wow fadeInUp" data-wow-delay="1.1s">
                              <a href="index.jsp?workgroup=product&work=butter">
                                    <p id="prod-desc">버터</p>
                                    <img src="images/butter.jpg" alt="">
                                    <p id="price">2,000원</p>
                              </a>
                        </div>
                  </div>
            </div>
      </div>
</div>

<!-- Fat and Oils ENDS -->



<!-- CATEGORIES SECTION STARTS -->

<div class="container-fluid">
      <div class="row section shop">
            <div class="col-lg-8">
                  <p class="wow fadeInUp" data-wow-delay="0.4s">우유사조가 직접 키워 건강한 소에서 직접 추출한 신선하고 맛있는 우유.</p>

                  <div class="link wow fadeInUp" data-wow-delay="0.6s">
                        <a href="index.jsp?workgroup=product&work=shop">다른 제품 보러가기 →</a>
                  </div>
            </div>
      </div>

      <div class="container-fluid">
            <div class="row some-cards">
                  <div class="col-lg-3"></div>

                  <div class="col-lg-3 prod wow fadeInUp" data-wow-delay="0.3s">
                        <img src="images/detail1.jpg" alt="">
                        <p id="prod-desc">Aimez-vous le lait?</p>
                  </div>

                  <div class="col-lg-3 prod wow fadeInUp" data-wow-delay="0.5s">
                        <img src="images/detail2.jpg" alt="">
                        <p id="prod-desc">Quel genre de lait aimez-vous?</p>
                  </div>

                  <div class="col-lg-3 prod wow fadeInUp" data-wow-delay="0.7s">
                        <img src="images/detail3.jpg" alt="">
                        <p id="prod-desc">Quel que soit le lait que vous buvez, notre lait est gÃ©nial.</p>
                  </div>
            </div>
      </div>
</div>


</body>
</html>
