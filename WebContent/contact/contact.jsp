<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<div class="about-hero">
      <div class="container-fluid hero wow fadeInUp" style="height: 160px;]">
             <h1 id="hero-title">MILK WITH YOU</h1>
       </div>

       <div class="container content" style=" margin: auto;">
            
            <p class="wow fadeInUp" style="visibility: visible; font-size: 20px; letter-spacing: -1px; text-align: center; margin-top: 15px;">MILKSAJO는 언제나 가까이에 있습니다.</p>
			
             <form action="">
                   <div class="form-group">
                         <label>Name</label>
                         <input type="text" class="form-control wow fadeInUp" data-wow-delay="0.5s">
                   </div>

                   <div class="form-group">
                         <label>E-mail</label>
                         <input type="email" class="form-control wow fadeInUp" data-wow-delay="0.7s">
                   </div>

                   <div class="form-group">
                        <label>Message</label>
                        <textarea rows="3" class="form-control wow fadeInUp" data-wow-delay="0.8s"></textarea>
                  </div>
                  <div class="add-prod wow fadeInUp" data-wow-delay="0.2s" style="text-align: center;">
                        <button type="submit" >SUBMIT</button>
                   </div>
             </form>

       </div>
</div>
    
<script type="text/javascript">

//Scroll reveal animations

new WOW().init();

//Scroll activated background change
$(function() {
      $(document).scroll(function() {
            var $nav = $(".nav");
            $nav.toggleClass('scrolled', $(this).scrollTop() > $nav.height());
      });
});
</script>