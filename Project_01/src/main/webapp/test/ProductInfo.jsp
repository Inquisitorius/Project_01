<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="Board.BoardDAO"%>
<%@ page import="Board.BoardDTO"%>
<%@ page import="Main.JDBConnect"%>
<%@ page import="Main.TestDBPool"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	function count(type)  {
		  // 결과를 표시할 element
		  const resultElement = document.getElementById('result');
		  const resultElement2 = document.getElementById('price');
		  // 현재 화면에 표시된 값
		  let number = resultElement.innerText;
		  let price = resultElement2.innerText;
		  // 더하기/빼기
		  if(type === 'plus') {
		    number = parseInt(number) + 1;
		    price  += parseInt(number) ;
		  }else if(type === 'minus' && number!=1)  {
		    number = parseInt(number) - 1;
		    price -= parseInt(number) ;
		  }
		  // 결과 출력
		  resultElement.innerText = number;
		  resultElement2.innerText = price;
		}
	function validateForm(form) {
		if (form.name.value == "") {
			alert("이름을 입력하세요.");
			form.content.focus();
			return false;
		}
		if (form.title.value == "") {
			alert("제목을 입력하세요.");
			form.title.focus();
			return false;
		}
		if (form.content.value == "") {
			alert("내용을 입력하세요.");
			form.content.focus();
			return false;
		}
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
.board-table .hidden-content {
	display: none; /* Hide content initially */
	padding: 10px;
	background-color: #f9f9f9;
}

.board-table tr {
	cursor: pointer; /* Change cursor to indicate clickable rows */
}

hr {
	border: 1px solid gray;
}

</style>
</head>
<body>
<jsp:include page="/Common/Header.jsp"/>

 <c:forEach var="BoardDTO" items="${product}">
 <p>${ BoardDTO.pname } </p>
 <p>${ BoardDTO.p_num} </p> 
 </c:forEach>
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
						[쉘퍼] 머스크멜론 1.6kg 
					</div>
			</div>
			<div class= "row">
				<div class = "col-md-12 fontgray">
					촉촉하게 머금은 달콤함 
				</div>
			</div>	
			<div class= "row">
				<div class = "col-md-12 fontCommon_nomal">
					9900 원
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
				총 상품 금액:<label style="font-weight:bold;font-size:25px">9900//</label>원</div>
				<label class="fontCommon_nomal2" id='price' min="9900">9900</label>
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
		 <div class="col fontCommon_nomal" style="width:500px; height:300; display:flex; justify-content: space-around;">
		 <h2>후기</h2>
		
		 </div>
		
		 <!-- 문의 -->
    
    <section class="notice"style="min-width:1050px; height:1000px; display:flex; justify-content: space-around;">
  <div class="page-title">
  <h2>상품 문의</h2>
        <div class="container"style="min-width:1050px; height:auto; display:flex; justify-content: flex-end;">

	<div class="row">
	<div class="col" style="display:flex;justify-content:flex-end;padding-bottom:10px;">
	<button type="button" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="제목을 입력하시오.">문의하기</button>
</div>
</div>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="static">
  <div class="modal-dialog modal-dialog-centered modal-dialog modal-dialog-scrollable modal-dialog modal-lg">>
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title texttop_01" id="exampleModalLabel">상품 문의하기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="row"style="padding-bottom:5px;padding-top:5px;">
        <div class="col-3">
        <img src="../resources/img/melon.jpg" style="width:100px; padding-bottom:10px;">
        </div>
        <div class="col-6">	
        <div class="col" style="font-size:20px;display:flex;align-items: center;height:100%;">
        [쉘퍼] 머스크멜론 1.6kg
        </div>
        </div>
        
		<div>
		<hr style="width:100%; margin: auto;">
		<form action="../test/List.do"  method="post" enctype="multpart/form-data"
		 onsubmit="return validateForm(this);"id="ModalWriteForm">
        <div class="form-group-mb-3">
            <label for="recipient-title" class="col-form-label">이름</label>
            <input type="text" class="form-control" name="name">
          </div>
          <div class="form-group-mb-3">
            <label for="recipient-name" class="col-form-label">제목</label>
            <input type="text" class="form-control" name="title">
          </div>
          <div class="form-group-mb-3">
            <label for="message-text" class="col-form-label">내용</label>
            <textarea class="form-control" name="content" rows="4">메시지를 입력하시오.</textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer"style="display:flex;justify-content:center;">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"style="width:100px;height:40px;">취소</button>
        <button type="submit" class="btn btn-outline-success" id="submitFormButton"style="width:100px;height:40px;">등록</button>
      </div>
    </div>
  </div>	
</div>
</div>
</div></div>
  <!-- board list area -->
    <div id="board-list">
        <div class="panel-faq-container"style="min-width: 1050px;height:auto; display:flex; justify-content: space-around;">
            <table class="board-table table">
            	    <thead>
            	    <tr>
                    <th scope="col" class="th-num">번호</th>
                    <th scope="col" class="th-title">제목</th>
                    <th scope="col" class="th-writer">이름</th>
                    <th scope="col" class="th-date">날짜</th>
                </tr>
                </thead>
                <c:forEach var="BoardDTO" items="${boardLists}">
                <tbody style="border:none;">
                 <tr class="board-row" data-target="#content${ BoardDTO.idx }"style="border:none;">
                    <td>${ BoardDTO.idx }</td>
                    <th>
                      <a href="#!">${ BoardDTO.title }</a>
                      <p>${ BoardDTO.name }</p>
                    </th>	
                    <td>${ BoardDTO.name }</td>
                    <td>${ BoardDTO.postdate }</td>
                     <tr id="content${ BoardDTO.idx }" class="hidden-content-row"style="width:150px;hegiht:300px;"> 
                        <td colspan="4"style="padding : 0px;border:none;">
                        <div class="hidden-content">
                            <div style="display:flex;padding-left:30px;font-size:15px;width:1000px;hegiht:100%;"> 
                             &nbsp;&nbsp;&nbsp;
                             문의내용 :
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              ${ BoardDTO.content }
                           </div>
                           </div>
                        </td>
                </tr>
                </tbody>  
                </c:forEach>
            </table>   
        </div>	
      </table>
    </div> 
</section>
</main>
<jsp:include page="/Common/Footer.jsp"/>

	<script>
	$(document).ready(function() {
		console.log("ready");
		$('#submitFormButton').click(function() {
			console.log("hit!;");
			$('#ModalWriteForm').submit();
		});

		$('.board-row').on('click', function() {
			var target = $(this).data('target'); // Get the target content ID
			var $content = $(target).find('.hidden-content'); // Find the content to slide

			if ($content.is(':visible')) {
				$content.slideUp(); // Hide the content if it is visible
			} else {
				// Optionally: Close other open items if single open item behavior is needed
				$('.hidden-content').slideUp(); // Hide all other open contents

				// Show the clicked content
				$content.slideDown();
			}
		});
	});
	var exampleModal = document.getElementById('exampleModal')
	exampleModal.addEventListener('show.bs.modal', function(event) {
		// Button that triggered the modal
		var button = event.relatedTarget
		// Extract info from data-bs-* attributes
		var recipient = button.getAttribute('data-bs-whatever')
		// If necessary, you could initiate an AJAX request here
		// and then do the updating in a callback.
		// Update the modal's content.	
		var modalTitle = exampleModal.querySelector('.modal-title')
		var modalBodyInput = exampleModal.querySelector('.modal-body input')

		var myModalEl = document.getElementById('myModal')
		var modal = bootstrap.Modal.getInstance(myModalEl)

		modalTitle.textContent = ' 상품 문의하기 '
		modalBodyInput.value = recipient
	});
</script>
	
	<script src="/resources/bootstrap/js/bootstrap.bundle.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	 <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>