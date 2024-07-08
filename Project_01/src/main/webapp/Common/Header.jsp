<%@page import="oracle.jdbc.internal.OracleConnection.XSSessionSetOperationCode"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/resources/css/Common.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
				<input id = "loginSave" type = "hidden" value = "<%= session.getAttribute("idx")%>"/>
				<input id = "authSave" type = "hidden" value = "<%= session.getAttribute("auth_type")%>"/>
			</div>
		</div>
	</div>	
	<div></div>
	<div class="row" style="display: flex; justify-content: center; align-content: center; min-height: 63px; min-width: 1050px;">
		<div class="col-sm-12 d-flex flex-nowrap" style = "max-width: 1050px; padding : 0px;">
			<div class = "row">
				<div style = "width: auto; display: inline-flex; align-items: center;">
					<!--  <img src="/resources/img/kurly_logo.svg"/> -->
					<a href = "/MainPage/MainPage.jsp" style = "text-decoration: none;">
					<img src="/resources/img/Green.svg" style = "width: 82px; height: 42px; padding-bottom: 5px;">
					</a>
					<button id = "marketBtn_inHeader" class = "fontCommon_Option" style="background: none; border: none; padding-left: 15px; padding-top: 5px; font-size: 15px; color: gray;">마켓그린</button>
					<button id = "contactBtn" class = "fontCommon_Option" style="background: none; border: none; padding-left: 15px; padding-top: 5px; font-size: 15px; color: gray;">회사소개</button>
				</div>	
				<div style = "width: auto; padding-left: 90px;">
					<form class="d-flex" role="search" id="searchForm">
                    	<input class="form-control me-2 fontCommon_Option" type="search" name="search" id="searchInput" placeholder="Search" aria-label="Search" style = "width: 300px;">
                    	<button class="btn btn-outline-success fontCommon_Option" type="submit" id="searchBtn" style = "color: rgb(71, 112, 46);">Search</button>
                	</form>
				</div>
				<div style = "position: relative;">
					<div  
					style = "position:absolute; width: auto; 
					right: -255px; top: -42px; 
					width : 200px; height: 42px; 					
					display: flex; align-items: center;">
						<div id = "adminBtn_Header" style = "width: 36px; margin-left: 10px; height: auto; display: none;"><img style = "width: 36px; height: auto;" src="/resources/img/admin.svg"/></div>
						<div id = "sellerIconImg" style = "width: 36px; margin-left: 10px; height: auto; display: none;"><img style = "width: 36px; height: auto; " src="/resources/img/seller.svg"/></div>
						<div id = "loginBtn_Header" style = "width: 36px; margin-left: 10px; height: auto; display: none;"><img style = "width: 36px; height: auto;" src="/resources/img/login.svg"/></div>
						<div id = "logoutBtn_Header" style = "width: 36px; margin-left: 10px; height: auto; display: none;"><img style = "width: 36px; height: auto;" src="/resources/img/logout.svg"/></div>
						<div id = "useraddBtn_Header" style = "width: 36px; margin-left: 10px; height: auto;"><img style = "width: 36px; height: auto;" src="/resources/img/user_add.svg"/></div>
						<div id = "userpageBtn_Header" style = "width: 36px; margin-left: 10px; height: auto;"><img style = "width: 36px; height: auto;" src="/resources/img/user_page.svg"/></div>
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
			                		<li><a class="dropdown-item category_ItemText_sub dropdown-item_sub" href="/ProductList?page=1&category=alcohol&filters=wine&delivery=&type=" >와인</a></li>
			                		<li><hr class="dropdown-divider" style = "margin-top: 2px; margin-bottom: 2px;"></li>
			                		<li><a class="dropdown-item category_ItemText_sub dropdown-item_sub" href="/ProductList?page=1&category=alcohol&filters=whisky&delivery=&type=" >위스키</a></li>
			                		<li><hr class="dropdown-divider" style = "margin-top: 2px; margin-bottom: 2px;"></li>
			                		<li><a class="dropdown-item category_ItemText_sub dropdown-item_sub" href="/ProductList?page=1&category=alcohol&filters=beer&delivery=&type=" >맥주</a></li>
			                		<li><hr class="dropdown-divider" style = "margin-top: 2px; margin-bottom: 2px;"></li>
			                		<li><a class="dropdown-item category_ItemText_sub dropdown-item_sub" href="/ProductList?page=1&category=alcohol&filters=distilledalcohol&delivery=&type=" >증류주</a></li>
			              		</ul>
			            	</li>
			            	
			            	<li class="dropend">
			            		<a class="dropdown-item dropdown-toggle dropdown-item_main" id="submenuDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" href="#" style = "">
			            			<img class = "categoryImg" src = "/resources/img/category/food.png" style = "width: 20px; height: auto;"/>
			            			<label class = "category_ItemText categoryLabel" style = "height: 20px; padding-left: 10px;">식품</label>
			            		</a>
			            		<ul class="dropdown-menu" aria-labelledby="submenuDropdown" style = "padding-top: 2px; padding-bottom: 2px;">
			                		<li><a class="dropdown-item category_ItemText_sub dropdown-item_sub" href="/ProductList?page=1&category=food&filters=fruit&delivery=&type=" >과일</a></li>
			                		<li><hr class="dropdown-divider" style = "margin-top: 2px; margin-bottom: 2px;"></li>
			                		<li><a class="dropdown-item category_ItemText_sub dropdown-item_sub" href="/ProductList?page=1&category=food&filters=seafood&delivery=&type=" >수산</a></li>
			                		<li><hr class="dropdown-divider" style = "margin-top: 2px; margin-bottom: 2px;"></li>
			                		<li><a class="dropdown-item category_ItemText_sub dropdown-item_sub" href="/ProductList?page=1&category=food&filters=meat&delivery=&type=" >정육</a></li>			                		
			              		</ul>
			            	</li>				            	
			            	
			            	<li class="dropend">
			            		<a class="dropdown-item dropdown-toggle dropdown-item_main" id="submenuDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" href="#" style = "">
			            			<img class = "categoryImg" src = "/resources/img/category/cleaner.png" style = "width: 20px; height: auto;"/>
			            			<label class = "category_ItemText categoryLabel" style = "height: 20px; padding-left: 10px;">가전</label>
			            		</a>
			            		<ul class="dropdown-menu" aria-labelledby="submenuDropdown" style = "padding-top: 2px; padding-bottom: 2px;">
			                		<li><a class="dropdown-item category_ItemText_sub dropdown-item_sub" href="/ProductList?page=1&category=electronics&filters=PC&delivery=&type=" >PC</a></li>
			                		<li><hr class="dropdown-divider" style = "margin-top: 2px; margin-bottom: 2px;"></li>
			                		<li><a class="dropdown-item category_ItemText_sub dropdown-item_sub" href="/ProductList?page=1&category=electronics&filters=kitchen_appliances&delivery=&type=" >주방가전</a></li>
			                		<li><hr class="dropdown-divider" style = "margin-top: 2px; margin-bottom: 2px;"></li>
			                		<li><a class="dropdown-item category_ItemText_sub dropdown-item_sub" href="/ProductList?page=1&category=electronics&filters=living_appliances&delivery=&type=" >생활가전</a></li>			                		
			              		</ul>
			            	</li>	            	
			            
			            	<li class="dropend">
			            		<a class="dropdown-item dropdown-toggle dropdown-item_main" id="submenuDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" href="#" style = "">
			            			<img class = "categoryImg" src = "/resources/img/category/bread.png" style = "width: 20px; height: auto;"/>
			            			<label class = "category_ItemText categoryLabel" style = "height: 20px; padding-left: 10px;">베이커리</label>
			            		</a>
			            		<ul class="dropdown-menu" aria-labelledby="submenuDropdown" style = "padding-top: 2px; padding-bottom: 2px;">
			                		<li><a class="dropdown-item category_ItemText_sub dropdown-item_sub" href="/ProductList?page=1&category=bakery&filters=bread_morning&delivery=&type=" >식빵·모닝빵</a></li>
			                		<li><hr class="dropdown-divider" style = "margin-top: 2px; margin-bottom: 2px;"></li>
			                		<li><a class="dropdown-item category_ItemText_sub dropdown-item_sub" href="ProductList?page=1&category=bakery&filters=jam_spread&delivery=&type=" >잼·스프레드</a></li>
			                		<li><hr class="dropdown-divider" style = "margin-top: 2px; margin-bottom: 2px;"></li>
			                		<li><a class="dropdown-item category_ItemText_sub dropdown-item_sub" href="/ProductList?page=1&category=bakery&filters=dessert&delivery=&type=" >디저트</a></li>
			                		<li><hr class="dropdown-divider" style = "margin-top: 2px; margin-bottom: 2px;"></li>
			                		<li><a class="dropdown-item category_ItemText_sub dropdown-item_sub" href="/ProductList?page=1&category=bakery&filters=cake&delivery=&type=" >케이크</a></li>			                		
			              		</ul>
			            	</li>
			            	
			            	<li class="dropend">
			            		<a class="dropdown-item dropdown-toggle dropdown-item_main" id="submenuDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" href="#" style = "">
			            			<img class = "categoryImg" src = "/resources/img/category/light.png" style = "width: 20px; height: auto;"/>
			            			<label class = "category_ItemText categoryLabel" style = "height: 20px; padding-left: 10px;">가구</label>
			            		</a>
			            		<ul class="dropdown-menu" aria-labelledby="submenuDropdown" style = "padding-top: 2px; padding-bottom: 2px;">
			                		<li><a class="dropdown-item category_ItemText_sub dropdown-item_sub" href="/ProductList?page=1&category=living&filters=sofa_chair&delivery=&type=" >소파·체어</a></li>
			                		<li><hr class="dropdown-divider" style = "margin-top: 2px; margin-bottom: 2px;"></li>
			                		<li><a class="dropdown-item category_ItemText_sub dropdown-item_sub" href="/ProductList?page=1&category=living&filters=organizer&delivery=&type=" >수납정리용품</a></li>
			                		<li><hr class="dropdown-divider" style = "margin-top: 2px; margin-bottom: 2px;"></li>
			                		<li><a class="dropdown-item category_ItemText_sub dropdown-item_sub" href="/ProductList?page=1&category=living&filters=mattress_topper&delivery=&type=" >메트리스·토퍼</a></li>
			                		<li><hr class="dropdown-divider" style = "margin-top: 2px; margin-bottom: 2px;"></li>
			                		<li><a class="dropdown-item category_ItemText_sub dropdown-item_sub" href="/ProductList?page=1&category=living&filters=kitchen_furniture&delivery=&type=" >주방가구</a></li>			                		
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
	//var url_server = 'http://14.42.124.35:8080';
	var url_server = window.location.origin;
	//var url_server = window.location.protocol + window.location.host;
	
	$(document).ready(function()
	{	
		HeaderInit();	
		
		//marketBtn_inHeader
		$('#marketBtn_inHeader').click(function()
		{
			location.href = "/ProductList";
		});
		
		
		$('#contactBtn').click(function()
		{
			location.href = "/MainPage/Contactus.jsp";
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
	
	function HeaderInit()
	{
		var loginCheck = $('#loginSave').val();
		var authCheck = $('#authSave').val();
		
		if(loginCheck == 'null')
		{
			$('#logoutBtn_Header').css('display','none');	
			$('#loginBtn_Header').css('display','block');	
			
			//로그인 이 안되있으니 회원가입
			$('#useraddBtn_Header').css('display','block');
			$('#userpageBtn_Header').css('display','none');
		}
		else
		{
			$('#loginBtn_Header').css('display','none');
			$('#logoutBtn_Header').css('display','block');	
			
			$('#useraddBtn_Header').css('display','none');
			$('#userpageBtn_Header').css('display','block');
		}
		
		if(authCheck == '0' || authCheck == 'null')
		{
			$('#sellerIconImg').css('display','none');
			$('#adminBtn_Header').css('display','none');
		}
		else if(authCheck == '2')
		{
			$('#sellerIconImg').css('display','block');
			$('#adminBtn_Header').css('display','none');
		}
		else if(authCheck == '3')
		{
			$('#adminBtn_Header').css('display','block');
		}
		
		//adminBtn_Header
		$('#adminBtn_Header').css('cursor','pointer');
		$('#adminBtn_Header').click(function()
		{
			location.href = "/Admin/AdminMainPage.jsp";
		});	
			
		
		//useraddBtn_Header
		$('#useraddBtn_Header').css('cursor','pointer');
		$('#userpageBtn_Header').css('cursor','pointer');
		$('#useraddBtn_Header').click(function()
		{
			location.href = "/MainPage/JoinPage.jsp";
		});	
		
		$('#userpageBtn_Header').click(function()
		{
			location.href = "/MyPage/MyPageMain.jsp";
		});	
		
		
		
		$('#loginBtn_Header').css('cursor','pointer');
		$('#loginBtn_Header').click(function()
		{
			location.href = "/MainPage/LoginPage.jsp";
		});		
		
		//logoutTry
		$('#logoutBtn_Header').css('cursor','pointer');
		$('#logoutBtn_Header').click(function()
		{	
			swal({
				  title: "로그아웃되었습니다.",		
				  //text : "asdsad",
				  icon: "info", //"success"
				  button: "확인",
				}).then((value) => {
				location.href = "/login/logoutTry";
			});			
		});
		
		$('#sellerIconImg').css('cursor','pointer');
		$("#sellerIconImg").click(function()
		{
			location.href = "/SellerPage/SellerMainPage.jsp";
		});
		
		   $('#searchForm').submit(function(event) {
		        // 폼의 기본 동작 방지 (페이지 리로딩 방지)
		        event.preventDefault();

		        // 검색어 가져오기
		        var searchword = $('#searchInput').val().trim();

		        // 검색어가 비어 있는지 확인
		        if (searchword.length === 0) {
		            alert('검색어를 입력해주세요.');
		            return;
		        }

		        // 새로운 URL 생성
		        var newUrl = '/search?search=' + encodeURIComponent(searchword);

		        // 페이지 이동
		        window.location.href = newUrl;
		    });
		
	}
</script>