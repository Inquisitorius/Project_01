<%@page import="Info.TestDAO"%>
<%@page import="Info.TestDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Main.JDBConnect"%>
<%@ page import="Main.TestDBPool"%>
<% 
String num = request.getParameter("1");
TestDAO dao = new TestDAO(application);
TestDTO dto = dao.View("1");
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	function count(type)  {
		  // 결과를 표시할 element
		  const resultElement = document.getElementById('result');
		  
		  // 현재 화면에 표시된 값
		  let number = resultElement.innerText;
		  
		  // 더하기/빼기
		  if(type === 'plus') {
		    number = parseInt(number) + 1;
		    
		  }else if(type === 'minus' && number!=1)  {
		    number = parseInt(number) - 1;
		  }
		  // 결과 출력
		  resultElement.innerText = number;
		}
</script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Productpage</title>
<jsp:include page="/Common/LinkFile.jsp"/>
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/resources/css/Common.css">
<script src="/resources/js/jquery-3.7.1.js"></script>
<script src="https://kit.fontawesome.com/a0b08e370a.js" crossorigin="anonymous"></script>
<style type="text/css">
/*문의사항 css */
table {
  border-collapse: collapse;
  border-spacing: 0;
}
section.notice {
  padding: 80px 0;
}

.page-title {
  margin-bottom: 60px;
}

.page-title h3 {
  font-size: 28px;
  color: #333333;
  font-weight: 400;
  text-align: center;
}
.board-table {
  font-size: 13px;
  width: 100%;
  border-top: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
}

.board-table a {
  color: #333;
  display: inline-block;
  line-height: 1.4;
  word-break: break-all;
  vertical-align: middle;
}
.board-table a:hover {
  text-decoration: underline;
}
.board-table th {
  text-align: center;
}

.board-table .th-num {
  width: 100px;
  text-align: center;
}

.board-table .th-date {
  width: 200px;
}

.board-table th, .board-table td {
  padding: 14px 0;
}

.board-table tbody td {
  border-top: 1px solid #e7e7e7;
  text-align: center;
}

.board-table tbody th {
  padding-left: 28px;
  padding-right: 14px;
  border-top: 1px solid #e7e7e7;
  text-align: left;
}

.board-table tbody th p{
  display: none;
}

/* .btn {
  display: inline-block;
  padding: 0 30px;
  font-size: 15px;
  font-weight: 400;
  background: transparent;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  -ms-touch-action: manipulation;
  touch-action: manipulation;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  border: 1px solid transparent;
  text-transform: uppercase;
  -webkit-border-radius: 0;
  -moz-border-radius: 0;
  border-radius: 0;
  -webkit-transition: all 0.3s;
  -moz-transition: all 0.3s;
  -ms-transition: all 0.3s;
  -o-transition: all 0.3s;
  transition: all 0.3s;
} */

.btn-dark {
  background: #555;
  color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
  background: #373737;
  border-color: #373737;
  color: #fff;
}

.btn-dark {
  background: #555;
  color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
  background: #373737;
  border-color: #373737;
  color: #fff;
}

/*문의사항 css e  */
.texttop_01
{
background-color :white ;
color :black;
font-weight: bold;
font-size: 30px;
}
.product_01
{
/* background-image: url("../resources/img/melon.jpg"); */
background-pozsition: left;
background-sie: cover;
border-radius: 24px;
}
.fontCommon_Option
{
font-family: "Noto Sans KR", sans-serif;
font-optical-sizing: auto;
font-style: normal;
color: #333333;
margin-bottom:10px
}
.fontCommon_nomal
{
font-family: "Noto Sans KR", serif;
font-optical-sizing: auto;
font-style: normal;
color: #333333;
margin-bottom:10px
}
.fontCommon_nomal2
{
font-family: "Noto Sans KR", serif;
font-optical-sizing: auto;
font-style: normal;
color: #333333;
width: 50px;
text-align: center;
}
.fontgray
{
font-family: "Noto Sans KR", sans-serif;
font-optical-sizing: auto;
font-style: normal;
color: gray;
margin-bottom:10px
}
.fontsmall
{
font-family: "Noto Sans KR";
font-optical-sizing: auto;
font-style: normal;
color: gray;
margin-bottom:10px
}
.right
{
display: flex;
justify-content: flex-end;
text-align: right;
float: right;
color :black;
font-weight: bold;
font-size: 15px;
}
.buy_button
{
float: right;
width: 250px;
height: 50px;
}
.button_style
{
background-color: #fff;
width: 330px;
height: auto;
top: 0px;
z-index: 10;
position: sticky;
}
.button_style2
{
background-color: white;
color: black;
}
.line_stlye
{
width:50%;
border:none;
background-color:gray;
}
body {
overflow-x: hidden;
overflow-y: scroll; 
}
h3{
text-align:center;
font-family: "Noto Sans KR";
font-optical-sizing: auto;
font-style: normal;
color: gray;
}
p{
font-family: "Noto Sans KR";
font-optical-sizing: auto;
font-style: normal;

color: black;
}
</style>
</head>
<body>
<jsp:include page="/Common/Header.jsp"/>
<main>
<div class="container"style = "max-width: 1050px; min-width:1050px; padding-left: 0px;padding-top: 20px;" >
<div class="row d-flex flex-nowrap">	
		 <div class="col-5">
		 	<img src = "../resources/img/melon.jpg" style = "width: 400px; height: auto; border-radius: 2%;
		 	overflow: hidden; margin-right: 300px;"/>
		 </div>
		 <div class = "col-7">
		 	<div class= "row">
				<div class = "col-md-12 fontgray">
					샛별배송
				</div>
			</div>
		 	<div class = "row">
					<div class = "col-md-12 fontCommon_Option" style = "font-size: 24px; font-weight: 700; color: #333;">
						[쉘퍼] 머스크멜론 1.6kg // <%= dto.getName() %>
					</div>
			</div>
			<div class= "row">
				<div class = "col-md-12 fontgray">
					촉촉하게 머금은 달콤함 // <%= dto.getScript()%>
				</div>
			</div>	
			<div class= "row">
				<div class = "col-md-12 fontCommon_nomal">
					9900 원//<%= dto.getPrice() %>
				</div>
			</div>	
			<div class= "row">
				<div class = "col-md-12 fontCommon_nomal">
					원산지 국산
				</div>
			</div>	
			<div class= "row">
				<div class = "col-md-12 fontCommon_nomal">
					<button type="button" class="btn btn-success">쿠폰</button>
				</div>
			</div>
			<hr style="height:1px;border:none;background-color:gray;">
			<div class= "row">
				<div class = "col-md-3 fontgray">
					배송
				</div>
				<div class = "col-md-4 fontgray">
					샛별배송
				</div>
			</div>
			<hr style="height:1px;border:none;background-color:gray;">
			<div class= "row">
				<div class = "col-md-3 fontgray">
					판매자
				</div>
				<div class = "col-md-4 fontgray">
					컬리
				</div>
			</div>	
			<hr style="height:1px;border:none;background-color:gray;">
			<div class= "row">
				<div class = "col-md-3 fontgray">
					포장타입
				</div>
				<div class = "col-md-4 fontgray">
					냉장(종이포장)
				</div>
			</div>	
			<hr style="height:1px;border:none;background-color:gray;">
			<div class= "row">
				<div class = "col-md-3 fontgray">
					판매단위
				</div>
				<div class = "col-md-4 fontgray">
					1통
				</div>
			</div>
			<hr style="height:1px;border:none;background-color:gray;">
			<div class= "row">
				<div class = "col-md-3 fontgray">
					중량
				</div>
				<div class = "col-md-4 fontgray">
					1.6kg 내외
				</div>
			</div>
			<hr style="height:1px;border:none;background-color:gray;">
			<div class= "row">
				<div class = "col-md-3 fontgray">
					소비기한정보
				</div>
				<div class = "col-md-8 fontgray">
					농산물로 소비기한은 없으나 빠르게
					섭취하시는 것을 권장드립니다.
				</div>
			</div>
			<hr style="height:1px;border:none;background-color:gray;">
			<div class= "row">
				<div class = "col-md-3 fontgray">
					안내사항
				</div>
				<div class = "col-md-8 fontgray">
					상품특성상 3%내외의 중량차이가 있을 수 있습니다.<br/>
					신선식품 특성상 원물마다 크기 및 형태가 일정하지 않을 수 있습니다.
				</div>
			</div>
			<hr style="height:1px;border:none;background-color:gray;">
			<div class= "row">
				<div class = "col-md-3 fontgray">
					상품선택
				</div>
				<div class = "col-md-9 fontgray">
					<div class = "col-md-9 fontgray">
			<input type='button' class="button_style2"onclick='count("minus")'value='-'style="min-width: 25px;height: auto;border-radius: 2px;">
			<!-- <input type="text" class="button_style2" name="amounts" value="1"min="0"> -->
			<label class="fontCommon_nomal2" id='result' min="0">1</label>
			<input type='button' class="button_style2" onclick='count("plus")'value='+'style="min-width: 25px;height: auto;border-radius: 3px;">
			</div>
			</div>
			</div>
			<div class= "row">
				<div class = "col-md-12 fontgray right" style="display:inline-flex;align-items: center;">
				총 상품 금액:<label style="font-weight:bold;font-size:25px">9900//<%= dto.getPrice()%></label>원</div>
				
			</div>
			<div class="row">
				<div class= "col -4"style= "padding-bottom: 50px;">
				<button type="button" class="btn btn-success buy_button">장바구니 담기</button>
			</div>
			</div>
		 </div>
		 </div>
		 </div>
		 <div class="container" style = "max-width: 1050px; min-width:1050px; padding-left: 0px;position: sticky;top: 0px;z-index: 0;height:40px;">
		 <div class="row">
		 		<div class= "col-4">
				<button type="button" class="btn btn-outline-success button_style">상품설명</button>
				</div>
				<div class= "col-4">
				<button type="button" class="btn btn-outline-success button_style">후기</button>
				</div>
				<div class= "col-4">
				<button type="button" class="btn btn-outline-success button_style">문의</button>
				</div>
				
			</div>
		 </div>
		 <!-- 버튼이후 -->
		 <div class="container" style = "max-width: 1050px; min-width:1050px; padding-left: 0px;padding-top: 20px;">
		 <!-- 상품설명 -->
		 <div class="row">
		 <div class="col-12">	
		 	<img src = "../resources/img/melon.jpg" style = "width: 1040px; height: 600; border-radius: 2%;
		 	overflow: hidden;"/>
		 </div>
		 <div class="row">
		 <h3>촉촉하게 머금은 달콤함</h3>
		 <h3>머스크 멜론</h3>
		 <hr>
		 <p>멜론은 촉촉한 식감과 입안에 감도는 단맛으로 그만의 매력을 톡톡히 발산하는 과일이죠. 
		 그중에서도 달콤한 맛과 향을 품은 머스캣멜론을 마켓그린에서 합리적인 가격으로 만나보세요. 
		 국내 농가에서 정성스레 재배해 묵직하게 잘 익은 머스크 멜론이랍니다. 
		 맛도 맛이지만 비타민c칼륨도 풍부하게 함유하고있어 꾸준히 즐겨찾는분들도 계시죠. 
		 과일 디저트는 물론이고 근사한 안주로 즐겨도 좋을 거예요. </p>
		 </div>
		 </div>
		 <!-- 후기  -->
		 <div class="row">
		 <div class="col-12" style="width:500px; height:300;">
		 <h2>후기</h2>
		
		 </div>
		 <!-- 문의 -->
		 <section class="notice">
  		<div class="page-title">
        <div class="container">
            <h3>상품 문의</h3>
		 </div>
		 <div id="board-list">
        <div class="container">
            <table class="board-table">
                <thead>
                <tr>
                    <th scope="col" class="th-num">번호</th>
                    <th scope="col" class="th-title">제목</th>
                    <th scope="col" class="th-writer">작성자</th>
                    <th scope="col" class="th-date">등록일</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>3</td>
                    <th>
                      <a href="#!">[공지사항] 개인정보 처리방침 변경안내처리방침</a>
                      <p>테스트</p>
                    </th>
                    <td>김진성</td>
                    <td>2017.07.13</td>
                </tr>

                <tr>
                    <td>2</td>
                    <th>
                    <a href="#!">공지사항 안내입니다. 이용해주셔서 감사합니다</a>
                    </th>
                    <td>김진성</td>
                    <td>2017.06.15</td>
                </tr>

                <tr>
                    <td>1</td>
                    <th>
                    <a href="#!">공지사항 안내입니다. 이용해주셔서 감사합니다</a>
                    </th>
                    <td>김진성</td>
                    <td>2017.06.15</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
     </div>
		 </div>
		 </div>
    </section>
</main>
<jsp:include page="/Common/Footer.jsp"/>

	<script>
	$(document).ready(function())
	{
		alert("Clicked");
		$('.inputtest')
		add();
		del();
	});
	
	</script>
	
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.bundle.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
</body>
</html>