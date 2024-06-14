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

.trstlogin_00
{
background-color :white ;
border: 1px solid green	;
color :black;
}

.trstlogin_01
{
background-color :white ;
color :black;
font-weight: bold;

}

</style>
</head>
<body>
	<jsp:include page="/Common/Header.jsp"/>
	<main class="container" >
		<div class="row" style="margin-bottom : 30px;">
			<div class="d-flex justify-content-around trstlogin_01" justify-content:space-around;>로그인</div> 	
		</div>
		<div class="row" style=justify-content:space-around;margin-bottom:10px;">
			<div class="col-md-2 trstlogin_00">아이디입력</div> 	
		</div>
		<div class="row" style=justify-content:space-around;margin-bottom:10px;">
			<div class="col-md-2 trstlogin_00">비번입력</div> 	
		</div>
		<div class="row" style=justify-content:space-around;margin-bottom:10px;">
			<div class="col-md-3 ">아이디찾기 / 비밀번호 찾기</div> 	
		</div>	
		<!-- <div class="row" style=justify-content:space-around;margin-bottom:10px;">
			<div class="col-md-2 trstlogin_00">비밀번호찾기</div> 	
		</div> -->
		
		<!-- <div class="row" style="display: flex;margin-bottom : 10px;">
		<div class="d-flex justify-content-around trstlogin_00">로그인</div>
		</div>
		<div class="row">-->		
		
		<!-- <div class=>col-md-12" -->
			<div class="d-flex align-items-center" style="display: flex; min-height: 50px;justify-content: space-around;">
			<button type="button" class="btn btn-success">로그인</button>
			<!-- <button type="button" style = "height: 50px;">123213</button> --> 	
		</div>
		<div class="row">
			<div class="d-flex align-items-center" style="display: flex; min-height: 50px;justify-content: space-around;">
			<button type="button" class="btn btn-success">회원가입</button>
		</div>
		<div>1123</div>
	</main>
</script>

	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.bundle.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
</body>
</html>