<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
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
	background-color: black;
	border: 1px solid gray;
	color: white;
}

</style>
</head>
<body>
	<jsp:include page="/Common/Header.jsp"/>
	<main class="container testArea_01" style="width: 70%;">
		<div class="row">
			<div class="col-md-6">asdadad</div>
			<div class="col-md-6">asdadad</div>
		</div>
		<div class="row">
			<div class="col-md-6">asdadad</div>
			<div class="col-md-6">asdadad</div>
		</div>
		<div class="row">
			<div class="col-md-6"><input  class = "inputtest" type = "text" value = "1232134"/></div>
			<div class="col-md-6"><button type = "button" class = "btntest" >move Test</button></div>
			
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

	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/bootstrap.bundle.js"></script>
</body>
</html>