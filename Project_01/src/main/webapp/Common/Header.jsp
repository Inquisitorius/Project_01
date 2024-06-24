<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/resources/css/Common.css">
<header class="container-fluid shadow_eff">
	<div class="row" style="display: flex; justify-content: center; min-height: 35px; background-color: #163020;">
		<div class="col-12" style="padding-top: 10px; max-width: 1050px;">
			<div class = "row">
				<!--  <div class = "aaa" style ="padding-right: 5%; width: 100%; display: flex; justify-content: flex-end; min-width: 200px;">					
					<div style = "font-size: 12px; padding-right: 10px; color: 217, 217, 217;">회원가입</div>
					<div style = "font-size: 12px; padding-right: 10px; color: 217, 217, 217;"><i class="fa-solid fa-grip-lines-vertical"></i></div>
					
					<div style = "font-size: 12px; padding-right: 10px; color: 217, 217, 217;">로그인</div>
					<div style = "font-size: 12px; padding-right: 10px; color: 217, 217, 217;"><i class="fa-solid fa-grip-lines-vertical"></i></div>
					
					<div style = "display:inline; font-size: 12px; padding-right: 3px; color: 217, 217, 217;">고객센터</div>	
				</div> -->
			</div>
		</div>
	</div>	
	<div></div>
	<div class="row" style="display: flex; justify-content: center; align-content: center; min-height: 63px; min-width: 1050px;">
		<div class="col-sm-12 d-flex flex-nowrap" style = "max-width: 1050px; padding : 0px;">
			<div class = "row">
				<div style = "width: auto;">
					<!--  <img src="/resources/img/kurly_logo.svg"/> -->
					<a href = "/MainPage/MainPage.jsp" style = "text-decoration: none;">
					<img src="/resources/img/Green.svg"/ style = "width: 82px; height: 42px; padding-bottom: 5px;">
					</a>
					<button class = "fontCommon_Option" style="background: none; border: none; padding-left: 15px; font-size: 15px; color: gray;">마켓그린</button>
					<button class = "fontCommon_Option" style="background: none; border: none; padding-left: 15px; font-size: 15px; color: gray;">뷰티그린</button>
				</div>	
				<div style = "width: auto; padding-left: 50px;">
					<form class="d-flex" role="search">
                    	<input class="form-control me-2 fontCommon_Option" type="search" placeholder="Search" aria-label="Search" style = "width: 300px;">
                    	<button class="btn btn-outline-success fontCommon_Option" type="submit" style = "color: rgb(71, 112, 46);">Search</button>
                	</form>
				</div>
				<div style = "position: relative;">
					<div  
					style = "position:absolute; width: auto; 
					right: -325px; top: -42px; 
					width : 200px; height: 42px; 					
					display: flex; align-items: center; justify-content: space-evenly;">
						<div style = "width: 36px; height: auto;"><img id = "sellerIconImg" style = "width: 36px; height: auto;" src="/resources/img/seller.svg"/></div>
						<div style = "width: 36px; height: auto;"><img style = "width: 36px; height: auto;" src="/resources/img/login.svg"/></div>
						<div style = "width: 36px; height: auto;"><img style = "width: 36px; height: auto;" src="/resources/img/logout.svg"/></div>
						<div style = "width: 36px; height: auto;"><img style = "width: 36px; height: auto;" src="/resources/img/user_add.svg"/></div>
						<div style = "width: 36px; height: auto;"><img style = "width: 36px; height: auto;" src="/resources/img/user_page.svg"/></div>
						<div></div>
					</div>					
				</div>					
			</div>
		</div>
	</div>
	<div class = "row" style="display: flex; justify-content: center; align-content: center; min-height: 56px; min-width: 1050px;">
		<div class = "col-sm-12" style = "width: 1050px;">
			<div class = "row">				
				<div class = "col-sm-4" style = "padding: 0px;">
					<div class="btn-group">
						<div class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="false"
						style = "font-size: 16px; display: inline-flex; align-items: center;">	 
			            	<img style = "width: 15px; height: auto; margin-right: 10px; padding-top: 2px;" src="/resources/img/menu.svg"/> 
			            	<label class = "fontCommon_Option" style = "color: gray;">카테고리</label>
			         	</div>
			          	<ul class="dropdown-menu" aria-labelledby="navbarDropdown" style = "padding-top: 2px; padding-bottom: 2px;">	
			            	<li class="dropend">
			            		<a class="dropdown-item dropdown-toggle dropdown-item_main" id="submenuDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" href="#" style = "">
			            			<img class = "categoryImg" src = "/resources/img/category/wine.png" style = "width: 20px; height: auto;"/>
			            			<label class = "category_ItemText categoryLabel" style = "height: 20px; padding-left: 10px;">주류</label>
			            		</a>
			            		<ul class="dropdown-menu" aria-labelledby="submenuDropdown" style = "padding-top: 2px; padding-bottom: 2px;">
			                		<li><a class="dropdown-item category_ItemText_sub dropdown-item_sub" href="#" >와인</a></li>
			                		<li><hr class="dropdown-divider" style = "margin-top: 2px; margin-bottom: 2px;"></li>
			                		<li><a class="dropdown-item category_ItemText_sub dropdown-item_sub" href="#" >위스키</a></li>
			                		<li><hr class="dropdown-divider" style = "margin-top: 2px; margin-bottom: 2px;"></li>
			                		<li><a class="dropdown-item category_ItemText_sub dropdown-item_sub" href="#" >맥주</a></li>
			                		<li><hr class="dropdown-divider" style = "margin-top: 2px; margin-bottom: 2px;"></li>
			                		<li><a class="dropdown-item category_ItemText_sub dropdown-item_sub" href="#" >증류주</a></li>
			              		</ul>
			            	</li>
			            	
			            	<li class="dropend">
			            		<a class="dropdown-item dropdown-toggle dropdown-item_main" id="submenuDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" href="#" style = "">
			            			<img class = "categoryImg" src = "/resources/img/category/food.png" style = "width: 20px; height: auto;"/>
			            			<label class = "category_ItemText categoryLabel" style = "height: 20px; padding-left: 10px;">식품</label>
			            		</a>
			            		<ul class="dropdown-menu" aria-labelledby="submenuDropdown" style = "padding-top: 2px; padding-bottom: 2px;">
			                		<li><a class="dropdown-item category_ItemText_sub dropdown-item_sub" href="#" >과일</a></li>
			                		<li><hr class="dropdown-divider" style = "margin-top: 2px; margin-bottom: 2px;"></li>
			                		<li><a class="dropdown-item category_ItemText_sub dropdown-item_sub" href="#" >수산</a></li>
			                		<li><hr class="dropdown-divider" style = "margin-top: 2px; margin-bottom: 2px;"></li>
			                		<li><a class="dropdown-item category_ItemText_sub dropdown-item_sub" href="#" >정육</a></li>			                		
			              		</ul>
			            	</li>				            	
			            	
			            	<li class="dropend">
			            		<a class="dropdown-item dropdown-toggle dropdown-item_main" id="submenuDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" href="#" style = "">
			            			<img class = "categoryImg" src = "/resources/img/category/cleaner.png" style = "width: 20px; height: auto;"/>
			            			<label class = "category_ItemText categoryLabel" style = "height: 20px; padding-left: 10px;">가전</label>
			            		</a>
			            		<ul class="dropdown-menu" aria-labelledby="submenuDropdown" style = "padding-top: 2px; padding-bottom: 2px;">
			                		<li><a class="dropdown-item category_ItemText_sub dropdown-item_sub" href="#" >PC</a></li>
			                		<li><hr class="dropdown-divider" style = "margin-top: 2px; margin-bottom: 2px;"></li>
			                		<li><a class="dropdown-item category_ItemText_sub dropdown-item_sub" href="#" >주방가전</a></li>
			                		<li><hr class="dropdown-divider" style = "margin-top: 2px; margin-bottom: 2px;"></li>
			                		<li><a class="dropdown-item category_ItemText_sub dropdown-item_sub" href="#" >생활가전</a></li>			                		
			              		</ul>
			            	</li>	            	
			            
			            	<li class="dropend">
			            		<a class="dropdown-item dropdown-toggle dropdown-item_main" id="submenuDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" href="#" style = "">
			            			<img class = "categoryImg" src = "/resources/img/category/bread.png" style = "width: 20px; height: auto;"/>
			            			<label class = "category_ItemText categoryLabel" style = "height: 20px; padding-left: 10px;">베이커리</label>
			            		</a>
			            		<ul class="dropdown-menu" aria-labelledby="submenuDropdown" style = "padding-top: 2px; padding-bottom: 2px;">
			                		<li><a class="dropdown-item category_ItemText_sub dropdown-item_sub" href="#" >식빵·모닝빵</a></li>
			                		<li><hr class="dropdown-divider" style = "margin-top: 2px; margin-bottom: 2px;"></li>
			                		<li><a class="dropdown-item category_ItemText_sub dropdown-item_sub" href="#" >잼·스프레드</a></li>
			                		<li><hr class="dropdown-divider" style = "margin-top: 2px; margin-bottom: 2px;"></li>
			                		<li><a class="dropdown-item category_ItemText_sub dropdown-item_sub" href="#" >디저트</a></li>
			                		<li><hr class="dropdown-divider" style = "margin-top: 2px; margin-bottom: 2px;"></li>
			                		<li><a class="dropdown-item category_ItemText_sub dropdown-item_sub" href="#" >케이크</a></li>			                		
			              		</ul>
			            	</li>
			            	
			            	<li class="dropend">
			            		<a class="dropdown-item dropdown-toggle dropdown-item_main" id="submenuDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" href="#" style = "">
			            			<img class = "categoryImg" src = "/resources/img/category/light.png" style = "width: 20px; height: auto;"/>
			            			<label class = "category_ItemText categoryLabel" style = "height: 20px; padding-left: 10px;">가구</label>
			            		</a>
			            		<ul class="dropdown-menu" aria-labelledby="submenuDropdown" style = "padding-top: 2px; padding-bottom: 2px;">
			                		<li><a class="dropdown-item category_ItemText_sub dropdown-item_sub" href="#" >소파·체어</a></li>
			                		<li><hr class="dropdown-divider" style = "margin-top: 2px; margin-bottom: 2px;"></li>
			                		<li><a class="dropdown-item category_ItemText_sub dropdown-item_sub" href="#" >침실가구</a></li>
			                		<li><hr class="dropdown-divider" style = "margin-top: 2px; margin-bottom: 2px;"></li>
			                		<li><a class="dropdown-item category_ItemText_sub dropdown-item_sub" href="#" >메트리스·토퍼</a></li>
			                		<li><hr class="dropdown-divider" style = "margin-top: 2px; margin-bottom: 2px;"></li>
			                		<li><a class="dropdown-item category_ItemText_sub dropdown-item_sub" href="#" >주방가구</a></li>			                		
			              		</ul>
			            	</li>
			          	</ul>	
			          					  
					</div>	
				</div>
			</div>
		</div>
	</div>
</header>
<script>
	$(document).ready(function()
	{
		$('#sellerIconImg').css('cursor','pointer');
		$("#sellerIconImg").click(function()
		{
			location.href = "/SellerPage/SellerMainPage.jsp";
		});
		
		$('.dropdown-item_main').mouseover(function()
		{
			var src = $(this).children('.categoryImg').attr("src");
			src = src.slice(0, -4);
			src = src + "_sel.png";
			
			$(this).children('.categoryLabel').css("color","#108c0d");			
			$(this).children('.categoryImg').attr("src",src);			
		});
		
		$('.dropdown-item_main').mouseout(function()
		{
			var src = $(this).children('.categoryImg').attr("src");
			src = src.slice(0, -8);
			src = src + ".png";
			
			$(this).children('.categoryLabel').css("color","rgb(51, 51, 51)");
			$(this).children('.categoryImg').attr("src",src);
		});
		
		$('.dropdown-item_sub').mouseover(function()
		{
			$(this).css("color","#108c0d");
			
		});
		
		$('.dropdown-item_sub').mouseout(function()
		{
			$(this).css("color","rgb(51, 51, 51)");	
		});
		
	});
</script>