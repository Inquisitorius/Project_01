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

<link rel="stylesheet" href="/resources/css/MainPage.css">
<script src="/resources/bootstrap/js/jquery-3.7.1.js"></script>
<script src="/resources/bootstrap/js/jQueryRotate.js"></script>

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
			      	<!--  <img src="https://product-image.kurly.com/cdn-cgi/image/width=1900,height=370,quality=85/banner/main/pc/img/0d1e09d2-5301-4e91-abcd-5549384d625d.jpg">-->
			      	<img src = "/resources/img/melonHeadLine.jpg"/>
			      </div>
			      <div class="swiper-slide">
			      	<img src="https://product-image.kurly.com/cdn-cgi/image/width=1900,height=370,quality=85/banner/main/pc/img/09193c01-e241-4666-9d41-ec55deeff5e7.jpg">
				</div>			
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
						<span class = "mainpage_SubTitle" style = "vertical-align : bottom;">🛒지금 바로 위스키 특가</span>
						<span><img src = "/resources/img/dash.svg" style = "width: 32px; height: 32px;"/></span>
					</a>
				</div>
			</div>
			<div class= "row d-flex flex-nowrap" style = "justify-content: space-between;">
				<div class = "col" style="display: inline-flex; justify-content: center; text-decoration-line: none;">
					<span class = "mainpage_SubText" >그린 추천 특가템 최대 35%</span>					
				</div>
			</div>			
			<div class= "row d-flex flex-nowrap" style = "justify-content: space-between; margin-top: 24px; margin-bottom: 40px;">
				<div class="swiper mySwiper_card" style = "max-width: 1050px;">
		    		<div class="swiper-wrapper">
		      			<div class="swiper-slide" id = "maincard_0">
		      				<jsp:include page="/MainPage/MainPageCardItem.jsp"/>
		      			</div>
		      			<div class="swiper-slide" id = "maincard_1">
		      				<jsp:include page="/MainPage/MainPageCardItem.jsp"/>
		      			</div>
		      			<div class="swiper-slide" id = "maincard_2">
		      				<jsp:include page="/MainPage/MainPageCardItem.jsp"/>
		      			</div>
		      			<div class="swiper-slide" id = "maincard_3">
		      				<jsp:include page="/MainPage/MainPageCardItem.jsp"/>
		      			</div>
		      			<div class="swiper-slide" id = "maincard_4">
		      				<jsp:include page="/MainPage/MainPageCardItem.jsp"/>
		      			</div>
		      			<div class="swiper-slide" id = "maincard_5">
		      				<jsp:include page="/MainPage/MainPageCardItem.jsp"/>
		      			</div>
		      			<div class="swiper-slide" id = "maincard_6">
		      				<jsp:include page="/MainPage/MainPageCardItem.jsp"/>
		      			</div>		
		    		</div>
		    		<div class="swiper-button-next card_list_next"></div>
			    	<div class="swiper-button-prev card_list_prev"></div>
		  		</div>
			</div>
		</div>	
		<!-- 2nd product list -->
		<div class = "container" style = "max-width: 1050px; min-width: 1050px; padding-left: 0px; padding-right: 0px; padding-top: 40px;">
			<div class= "row d-flex flex-nowrap" style = "justify-content: space-between;">
				<div class = "col" href = "/MainPage/MainPage.jsp" style="display: inline-flex; justify-content: center;">
					<a href = "/MainPage/MainPage.jsp" style ="text-decoration-line: none;">
						<span class = "mainpage_SubTitle" style = "vertical-align : bottom;">🍈 신선한 과일 특가</span>
						<span><img src = "/resources/img/dash.svg" style = "width: 32px; height: 32px;"/></span>
					</a>
				</div>
			</div>
			<div class= "row d-flex flex-nowrap" style = "justify-content: space-between;">
				<div class = "col" style="display: inline-flex; justify-content: center; text-decoration-line: none;">
					<span class = "mainpage_SubText" >그린 마켓에서 진행하는 특별 할인 행사</span>					
				</div>
			</div>			
			<div class= "row d-flex flex-nowrap" style = "justify-content: space-between; margin-top: 24px; margin-bottom: 40px;">
				<div class="swiper mySwiper_card2" style = "max-width: 1050px;">
		    		<div class="swiper-wrapper">
		      			<div class="swiper-slide" id = "maincard2_0">
		      				<jsp:include page="/MainPage/MainPageCardItem.jsp"/>
		      			</div>
		      			<div class="swiper-slide" id = "maincard2_1">
		      				<jsp:include page="/MainPage/MainPageCardItem.jsp"/>
		      			</div>
		      			<div class="swiper-slide" id = "maincard2_2">
		      				<jsp:include page="/MainPage/MainPageCardItem.jsp"/>
		      			</div>
		      			<div class="swiper-slide" id = "maincard2_3">
		      				<jsp:include page="/MainPage/MainPageCardItem.jsp"/>
		      			</div>	
		      			<div class="swiper-slide" id = "maincard2_4">
		      				<jsp:include page="/MainPage/MainPageCardItem.jsp"/>
		      			</div>
		      			<div class="swiper-slide" id = "maincard2_5">
		      				<jsp:include page="/MainPage/MainPageCardItem.jsp"/>
		      			</div>
		      			<div class="swiper-slide" id = "maincard2_6">
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
						<div class = "row" style="padding-left: 30px; padding-top: 10px;">
							<div id="col-3 circle" style = " width : 28px; height : 28px; border-radius: 50%; background-color: rgb(189, 118, 255); padding: 0px;">
								<img id = "" src = "/resources/img/clock_00.png" style = "width: 25px; height: auto; position : relative; left : 1px;">
								<img id = "circle_clock" src = "/resources/img/clock_00.png" style = "width: 25px; height: auto; position: relative; left : 1px; top: -27px; transform: rotate(45deg);">
							</div>
							<div class = "col">
								<label class = "mainpage_timeCountText " id = "time_h" >11</label>
								<label class = "mainpage_timeCountText time_dot" >:</label>
								<label class = "mainpage_timeCountText " id = "time_m" >22</label>
								<label class = "mainpage_timeCountText time_dot" >:</label>
								<label class = "mainpage_timeCountText " id = "time_s" >33</label>
								
							</div>
						</div>
						<div class = "row">
							<div class="notoSans mainpage_cardFont_subText2" style = "padding-top: 40px;">망설이면 늦어용</div>
						</div>
					</div>
					<div style = "width: 694px;">
						<div class = "row" style = "padding-left : 0px; padding-right: 0px; display: inline-flex;">
							<div class = "col-12">
								<img src="/resources/img/product/eventProduct_00.jpg" 
							data-nimg="fill" id="timeLimitEvent_img" style="min-width: 100%; max-width: 100%; hegith: auto; border-radius: 3%;  overflow: hidden; padding-left : 0px;">							
							</div>
							
						</div>
						<div class = "row" style = "margin-top: 5px;">
							<div class = "col-12" style = "display: inline-flex;">
								<button class="btn btn-navy rounded-1 fontCommon_Option" type = "button" id = "TimeEventBtn" style = "width: 100%; height: 36px;">구매</button>
							</div>
						</div>	
						<div class = "row" style = "margin-top: 5px;">
							<div class = "col-12" style = "display: inline-flex;">
								<label class = "notoSans mainpage_cardFont2_subText" id = "timeLimitEvent_sublabel">판매자배송, 모던심플한 10만원대 가성비 음식물처리기</label>
							</div>
						</div>
						<div class = "row" style = "margin-top: 5px;">
							<div class = "col-12" style = "display: inline-flex;">
								<label class = "notoSans mainpage_cardFont2_mainText" id = "timeLimitEvent_mainlabel">[루펜] 음식물처리기 SLW-01 4종(택1)</label>
							</div>
						</div>	
						<div class = "row" style = "margin-top: 5px;">
							<div class = "col-12" style = "display: inline-flex;">
								<label class = "notoSans mainpage_cardFont2_SalePriceText" id = "timeLimitEvent_percent">33%</label>
								<label class = "notoSans mainpage_cardFont2_Price" id = "timeLimitEvent_price">30000원</label>
								<label class = "notoSans mainpage_cardFont2_OriPrice" id = "timeLimitEvent_oriprice">30000원</label>
							</div>
						</div>		
					</div>				
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="/Common/Footer.jsp"/>
	
	<form method="get" id = "form_for_productInfo" style = "display: none" action = "/test/ProductInfo.do">
		<input name = "product_id" id = "product_id_trans" value = ""/>
	</form>
	<!-- 
	product_id
	구매하기 버튼을 누르면 form 의 submit 를 실행
	실행하기 전에 버튼 내부에 있는 정보 초기화 해주고 넘겨야 제대로 id 받음.
	
	 -->
	<script src="/resources/bootstrap/js/bootstrap.bundle.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
	<script>
		
		var targetTime = 0;
						
		
		$(document).ready(function()
		{
			<!-- time function -->			
			circle_clockFunction();		
			
			$('#TimeEventBtn').click(function()
			{
				var product_id = $(this).siblings('#mainpage_productid').val();
				$('#product_id_trans').val(121);
				
				$('#form_for_productInfo').submit();
			});
			
			//사진변경
			//$('#maincard_00').find('.maincard_img').attr('src','/resources/img/product/WildTurkeyMasters.jpg');
			
			//time Limit
			Get_timelimitSaleData(121);
			
			//swiper init;
			Get_SaleProductList(2,'#maincard_');
			Get_SaleProductList(21,'#maincard2_');
			
			//click event
			
			$('.productBtn_forDetail').click(function()
			{
				console.log($(this).siblings('#mainpage_productid').val());
				
				var product_id = $(this).siblings('#mainpage_productid').val();
				$('#product_id_trans').val(product_id);
				
				$('#form_for_productInfo').submit();
			});
			
						
		});
		
		function Get_SaleProductList(id, element_id)
		{
			var data = {
					event_id : id
                };			
			
			console.log(url_server);
			var url = url_server + "/MainController";			
			//target URL INSERT
			url += "/getSaleProductList";
			
			var num = 0;
			
		    $.ajax({
		        type:"post",
		        url:url,
		        crossOrigin: true,
		        contentType: 'application/json',
		        data: JSON.stringify(data),
                success: function(response) 
                {                	                	
                	$(response).each(function()
                	{
                		var id = element_id + num;
                		num = num + 1;
                		if(num < 8)
                		{
                			$(id).find('#mainpage_productid').val(this.product_id);
                			
                			$(id).find('.maincard_img').attr('src',this.product_img);
                    		$(id).find('.mainpage_Itemtitle').html(this.name);
                    		
                    		var oriPrice = this.price_ori;
                    		$(id).find('.mainpage_OripriceText').html(oriPrice.toLocaleString('ko-KR') + "원");
                    		$(id).find('.mainpage_SalepercentText').html(this.price_percent + "%");
                    		
                    		var discountPrice = this.price_discount;
                    		$(id).find('.mainpage_SalePriceText').html(discountPrice.toLocaleString('ko-KR') + "원");
                		}
        			});
                },
		        error : function(request,status,error){
		            alert('code:'+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); //에러 상태에 대한 세부사항 출력
		            alert(e);
		        }
		    });
		}
		
		function Get_timelimitSaleData(productId)
		{
			var data = 
			{
				product_id : productId
            };			
			var url = url_server + "/MainController";
			url += "/getTimeLimitSale";
			
			 $.ajax
			 ({
			    type:"post",
			    url:url,
			    crossOrigin: true,
			    contentType: 'application/json',
			    data: JSON.stringify(data),
	            success: function(response) 
	            {  
	                targetTime = response.endDate;
	                $('#timeLimitEvent_img').attr('src',response.product_img);
	                $('#timeLimitEvent_mainlabel').html(response.name);
	                $('#timeLimitEvent_sublabel').html(response.sub_text);
	                
	                $('#timeLimitEvent_oriprice').html(response.price_ori + "원");
	                $('#timeLimitEvent_price').html(response.price_discount + "원");
	                $('#timeLimitEvent_percent').html(response.price_percent + "%");
	                //timeLimitEvent_oriprice
	               
	                
	                
	            },
	            error : function(request,status,error)
	            {
			            alert('code:'+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); //에러 상태에 대한 세부사항 출력
			            alert(e);
			    }
			 });
		}
		
		function cardItemChange(cardName)
		{
			var data = {
					test_00: "this is ajax ||||;;sada",
					test_01: "very good"
                };
			
			$('#test').text("text changer!!!!!!!!!!!");
			
			var url = url_server + "/MainController/test.do";
		    $.ajax({
		        type:"post",
		        url:url,
		        contentType: 'application/json',
		        data: JSON.stringify(data),		       
                success: function(response) 
                {
                	$(response).each(function(){
        				console.log(this.idx + " : " + this.Category_Name + " ");
        				});
                },
		        error : function(request,status,error){
		            alert('code:'+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); //에러 상태에 대한 세부사항 출력
		            alert(e);
		        }
		    });
		}
		
		function timeUpdate(inputTime)
		{
			var now = new Date().getTime() / 1000;
			var target = new Date(inputTime + " 00:00:00").getTime() /1000; //ms 단위
			
			var hrs = Math.floor((target - now) / 3600); 		
			var min = Math.floor(((target - now) % 3600) / 60);
			var sec = Math.floor((((target - now) % 3600) % 60));
			
			if(hrs < 10)
				hrs = "0" + hrs;
			
			if(min < 10)
				min = "0" + min;
			
			if(sec < 10)
				sec = "0" + sec;
			
			$('#time_h').text(hrs);
			$('#time_m').text(min);
			$('#time_s').text(sec);
		}
		
		function getNextDate()
		{
			var dateTest;
			
			var d = new Date();
			var sel_day = +1;
			d.setDate(d.getDate() + sel_day );


			var year    = d.getFullYear();
			var month   = ('0' + (d.getMonth() +  1 )).slice(-2);
			var day     = ('0' + d.getDate()).slice(-2);
			dateTest = year+"-"+month+"-"+day+" " +" 00:00:00";
			
			return dateTest;
		}
		
		function circle_clockFunction()
		{
			setInterval(function(){
				
			var tr = $('#circle_clock').css('transform');				
			var values = tr.split('(')[1].split(')')[0].split(',');
			
			var a = values[0];
			var b = values[1];
			var c = values[2];
			var d = values[3];

			var scale = Math.sqrt(a*a + b*b);
			var sin = b/scale;
			var angle_0 = Math.round(Math.atan2(b, a) * (180/Math.PI));
				
				//$("#circle_clock").rotate(angle + 30);
			$("#circle_clock").rotate({
			    angle: angle_0 - 360, //예정지
			    animateTo: 89, //출발지
			    duration: 990,
			    callback: function(){
			    	timeUpdate(targetTime);
			    }
			});
				
			},1000);
		}
		
		function testAjax()
		{
			var data = {
					test_00: "this is ajax ||||;;sada",
					test_01: "very good"
                };
			
			$('#test').text("text changer!!!!!!!!!!!");
			
			var url = url_server + "/MainController/test.do";
		    $.ajax({
		        type:"post",
		        url:url,
		        contentType: 'application/json',
		        data: JSON.stringify(data),		       
                success: function(response) 
                {
                	$(response).each(function(){
        				console.log(this.idx + " : " + this.Category_Name + " ");
        				});
                },
		        error : function(request,status,error){
		            alert('code:'+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); //에러 상태에 대한 세부사항 출력
		            alert(e);
		        }
		    });
		}
	
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
	    
	    var swiper2 = new Swiper(".mySwiper_card2", {
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