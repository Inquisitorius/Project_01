<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MainPage</title>
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
<jsp:include page="/Common/LinkFile.jsp"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<link rel="stylesheet" href="/resources/css/Common.css">
<script src="/resources/bootstrap/js/jquery-3.7.1.js"></script>

<style type="text/css">
body {
  -webkit-user-select:none;
  -moz-user-select:none;
  -ms-user-select:none;
  user-select:none
}

.testArea_00 
{
	background-color: purple;
	border: 1px solid gray;
	color: white;
}

.testArea_01
{
	background-color: blue;
	border: 1px solid gray;
	color: white;
}

.testArea_02
{
	background-color: red;
	border: 1px solid gray;
	color: white;
}

.testArea_03
{
	background-color: black;
	border: 1px solid gray;
	color: white;
}

.swiper 
{
	width: 100%;
    height: 100%;
}
    
.swiper-slide 
{
      text-align: center;
      font-size: 18px;
      background: #fff;
      display: flex;
      justify-content: center;
      align-items: center;
}

.swiper-slide img 
{
      display: block;
      width: 100%;
      height: 100%;
      object-fit: cover;
}

.swiper .swiper-pagination-bullet {
  background-color: #304D30;
  margin: 0 10px;
}

.swiper-button-next, .swiper-button-prev
{
	color: #304D30; /* 화살표 색상 */
}

.swiper-button-next.swiper-button-disabled, 
.swiper-button-prev.swiper-button-disabled 
{
    opacity: .00;    
}

.card_list_prev,
.card_list_next
{
	color: #ffffff;
	border-radius: 50%;
	border: 1px solid black;
}

/*부트스트랩 색상 설정*/
.btn-navy {
	color: #a0a0a0;
	background-color: #ffffff;
	border-color: #e0e0e0;
}
.btn-navy:hover {
	color: #fff;
	background-color: #47702e;
	border-color: #163020;
}

</style>
</head>
<body>
	<jsp:include page="/Common/Header.jsp"/>
	<main>
	<div class = "container-fluid" style = "padding : 0px; margin-bottom: 40px;">
		<!-- Swiper -->
			 <div class="swiper mySwiper" style = "height: 370px;">
			    <div class="swiper-wrapper">
			      <div class="swiper-slide">
			      	<img src="https://product-image.kurly.com/cdn-cgi/image/width=1900,height=370,quality=85/banner/main/pc/img/60026f84-40b2-4eb7-84d5-b90b464feb41.jpg">
			      </div>
			      <div class="swiper-slide">
			      	<img src="https://product-image.kurly.com/cdn-cgi/image/width=1900,height=370,quality=85/banner/main/pc/img/0d1e09d2-5301-4e91-abcd-5549384d625d.jpg">
			      </div>
			      <div class="swiper-slide">
			      	<img src="https://product-image.kurly.com/cdn-cgi/image/width=1900,height=370,quality=85/banner/main/pc/img/09193c01-e241-4666-9d41-ec55deeff5e7.jpg">
				</div>
			      <div class="swiper-slide">Slide 4</div>			
				</div>
				<div class="swiper-button-next"></div>
			    <div class="swiper-button-prev"></div>
			    <div class="swiper-pagination"></div>
			</div>
	</div>
		<div class = "container" style = "max-width: 1050px; min-width: 1050px; padding-left: 0px; padding-top: 40px;">
			<div class= "row d-flex flex-nowrap" style = "justify-content: space-between;">
				<div class = "col" href = "/MainPage/MainPage.jsp" style="display: inline-flex; justify-content: center;">
					<a href = "/MainPage/MainPage.jsp" style ="text-decoration-line: none;">
						<span class = "mainpage_SubTitle" style = "vertical-align : bottom;">🛒지금 가장 많이 담는 특가</span>
						<span><img src = "/resources/img/dash.svg" style = "width: 32px; height: 32px;"/></span>
					</a>
				</div>
			</div>
			<div class= "row d-flex flex-nowrap" style = "justify-content: space-between;">
				<div class = "col" style="display: inline-flex; justify-content: center; text-decoration-line: none;">
					<span class = "mainpage_SubText" >그린 추천 특가템 최대 30%</span>					
				</div>
			</div>
			<div class= "row d-flex flex-nowrap" style = "justify-content: space-between; margin-top: 24px;">
				<div class="swiper mySwiper_card">
		    		<div class="swiper-wrapper">
		      			<div class="swiper-slide">
		      				<jsp:include page="/MainPage/MainPageCardItem.jsp"/>
		      			</div>
		      			<div class="swiper-slide">
		      				<jsp:include page="/MainPage/MainPageCardItem.jsp"/>
		      			</div>
		      			<div class="swiper-slide">
		      				<jsp:include page="/MainPage/MainPageCardItem.jsp"/>
		      			</div>
		      			<div class="swiper-slide">
		      				<jsp:include page="/MainPage/MainPageCardItem.jsp"/>
		      			</div>
		      			<div class="swiper-slide">
		      				<jsp:include page="/MainPage/MainPageCardItem.jsp"/>
		      			</div>
		      			<div class="swiper-slide">
		      				<jsp:include page="/MainPage/MainPageCardItem.jsp"/>
		      			</div>
		      			<div class="swiper-slide">
		      				<jsp:include page="/MainPage/MainPageCardItem.jsp"/>
		      			</div>		
		    		</div>
		    		<div class="swiper-button-next card_list_next"></div>
			    	<div class="swiper-button-prev card_list_prev"></div>
		  		</div>
			</div>
		</div>		
	</main>
	<jsp:include page="/Common/Footer.jsp"/>
	<script>
	$(document).ready(function()
	{
		//alert("jQuery is Ready");
	});
	
	$('.btntest').click(function()
	{
		alert("Clicked");
		$('.inputtest').val("asdsadsa");
		location.href = "/MainController/test.do2";
	});
	
	</script>

	<!--  <script src="/resources/bootstrap/js/bootstrap.min.js"></script>-->
	<script src="/resources/bootstrap/js/bootstrap.bundle.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
	<script>
		<!-- Initialize Swiper -->
	    var swiper = new Swiper(".mySwiper", {
	      slidesPerView: 1,
	      spaceBetween: 30,
	      loop: true,
	      effect: "fade",
	      autoplay: {
	          delay: 2500,
	          disableOnInteraction: false,
	      },
	      pagination: {
	          el: '.swiper-pagination',
	          clickable: true,
	        },
	      navigation: {
	          nextEl: '.swiper-button-next',
	          prevEl: '.swiper-button-prev',
	      },
	    });
	    
	    var swiper2 = new Swiper(".mySwiper_card", {
	        slidesPerView: 4,
	        spaceBetween: 30,	        
	        navigation: 
	        {
		        nextEl: ".card_list_next",
		        prevEl: ".card_list_prev",
		     },
	      });
  	</script>
</body>
</html>