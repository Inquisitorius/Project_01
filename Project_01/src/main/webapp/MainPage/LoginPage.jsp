<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">

<style type="text/css">
.testArea_00 {
	background-color: #47702e;
	border: 1px solid gray;
	color: white;
}

.button_Style
{
display: flex; 
min-height: 50px;
color: white;
width:90px;
}

.input_Style{
display : flex; 
justify-content: center;

}

.ban_Select{
    -webkit-touch-callout: none; /* iOS Safari */
    -webkit-user-select: none; /* Safari */
    -ms-user-select: none; 
    user-select: none;
}
</style>
</head>
<body>
	<jsp:include page="/Common/Header.jsp" />
	<main class="container">
		<div class="row">
			<div class="col-md-12 testArea_00">중간제목</div>
		</div>		
		<div class = "row">
			<div class="col-md-12"
				style="display: flex; height: 100px; justify-content: center; align-items: flex-end;">
				<p class="ban_Select" style = "font-size: 50px;">로그인</p>
			</div>		
		</div>
		<form action="LoginProcess.jsp" method="post" name="loginForm" onsubmit="return validateForm(this);">
				<div class = "row">
			<div class="input_Style">
				<input type="text" placeholder="아이디를 입력하세요." onfocus="this.placeholder=''" onblur="this.placeholder='아이디를 입력하세요.'" name="LoginId">
			</div>		
		</div>
		<div class = "row">
				<div class="input_Style">
					<input type="password" placeholder="비밀번호를 입력하세요." onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호를 입력하세요.'" name="LoginPwd">
			</div>		
		</div>
		<div class="d-flex align-items-center" style="display: flex; min-height: 50px;justify-content: center;">
			<button type="submit" class="btn btn-success" value="login">로그인</button>
		</div>
		</form>
				<div class="row	">
			<div class="d-flex align-items-center" style="display: flex; min-height: 40px; justify-content: space-around;">
			<button type="button" class="btn btn-success" onclick="location.href='/MainPage/JoinPage.jsp';">회원가입</button>
		</div>
		</div>
		
		
		
	</main>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.bundle.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
</body>
</html>
