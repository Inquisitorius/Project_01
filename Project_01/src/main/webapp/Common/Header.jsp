<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<header class="container-fluid shadow_eff">
	<div class="row" style="display: flex; justify-content: center; min-height: 35px; background-color: #47702e;">
		<div class="col-sm-12" style="padding-top: 10px; max-width: 1050px;">
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
					<img src="/resources/img/kurly_logo.svg"/>
					<button style="background: none; border: none; padding-left: 15px; font-size: 15px; color: gray;">마켓컬리</button>
					<button style="background: none; border: none; padding-left: 15px; font-size: 15px; color: gray;">뷰티컬리</button>
				</div>	
				<div style = "width: auto; padding-left: 50px;">
					<form class="d-flex" role="search">
                    	<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" style = "width: 300px;">
                    	<button class="btn btn-outline-success" type="submit">Search</button>
                	</form>
				</div>
				<div style = "position: relative;">
					<div  
					style = "position:absolute; width: auto; 
					right: -325px; top: -42px; 
					width : 200px; height: 42px; 					
					display: flex; align-items: center; justify-content: space-evenly;">
						<div style = "width: 36px; height: auto;"><img style = "width: 36px; height: auto;" src="/resources/img/logout.svg"/></div>
						<div style = "width: 36px; height: auto;"><img style = "width: 36px; height: auto;" src="/resources/img/login.svg"/></div>
						<div style = "width: 36px; height: auto;"><img style = "width: 36px; height: auto;" src="/resources/img/user_add2.svg"/></div>
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
						style = "font-size: 16px;">	 
			            	<img style = "width: 15px; height: auto; margin-right: 10px;" src="/resources/img/menu.svg"/> 카테고리
			         	</div>
			          	<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
			            	<li><a class="dropdown-item" href="#">Action</a></li>
			            	<li><a class="dropdown-item" href="#">Another action</a></li>
			            	<li><hr class="dropdown-divider"></li>
			            	<li class="dropend">
			              		<a class="dropdown-item dropdown-toggle" href="#" id="submenuDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			                		More options
			              		</a>
			              		<ul class="dropdown-menu" aria-labelledby="submenuDropdown">
			                		<li><a class="dropdown-item" href="#">Submenu Action 1</a></li>
			                		<li><a class="dropdown-item" href="#">Submenu Action 2</a></li>
			              		</ul>
			            	</li>
			            	<li>
			            		<a class="dropdown-item" href="#">Something else here</a>
			            	</li>
			            	<li><hr class="dropdown-divider"></li>
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
		$("#categoryText").mouseover(function()
		{
			console.log("mouseOver Hit");			
		});
	});
</script>