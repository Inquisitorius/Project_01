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
	<main class="container" >
		<div class="row">
			<div class="col-md-12 testArea_00">중간제목</div>			
		</div>
		<div class="row" style = "padding-top: 10px;">
			<div class="col-md-12 testArea_01">사진영역</div>			
		</div>
		<div class="row testArea_03">
			<div class="col-md-6">
				<input  class = "inputtest" type = "text" value = "1232134"/>
			</div>
			<div class="col-md-6">
				<div class = "row">
					<div class = "col-md-12">123213213</div>
				</div>
				<div class = "row">
					<div class = "col-md-12">123213213</div>
				</div>
				<div class = "row">
					<div class = "col-md-6">반</div>
					<div class = "col-md-6">반</div>
				</div>
				<div class = "row">
					<div class = "col-md-12">123213213</div>
				</div>
				<div class = "row">
					<div class = "col-md-12">123213213</div>
				</div>
			</div>			
		</div>
		<div class = "row">
			<div class ="col-md-12" style="display: flex; min-height: 1000px;">
				<button type="button" style = "height: 50px;">123213</button>	
				<button type="button" style = "height: 50px;">123213</button>	
				<button type="button" style = "height: 50px;">123213</button>	
				<button type="button" style = "height: 50px;">123213</button>	
			</div>			
		</div>
	</main>
	<footer class="container-fluid">
		<div class="row">
			<div class="col-md-12">footer</div>
		</div>
	</footer>
	<script>
	$(document).ready(function()
	{
		//alert("jQuery is Ready");
	});
	
	$('.btntest').click(function()
	{
		alert("Clicked");
		$('.inputtest').val("asdsadsa");
		location.href = "/MainController/test.do2";
	});
	
	</script>

	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.bundle.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
</body>
</html>