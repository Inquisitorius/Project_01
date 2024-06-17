<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩에 필요한 meat tag -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Sample Page</title>

<!-- bootstrap css load -->
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">

<!-- 개발에 필요한 LinkFile 공용 목적(Font 등을 로드) -->
<jsp:include page="/Common/LinkFile.jsp"/>

<!-- Head, Footer css link 필수 -->
<link rel="stylesheet" href="/resources/css/Common.css">

<!-- jQuery 사용을 위한 js 로드 -->
<script src="/resources/bootstrap/js/jquery-3.7.1.js"></script>
<style type="text/css">
.testArea
{
	background-color: blue;
}
</style>
</head>
<body>
<!-- Header Include -->
<jsp:include page="/Common/Header.jsp"/>


<main>
	<div class = "container" style = "max-width: 1050px; min-width: 1050px; padding-left: 0px;">
		<div class = "row d-flex flex-nowrap " style = "display: inline-flex; justify-content: space-between;">
			<div class = "col-md-5 flex-nowrap">
				<img src = "https://3p-image.kurly.com/cdn-cgi/image/fit=crop,width=720,height=936,quality=85/files/9a4c0af9-4082-46c5-b534-1049d592ac51/85267c7b-37f1-45d3-bf86-f2534203e63e.png" 
				style = "width: 430px; height: auto;  border-radius: 2%;  overflow: hidden;"/>
			</div>
			<div class = "col flex-nowrap" style = "padding-left: 50px;">
				<div class = "row">
					<div class = "col-md-12" style = "font-size: 24px; font-weight: 700; color: #333;">
						[쉘퍼] 4L 대용량 건조분쇄 음식물처리기 (쉘퍼 음식물처리기)
					</div>
				</div>
				<div class = "row">
					<div class = "col-md-12">
						123123123
					</div>
				</div>
				<div class = "row">
					<div class = "col-md-12">
						123123123
					</div>
				</div>
			</div>
		</div>
		<div class = "row">
			<div class = "col-md-12">
				213123123
			</div>
		</div>
	</div>
</main>

<!-- Footer Include -->
<jsp:include page="/Common/Footer.jsp"/>
<script>
</script>
<!-- bootstrap js load -->
<script src="/resources/bootstrap/js/bootstrap.bundle.js"></script>
</body>
</html>