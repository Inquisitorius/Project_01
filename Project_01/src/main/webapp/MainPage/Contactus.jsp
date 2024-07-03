<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SellerMain</title>
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
<jsp:include page="/Common/LinkFile.jsp"/>

<link rel="stylesheet" href="/resources/css/MainPage.css">
<script src="/resources/bootstrap/js/jquery-3.7.1.js"></script>
<script type="text/javascript" src="https://unpkg.com/tabulator-tables/dist/js/tabulator.min.js"></script>
<style>
body
{
	background-color: black;
}

html, body {   
    overflow-x: hidden; /* 수평 스크롤바 제거 */
}

.video_MainTitle
{
	font-family: "Noto Sans KR", sans-serif;
	font-optical-sizing: auto;
	font-style: normal;
	
	font-size: 80px;
    line-height: 1.15;
    letter-spacing: -0.26px;
    font-weight: 800;	
}

.video_MainTitle_subtext
{
	font-family: "Noto Sans KR", sans-serif;
	font-optical-sizing: auto;
	font-style: italic;
	
	font-size: 15px;
    line-height: 1.15;
    letter-spacing: -0.26px;
    font-weight: 500;	
}

.video_subTitle
{
	font-family: "Noto Sans KR", sans-serif;
	font-optical-sizing: auto;
	font-style: normal;
	
	font-size: 25px;
    line-height: 1.15;
    letter-spacing: -0.26px;
    font-weight: 600;	
}

.video_subTitle
{
	font-family: "Noto Sans KR", sans-serif;
	font-optical-sizing: auto;
	font-style: normal;
	
	font-size: 25px;
    line-height: 1.15;
    letter-spacing: -0.26px;
    font-weight: 600;	
}


.videoBackground {
    position: relative;
    width: 100%;
    padding-top: 56.25%; /* 16:9 비율을 유지하기 위해 */
    overflow: hidden;
}

.videoBackground video {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: cover; /* 동영상이 컨테이너를 덮도록 설정 */
    filter: blur(8px);
}

.overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5); /* 반투명 검은색 오버레이 */
    z-index: 2;
}

.content {
    position: absolute;
    z-index: 3;
    color: white;
    text-align: center;
    top: 40%; /* 중앙에 위치 */
    left: 50%;
    transform: translate(-50%, -50%);
    animation: slide-in 2s ease-out forwards; /* 애니메이션 적용 */
}

#fadeContent {
    position: absolute;
    z-index: 3;
    color: white;
    text-align: center;
    top: 60%; /* 약간 아래에 위치 */
    left: 50%;
    transform: translate(-50%, -50%);
    animation: fade-in-in 2s ease-out forwards; /* 다른 애니메이션 적용 */
}

.fontCommon_Option_conect
{
	font-family: "Noto Sans KR", sans-serif;
	font-optical-sizing: auto;
	font-style: normal;
	color: #eaeaea;	
}

@keyframes fade-in-in
{
	0% {
        transform: translate(-125%, -855%); /* 오른쪽에서 시작555 */
    }
    100% {
        transform: translate(-125%, -300%); /* 중앙에 위치  -300*/
    }
}

@keyframes slide-in 
{
    0% {
        transform: translate(575%, -0%); /* 오른쪽에서 시작 */
    }
    100% {
        transform: translate(75%, -0%); /* 중앙에 위치 */
 	}
}
</style>
</head>
<body>
<header class="container-fluid">
<div class = "row">
	<div class = "col-12" style = "margin-left: 100px;">
		<a href = "/MainPage/MainPage.jsp" style = "text-decoration: none;">
			<img src="/resources/img/Green_bw.svg" style = "width: 82px; height: 42px; padding-bottom: 5px;">
		</a>		
	</div>
</div>
</header>
<main>
<!-- https://drive.google.com/file/d/1r8LaQaKdP8pjiPJ85pEKvqEOomGEIpY8/view?usp=drive_link  video/webm-->
<!-- /resources/img/video/ContectUs.mp4 -->
<div class="container-fluid">
    <div class="row">
        <div class="col-12" style = "padding: 0px;">
            <div class="videoBackground">
                <video id="bg_video" src="/resources/img/video/ContectUs.mp4" 
                loop="" muted="" autoplay></video>
                <div class="overlay"></div>
                <div class="content" style = "text-align: left;">
                    <h3 class = "video_subTitle">Project Team</h3>
                    <p style = "text-align: left;">포트폴리오의 새로운 흐름<br/>
                    이클립스 기반의 뉴미디어 콘텐츠 스페셜리스트<br/>
                   	'오늘 점심메뉴가 무엇인가' 매일 열틴 토론</p>
                </div>
                <div id ="fadeContent" style = "text-align: left;">
                    <h1 class = "video_MainTitle">The Green </h1>
                    <p class = "video_MainTitle_subtext" style = "text-align: right;">
                    Groove · Routine · Ensue · Exists · Near </p>
                </div>
            </div>
        </div>        
    </div>
</div>
<div class="container" style = "color: #fff; padding-top: 50px; padding-bottom: 50px;">
	<div class = "row" style = "border-bottom: 1px solid #a0a0a0; padding-top: 10px;">
		<div class = "col-2"><img src="/resources/img/contect/giseon.svg" style = "width: 100%; height: auto; "></div>
		<div class = "col-10" style = "margin-top: 40px;">
			<div class = "row"><label class = "video_subTitle" style  = "padding-bottom: 10px;">정기선 팀장</label></div>
			<div class = "row"><label>매일 순두부 찌개 미는편</label></div>
			<div class = "row"><label>카페인 중독자</label></div>
			<div class = "row"><label>메인화면, 판매자 메인, 판매자 기능전반</label></div>
		</div>
	</div>
	<div class = "row" style = "border-bottom: 1px solid #a0a0a0; padding-top: 10px;">
		<div class = "col-2"><img src="/resources/img/contect/Hyeonok.svg" style = "width: 100%; height: auto; "></div>
		<div class = "col-10" style = "margin-top: 40px;">
			<div class = "row"><label class = "video_subTitle" style  = "padding-bottom: 10px;">박현옥 조원</label></div>
			<div class = "row"><label>메뉴 마음에 안들면 탈주 준비중</label></div>
			<div class = "row"><label>ㅁㅁㅁㅁㅁㅁㅁ</label></div>
			<div class = "row"><label>상품 리스트, 판매 물품 등록</label></div>
		</div>
	</div>
	<div class = "row" style = "border-bottom: 1px solid #a0a0a0; padding-top: 10px;">
		<div class = "col-2"><img src="/resources/img/contect/Jinsung.svg" style = "width: 100%; height: auto; "></div>
		<div class = "col-10" style = "margin-top: 40px;">
			<div class = "row"><label class = "video_subTitle" style  = "padding-bottom: 10px;">김진성 조원</label></div>
			<div class = "row"><label>제육, 돈까스, 국밥 로테이션</label></div>
			<div class = "row"><label>ㅁㅁㅁㅁㅁㅁㅁ</label></div>
			<div class = "row"><label>상품 상세 페이지</label></div>
		</div>
	</div>
	<div class = "row" style = "padding-top: 10px;">
		<div class = "col-2"><img src="/resources/img/contect/Ousung.svg" style = "width: 100%; height: auto; "></div>
		<div class = "col-10" style = "margin-top: 40px;">
			<div class = "row"><label class = "video_subTitle" style  = "padding-bottom: 10px;">권오성 조원</label></div>
			<div class = "row"><label>ㅇㅇㅇㅇㅇㅇㅇㅇㅇ</label></div>
			<div class = "row"><label>ㅁㅁㅁㅁㅁㅁㅁ</label></div>
			<div class = "row"><label>회원가입, 로그인, 마이페이지</label></div>
		</div>
	</div>	
</div>
</main>
<jsp:include page="/Common/Footer2.jsp"/>
<script src="/resources/bootstrap/js/bootstrap.bundle.js"></script>
</body>
</html>