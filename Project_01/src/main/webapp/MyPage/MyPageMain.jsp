<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
<script src="/resources/bootstrap/js/jquery-3.7.1.js"></script>
<script src="https://kit.fontawesome.com/a0b08e370a.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/fork-awesome@1.2.0/css/fork-awesome.min.css">
<style type="text/css">


</style>
</head>
<body>
<jsp:include page="/Common/Header.jsp" />
<main class="container" style="width:1050px;" >
		<div class="row" style="display:block; min-height:50px; "></div>
		<div class="row" style="justify-content: center;">
				<div class="col-md-5" style="padding-left:0px;">
				<jsp:include page="MyPageMenu.jsp" />
				</div>
				<div class="col-md-7" style="height:1000px; border: 1px solid green;">
				아아아아아아아앙아ㅏ
				</div>
			
			</div>
	</main>		
<jsp:include page="/Common/Footer.jsp" />
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.bundle.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
</body>
</html>