<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
<script src="/resources/bootstrap/js/jquery-3.7.1.js"></script>

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
    margin-top: 10px;
    margin-bottom: 10px;
    }
  
  .font_Style{
  font-size:14px;
  font-weight:600;
  }
  
  .choose_Style{
  background-color:#fff;
  border:0px;
  width:130px;"
  font-size:20px;
  font-weight:600;
  padding:0px;
  color:grey;
  }
  
</style>
</head>
<body>
<jsp:include page="/Common/Header.jsp" />
<main class="container">
		<div class="row">
			<div class="login_Title">아이디 찾기</div>		
		</div>
	<div class="row" style="justify-content:center; height:40px; margin-top:20px; margin-bottom:30px">
		<div class="col-md-3" style="display:flex; justify-content: space-between; padding:0px;">
			
			<button type="button" class="choose_Style" onclick="clickButton()" value="checked">휴대폰 인증</button>
			<button type="button" class="choose_Style" onclick="clickButton()">이메일 인증</button>
		</div>
	</div>	
	<form  method="post">
		<div class="row" style="justify-content: center;">
			<div class="col-md-3" style="justify-content: center;">
				<div><span class="font_Style">이름</span></div>
				<input id = "input_id" type="text" class="input_Style" placeholder="이름을 입력해주세요" onfocus="this.placeholder=''" onblur="this.placeholder='이름을 입력해주세요.'" name="name">
				<div><span class="font_Style">휴대폰 번호</span></div>
				<input id = "input_pw" type="password" class="input_Style" placeholder="휴대폰 번호를 입력해주세요" onfocus="this.placeholder=''" onblur="this.placeholder='전화번호를 입력해주세요.'" name="phone">
				<button type="button" class="btn btn-success" style="margin-top:30px; width:100%;">찾기</button>
				</div>
		</div>
		
		<script>
		</script>
	
	
	</form>
	</main>
	<jsp:include page="/Common/Footer.jsp" />
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.bundle.js"></script>
	<script	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
</body>
</html>