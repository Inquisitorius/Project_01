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
.menu_Title{
font-size:25px;
font-weight:600;
border-bottom:1px solid green;
justify-content: center;
width:50%;
text-align:center;
padding:20px;
user-select:none;
}

</style>
</head>
<body>
<% HttpSession session2 = request.getSession(); 
	String userId = (String)session.getAttribute("id");
%>

<main class="container" style="padding-left:0px">
			<div style="width: 100%; height:200px; padding:30px; border: 1px solid green;">
					<span style="font-size:25px; font-weight:600"><%= userId %> 님</span>
			</div>
			
			<div style="display:flex; justify-content: center">
			<hr style="width:90%;">
			</div>
			
			<div class="row" style= "justify-content: center">
				<div class="menu_Title">	
					MY 쇼핑
			</div>
		</div>		
	</main>		
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.bundle.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
</body>
</html>