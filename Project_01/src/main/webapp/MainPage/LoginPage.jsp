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

.login_Title {
	margin-top: 100px;
	font-size: 30px;
	font-weight: 600;
	text-align: center;
	color: rgb(51, 51, 51);
	user-select: none;
}

.ban_Select{
    user-select: none;
}

.input_Style{
    width: 100%;
    height: 46px;
    padding: 0 11px 1px 15px;
    border-radius: 4px;
    border: 1px solid #ddd;
    font-weight: 500;
    font-size: 14px;
    line-height: 1.5;
    color: #333;
    outline: none;
    margin-top: 20px;
    }
  
  .button_Style{
  margin-top:10px;
  }  
  
  .mini_Font{	
	margin-top: 5px;
	font-size: 10px;
	color: rgb(102, 102, 102);
	font-weight: 500;
	text-decoration: none;
	
}

a:visited {
  color: black;
}

a:hover {
  color: black;
}

</style>
</head>
<body>
	<jsp:include page="/Common/Header.jsp" />
	<main class="container">
		<div class="row">
			<div class="login_Title">로그인</div>		
		</div>
		<form action="/login.do" method="post">
		<div class="row" style="justify-content: center;">
			<div class="col-md-3" style="justify-content: center;">
				<input type="text" class="input_Style" placeholder="아이디를 입력해주세요" onfocus="this.placeholder=''" onblur="this.placeholder='아이디를 입력해주세요.'" name="Id">
				<input type="password" class="input_Style" placeholder="비밀번호를 입력해주세요" onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호를 입력해주세요.'" name="Pwd">
				</div>
		</div>
		<div class="row" style="justify-content: center;">
			<div class="col-md-3" style="display:flex; justify-content: flex-end;">
				<a class="mini_Font">아이디 찾기</a> <span>|</span>
				<a class="mini_Font">비밀번호 찾기</a>
			</div>
		</div>
		
		<div class="row" style="justify-content: center;">
			<div class="col-md-3" style="justify-content: center;">
				<div class="button_Style">
					<button type="submit" class="btn btn-success" style="width:100%;" >로그인</button>
				</div>
			</div>
		</div>
		</form>
		
		<div class="row" style="justify-content: center;">
			<div class="col-md-3" style="justify-content: center;">
				<div class="button_Style">
					<button type="button" class="btn btn-success" style="width:100%;" onclick="location.href='/MainPage/JoinPage.jsp';">회원가입</button>
				</div>
			</div>
		</div>
	</main>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.bundle.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
</body>
</html>
