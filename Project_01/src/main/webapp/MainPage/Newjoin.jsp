<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
<script src="/resources/js/jquery-3.7.1.js"></script>
<script src="https://kit.fontawesome.com/a0b08e370a.js" crossorigin="anonymous"></script>
<style type="text/css">

.logintop_01
{
background-color :white ;
color :black;
font-weight: bold;
font-size: 30px;

}
.logincss_01
{
background-color :white ;
font-weight: bold;

}
.textinputcss
{

color :black;

}
.middle
{
display: flex;
justify-content: center;
}
.middlex
{
display: flex;
justify-content: center;	
}

</style>	
</head>
<body>
<jsp:include page="/Common/Header.jsp"/>
<main class="container" >
	<div class="row" style="margin-bottom : 30px;">
			<div class="d-flex justify-content-around logintop_01" >로그인</div> 	
		</div>
	<form class="row row-cols-lg g-3 align-items-center middle" style="margin-bottom : 15px;">
		<div class="col-md-2 middle" >아이디</div> 	
		</div>
		<div class="col-md-4">
		<label class="visually-hidden" for="inUsername">Username</label>
    	<div class="input-group">
    	<input type="text" class="form-control" id="inUsername" placeholder="Username">
    	</div>
		</div>
		<div class="col-md-2" style="min-height: 38px;justify-content:space-around;">
			<button type="button" class="btn btn-success">중복확인</button>
	</form>

	</div>
	<form class="row row-cols-lg g-3 align-items-center middle" style="margin-bottom : 15px;">
		<div class="col-md-2 middle">비밀번호</div> 	
		</div>
		<div class="col-md-4">
		<label class="visually-hidden" for="inpassword">password</label>
    	<div class="input-group middle">
    	<input type="text" class="form-control" id="inpassword" placeholder="password">
    	</div>
		</div>
		<div class="col-md-2"></div>
	</form>
	
	<form class="row row-cols-lg g-3 align-items-center middle" style="margin-bottom : 15px;">
		<div class="col-md-2 middle">비밀번호확인</div> 	
		</div>
		<div class="col-md-4">
		<label class="visually-hidden" for="inpasswordcheck">passwordcheck</label>
    	<div class="input-group middle">
    	<input type="text" class="form-control" id="inpasswordcheck" placeholder="passwordcheck">
    	</div>
		</div>
		<div class="col-md-2"></div>
	</form>
	
	<form class="row row-cols-lg g-3 align-items-center middle" style="margin-bottom : 15px;">
		<div class="col-md-2 middle">이름</div> 	
		</div>
		<div class="col-md-4">
		<label class="visually-hidden" for="inputname">name</label>
    	<div class="input-group middle">
    	<input type="text" class="form-control" id="inputname" placeholder="name">
    	</div>
		</div>
		<div class="col-md-2"></div>
	</form>
	
	<form class="row row-cols-lg g-3 align-items-center middle" style="margin-bottom : 15px;">
		<div class="col-md-2 middle">이메일번호</div> 	
		</div>
		<div class="col-md-4">
		<label class="visually-hidden" for="inemail">email</label>
    	<div class="input-group middle">
    	<input type="text" class="form-control" id="inemail" placeholder="email">
    	</div>
		</div>
		<div class="col-md-2" style="min-height: 38px;justify-content:space-around;">
			<button type="button" class="btn btn-success">중복확인</button>
		</div>
	</form>
	
	<form class="row row-cols-lg g-3 align-items-center middle" style="margin-bottom : 15px;">
		<div class="col-md-2 middle">휴대폰</div> 	
		</div>
		<div class="col-md-4">
		<label class="visually-hidden" for="inphone">number</label>
    	<div class="input-group middle">
    	<input type="text" class="form-control" id="inphone" placeholder="phone">
    	</div>
		</div>
		<div class="col-md-2" style="min-height: 38px;justify-content:space-around;">
			<button type="button" class="btn btn-success">인증번호받기</button>
			</div>
	</form>
	
	<form class="row row-cols-lg g-3 align-items-center middle" style="margin-bottom : 15px;">
		<div class="col-md-2 middle">주소</div> 	
		</div>
		<div class="col-md-4" style="min-height: 38px;justify-content:space-around;">
			<button type="button" class="btn btn-success">주소 검색</button>
			</div>
			<div class="col-md-2"></div>
	</form>
	
</main>

	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.bundle.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
</body>
</html>