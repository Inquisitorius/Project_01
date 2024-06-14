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
margin-bottom: 15px;
}
.textinputcss
{
color :black;
}
</style>
</head>
<body>
	<jsp:include page="/Common/Header.jsp"/>
	<main class="container">
		<div class="row" style="margin-bottom : 30px;">
			<div class="d-flex justify-content-around logintop_01" justify-content:space-around;>회원가입</div> 	
		</div>
		<!-- <div class="row" style=justify-content:space-around;margin-bottom:10px;">
			<div class="col-md-3 logincss_01">아이디</div> 	
			<div class="col-md-3 contenteditable placeholder='메시지를 입력해주세요'"></div>
			  -->
		<div class="row">
			 <!-- <div class="col-sm-7">
			 <label for= "inputPassword" class="col-md-3 col-form-label ">아이디</label> -->
			 <div class="col-sm-7">
			 <input type="text" class="col-md-6 col-form-control" id="inputPassword">
			 <div class="col-md-4 ">	
   			 <button type="button" class="btn btn-primary btn-lg ">중복확인</button>
  			 </div> 
  			 </div>
			 </div>
		</div>
		<div class="row" margin-bottom:10px;">
			<div class="col-md-3 logincss_01">이름</div> 	
		</div>
		<div class="row"margin-bottom:10px;">
			<div class="col-md-3 logincss_01">이메일</div> 	
		</div>
		<div class="row"margin-bottom:10px;">
			<div class="col-md-3 logincss_01">휴대폰</div> 	
		</div>
		<div class="row" margin-bottom:10px;">
			<div class="col-md-3 logincss_01">주소</div> 	
		</div>
		<div class="row" margin-bottom:10px;">
			<div class="col-md-3 logincss_01">성별</div> 	
		</div>
		<div class="row" margin-bottom:10px;">
			<div class="col-md-3 logincss_01">생년월일</div> 	
		</div>
		<div class="row" margin-bottom:10px;">
			<div class="col-md-3 logincss_01">아이디입력</div> 	
		</div>
		<div class="row" margin-bottom:10px;">
			<div class="col-md-3 logincss_01">이용약관동의</div> 	
		</div>
		<div class="row" margin-bottom:10px;">
			<div class="col-md-3 logincss_01">가입하기</div> 	
		</div>
	</main>
</script>

	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.bundle.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
</body>
</html>