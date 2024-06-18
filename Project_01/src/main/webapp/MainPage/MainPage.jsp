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
<link rel="stylesheet" href="/resources/css/MainPage.css">
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
		<div class = "container" style = "max-width: 1050px; min-width: 1050px; padding-left: 0px; padding-right: 0px; padding-top: 40px;">
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
			<div class= "row d-flex flex-nowrap" style = "justify-content: space-between; margin-top: 24px; margin-bottom: 40px;">
				<div class="swiper mySwiper_card" style = "max-width: 1050px;">
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
		<div class = "container" style = "max-width: 1050px; min-width: 1050px; padding-left: 0px; padding-right: 0px; padding-top: 40px; margin-bottom: 40px;">
			<div class= "row d-flex flex-nowrap" style = "justify-content: space-between;">
				<div class = "col">
					<a href = "#">
						<img src = "https://product-image.kurly.com/cdn-cgi/image/width=1050,height=140,quality=85/banner/random-band/pc/img/7cbd0f6e-31bb-4d96-95ea-03931a1bc751.jpg">
					</a>
				</div>
			</div>
		</div>
		<div class = "container" style = "max-width: 1050px; min-width: 1050px; padding-left: 0px; padding-right: 0px; padding-top: 40px; margin-bottom: 100px;">
			<div class = "row">
				<div class ="col-12" style = "display: flex; justify-content: space-between;">
					<div style = "width: 249px;">
						<div class = "row">
							<h2 class="notoSans mainpage_cardFont_mainText">✨최저가 도전</h2>
						</div>
						<div class = "row">
							<h3 class="notoSans mainpage_cardFont_subText">놓칠 수 없는 기회!</h3>
						</div>
						<div class = "row">
							<div class="1">시간 라인</div>
						</div>
						<div class = "row">
							<div class="notoSans mainpage_cardFont_subText2" style = "padding-top: 40px;">망설이면 늦어용</div>
						</div>
					</div>
					<div style = "width: 694px;">
						<div class = "row" style = "padding-left : 0px; padding-right: 0px; display: inline-flex;">
							<div class = "col-12">
								<img src="https://3p-image.kurly.com/cdn-cgi/image/fit=crop,width=800,height=400,quality=85/files/b5efbc44-d31c-43c9-895d-ad087a2b77e3/fbf76cb1-47b3-4628-af7b-1a36b5b3c51b.jpg" 
							data-nimg="fill" class="css-1zjvv7" style="min-width: 100%; max-width: 100%; hegith: auto; border-radius: 3%;  overflow: hidden; padding-left : 0px;">							
							</div>
							
						</div>
						<div class = "row" style = "margin-top: 5px;">
							<div class = "col-12" style = "display: inline-flex;">
								<button class="btn btn-navy rounded-1 fontCommon_Option" type = "button" style = "width: 100%; height: 36px;">구매</button>
							</div>
						</div>	
						<div class = "row" style = "margin-top: 5px;">
							<div class = "col-12" style = "display: inline-flex;">
								<label class = "notoSans mainpage_cardFont2_subText">판매자배송, 모던심플한 10만원대 가성비 음식물처리기</label>
							</div>
						</div>
						<div class = "row" style = "margin-top: 5px;">
							<div class = "col-12" style = "display: inline-flex;">
								<label class = "notoSans mainpage_cardFont2_mainText">[루펜] 음식물처리기 SLW-01 4종(택1)</label>
							</div>
						</div>	
						<div class = "row" style = "margin-top: 5px;">
							<div class = "col-12" style = "display: inline-flex;">
								<label class = "notoSans mainpage_cardFont2_SalePriceText">33%</label>
								<label class = "notoSans mainpage_cardFont2_Price">30000원</label>
								<label class = "notoSans mainpage_cardFont2_OriPrice">30000원</label>
							</div>
						</div>		
					</div>				
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